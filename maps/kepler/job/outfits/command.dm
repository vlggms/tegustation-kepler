/decl/hierarchy/outfit/job/kepler/command
	name = OUTFIT_JOB_NAME("Kepler Command Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/kepler/command
	l_ear = /obj/item/device/radio/headset/headset_com

/decl/hierarchy/outfit/job/kepler/command/governor
	name = OUTFIT_JOB_NAME("Colony Governor")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/romulus/ranger
	suit = /obj/item/clothing/suit/storage/romulus_officer
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/kepler/gold)
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/kepler/command/governor/New()
	..()
	BACKPACK_OVERRIDE_COMMAND
