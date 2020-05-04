/datum/outfit/job/chief_engineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)

/datum/outfit/job/engineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)

/datum/outfit/job/atmos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)

/* el mecanico no porque el podrá conducir pods en el futuro
/datum/outfit/job/atmos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	if(H.mind
	H.add_quirk(/datum/quirk/podpilor)
*/
