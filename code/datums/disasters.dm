// A datum used by most gamemodes to decide what exactly happens on round-start
/datum/disaster
	var/name = "Normal Disaster Type"
	var/weight = 0
	/// How much time needs to pass after trigger effect for first dynamic to hit
	var/dynamic_start_delay = 1 MINUTES
	/// Delay between each "process" of dynamic effect
	var/dynamic_delay = 1 MINUTES

/// Called by gamemode on round-start.
/datum/disaster/proc/Start()
	addtimer(CALLBACK(src, .proc/TriggerEffect), rand(1 MINUTES, 2 MINUTES))
	return

/// Called by Start() after random delay. Handles starting effects.
/datum/disaster/proc/TriggerEffect()
	addtimer(CALLBACK(src, .proc/DynamicEffect), dynamic_start_delay)
	return

/// Called every minute.
/datum/disaster/proc/DynamicEffect()
	addtimer(CALLBACK(src, .proc/DynamicEffect), dynamic_delay)
	return

/datum/disaster/proc/AnnounceDisaster()
	return

/* Meteors */
/datum/disaster/meteors
	name = "Meteors"
	weight = 10
	dynamic_start_delay = 5 MINUTES
	dynamic_delay = 2 MINUTES
	/// How many meteors will hit critical (landmarked) areas
	var/meteor_landmark_count = 5
	/// Weighted list of turf types that get placed in meteor areas
	var/list/mineral_types = list(
		/turf/simulated/mineral = 70,
		/turf/simulated/mineral/random = 30,
		)
	var/dynamic_radius = 1
	var/dynamic_count = 5

/datum/disaster/meteors/TriggerEffect()
	var/list/meteor_turfs = list()
	for(var/obj/effect/landmark/disaster_meteor/L in landmarks_list)
		meteor_turfs += get_turf(L)

	for(var/i = 1 to meteor_landmark_count)
		if(!LAZYLEN(meteor_turfs))
			break

		var/turf/T = pick(meteor_turfs)
		meteor_turfs -= T
		addtimer(CALLBACK(src, .proc/MeteorHit, T), i * rand(2, 2 SECONDS))

	sleep(meteor_landmark_count * 2 SECONDS)

	AnnounceDisaster()

	return ..()

// Throws meteors all over the place that grow in size as time goes.
/datum/disaster/meteors/DynamicEffect()
	var/list/zlevels = list()
	for(var/obj/effect/landmark/disaster_meteor_dynamic/L in landmarks_list)
		zlevels |= L.z

	var/list/valid_turfs = list()
	valid_turfs = get_turfs_in_zlevels(zlevels, list(/proc/is_not_space_area), list(/proc/is_not_open_space, /proc/is_not_mineral_turf))

	for(var/i = 1 to dynamic_count)
		if(!LAZYLEN(valid_turfs))
			break

		var/turf/T = pick(valid_turfs)
		valid_turfs -= T
		addtimer(CALLBACK(src, .proc/MeteorHit, T, round(dynamic_radius)), rand(2, 5 SECONDS))

	dynamic_radius = min(dynamic_radius + 0.1, 4)
	return ..()

/datum/disaster/meteors/AnnounceDisaster()
	command_announcement.Announce(
		"The surface of colony has been hit with multiple meteorites, damaging critical infrastructure in the process. \n\
		Colonists are advised to repair the systems and initiate evacuation procedures as soon as possible.",
		"Meteors Alert!",
		'sound/effects/alarm_catastrophe.ogg'
		)

/datum/disaster/meteors/proc/MeteorHit(turf/T, radius = 7)
	if(!istype(T))
		return

	for(var/mob/M in GLOB.player_list)
		if(!(M.z in GLOB.using_map.station_levels))
			continue
		var/S = 'sound/effects/explosionsmallfar.ogg'
		if(M.z == T.z && radius >= 5)
			S = 'sound/effects/explosionfar.ogg'
		M.playsound_local(get_turf(M), S, rand(35, 100))
		shake_camera(M, radius * 0.2, radius * 0.2)

	explosion(T, -1, -1, min(radius * 2, 32))
	for(var/turf/TT in range(radius, T))
		if(prob((get_dist(T, TT) - 1) * 12))
			continue
		PlaceMineral(TT)

