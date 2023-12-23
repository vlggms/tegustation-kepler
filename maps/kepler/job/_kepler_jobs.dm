/datum/job
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/colonist,
		/datum/mil_rank/civ/contractor,
	)
	required_language = LANGUAGE_HUMAN_LATIN

/datum/map/kepler
	default_assistant_title = "Colonist"

	allowed_jobs = list(
		// Command,
		/datum/job/governor,
		// Military
		/datum/job/ranger,
		// Misc,
		/datum/job/assistant,
		)
