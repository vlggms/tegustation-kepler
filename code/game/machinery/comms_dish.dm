/*
* Primarily used by Kepler map to prevent shuttle from being called when it is broken.
*/
GLOBAL_LIST_EMPTY(comms_dishes)

/obj/machinery/comms_dish
	name = "communications dish"
	desc = "A mechanism used by colonists to relay signals from on-site communications to the orbit sattelite. \
			Important in case of emergency, as evacuation shuttles cannot be reached without it."
	icon = 'icons/obj/comms_dish.dmi'
	icon_state = "dish"
	density = TRUE
	uncreated_component_parts = null
	unacidable = TRUE

/obj/machinery/comms_dish/New()
	..()
	GLOB.comms_dishes += src

/obj/machinery/comms_dish/Destroy()
	GLOB.comms_dishes -= src
	..()

/obj/machinery/comms_dish/attackby(obj/item/O, mob/user, params)
	if(isScrewdriver(O))
		add_fingerprint(user)
		playsound(src, 'sound/items/Screwdriver.ogg', 50, 1)
		return

	return

/obj/machinery/comms_dish/ex_act(severity)
	if(!prob(severity * 33))
		set_broken(TRUE, TRUE)

/obj/machinery/comms_dish/dismantle()
	return

// Subtype used on Kepler maps
/obj/machinery/comms_dish/start_broken/Initialize()
	. = ..()
	set_broken(TRUE, TRUE)