/datum/disaster/meteors/proc/PlaceMineral(turf/T)
	// Kill shit, break stuff
	for(var/atom/movable/AM in T)
		AM.ex_act(pick(1, 2))
	var/turf_type = pickweight(mineral_types)
	T.ChangeTurf(turf_type, keep_air = TRUE)

/* Infestation */
/datum/disaster/infestation
	name = "Infestation"
	weight = 10
	dynamic_start_delay = 10 MINUTES
	dynamic_delay = 4 MINUTES
	/// How many random mobs will be spawned at the epicenter
	var/center_mob_count = 35
	/// Weighted list of mob types that will be spawned at the center
	var/list/center_mob_types = list(
		/mob/living/simple_animal/hostile/infestation/broodling = 50,
		/mob/living/simple_animal/hostile/infestation/floatfly = 40,
		/mob/living/simple_animal/hostile/infestation/eviscerator = 30,
		/mob/living/simple_animal/hostile/infestation/assembler = 20,
		/mob/living/simple_animal/hostile/infestation/rhino = 10,
		/mob/living/simple_animal/hostile/infestation/aggregate = 5,
		)
	/// How many random mobs can be spawned at each random spot (Random from 1 to this number)
	var/random_spawn_mob_count = 3
	/// Weighted list of mob types that will be spawned at random spots throughout the colony
	var/list/random_spawn_mob_types = list(
		/mob/living/simple_animal/hostile/infestation/larva = 10,
		/mob/living/simple_animal/hostile/infestation/larva/implant/implanter = 5,
		)

/datum/disaster/infestation/TriggerEffect()
	var/warn_sound = pick(\
		'sound/simple_mob/abominable_infestation/leviathan/wail1.ogg',\
		'sound/simple_mob/abominable_infestation/leviathan/wail1-long.ogg',\
		'sound/simple_mob/abominable_infestation/leviathan/wail2.ogg'\
		)

	for(var/mob/M in GLOB.player_list)
		if(!(M.z in GLOB.using_map.station_levels))
			continue
		M.playsound_local(get_turf(M), warn_sound, 50)
		to_chat(M, SPAN_WARNING("A terrifying creatures is wailing somewhere far from you, yet it sends chills down your spine..."))
		flash_color(M, flash_color = COLOR_MAROON, flash_time = 100)

	var/list/valid_turfs = list()
	for(var/obj/effect/landmark/disaster_infestation/L in landmarks_list)
		valid_turfs += get_turf(L)

	if(!LAZYLEN(valid_turfs))
		message_admins("[name] disaster couldn't find main infestation landmarks!")
		return ..()

	var/turf/T = pick(valid_turfs)
	T.visible_message(SPAN_DANGER("Something huge is falling down!"))
	playsound(T, 'sound/weapons/mortar_travel.ogg', 100, FALSE, 14)

	sleep(4 SECONDS)

	explosion(T, -1, -1, 24)
	var/obj/effect/hive_heart/HH = new (T)
	for(var/i = 1 to 20)
		addtimer(CALLBACK(HH, /obj/effect/hive_heart/proc/ConvertTurfs, FALSE), i * 3)
	var/list/spawn_turfs = list()
	for(var/turf/TT in range(4, T))
		if(TT.density)
			continue
		spawn_turfs += TT
	for(var/i = 1 to center_mob_count)
		var/turf/TT = pick(spawn_turfs)
		var/mob_type = pickweight(center_mob_types)
		new mob_type(TT)

	for(var/mob/M in GLOB.player_list)
		if(!(M.z in GLOB.using_map.station_levels))
			continue
		M.playsound_local(get_turf(M), 'sound/effects/explosioncreak1.ogg', 50)
		shake_camera(M, 5, 2)

	for(var/obj/effect/landmark/disaster_infestation_random/L in landmarks_list)
		if(prob(33))
			continue
		var/turf/TT = get_turf(L)
		for(var/i = 1 to rand(1, random_spawn_mob_count))
			var/mob_type = pickweight(random_spawn_mob_types)
			new mob_type(TT)

	sleep(10 SECONDS)

	AnnounceDisaster()

	return ..()

/datum/disaster/infestation/AnnounceDisaster()
	command_announcement.Announce(
		"The surface of colony has been hit with an infestation pod, containing number of hostile creatures. \n\
		Several abominations might have found their way into the infrastructure of the colony. \n\
		Colonists are advised to repair the systems and initiate evacuation procedures as soon as possible.",
		"Infestation Alert!",
		'sound/effects/alarm_catastrophe.ogg'
		)
