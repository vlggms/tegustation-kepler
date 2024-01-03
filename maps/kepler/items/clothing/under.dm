/obj/item/clothing/under/romulus
	name = "master kepler uniform"
	desc = "You shouldn't be seeing this."
	icon = 'maps/kepler/icons/obj/romulus_clothing.dmi'
	item_icons = list(slot_w_uniform_str = 'maps/kepler/icons/mob/romulus_clothing_worn.dmi')
	siemens_coefficient = 0.8
	gender_icons = FALSE

/obj/item/clothing/under/romulus/ranger
	name = "ranger uniform"
	desc = "A standard-issue uniform of marine and ranger corps of the Romulus Federation."
	item_state = "bl_suit"
	icon_state = "romulusmarine"
	worn_state = "romulusmarine"
	armor = list(
		melee = ARMOR_MELEE_MINOR
		)
	body_parts_covered = FULL_TORSO|LEGS|ARMS
	cold_protection = FULL_TORSO|LEGS|ARMS
	min_cold_protection_temperature = BODYTEMP_COLD_DAMAGE_LIMIT - 30
