#define isrevenant(A) (istype(A, /mob/living/simple_animal/revenant))
#define isrune(A) (istype(A, /obj/effect/rune))
#define adjustessence(A) (istype(A, /obj/effect/rune))

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
	desc = "A cursed hammer, which can only damage when you throw it."
	icon = 'icons/hispania/obj/weapons.dmi'
	icon_state = "pride"
	item_state = "pride"
	slot_flags = SLOT_BELT
	lefthand_file = 'icons/hispania/mob/inhands/weapons_lefthand.dmi'
	righthand_file = 'icons/hispania/mob/inhands/weapons_righthand.dmi'
	force = 3
	throwforce = 25

