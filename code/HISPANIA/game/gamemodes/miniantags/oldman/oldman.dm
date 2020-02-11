// SCP-106 HAS BREACHED CONTAINMENT
/mob/living/simple_animal/hostile/oldman
	name = "old man"
	real_name = "old man"
	desc = "A putrid, rotten humanoid, leaving a trail of death and decay. Has an unpleasant smile and is looking at you..."
	speak = list("Spuaj...", "Bletz...", "Grur...", "Hungry...", "Blood...", "Jaks...", "Blerg...", "Ajj...", "Krg...")
	speak_emote = list("gasps")
	emote_hear = list("wails","screeches")
	response_help  = "thinks better of touching"
	response_disarm = "flails at"
	response_harm   = "punches"
	icon = 'icons/hispania/mob/oldman.dmi'
	icon_state = "idle"
	icon_living = "oldman"
	incorporeal_move = 3
	invisibility = INVISIBILITY_REVENANT
	density = 0
	move_resist = INFINITY
	mob_size = MOB_SIZE_TINY
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	var/dimension = TRUE
	speed = 1
	wander = 0
	a_intent = INTENT_HARM
	stop_automated_movement = 1
	status_flags = CANPUSH
	attack_sound = 'sound/hispania/effects/oldman/gasp1.ogg'
	death_sound = 'sound/misc/demon_dies.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = INFINITY
	attacktext = "lashes"
	maxHealth = 1000
	health = 1000
	environment_smash = 1
	universal_understand = 1
	obj_damage = 50
	melee_damage_type = "fire"
	melee_damage_lower = 20
	melee_damage_upper = 25
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	var/last_meal

	var/list/consumed_mobs = list()

	loot = list(/obj/effect/decal/cleanable/blood/oil/sludge, /obj/effect/decal/cleanable/blood/oil/sludge, /obj/effect/gibspawner/generic, /obj/effect/gibspawner/generic)
	var/playstyle_string = "<B>You are the Old Man, an ancient entity who has been hunting humanity for centuries and still hungers for more.  \
						You are slow, but very durable. Your attacks slows and corrode your victims. \
						You may Click on walls to travel through them, appearing and disappearing from the station at will. \
						Pulling a dead or critical mob while you enter a wall will pull them in with you, sending them to your pocket dimension. </B>"
	del_on_death = 1
	deathmessage = "lets out a screeching scream as it escapes to its pocket dimension!"

	vision_range = 1
	aggro_vision_range = 1


/mob/living/simple_animal/hostile/oldman/New()
	..()
	remove_from_all_data_huds()
	last_meal = world.time
	if(mind)
		to_chat(src, src.playstyle_string)
		to_chat(src, "<B><span class ='notice'>You are not currently in the same plane of existence as the station. Click a wall to emerge.</span></B>")
		to_chat(src, "<B>Objective #[1]</B>: Hunt down as much of the crew as you can.")

/mob/living/simple_animal/hostile/oldman/Life(seconds, times_fired)
	..()
	if(!dimension)
		if(prob(20))
			new /obj/effect/decal/cleanable/blood/oil/sludge(get_turf(src))
	if(world.time - last_meal > 1200) //2 minutes
		if(world.time - last_meal > 3000) //5 minutes
			adjustBruteLoss(5)
			if(prob(5))
				to_chat(src, "<span class ='danger'>You are getting weaker by hunger!</span>")
		else
			if(prob(5))
				to_chat(src, "<span class ='warning'>You are getting hungry...</span>")

/mob/living/simple_animal/hostile/oldman/Destroy()
	for(var/mob/living/M in consumed_mobs)
		M.forceMove(get_turf(src))
	. = ..()

/mob/living/simple_animal/hostile/oldman/AttackingTarget()
	if(istype(target, /turf/simulated/wall))
		var/turf/simulated/wall/T = target
		if(dimension)
			outdimension(T)
		else
			indimension(T)
		return
	if(dimension)
		return
	if(isliving(target) && (!client || a_intent == INTENT_HARM))
		var/attack = pick(list('sound/hispania/effects/oldman/gasp1.ogg','sound/hispania/effects/oldman/gasp2.ogg','sound/hispania/effects/oldman/sludge.ogg'))
		attack_sound = attack
		var/mob/living/carbon/human/L = target
		L.adjustStaminaLoss(20)
		L.adjustToxLoss(3)
		if(prob(5))
			for(var/obj/item/organ/external/P in (L.bodyparts))
				P.germ_level = INFECTION_LEVEL_ONE
		..()
	else
		..()

/mob/living/simple_animal/hostile/oldman/hitby(atom/movable/AM, datum/thrownthing/throwingdatum) //No floor tiling them to death, wiseguy
	if(istype(AM, /obj/item))
		var/obj/item/T = AM
		if(!stat)
			Aggro()
		if(T.throwforce <= 10)
			visible_message("<span class='notice'>The [src.name] seems unaffected by the [T.name]!</span>")
			return
	..()

/obj/effect/decal/cleanable/blood/oil/sludge
	name = "black sludge"
	desc = "It's a black and slimy sludge. Smells like death."

/obj/effect/decal/cleanable/blood/oil/sludge/Crossed(atom/movable/O)
	..()
	if(!off_floor && ishuman(O))
		var/mob/living/carbon/human/L = O
		L.adjustStaminaLoss(10)
		L.adjustToxLoss(1)
