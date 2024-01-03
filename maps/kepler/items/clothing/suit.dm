/obj/item/clothing/suit/storage/romulus_officer
	name = "IRF officer jacket"
	desc = "A lightly armored jacket used by officers within Romulus Federation."
	icon_state = "romulusofficer"
	icon = 'maps/kepler/icons/obj/romulus_clothing.dmi'
	item_icons = list(slot_wear_suit_str = 'maps/kepler/icons/mob/romulus_clothing_worn.dmi')
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		)
	body_parts_covered = FULL_TORSO|ARMS
	cold_protection = FULL_TORSO|ARMS
	min_cold_protection_temperature = BODYTEMP_COLD_DAMAGE_LIMIT - 90
