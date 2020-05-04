/datum/quirk/nonviolent
	name = "Pacifista"
	desc = "The thought of violence makes you sick. So much so, in fact, that you can't hurt anyone."
	value = -3 //esto te hace perder toda habilidad de combate asi que considero que vale por muchas habilidades
	mob_trait = TRAIT_PACIFISM
	gain_text = "<span class='danger'>You feel repulsed by the thought of violence!</span>"
	lose_text = "<span class='notice'>Puedes defenderte a ti mismo nuevamente.</span>"
	medical_record_text = "El paciente es inusualmente pacifico y no hará nada que pueda dañar físicamente a otros."
	class = "SEGURIDAD"
	subclass = "DISPARAR"
	etiqueta = "SKILL"

/datum/quirk/notools
	name = "Manos inutiles"
	desc = "Tienes las mimsas habilidades de construccion que Evan"
	value = -1
	mob_trait = TRAIT_NO_TOOLS
	gain_text = "<span class='danger'>Tus habilidades manuales son basura!</span>"
	lose_text = "<span class='notice'>Al parecer esto de la mecanica no era tan dificil</span>"
	medical_record_text = "Al paciente le cuesta realizar habilidades manuales."
	class = "INGENERIA"
	subclass = "TOOLS"
	etiqueta = "SKILL"

/datum/quirk/torpeza
	name = "Naciste evan"
	desc = "Parece que eres tan torpe como evan, debes tener algun cromosoma extra"
	value = -1
	gain_text = "<span class='danger'>Eres evan, cuidado al caminar!</span>"
	lose_text = "<span class='notice'>Pues esto de trabajar no era nada del otro mundo.</span>"
	medical_record_text = "Al paciente le cuesta realizar cualquier habilidad motriz."
	class = "INGENERIA"
	subclass = "TOOLS"

/datum/quirk/torpeza/add()
	var/mob/living/carbon/human/H = quirk_holder
	H.dna.SetSEState(GLOB.clumsyblock, TRUE)
	genemutcheck(H, GLOB.clumsyblock, null, MUTCHK_FORCED)
	H.dna.default_blocks.Add(GLOB.clumsyblock)
	H.check_mutations = TRUE
