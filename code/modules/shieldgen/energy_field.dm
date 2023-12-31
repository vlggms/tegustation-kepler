
//---------- actual energy field

/obj/effect/energy_field
	name = "energy field"
	desc = "Impenetrable field of energy, capable of blocking anything as long as it's active."
	icon = 'icons/obj/machines/shielding.dmi'
	icon_state = "shield_normal"
	anchored = TRUE
	layer = PROJECTILE_LAYER
	density = FALSE
	invisibility = 101
	var/strength = 0
	var/ticks_recovering = 10

/obj/effect/energy_field/New()
	..()
	update_nearby_tiles()

/obj/effect/energy_field/Destroy()
	set_density(0)
	update_nearby_tiles()
	. = ..()

/obj/effect/energy_field/attackby(obj/item/O, mob/user)
	if(user.a_intent != I_HELP)
		Stress(O.force / 20)
		visible_message("<span class='danger'>\The [user] damages \the [src] with [O]!</span>")
		attack_animation(user)
		playsound(loc, 'sound/weapons/Egloves.ogg', 40, 1)
	return ..()

/obj/effect/energy_field/ex_act(severity)
	Stress(0.5 + severity)

/obj/effect/energy_field/bullet_act(obj/item/projectile/Proj)
	Stress(Proj.get_structure_damage() / 10)
	visible_message("<span class='danger'>\The [src] is hit by [Proj]!</span>")
	return ..()

/obj/effect/energy_field/proc/Stress(severity)
	strength -= severity

	//if we take too much damage, drop out - the generator will bring us back up if we have enough power
	ticks_recovering = min(ticks_recovering + 2, 10)
	if(strength < 1)
		set_invisibility(101)
		set_density(0)
		ticks_recovering = 10
		strength = 0
	else if(strength >= 1)
		set_invisibility(0)
		set_density(1)

/obj/effect/energy_field/proc/Strengthen(severity)
	strength += severity
	if (strength < 0)
		strength = 0

	//if we take too much damage, drop out - the generator will bring us back up if we have enough power
	var/old_density = density
	if(strength >= 1)
		set_invisibility(0)
		set_density(1)
	else if(strength < 1)
		set_invisibility(101)
		set_density(0)

	if (density != old_density)
		update_nearby_tiles()

/obj/effect/energy_field/CanPass(atom/movable/mover, turf/target, height=1.5, air_group = 0)
	//Purpose: Determines if the object (or airflow) can pass this atom.
	//Called by: Movement, airflow.
	//Inputs: The moving atom (optional), target turf, "height" and air group
	//Outputs: Boolean if can pass.

	//return (!density || !height || air_group)
	return !density
