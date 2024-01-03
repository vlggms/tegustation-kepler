/datum/map/kepler
	base_floor_type = /turf/simulated/floor/reinforced/airless
	base_floor_area = /area/kepler_surface

	post_round_safe_areas = list (
		/area/centcom,
		/area/shuttle/escape/centcom,
		/area/shuttle/specops/centcom,
	)

// Shuttles
/area/shuttle/emergency_kepler
	name = "Emergency Shuttle"

// Surface
/area/kepler_surface
	name = "\improper Kepler 22b Surface"
	icon_state = "green"
	ambience = list(
		'sound/effects/wind/wind_2_1.ogg',
		'sound/effects/wind/wind_2_2.ogg',
		'sound/effects/wind/wind_3_1.ogg',
		'sound/effects/wind/wind_4_1.ogg',
		'sound/effects/wind/wind_4_2.ogg',
		'sound/effects/wind/wind_5_1.ogg'
	)
	always_unpowered = TRUE
	planetary_surface = TRUE

// Undeground
/area/kepler_undeground
	name = "\improper Kepler 22b Underground"
	icon_state = "unexplored"
	forced_ambience = list('sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg')
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	base_turf = /turf/simulated/floor/asteroid

/* Underground buildings */
/area/kepler_underground_colony
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

// Corridors
/area/kepler_underground_colony/main_corridor
	name = "\improper Main Corridor"
	icon_state = "yellow"

// Crew areas
/area/kepler_underground_colony/crew_quarters
	holomap_color = HOLOMAP_AREACOLOR_CREW

/area/kepler_underground_colony/crew_quarters/cryo
	name = "\improper Cryogenic Storage"
	icon_state = "Sleep"

// Engineering
/area/kepler_underground_colony/engineering
	name = "\improper Engineering"
	icon_state = "engine"
	req_access = list(access_engineering)

// Medical
/area/kepler_underground_colony/medical
	name = "\improper Medical"
	icon_state = "medbay"
	req_access = list(access_medical)

// Militia
/area/kepler_underground_colony/militia
	icon_state = "security"
	req_access = list(access_militia)

/area/kepler_underground_colony/militia/hallway
	name = "\improper Militia - Main Hallway"

/area/kepler_underground_colony/militia/meeting_room
	name = "\improper Militia - Meeting Room"

/area/kepler_underground_colony/militia/armory
	name = "\improper Militia - Armory"
	icon_state = "Warden"
	req_access = list(access_militia, access_militia_armory)

/area/kepler_underground_colony/militia/checkpoint_a
	name = "\improper Militia - Checkpoint A"

/area/kepler_underground_colony/militia/checkpoint_b
	name = "\improper Militia - Checkpoint B"

/area/kepler_underground_colony/militia/checkpoint_c
	name = "\improper Militia - Checkpoint C"

// Military
/area/kepler_underground_colony/military
	icon_state = "security_sub2"
	req_access = list(access_military)

// Rangers
/area/kepler_underground_colony/military/ranger
	req_access = list(access_ranger)

/area/kepler_underground_colony/military/ranger/quarters
	name = "Ranger Corps - Quarters"

/area/kepler_underground_colony/military/ranger/armory
	name = "Ranger Corps - Armory"
