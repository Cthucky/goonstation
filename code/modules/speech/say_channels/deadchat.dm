/datum/say_channel/dead
	channel_id = SAY_CHANNEL_DEAD
	disabled_message = "Deadchat is currently disabled."
	suppress_say_sound = TRUE
	var/datum/say_channel/delimited/local/ghostly_whisper/ghostly_whisper_channel

/datum/say_channel/dead/New()
	. = ..()

	SPAWN(0)
		src.ghostly_whisper_channel = global.SpeechManager.GetSayChannelInstance(SAY_CHANNEL_GHOSTLY_WHISPER)

/datum/say_channel/dead/PassToChannel(datum/say_message/message)
	. = ..()

	if (!(message.flags & SAYFLAG_ADMIN_MESSAGE))
		RELAY_MESSAGE_TO_SAY_CHANNEL(src.ghostly_whisper_channel, message.Copy())

/datum/say_channel/dead/log_message(datum/say_message/message)
	var/mob/M = message.speaker
	if (!istype(M) || !M.client || !(message.flags & SAYFLAG_SPOKEN_BY_PLAYER))
		return

	logTheThing(LOG_SAY, message.speaker, "([src.channel_id]): [message.content]")
	phrase_log.log_phrase("deadsay", message.content)


/datum/say_channel/delimited/local/ghostly_whisper
	channel_id = SAY_CHANNEL_GHOSTLY_WHISPER
