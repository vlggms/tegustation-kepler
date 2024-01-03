/datum/job/ranger
	title = "Ranger"
	supervisors = "the Governor"
	minimal_player_age = 7
	minimum_character_age = list(SPECIES_HUMAN = 20)
	outfit_type = /decl/hierarchy/outfit/job/kepler/military/ranger

	total_positions = 5
	spawn_positions = 5

	allowed_branches = list(
		/datum/mil_branch/ranger
	)
	allowed_ranks = list(
		/datum/mil_rank/army/specialist,
		/datum/mil_rank/army/corporal,
		/datum/mil_rank/army/sergeant,
	)

	min_skill = list(
		SKILL_HAULING = SKILL_TRAINED,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED,
		SKILL_FORENSICS = SKILL_BASIC,
		)

	max_skill = list(
		SKILL_COMBAT = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX,
		)

	access = list(
		access_colony,
		access_military, access_ranger,
	)

	minimal_access = list()

	lowpop_access = list(
		access_medical,
	)

/datum/job/ranger/get_description_blurb()
	return "You are a Ranger on Kepler 22b. Your tasks include ensuring safety of the colony and fending off \
			any threats you might encounter - be it wildlife or pirates. <br>\
			You are directly subbordinate to the Governor and your superiors."
