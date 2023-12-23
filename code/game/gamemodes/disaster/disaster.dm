// Antagonists - Disabled.
// Round-start disasters - Enabled.
// Catastrophe level events - Enabled.
/datum/game_mode/disaster
	name = "Disaster"
	config_tag = "disaster"
	required_players = 0
	round_description = "Explore the disaster-struck colony and evacuate from it."
	extended_round_description = "The colony will be hit by a random disaster, requiring colonists to repair its critical \
								systems and infrastructure to be able to evacuate."
	addantag_allowed = ADDANTAG_ADMIN

/datum/game_mode/disaster/post_setup()
	. = ..()
	var/list/disaster_types = list()
	for(var/dtype in subtypesof(/datum/disaster))
		var/datum/disaster/D = dtype
		disaster_types[dtype] = initial(D.weight)

	var/dtype = pickweight(disaster_types)
	var/datum/disaster/D = new dtype
	message_admins("[D.name] disaster type has been selected!")
	addtimer(CALLBACK(D, /datum/disaster/proc/Trigger), rand(1 MINUTES, 2 MINUTES))
