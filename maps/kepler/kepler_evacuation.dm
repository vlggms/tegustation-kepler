#define EVAC_OPT_CALL_SHUTTLE "call_shuttle"
#define EVAC_OPT_RECALL_SHUTTLE "recall_shuttle"

/datum/evacuation_controller/shuttle/kepler
	name = "kepler shuttle controller"
	evac_waiting =  new(0, new_sound = sound('sound/AI/shuttledock.ogg'))
	evac_called =   new(0, new_sound = sound('sound/AI/shuttlecalled.ogg'))
	evac_recalled = new(0, new_sound = sound('sound/AI/shuttlerecalled.ogg'))

	emergency_prep_additional_delay = 0 MINUTES
	transfer_prep_additional_delay = 0 MINUTES

	evacuation_options = list(
		EVAC_OPT_CALL_SHUTTLE = new /datum/evacuation_option/call_shuttle/kepler(),
		EVAC_OPT_RECALL_SHUTTLE = new /datum/evacuation_option/recall_shuttle()
	)


/datum/evacuation_controller/shuttle/kepler/has_evacuated()
	return departed

/datum/evacuation_controller/shuttle/kepler/waiting_to_leave()
	return (!autopilot || (shuttle && shuttle.is_launching()))

/datum/evacuation_controller/shuttle/kepler/launch_evacuation()

	if(waiting_to_leave())
		return

	if(autopilot && shuttle.moving_status == SHUTTLE_IDLE)
		evac_arrival_time = world.time + (shuttle.move_time*10) + (shuttle.warmup_time*10)
		shuttle.launch(src)
	// Announcements, state changes and such are handled by the shuttle itself to prevent desync.

/datum/evacuation_controller/shuttle/kepler/finish_preparing_evac()
	departed = 1
	evac_launch_time = world.time + evac_launch_delay

	. = ..()
	// Arm the escape pods.
	if (emergency_evacuation)
		for (var/datum/shuttle/autodock/ferry/escape_pod/pod in escape_pods)
			if (pod.arming_controller)
				pod.arming_controller.arm()

/datum/evacuation_controller/shuttle/kepler/call_evacuation(var/mob/user, var/_emergency_evac, var/forced, var/skip_announce, var/autotransfer)
	if(..())
		autopilot = 1
		shuttle_launch_time = evac_no_return
		evac_ready_time += shuttle.warmup_time*10
		return 1
	return 0

/datum/evacuation_controller/shuttle/kepler/cancel_evacuation()
	if(..() && shuttle.moving_status != SHUTTLE_INTRANSIT)
		shuttle_launch_time = null
		shuttle.cancel_launch(src)
		return 1
	return 0

/datum/evacuation_controller/shuttle/kepler/get_eta()
	if (shuttle && shuttle.has_arrive_time())
		return (shuttle.arrive_time-world.time)/10
	return ..()

/datum/evacuation_controller/shuttle/kepler/get_status_panel_eta()
	if(has_eta() && waiting_to_leave())
		return "Launching..."
	return ..()

// This is largely handled by the emergency shuttle datum.
/datum/evacuation_controller/shuttle/kepler/process()
	if(state == EVAC_PREPPING)
		if(!isnull(shuttle_launch_time) && world.time > shuttle_launch_time && shuttle.moving_status == SHUTTLE_IDLE)
			shuttle.launch()
			shuttle_launch_time = null
		return
	else if(state == EVAC_IN_TRANSIT)
		return
	return ..()

/datum/evacuation_controller/shuttle/kepler/can_cancel()
	return (shuttle.moving_status == SHUTTLE_IDLE && shuttle.location && ..())

/datum/evacuation_controller/shuttle/kepler/shuttle_leaving()
	state = EVAC_IN_TRANSIT

/datum/evacuation_controller/shuttle/kepler/shuttle_evacuated()
	state = EVAC_COMPLETE

/datum/evacuation_controller/shuttle/kepler/shuttle_preparing()
	state = EVAC_PREPPING

/datum/evacuation_controller/shuttle/kepler/get_long_jump_time()
	if (shuttle.location)
		return round(evac_prep_delay/10)/2
	else
		return round(evac_transit_delay/10)

/datum/evacuation_controller/shuttle/kepler/available_evac_options()
	if (!shuttle.location)
		return list()
	if (is_idle())
		return list(evacuation_options[EVAC_OPT_CALL_SHUTTLE])
	else
		return list(evacuation_options[EVAC_OPT_RECALL_SHUTTLE])

/datum/evacuation_option/call_shuttle/kepler
	option_text = "Call emergency shuttle"
	option_desc = "call the emergency shuttle"
	option_target = EVAC_OPT_CALL_SHUTTLE
	needs_syscontrol = TRUE
	silicon_allowed = TRUE

/datum/evacuation_option/call_shuttle/kepler/execute(mob/user)
	if(!CanEvac(user))
		to_chat(user, SPAN_DANGER("Evacuation shuttle could not be reached. Check your connection."))
		return
	return ..()

/datum/evacuation_option/call_shuttle/kepler/proc/CanEvac(mob/user)
	var/can_evac = FALSE
	for(var/obj/machinery/comms_dish/C in GLOB.comms_dishes)
		if(C.operable())
			can_evac = TRUE
			break
	return can_evac

#undef EVAC_OPT_CALL_SHUTTLE
#undef EVAC_OPT_RECALL_SHUTTLE