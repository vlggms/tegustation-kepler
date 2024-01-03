/datum/job/governor
	title = "Colony Governor"
	supervisors = "the Romulus Federation High Command"
	minimal_player_age = 14
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 40)
	outfit_type = /decl/hierarchy/outfit/job/kepler/command/governor

	total_positions = 1
	spawn_positions = 1

	allowed_branches = list(
		/datum/mil_branch/romulus
	)
	allowed_ranks = list(
		/datum/mil_rank/romulus/governor
	)

	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_TRAINED,
		SKILL_SCIENCE = SKILL_TRAINED,
		SKILL_PILOT = SKILL_BASIC,
		)

	max_skill = list(
		SKILL_PILOT = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		)

	skill_points = 30

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/governor/get_access()
	return get_all_station_access()

/datum/job/governor/get_description_blurb()
	return "You are the Governor of Kepler 22b. You are the one overseeing the operations of the colony through and through, \
			ensuring everyone and everything is working. <br>\
			Your goal is to ensure the success of the colony by issuing orders to those subbordinate to you."

/datum/job/governor/post_equip_rank(mob/person, alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("[alt_title || title] [person.real_name] has arrived!", new_sound = announce_sound)
	..()
