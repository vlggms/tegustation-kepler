/* Militia */
// Appearances
/decl/closet_appearance/secure_closet/kepler/militia
	color = COLOR_KEPLER_BLUE
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_RED,
		"security" = COLOR_RED
	)

/decl/closet_appearance/secure_closet/kepler/militia/forensics
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_RED,
		"forensics" = COLOR_RED
	)

/decl/closet_appearance/secure_closet/kepler/militia/warden
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_RED,
		"stripe_vertical_right_full" = COLOR_RED,
		"security" = COLOR_RED
	)

// Closets
/obj/structure/closet/secure_closet/kepler/militia
	name = "militia locker"
	req_access = list(access_militia)
	closet_appearance = /decl/closet_appearance/secure_closet/kepler/militia

/obj/structure/closet/secure_closet/kepler/militia/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/sec, 50),
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/suit/armor/pcarrier/light,
		/obj/item/clothing/under/rank/security2,
		/obj/item/gun/projectile/pistol/sec/lethal,
		/obj/item/ammo_magazine/pistol = 5,
	)

/* Military */
// Appearances
/decl/closet_appearance/secure_closet/kepler/military
	color = COLOR_WALL_GUNMETAL
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_SKY_BLUE,
		"star" = COLOR_SKY_BLUE
	)

/decl/closet_appearance/secure_closet/kepler/military/ranger
	extra_decals = list(
		"stripe_vertical_left_partial" = COLOR_SKY_BLUE,
		"star" = COLOR_SKY_BLUE,
		"corp" = COLOR_SKY_BLUE,
	)

// Closets
/obj/structure/closet/secure_closet/kepler/military
	name = "military locker"
	req_access = list(access_military)
	closet_appearance = /decl/closet_appearance/secure_closet/kepler/military

/obj/structure/closet/secure_closet/kepler/military/WillContain()
	return list(
		/obj/item/device/radio/headset/headset_mil,
		/obj/item/device/flash,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/storage/belt/holster/security/tactical,
		/obj/item/clothing/head/helmet/romulus,
		/obj/item/clothing/accessory/armor/helmcover/navy,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/accessory/armguards/navy,
		/obj/item/clothing/accessory/legguards/navy,
		/obj/item/clothing/under/syndicate/combat,
		/obj/item/gun/projectile/pistol/military/alt,
		/obj/item/ammo_magazine/pistol/double = 5,
	)

/obj/structure/closet/secure_closet/kepler/military/ranger
	name = "ranger locker"
	req_access = list(access_ranger)
	closet_appearance = /decl/closet_appearance/secure_closet/kepler/military/ranger

/obj/structure/closet/secure_closet/kepler/military/ranger/WillContain()
	return list(
		/obj/item/device/radio/headset/headset_mil/ranger,
		/obj/item/clothing/glasses/night,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/storage/belt/holster/security/tactical,
		/obj/item/clothing/head/helmet/romulus,
		/obj/item/clothing/head/beret/romulus,
		/obj/item/clothing/suit/armor/pcarrier/light,
		/obj/item/clothing/under/romulus/ranger,
		/obj/item/clothing/gloves/thick,
		/obj/item/gun/projectile/revolver/military,
		/obj/item/ammo_magazine/speedloader = 5,
	)
