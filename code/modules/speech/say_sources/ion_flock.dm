/atom/movable/abstract_say_source/ion_flock
	speech_verb_say = list("sings", "clicks", "whistles", "intones", "transmits", "submits", "uploads")
	start_speech_outputs = list(SPEECH_OUTPUT_FLOCK_ION)
	default_speech_output_channel = SAY_CHANNEL_DISTORTED_FLOCK
	say_language = LANGUAGE_FEATHER

/atom/movable/abstract_say_source/ion_flock/New()
	. = ..()
	src.name = global.get_default_flock().name
