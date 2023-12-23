/datum/map/kepler/get_map_info()
	. = list()
	. +=  "You're colonist on " + replacetext("<b>[station_name]</b>", "\improper", "") + ", a colony claimed by Romulus Federation, a small polity in the Independent Sector."
	. +=  "The colony is staffed with various people, including contractors, fugitives, officers loyal to the IRF and many others."
	. +=  "This area of space is located withing Independent Sector, yet borders with the ISC territory, leading to frequent raids by pirates and various privateers."
	return jointext(., "<br>")
