/obj/item/card/id/kepler
	name = "identification card"
	desc = "An identification card issued to colonists of Kepler 22b."
	job_access_type = DEFAULT_JOB_TYPE

/obj/item/card/id/kepler/silver
	desc = "A silver identification card belonging to heads of staff."
	item_state = "silver_id"
	//job_access_type = /datum/job/hop
	extra_details = list("goldstripe")
	color = "#ccecff"

/obj/item/card/id/kepler/gold
	desc = "A golden identification card belonging to the Colony Governor."
	item_state = "gold_id"
	job_access_type = /datum/job/governor
	color = "#d4c780"
	extra_details = list("goldstripe")

// Military
/obj/item/card/id/kepler/military
	desc = "A golden identification card belonging to the members of IRF Army."
	color = COLOR_WALL_GUNMETAL

// Ranger
/obj/item/card/id/kepler/ranger
	desc = "A golden identification card belonging to the members of IRF Ranger Corps."
	job_access_type = /datum/job/ranger
	color = COLOR_SKY_BLUE
	detail_color = COLOR_WALL_GUNMETAL
