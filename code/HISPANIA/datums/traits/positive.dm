/datum/quirk/shooter
	name = "Tirador PRO"
	desc = "Eres un tirador experto."
	value = 2
	mob_trait = TRAIT_SHOOTER
	gain_text = "<span class='notice'>Tu punteria aumenta.</span>"
	lose_text = "<span class='notice'>tu punteria ya no es lo que era!</span>"
	medical_record_text = "El paciente tiene manos de acero."
	class = "SEGURIDAD"
	subclass = "DISPARAR"
	etiqueta = "SKILL"

/datum/quirk/mechpilot
	name = "Piloto de mechas"
	desc = "Conducir un ripley te es tan natural como caminar."
	value = 2
	mob_trait = TRAIT_MECH_PILOT
	gain_text = "<span class='notice'>Conducir un mecha no ha de ser complicado para ti.</span>"
	lose_text = "<span class='notice'>Conducir un ripley es como andar en bicicleta decian.</span>"
	medical_record_text = "El paciente solo habla de mechas y lo bien que puede conducirlos."
	class = "CONDUCIR"
	subclass = "MECHA"
	etiqueta = "SKILL"

/datum/quirk/borrachoexperto
	name = "Resistencia al alcohol"
	desc = "Que sea doble, por favor."
	value = 1
	gain_text = "<span class='notice'>Has bebido tanto en tu vida que ya el alcohol casi ni te afecta.</span>"
	lose_text = "<span class='notice'>Ya no tienes tanta resitencia como antes.</span>"
	class = "COMIDA"
	subclass = "BORRACHERA"
	etiqueta = "GENETICA"

/datum/quirk/borrachoexperto/add()
	var/mob/living/carbon/human/H = quirk_holder
	H.dna.SetSEState(GLOB.soberblock,1)
	genemutcheck(H, GLOB.soberblock, null, MUTCHK_FORCED)
	H.dna.default_blocks.Add(GLOB.soberblock)
	H.check_mutations = TRUE

/datum/quirk/cirujano
	name = "Crujano Veterano"
	desc = "Tienes mucha experiencia haciendo cirugias."
	value = 2
	mob_trait = TRAIT_CIRUJANO
	gain_text = "<span class='notice'>Tus manos son firmes y nunca te abandonan.</span>"
	lose_text = "<span class='notice'>Tus manos tiemblan al ver sangre.</span>"
	class = "CONDUCIR"
	subclass = "MECHA"
	etiqueta = "SKILL"

/datum/quirk/podpilot
	name = "Piloto de pods"
	desc = "Conducir un pod te es tan natural como respirar."
	value = 2
	mob_trait = TRAIT_POD_PILOT
	gain_text = "<span class='notice'>Conducir un pod no ha de ser complicado para ti.</span>"
	lose_text = "<span class='notice'>Conducir un pod es como andar en bicicleta decian.</span>"
	class = "CONDUCIR"
	subclass = "POD" //tiene la misma clase  que el mech pilot pero diferente supclase
	etiqueta = "SKILL"

/datum/quirk/dualshooter
	name = "Vaquero"
	desc = "Eres un tirador experto."
	value = 1	//vale uno porque no es muy buena
	mob_trait = TRAIT_DUAL_SHOOTER
	gain_text = "<span class='notice'>Por qué disperar con un arma cuando puedes disparar con dos?.</span>"
	lose_text = "<span class='notice'>Al parecer disprar con dos armas no era tan facil despues de todo.</span>"
	class = "SEGURIDAD"
	subclass = "DISPARAR"
	etiqueta = "SKILL"

/datum/quirk/estomagofuerte
	name = "Estomago fuerte"
	desc = "Estas acostumbrado a los malos olres."
	value = 1	//vale uno porque es una tonteria
	mob_trait = TRAIT_ESTOMAGO_FUERTE
	gain_text = "<span class='notice'>Los olores fuertes no te afectan.</span>"
	lose_text = "<span class='notice'>Los lores fuertes hacen revolver el estomago.</span>"
	class = "SEGURIDAD"
	subclass = "DISPARAR"
	etiqueta = "SKILL"