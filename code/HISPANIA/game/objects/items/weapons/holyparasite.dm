#define isrevenant(A) (istype(A, /mob/living/simple_animal/revenant))
#define isrune(A) (istype(A, /obj/effect/rune))
#define adjustessence(A) (istype(A, /obj/effect/rune))

/obj/item/nullrod/holy_tarot
	name = "a holy tarot card"
	desc = "For all your holy needs!"
	icon = 'icons/hispania/obj/holy_tarot.dmi'
	lefthand_file = null
	righthand_file = null
	icon_state = "holy_tarot"
	force = 0
	throwforce = 0
	var/used = FALSE
	var/confirmation_message = "The card is still unused. Do you wish to use it?"
	var/use_message = "You use the card"
	var/used_message = "The cards seem to be unpower for now."
	var/failure_message = "The cards seem to be unpower for now."
	var/ling_failure = "The deck refuses to respond to a souless creature such as you."
	var/mob_name = "Holy Spirit"
	var/name_list = list("Aries", "Leo", "Sagittarius", "Taurus", "Virgo", "Capricorn", "Gemini", "Libra", "Aquarius", "Cancer", "Scorpio", "Pisces","God")

/obj/item/nullrod/holy_tarot/attack_self(mob/living/user)
	if(user.mind.isholy == FALSE)
		to_chat(user, "[ling_failure]")
		user.adjustBruteLoss(15,robotic=15)
		return
	for(var/mob/living/simple_animal/hostile/guardian/G in GLOB.living_mob_list)
		if(G.summoner == user)
			to_chat(user, "You already have a [mob_name]!")
			return
	if(user.mind && (user.mind.changeling || user.mind.vampire))
		to_chat(user, "[ling_failure]")
		return
	if(used == TRUE)
		to_chat(user, "[used_message]")
		return
	var/choice = alert(user, "[confirmation_message]",, "Yes", "No")
	if(choice == "No")
		to_chat(user, "<span class='warning'>You decide against using the [name].</span>")
		return
	used = TRUE
	to_chat(user, "[use_message]")
	var/list/mob/dead/observer/candidates = pollCandidates("Do you want to play as the [mob_name] of [user.real_name]?", ROLE_GUARDIAN, 0, 100)
	var/mob/dead/observer/theghost = null

	if(candidates.len)
		theghost = pick(candidates)
		spawn_guardian(user, theghost.key)
	else
		to_chat(user, "[failure_message]")
		used = FALSE

/obj/item/nullrod/holy_tarot/proc/spawn_guardian(mob/living/user, key)
	var/mob/living/simple_animal/hostile/guardian/G = /mob/living/simple_animal/hostile/guardian/holy
	G.summoner = user
	G.summoned = TRUE
	G.key = key
	to_chat(G, "You are a [mob_name] bound to serve [user.real_name].")
	to_chat(G, "You are capable of manifesting or recalling to your master with verbs in the Guardian tab. You will also find a verb to communicate with them privately there.")
	to_chat(G, "While personally invincible, you will die if [user.real_name] does, and any damage dealt to you will have a portion passed on to them as you feed upon them to sustain yourself.")
	to_chat(G, "[G.playstyle_string]")
	G.faction = user.faction
	user.verbs += /mob/living/proc/guardian_comm
	user.verbs += /mob/living/proc/guardian_recall
	user.verbs += /mob/living/proc/guardian_reset

	var/color = null
	G.name_color = "Holy"
	var/picked_name = pick(name_list)
	create_theme(G, user, picked_name, color)

/obj/item/nullrod/holy_tarot/proc/create_theme(mob/living/simple_animal/hostile/guardian/G, mob/living/user, picked_name, color)
	G.name = "[picked_name] [color]"
	G.real_name = "[picked_name] [color]"
	G.icon = 'icons/hispania/obj/holy_tarot.dmi'
	G.icon_living = "holy_guardian"
	G.icon_state = "holy_guardian"
	G.icon_dead = "holy_guardian"
	to_chat(user, "[G.magic_fluff_string].")

/obj/item/nullrod/holy_tarot/examine(mob/user, distance)
	. = ..()
	if(used)
		. += "<span class='notice'>[used_message]</span>"

/mob/living/simple_animal/hostile/guardian/holy
	melee_damage_lower = 0
	melee_damage_upper = 0
	obj_damage = 0
	damage_transfer = 0.2
	range = 5
	attacktext = "bless"
	friendly = "bless"
	a_intent = INTENT_HELP
	icon = 'icons/hispania/obj/holy_tarot.dmi'
	icon_living = "holy_guardian"
	icon_state = "holy_guardian"
	icon_dead = "holy_guardian"
	playstyle_string = "As a <b> Holy </b> type, you can erase cult runes, bless the water, and have high damage resistance, but you only have damage abilities for revenants and vampires and you also have less range than other guardians."
	magic_fluff_string = "You feel the power of gods filling your blood."
	tech_fluff_string = "This is a error. If you report this I'll agree whit you for eternity."
	bio_fluff_string = "This is a error. If you report this I'll agree whit you for eternity."
	var/heal_cooldown = 0

/mob/living/simple_animal/hostile/guardian/holy/AttackingTarget()
	. = ..()
	var/mob/living/C = target
	if(isrevenant(C))
		to_chat(src,"<span class='danger'>You steal part of the revenant soul.</span>")
		C.adjustBruteLoss(25)
		return
	if(isrune(C))
		to_chat(src,"<span class='danger'>You disrupt the cult magic.</span>")
		qdel(target)
		return
	if(iscarbon(C))
		if(C.mind.vampire)
			to_chat(src,"<span class='danger'>You bless they unholy soul.</span>")
			C.adjustBruteLoss(10)
			C.adjustFireLoss(5)
		if(C.mind.isblessed)
			to_chat(src,"<span class='danger'>You feel God with him.</span>")
	if(C.reagents && C.reagents.has_reagent("water"))
		to_chat(src, "<span class='notice'>You bless [C].</span>")
		var/water2holy = C.reagents.get_reagent_amount("water")
		C.reagents.del_reagent("water")
		C.reagents.add_reagent("holywater",water2holy)
	if(C.reagents && C.reagents.has_reagent("unholywater"))
		to_chat(src, "<span class='notice'>You purify [C].</span>")
		var/unholy2clean = C.reagents.get_reagent_amount("unholywater")
		C.reagents.del_reagent("unholywater")
		C.reagents.add_reagent("holywater",unholy2clean)