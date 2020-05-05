//HOS - HEAD
/datum/outfit/job/hos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/podpilot)
	H.add_quirk(/datum/quirk/shooter)

//WARDEN - SUBJEFE
/datum/outfit/job/warden/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/podpilot)
	H.add_quirk(/datum/quirk/shooter)

//OFICIAL - JOB COMPLETO
/datum/outfit/job/officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/shooter)

//BRIGDOC - JOB ESPECIAL
/datum/outfit/job/brigdoc/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/podpilot) //NO TIENE ACCESOS,PERO LOS SEC NORMALES SÍ. PARA RESCATES, COMO EL PARAMEDICO

//DETECTIVE - JOB ROL
/datum/outfit/job/detective/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/borrachoexperto)
	H.add_quirk(/datum/quirk/estomagofuerte)

//PILOTO - JOB ESPECIAL
/datum/outfit/job/pilot/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/podpilot)
