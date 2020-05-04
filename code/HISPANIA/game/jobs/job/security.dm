//HOS
/datum/outfit/job/hos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/shooter)
	H.add_quirk(/datum/quirk/mechpilot)

//WARDEN
/datum/outfit/job/warden/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/shooter)
	H.add_quirk(/datum/quirk/mechpilot)

//OFICIAL
/datum/outfit/job/officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/shooter)

//DETECTIVE
/datum/outfit/job/detective/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/shooter)
	H.add_quirk(/datum/quirk/borrachoexperto)

//PILOTO
/* piloto? este tendrá el quir de pilotar pods en el futuro, por eso no tiene este. si le doy este le quitare otra cosa
/datum/outfit/job/pilot/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/shooter)
*/ // cual piloto?