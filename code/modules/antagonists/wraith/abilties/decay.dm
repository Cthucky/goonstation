/datum/targetable/wraithAbility/decay
	name = "Decay"
	icon_state = "decay"
	desc = "Cause a human to lose stamina, or an object to malfunction."
	targeted = TRUE
	target_non_mobs = TRUE
	pointCost = 30
	cooldown = 1 MINUTE
	min_req_dist = 15

	cast(atom/target)
		. = ..()
		//If you targeted a turf for some reason, find a valid target on it
		if (isturf(target))
			for (var/mob/living/carbon/human/M in target.contents)
				if (!isdead(M))
					target = M
					break
			if (!target)
				for (var/obj/O in target.contents)
					target = O //todo: emaggable check
					break

		if (ishuman(target))
			var/mob/living/carbon/H = target
			if (H.traitHolder.hasTrait("training_chaplain"))
				boutput(src.holder.owner, SPAN_ALERT("Some mysterious force protects [H] from your influence."))
				return TRUE
			else
				boutput(src.holder.owner, SPAN_NOTICE("[pick("You sap [H]'s energy.", "You suck the breath out of [H].")]"))
				boutput(H, SPAN_ALERT("You feel really tired all of a sudden!"))
				src.holder.owner.playsound_local(src.holder.owner.loc, 'sound/voice/wraith/wraithstaminadrain.ogg', 75, 0)
				H.emote("pale")
				H.remove_stamina(rand(100, 120))
				H.changeStatus("stunned", 4 SECONDS)
				return FALSE
		else if (isobj(target))
			if(istype(target, /obj/machinery/computer/shuttle))
				boutput(src.holder.owner, SPAN_ALERT("You cannot seem to alter the energy of [target].") )
				return TRUE
			// go to jail, do not pass src, do not collect pushed messages
			if (target.emag_act(null, null))
				boutput(src.holder.owner, SPAN_NOTICE("You alter the energy of [target]."))
				return FALSE
			else
				boutput(src.holder.owner, SPAN_ALERT("You fail to alter the energy of [target]."))
				return TRUE
		else // turf
			boutput(src.holder.owner, "<span class='alert>There's nothing to target there.</span>")
			return TRUE
