/obj/effect/overmap/visitable/sector/kepler
	name = "Kepler 22b"
	desc = "Sensor arrays detect an arctic moon with sub-zero surface conditions and sparse flora. \
			<br><br>\
			The moon is claimed by Romulus Federation, a nominally independent polity. \
			<br><br>\
			The moon is tidally locked and its inhabited area receives no sunlight."
	icon_state = "globe"
	color = "#ecfffd"
	in_space = FALSE
	known = TRUE
	base = TRUE
	free_landing = TRUE
	var/image/skybox_image

/obj/effect/overmap/visitable/sector/kepler/Initialize()
	. = ..()
	generate_planet_image()

/obj/effect/overmap/visitable/sector/kepler/get_skybox_representation()
	return skybox_image

/obj/effect/overmap/visitable/sector/kepler/proc/get_base_image()
	var/image/base = image('icons/skybox/planet.dmi', "base")
	base.color = "#ecfffd"
	return base

/obj/effect/overmap/visitable/sector/kepler/proc/generate_planet_image()
	skybox_image = image('icons/skybox/planet.dmi', "")

	skybox_image.overlays += get_base_image()

	var/image/clouds = image('icons/skybox/planet.dmi', "weak_clouds")
	clouds.color = COLOR_WHITE
	skybox_image.overlays += clouds

	var/image/atmo = image('icons/skybox/planet.dmi', "atmoring")
	skybox_image.underlays += atmo

	var/image/shadow = image('icons/skybox/planet.dmi', "shadow")
	shadow.blend_mode = BLEND_MULTIPLY
	skybox_image.overlays += shadow

	var/image/light = image('icons/skybox/planet.dmi', "lightrim")
	skybox_image.overlays += light

	skybox_image.pixel_x = rand(0,64)
	skybox_image.pixel_y = rand(128,256)
	skybox_image.appearance_flags = RESET_COLOR
	skybox_image.transform *= 0.6
