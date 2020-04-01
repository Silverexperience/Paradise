/obj/item/nullrod/armblade/unholy_blessing
	name = "unholy blessing"
	icon_state = "tentacle"
	item_state = "tentacle"
	desc = "A tentacle made by ancient dark gods."
	hitsound = 'sound/effects/splat.ogg'
	sharp = 0

/obj/item/nullrod/egyptian
	name = "egyptian staff"
	desc = "A tutorial in mummification is carved into the staff. You could probably craft the wraps if you had some cloth."
	icon = 'icons/hispania/obj/weapons.dmi'
	icon_state = "pharoah_sceptre"
	item_state = "pharoah_sceptre"
	lefthand_file = 'icons/hispania/mob/inhands/weapons_lefthand.dmi'
	righthand_file = 'icons/hispania/mob/inhands/weapons_righthand.dmi'
	w_class = WEIGHT_CLASS_HUGE
	attack_verb = list("bashes", "smacks", "whacks")

/obj/item/nullrod/hammmer/pride_hammer
	name = "pride-struck Hammer"
	desc = "It resonates an aura of Pride."
	icon = 'icons/hispania/obj/weapons.dmi'
	icon_state = "pride"
	item_state = "pride"
	slot_flags = SLOT_BELT
	lefthand_file = 'icons/hispania/mob/inhands/weapons_lefthand.dmi'
	righthand_file = 'icons/hispania/mob/inhands/weapons_righthand.dmi'
	force = 9
	throwforce = 20

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
	var/confirmation_message = "The card are still unused. Do you wish to use it?"
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
	damage_transfer = 0.4
	attacktext = "heals"
	friendly = "heals"
	a_intent = INTENT_HELP
	icon = 'icons/hispania/obj/holy_tarot.dmi'
	icon_living = "holy_guardian"
	icon_state = "holy_guardian"
	icon_dead = "holy_guardian"
	playstyle_string = "As a <b>Holy</b> type you have a high damage resistance but you don't have damage habilities, only healing powers with little consequences."
	magic_fluff_string = "You feel the power of the gods filling your blood."
	tech_fluff_string = "This is a error. If you report this I'll agree whit you for eternity."
	bio_fluff_string = "This is a error. If you report this I'll agree whit you for eternity."
	var/heal_cooldown = 0

/mob/living/simple_animal/hostile/guardian/holy/AttackingTarget()
	. = ..()
	if(loc == summoner)
		to_chat(src, "<span class='danger'>You must be manifested to heal!</span>")
		return
	if(iscarbon(target))
		changeNext_move(CLICK_CD_MELEE)
		var/mob/living/carbon/C = target
		if(C == summoner)
			to_chat(src, "<span class='danger'>You cant heal your summoner</span>")
			return
		if(heal_cooldown <= world.time && !stat)
				C.adjustBruteLoss(-5, robotic=1)
				C.adjustFireLoss(-5, robotic=1)
				C.adjustOxyLoss(-5)
				C.adjustToxLoss(-5)
				C.adjustBrainLoss(15)
				heal_cooldown = world.time + 20			
				to_chat(src, "<span class='danger'>You cant heal your summoner</span>")
