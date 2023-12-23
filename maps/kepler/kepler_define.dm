/datum/map/kepler
	name = "\improper Kepler 22b"
	full_name = "\improper Arctic Moon Kepler 22b"
	path = "kepler"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/kepler_config.txt"

	admin_levels  = list(4)
	escape_levels = list(5)
	empty_levels  = list(6)
	accessible_z_levels = list("6" = 100)
	overmap_size = 7
	overmap_event_areas = 4
	usable_email_tlds = list("kepler.ind")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "\improper Arctic Moon Kepler 22b"
	station_short = "\improper Kepler 22b"
	dock_name     = "TBD"
	boss_name     = "Command"
	boss_short    = "Command"
	company_name  = "Independent Romulus Federation"
	company_short = "IRF"

	map_admin_faxes = list(
		"Romulus Federation Command",
	)

	//These should probably be moved into the evac controller...
	shuttle_called_message = "Attention! Emergency Evacuation shuttle has been requested and will arrive in %ETA%."
	shuttle_recall_message = "Attention! Emergency Evacuation shuttle has been cancelled!"
	shuttle_docked_message = "Attention! Emergency Evacuation shuttle has docked with the station. Departure in %ETD%."
	shuttle_leaving_dock = "Attention! Emergency Evacuation shuttle has exited the surface and will arrive at the destination in %ETA%."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	num_exoplanets = 0

	away_site_budget = 0

	id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'
