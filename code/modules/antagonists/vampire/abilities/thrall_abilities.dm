/datum/targetable/vampiric_thrall/speak
	name = "Speak"
	desc = "Telepathically speak to your master and your fellow ghouls."
	icon_state = "thrallspeak"
	targeted = FALSE
	target_nodamage_check = 1
	max_range = 1
	cooldown = 0
	pointCost = 0
	not_when_in_an_object = FALSE
	incapacitation_restriction = 1
	can_cast_while_cuffed = TRUE
	unlock_message = ""

	incapacitation_check()
		.= 1

	cast(mob/target)
		if (!holder)
			return 1

		var/mob/living/M = holder.owner
		var/datum/abilityHolder/vampiric_thrall/H = holder

		if (!M)
			return 1

		var/message = html_encode(input("Choose something to say:","Enter Message.","") as null|text)
		if (!message)
			return

		if (!H.master)
			boutput(M, SPAN_ALERT("Your link to your master has been severed!"))
			return 1

		.= H.msg_to_master(message)

		return 0
