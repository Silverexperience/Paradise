//DISPARAR
/datum/quirk/nonviolent
	name = "Pacifista"
	desc = "The thought of violence makes you sick. So much so, in fact, that you can't hurt anyone."
	value = -2 //esto te hace perder toda habilidad de combate asi que considero que vale por muchas habilidades
	mob_trait = TRAIT_PACIFISM
	gain_text = "<span class='danger'>You feel repulsed by the thought of violence!</span>"
	lose_text = "<span class='notice'>Puedes defenderte a ti mismo nuevamente.</span>"
	medical_record_text = "El paciente es inusualmente pacifico y no hará nada que pueda dañar físicamente a otros."
	class = "SEGURIDAD"
	subclass = "DISPARAR"
	etiqueta = "SKILL"

/datum/quirk/gusfobia
	name = "Guns fobia"
	desc = "Le tienes fobia a las armas de fuego."
	value = -1 //esto vale uno porque si alguien lo toma tambien puede tomar el poor_aim gratis
	mob_trait = TRAIT_GUNS_FOBIA
	gain_text = "<span class='danger'>Recuerdas eso... disparos, no de nuevo!</span>"
	lose_text = "<span class='notice'>Pues disparar es hasta divertido, quien lo diria.</span>"
	class = "SEGURIDAD"
	subclass = "DISPARAR"
	etiqueta = "SKILL"

//MISC - SKILLS
/datum/quirk/notools
	name = "Manos inutiles"
	desc = "Tienes las mimsas habilidades de construccion que... no sabes constuir nada"
	value = -1
	mob_trait = TRAIT_NO_TOOLS
	gain_text = "<span class='danger'>Tus habilidades manuales son basura!</span>"
	lose_text = "<span class='notice'>Al parecer esto de la mecanica no era tan dificil</span>"
	medical_record_text = "Al paciente le cuesta realizar habilidades manuales."
	class = "INGENERIA"
	subclass = "TOOLS"
	etiqueta = "SKILL"

/datum/quirk/nocraft
	name = "Craftear, que es eso?"
	desc = "No puedes craftear nada."
	value = -1
	mob_trait = TRAIT_NO_CRAFT
	gain_text = "<span class='danger'>No podrias ni craftear un barco de papel</span>"
	lose_text = "<span class='notice'>Esto del maincra no se te daba tan mal.</span>"
	class = "INGENERIA"
	subclass = "CRAFT"
	etiqueta = "SKILL"

//GENETICA
/datum/quirk/torpeza
	name = "Torpeza"
	desc = "Parece que eres tan torpe como nadie, debes tener algun cromosoma extra"
	value = -1
	gain_text = "<span class='danger'>Eres evan, cuidado al caminar!</span>"
	lose_text = "<span class='notice'>Pues esto de trabajar no era nada del otro mundo.</span>"
	class = "INGENERIA"
	subclass = "TOOLS"

/datum/quirk/torpeza/add()
	var/mob/living/carbon/human/H = quirk_holder
	H.dna.SetSEState(GLOB.clumsyblock, TRUE)
	genemutcheck(H, GLOB.clumsyblock, null, MUTCHK_FORCED)
	H.dna.default_blocks.Add(GLOB.clumsyblock)
	H.check_mutations = TRUE

/datum/quirk/manco
	name = "Manco"
	desc = "Hace mucho perdiste una mano en un accidente."
	value = -1
	gain_text = "<span class='danger'>Que le ha pasado a tu mano?</span>"
	lose_text = "<span class='notice'>Pues parece que al final .</span>"
	class = "MEDABAY"
	subclass = "CUERPO"
	etiqueta = "DISCAPACIDAD"

/datum/quirk/manco/on_spawn() //these should only trigger when the character is being created for the first time, i.e. roundstart/latejoin
	var/mob/living/carbon/human/H = quirk_holder
	var/picked_hand = pick("l_hand", "r_hand")
	var/obj/item/organ/external/M = H.get_organ(picked_hand)
	qdel(M)
