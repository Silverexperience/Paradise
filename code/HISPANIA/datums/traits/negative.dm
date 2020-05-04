/datum/quirk/nonviolent
	name = "Pacifista"
	desc = "The thought of violence makes you sick. So much so, in fact, that you can't hurt anyone."
	value = -2
	mob_trait = TRAIT_PACIFISM
	gain_text = "<span class='danger'>You feel repulsed by the thought of violence!</span>"
	lose_text = "<span class='notice'>Puedes defenderte a ti mismo nuevamente.</span>"
	medical_record_text = "El paciente es inusualmente pacifico y no hará nada que pueda dañar físicamente a otros."
	class = "SEGURIDAD"
	subclass = "DISPARAR"

/datum/quirk/notools
	name = "Manos inutiles"
	desc = "Tienes las mimsas habilidades de construccion que Evan"
	value = -1
	mob_trait = TRAIT_EVAN_INGENIERO
	gain_text = "<span class='danger'>Tus habilidades manuales son basura!</span>"
	lose_text = "<span class='notice'>Al parecer esto de la mecanica no era tan dificil</span>"
	medical_record_text = "Al paciente le cuesta realizar habilidades manuales."
	class = "INGENERIA"
	subclass = "TOOLS"

/datum/quirk/notools
	name = "Manos inutiles"
	desc = "Tienes las mimsas habilidades de construccion que Evan"
	value = -1
	mob_trait = TRAIT_EVAN_INGENIERO
	gain_text = "<span class='danger'>Tus habilidades manuales son basura!</span>"
	lose_text = "<span class='notice'>Al parecer esto de la mecanica no era tan dificil.</span>"
	medical_record_text = "Al paciente le cuesta realizar habilidades manuales."
	class = "INGENERIA"
	subclass = "TOOLS"

/datum/quirk/payaso
	name = "Naciste payaso"
	desc = "Parece que tienes un cromosoma extra, un cromosoma extra chistoso"
	value = -1
	mob_trait = TRAIT_EVAN_INGENIERO
	gain_text = "<span class='danger'>Todas tus acciones son chistosas!</span>"
	lose_text = "<span class='notice'>No todos pueden ser payasos</span>"
	medical_record_text = "Al paciente le cuesta realizar habilidades manuales."
	class = "INGENERIA"
	subclass = "TOOLS"

/datum/quirk/payaso/add()
	var/mob/living/carbon/human/H = quirk_holder
	if(ismachine(H))
		var/obj/item/organ/internal/cyberimp/brain/clown_voice/implant = new
		implant.insert(H)

	H.dna.SetSEState(GLOB.clumsyblock, TRUE)
	genemutcheck(H, GLOB.clumsyblock, null, MUTCHK_FORCED)
	H.dna.default_blocks.Add(GLOB.clumsyblock)
	if(!ismachine(H))
		H.dna.SetSEState(GLOB.comicblock, TRUE)
		genemutcheck(H, GLOB.comicblock, null, MUTCHK_FORCED)
		H.dna.default_blocks.Add(GLOB.comicblock)
	H.check_mutations = TRUE
	H.add_language("Clownish")
