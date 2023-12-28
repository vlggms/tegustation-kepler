/datum/shuttle/autodock/ferry/emergency/kepler
	name = "Emergency Shuttle"
	location = 1
	shuttle_area = /area/shuttle/emergency_kepler
	dock_target = "evac_dock"
	waypoint_offsite = "nav_evac_start"
	waypoint_station = "nav_evac_out"

/obj/effect/shuttle_landmark/emergency_kepler/start
	name = "Emergency Shuttle - Start"
	landmark_tag = "nav_evac_start"
	docking_controller = "evac_start_dock"

/obj/effect/shuttle_landmark/emergency_kepler/out
	name = "Emergency Shuttle - Dock"
	landmark_tag = "nav_evac_out"
	docking_controller = "evac_out_dock"
