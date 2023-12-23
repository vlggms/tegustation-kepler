/datum/job/assistant
	title = "Colonist"
	total_positions = 12
	spawn_positions = 12
	supervisors = "the Governor and IRF Agents"
	economic_power = 6
	announced = FALSE
	alt_titles = list(
		"Journalist",
		"Historian",
		"Investor",
		"Tourist",
		"Naturalist",
		"Ecologist",
		"Entertainer",
		"Independent Observer",
		"Sociologist",
		)
	outfit_type = /decl/hierarchy/outfit/job/kepler/colonist
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
	)

	access = list(
		access_colony,
	)
