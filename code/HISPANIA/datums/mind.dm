/datum/mind/proc/transfer_quirks(mob/living/new_character)
	if(roundstart_quirks.len)
		var/list/old_roundstart_quirks = roundstart_quirks
		roundstart_quirks = list ()
		for(var/datum/quirk/Q in old_roundstart_quirks)
			new_character.add_quirk(Q, TRUE)
