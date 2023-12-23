#if !defined(using_map_DATUM)

	//#include "kepler_announcements.dm"
	#include "kepler_areas.dm"
	//#include "kepler_events.dm"
	#include "kepler_lobby.dm"
	//#include "kepler_machinery.dm"
	#include "kepler_overmap.dm"
	//#include "kepler_presets.dm"
	//#include "kepler_procs.dm"
	#include "kepler_ranks.dm"
	//#include "kepler_security_state.dm"
	#include "kepler_setup.dm"
	//#include "kepler_shuttles.dm"
	//#include "kepler_unit_testing.dm"

	#include "items/cards_ids.dm"
	#include "items/encryption_keys.dm"
	#include "items/headsets.dm"

	#include "job/_kepler_access.dm"
	#include "job/_kepler_jobs.dm"
	#include "job/command.dm"
	#include "job/military.dm"
	#include "job/misc.dm"

	#include "job/outfits/_kepler_outfits.dm"
	#include "job/outfits/command.dm"
	#include "job/outfits/military.dm"
	#include "job/outfits/misc.dm"

	#include "language/human/latin.dm"
	#include "language/human/misc/spacer.dm"

	#include "machinery/airlock.dm"

	#include "kepler_underground.dmm"
	#include "kepler_surface.dmm"
	#include "kepler_surface2.dmm"
	#include "z1_admin.dmm"
	#include "z2_transit.dmm"

	#define using_map_DATUM /datum/map/kepler

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Kepler

#endif
