// TODO

/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank =   /datum/mil_rank/civ/civ
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	required_language = null

/datum/map/kepler
	branch_types = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/romulus,
		/datum/mil_branch/ranger,
		// Submap branches,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/obs,
		// Others,
		/datum/mil_branch/imperial_commando,
	)

	spawn_branch_types = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/romulus,
		/datum/mil_branch/ranger,
		// Submap branches,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/obs,
		// Others,
		/datum/mil_branch/imperial_commando,
	)

	species_to_branch_blacklist = list(
		/datum/species/human   = list(/datum/mil_branch/alien, /datum/mil_branch/skrell_fleet),
		/datum/species/machine = list(/datum/mil_branch/alien, /datum/mil_branch/skrell_fleet),
	)

	species_to_branch_whitelist = list(
		/datum/species/diona        = list(/datum/mil_branch/alien, /datum/mil_branch/civilian),
		/datum/species/nabber       = list(/datum/mil_branch/alien, /datum/mil_branch/civilian),
		/datum/species/skrell       = list(/datum/mil_branch/alien, /datum/mil_branch/civilian),
		/datum/species/unathi       = list(/datum/mil_branch/alien, /datum/mil_branch/civilian),
		/datum/species/unathi/yeosa = list(/datum/mil_branch/alien, /datum/mil_branch/civilian),
		/datum/species/adherent     = list(/datum/mil_branch/alien, /datum/mil_branch/civilian),
		/datum/species/vox          = list(/datum/mil_branch/alien, /datum/mil_branch/civilian)
	)

/* Mil Branches */
/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "Civ"
	email_domain = "freemail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
	)

/datum/mil_branch/romulus
	name = "Independent Romulus Federation"
	name_short = "IRF"
	email_domain = "romulus.ind"

	rank_types = list(
		/datum/mil_rank/romulus/governor,
		/datum/mil_rank/romulus/senior_agent,
		/datum/mil_rank/romulus/agent,
		/datum/mil_rank/romulus/junior_agent,
	)

	spawn_rank_types = list(
		/datum/mil_rank/romulus/governor,
		/datum/mil_rank/romulus/senior_agent,
		/datum/mil_rank/romulus/agent,
		/datum/mil_rank/romulus/junior_agent,
	)

/datum/mil_branch/ranger
	name = "IRF Ranger Corps"
	name_short = "IRFRC"
	email_domain = "romulus.ind"

	rank_types = list(
		/datum/mil_rank/army/specialist,
		/datum/mil_rank/army/corporal,
		/datum/mil_rank/army/sergeant,
	)

	spawn_rank_types = list(
		/datum/mil_rank/army/specialist,
		/datum/mil_rank/army/corporal,
		/datum/mil_rank/army/sergeant,
	)

/datum/mil_branch/alien
	name = "Alien"
	name_short = "Alien"
	rank_types = list(/datum/mil_rank/alien)
	spawn_rank_types = list(/datum/mil_rank/alien)

/* Mil Ranks */
// Civilians
/datum/mil_rank/civ/civ
	name = "Civilian"

/datum/mil_rank/civ/colonist
	name = "Colonist"

/datum/mil_rank/civ/contractor
	name = "Contractor"

// Romulus Federation
/datum/mil_rank/romulus/governor
	name = "IRF Governor"

/datum/mil_rank/romulus/senior_agent
	name = "IRF Senior Agent"

/datum/mil_rank/romulus/agent
	name = "IRF Agent"

/datum/mil_rank/romulus/junior_agent
	name = "IRF Junior Agent"

// IRF Military / Paramilitary
/datum/mil_rank/army/private
	name = "Private"
	name_short = "PVT"
	sort_order = 1

/datum/mil_rank/army/private_first_class
	name = "Private First Class"
	name_short = "PFC"
	sort_order = 2

/datum/mil_rank/army/specialist
	name = "Specialist"
	name_short = "SPC"
	sort_order = 3

/datum/mil_rank/army/corporal
	name = "Corporal"
	name_short = "CPL"
	sort_order = 4

/datum/mil_rank/army/sergeant
	name = "Sergeant"
	name_short = "SGT"
	sort_order = 5

/datum/mil_rank/army/staff_sergeant
	name = "Staff Sergeant"
	name_short = "SSGT"
	sort_order = 6

// Aliens
/datum/mil_rank/alien
	name = "Alien"
