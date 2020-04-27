/mob/living/simple_animal/update_canmove(delay_action_updates = 0)
	if(paralysis || stunned || IsWeakened() || stat || resting || sleeping)
		drop_r_hand()
		drop_l_hand()
		canmove = 0
	else if(buckled)
		canmove = 0
	else
		canmove = 1
	if(!canmove)
		walk(src, 0)

	update_transform()
	if(!delay_action_updates)
		update_action_buttons_icon()
	return canmove
