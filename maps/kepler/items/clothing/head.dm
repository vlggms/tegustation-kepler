/obj/item/clothing/head/beret/romulus
	name = "IRF beret"
	desc = "A beret used by members of Romulus Federation."
	icon_state = "romulusberet"
	icon = 'maps/kepler/icons/obj/romulus_clothing.dmi'
	item_icons = list(slot_head_str = 'maps/kepler/icons/mob/romulus_clothing_worn.dmi')

/obj/item/clothing/head/romulus
	name = "master romulus hat"
	icon = 'maps/kepler/icons/obj/romulus_clothing.dmi'
	item_icons = list(slot_head_str = 'maps/kepler/icons/mob/romulus_clothing_worn.dmi')
	siemens_coefficient = 0.9

/obj/item/clothing/head/romulus/hood
	name = "IRF winter hood"
	desc = "A simple unarmored winter hood utilized by members of the Romulus Federation."
	icon_state = "romulushood"
	min_cold_protection_temperature = BODYTEMP_COLD_DAMAGE_LIMIT - 30

/* Armor */
/obj/item/clothing/head/helmet/romulus
	name = "IRF helmet"
	desc = "An armored helmet used by marine and ranger corps of the Romulus Federation."
	icon_state = "romulushelmet"
	icon = 'maps/kepler/icons/obj/romulus_clothing.dmi'
	item_icons = list(slot_head_str = 'maps/kepler/icons/mob/romulus_clothing_worn.dmi')
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED
		)
