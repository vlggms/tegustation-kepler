// Antagonists - Disabled.
// Round-start disasters - Disabled.
// Catastrophe level events - Disabled.
/datum/game_mode/serene
	name = "Serene"
	config_tag = "serene"
	required_players = 0
	round_description = "Just have fun and roleplay!"
	extended_round_description = "There are no antagonists, disasters and catastrophes during Serene gamemode. \
								Explore the colony and roleplay!"
	addantag_allowed = ADDANTAG_ADMIN

/datum/game_mode/serene/post_setup()
	. = ..()
	var/datum/event_container/catastrophe/C = SSevent.event_containers[EVENT_LEVEL_CATASTROPHE]
	if(!istype(C))
		return
	C.next_event_time = INFINITY
