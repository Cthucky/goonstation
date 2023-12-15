/datum/targetable/throw/werewolf
	name = "Throw"
	desc = "Spin a grabbed opponent around and throw them."
	icon = 'icons/mob/werewolf_ui.dmi'
	icon_state = "throw"
	preferred_holder_type = /datum/abilityHolder/werewolf
	cooldown = 30 SECONDS

	// duplicated from werewolf abilityHolder. see comment on /datum/targetable/castcheck()
	// TODO ABILITYHOLDER CASTCHECK
	castcheck()
		. = ..()
		var/mob/living/carbon/human/user = src.holder.owner

		if (!ishuman(user)) // Only humans use mutantrace datums.
			boutput(user, SPAN_ALERT("You cannot use any powers in your current form."))
			return FALSE

		if (!iswerewolf(user))
			boutput(user, SPAN_ALERT("You must be in your wolf form to use this ability."))
			return FALSE



