/*********************************
Procs for handling ircbot connectivity and data transfer
*********************************/


var/global/datum/ircbot/ircbot = new /datum/ircbot()

/datum/ircbot
	var/interface = null
	var/loaded = 0
	var/loadTries = 0
	var/list/queue = list()
	var/debugging = 0

	New()
		..()
		if (!src.load())
			SPAWN(1 SECOND)
				if (!src.loaded)
					src.load()

	proc
		//Load the config variables necessary for connections
		load()
			if (config)
				src.interface = config.irclog_url
				src.loaded = 1

				if (src.queue && src.queue.len > 0)
					if (src.debugging)
						src.logDebug("Load success, flushing queue: [json_encode(src.queue)]")
					for (var/x = 1, x <= src.queue.len, x++) //Flush queue
						src.export(src.queue[x]["iface"], src.queue[x]["args"])

				src.queue = null
				return 1
			else
				loadTries++
				if (loadTries >= 5)
					logTheThing(LOG_DEBUG, null, "<b>IRCBOT:</b> Reached 5 failed config load attempts")
					logTheThing(LOG_DIARY, null, "<b>IRCBOT:</b> Reached 5 failed config load attempts", "debug")
				return 0


		//Shortcut proc for event-type exports
		event(type, data)
			set waitfor = FALSE // events async by default because who cares about the result really, we are just notifying the bot about something
			if (!type) return 0
			var/list/eventArgs = list("type" = type)
			if (data) eventArgs |= data
			return src.export("event", eventArgs)

		apikey_scrub(text)
			if(config.ircbot_api)
				return replacetext(text, config.ircbot_api, "***")
			else
				return text

		text_args(list/arguments)
			return src.apikey_scrub(list2params(arguments))

		export_async(iface, args)
			set waitfor = FALSE
			export(iface, args)

		//Send a message to an irc bot! Yay!
		export(iface, args)
			return


		//Format the response to an irc request juuuuust right
		response(args)
			if (src.debugging)
				src.logDebug("Response called with args: [text_args(args)]")

			args = (args == null ? list() : args)

			if (config?.server_name)
				args["server_name"] = replacetext(config.server_name, "#", "")
				args["server"] = replacetext(config.server_name, "#", "") //TEMP FOR BACKWARD COMPAT WITH SHITFORMANT

			if (src.debugging)
				src.logDebug("Response, final args: [text_args(args)]")

			return text_args(args)


		toggleDebug(client/C)
			if (!C) return 0
			src.debugging = !src.debugging
			out(C, "IRCBot Debugging [(src.debugging ? "Enabled" : "Disabled")]")
			if (src.debugging)
				var/log = "Debugging Enabled. Datum variables are: "
				for (var/x = 1, x <= src.vars.len, x++)
					var/theVar = src.vars[x]
					if (theVar == "vars") continue
					var/contents
					if (islist(src.vars[theVar]))
						contents = list2params(src.vars[theVar])
					else
						contents = src.vars[theVar]
					log += "<b>[theVar]:</b> [contents] "
				src.logDebug(log)
			return 1


		logDebug(log)
			if (!log) return 0
			logTheThing(LOG_DEBUG, null, "<b>IRCBOT DEBUGGING:</b> [log]")
			return 1


/client/proc/toggleIrcbotDebug()
	set name = "Toggle IRCBot Debug"
	set desc = "Enables in-depth logging of all IRC Bot exports and returns"
	SET_ADMIN_CAT(ADMIN_CAT_SERVER_TOGGLES)

	ADMIN_ONLY

	ircbot.toggleDebug(src)
	return 1


/client/verb/linkDiscord(discordCode as text)
	set name = "Link Discord"
	set category = "Commands"
	set desc = "Links your Byond key with your Discord account. Enter the code Medical Assistant gave you when you ran ]link."
	set popup_menu = 0

	if (!discordCode)
		discordCode = input(src, "Please enter your Discord access code. You can get this by running ]link in Discord. Or leave the field empty if you want to receive the Discord invite.", "Link Discord") as null|text

	if (!discordCode)
		usr << link("https://discord.gg/zd8t6pY")

	if (ircbot.debugging)
		ircbot.logDebug("linkDiscord verb called. <b>src.ckey:</b> [src.ckey]. <b>discordCode:</b> [discordCode]")

	if (!discordCode || !src.ckey) return 0

	var/ircmsg[] = new()
	ircmsg["key"] = src.key
	ircmsg["ckey"] = src.ckey
	ircmsg["code"] = discordCode
	var/res = ircbot.export("link", ircmsg)

	if (res)
		tgui_alert(src, "Please return to Discord and look for any Medical Assistant PMs.", "Discord")
		return 1
	else
		tgui_alert(src, "An unknown internal error occurred. Please report this.", "Error")
		return 0
