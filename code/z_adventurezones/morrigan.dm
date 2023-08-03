// Morrigan Azone Objects
// ID Cards
/obj/item/card/id/morrigan

/obj/item/card/id/morrigan/botany
	name = "Moldy Botanist ID"
	icon_state = "id_civ"
	desc = "Ew..."
	access = list(access_morrigan_botany)

/obj/item/card/id/morrigan/inspector
	name = "Old Inspector's Card"
	icon_state = "data"
	desc = "Looks like and old proto-type ID card!"
	access = list(access_morrigan_teleporter)

/obj/item/card/id/morrigan/engineer
	name = "Richard S. Batherl (Engineer)"
	icon_state = "id_eng"
	desc = "This should let you get into engineering..."
	access = list(access_morrigan_engineering)

/obj/item/card/id/morrigan/ce
	name = "Misplaced CE Card"
	icon_state = "id_com"
	desc = "Name and picture are scratched off. It's in pretty poor shape."
	access = list(access_morrigan_CE, access_morrigan_engineering)

/obj/item/card/id/morrigan/medical
	name = "Harther Monoshoe (EMT)"
	icon_state = "id_res"
	desc = "A card for medbay!"
	access = list(access_morrigan_medical)

/obj/item/card/id/morrigan/mdir
	name = "Barara J. June (Medical Director)"
	icon_state = "id_com"
	desc = "An important ID card belonging to the medical director."
	access = list(access_morrigan_medical, access_morrigan_mdir, access_morrigan_bridge)

/obj/item/card/id/morrigan/science
	name = "Troy Wentworth (Scientist)"
	icon_state = "id_res"
	desc = "An ID card of a scientist."
	access = list(access_morrigan_science)

/obj/item/card/id/morrigan/rd
	name = "Partially melted Research Director ID"
	icon_state = "id_pink"
	desc = "This card looks badly damaged, does it still work?"
	access = list(access_morrigan_science, access_morrigan_RD)

/obj/item/card/id/morrigan/janitor
	name = "Yi Wong (Janitor)"
	icon_state = "id_civ"
	desc = "It's sparkling clean."
	access = list(access_morrigan_janitor)

/obj/item/card/id/morrigan/security
	name = "Harrier S. Jentlil (Patrol Officer)"
	icon_state = "id_sec"
	desc = "Wow, a still intact security ID! This could come in handy..."
	access = list(access_morrigan_security)

/obj/item/card/id/morrigan/hos
	name = "Alexander Nash (Elite Head of Security)"
	icon_state = "id_syndie"
	desc = "Jackpot!"
	access = list(access_morrigan_bridge, access_morrigan_security, access_morrigan_HOS)

/obj/item/card/id/morrigan/customs
	name = "William B. Ron"
	icon_state = "id_com"
	desc = "A Head ID but it seems to be lacking something..."
	access = list(access_morrigan_customs, access_morrigan_bridge)

/obj/item/card/id/morrigan/captain
	name = "Captain's Spare ID"
	icon_state = "id_syndie"
	desc = "The Captains spare ID! This should access most doors..."

	New()
		..()
		access = morrigan_access() - list(access_morrigan_exit)

/obj/item/card/id/morrigan/all_access
	name = "Spare HQ Card"
	icon_state = "id_syndie"
	desc = "Someone must've been in a rush and left this behind... could this be your key out?"

	New()
		..()
		access = morrigan_access()

/proc/morrigan_access()
	return list(access_morrigan_bridge, access_morrigan_medical, access_morrigan_CE, access_morrigan_captain, access_morrigan_RD, access_morrigan_engineering,
	access_morrigan_factory, access_morrigan_HOS, access_morrigan_meetingroom, access_morrigan_customs, access_morrigan_exit, access_morrigan_science,
	access_morrigan_mdir, access_morrigan_security, access_morrigan_janitor)

//fake objects

/obj/decal/fakeobjects/pod
	name = "Pod"
	icon = 'icons/effects/64x64.dmi'
	bound_width = 64
	bound_height = 64

/obj/decal/fakeobjects/pod/syndicate/racepod
	name = "Syndicate Security Pod"
	desc = "A Syndicate-crafted light pod, seems locked."
	icon_state = "pod_raceRed"

/obj/decal/fakeobjects/pod/nanotrasen/racepod
	name = "Nanotrasen Light Pod"
	desc = "A Nanotrasen light Pod! It seems locked.. "
	icon_state = "pod_raceBlue"

/obj/decal/fakeobjects/pod/black
	name = "Black Pod"
	desc = "A black pod, seems locked."
	icon_state = "pod_black"

/obj/decal/fakeobjects/miniputt
	name = "Miniputt"
	icon = 'icons/obj/ship.dmi'

/obj/decal/fakeobjects/miniputt/syndicate/raceputt
	name = "Syndicate Security MiniPutt"
	desc = "A Syndicate-crafted light miniputt, seems locked."
	icon_state = "putt_raceRed_alt"

/obj/decal/fakeobjects/miniputt/nanotrasen/raceputt
	name = "Nanotrasen Light MiniPutt"
	desc = "A Nanotrasen light miniputt! It seems locked.."
	icon_state = "putt_raceBlue"

/obj/decal/fakeobjects/miniputt/black
	name = "Black Miniputt"
	desc = "A black miniputt, seems locked."
	icon_state = "putt_black"

//NPCS for Morrigan

/mob/living/carbon/human/hobo
	New()
		..()
		src.equip_new_if_possible(pick(/obj/item/clothing/head/apprentice, /obj/item/clothing/head/beret/random_color, /obj/item/clothing/head/black, /obj/item/clothing/head/chav,
		/obj/item/clothing/head/fish_fear_me/emagged, /obj/item/clothing/head/flatcap, /obj/item/clothing/head/party/random, /obj/item/clothing/head/plunger,
		/obj/item/clothing/head/towel_hat, /obj/item/clothing/head/wizard/green, /obj/item/clothing/head/snake, /obj/item/clothing/head/raccoon,
		/obj/item/clothing/head/bandana/random_color), SLOT_HEAD)
		src.equip_new_if_possible(pick(/obj/item/clothing/under/gimmick/yay, /obj/item/clothing/under/misc/casualjeansgrey, /obj/item/clothing/under/misc/dirty_vest,
		/obj/item/clothing/under/misc/yoga/communist, /obj/item/clothing/under/patient_gown, /obj/item/clothing/under/shorts/random_color,
		/obj/item/clothing/under/shorts/trashsinglet, /obj/item/clothing/under/misc/flannel), SLOT_W_UNIFORM)
		src.equip_new_if_possible(pick(/obj/item/clothing/suit/walpcardigan, /obj/item/clothing/suit/gimmick/hotdog, /obj/item/clothing/suit/loosejacket,
		/obj/item/clothing/suit/torncloak/random, /obj/item/clothing/suit/gimmick/guncoat/dirty, /obj/item/clothing/suit/bathrobe, /obj/item/clothing/suit/apron,
		/obj/item/clothing/suit/apron/botanist, /obj/item/clothing/suit/bedsheet/random), SLOT_WEAR_SUIT)
		src.equip_new_if_possible((/obj/item/clothing/shoes/tourist), SLOT_SHOES)

	Life(datum/controller/process/mobs/parent)
		if (..(parent))
			return 1

		if (prob(2) && !src.stat)
			src.emote("scream")

	initializeBioholder()
		. = ..()
		randomize_look(src, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, src)
		bioHolder.mobAppearance.gender = "male"
		bioHolder.age = rand(50, 90)
		bioHolder.mobAppearance.customization_first_color = pick("#292929", "#504e00" , "#1a1016")
		bioHolder.mobAppearance.customization_second_color = pick("#292929", "#504e00" , "#1a1016")
		var/beard = pick(/datum/customization_style/hair/gimmick/shitty_beard, /datum/customization_style/hair/gimmick.wiz, /datum/customization_style/beard/braided,
		/datum/customization_style/beard/abe, /datum/customization_style/beard/fullbeard, /datum/customization_style/beard/longbeard, /datum/customization_style/beard/trampstains)
		bioHolder.mobAppearance.customization_second = new beard

/mob/living/carbon/human/hobo/vladimir
	real_name = "Vladimir Dostoevsky"

	Life(datum/controller/process/mobs/parent)
		if (..(parent))
			return 1

		if (prob(10) && !src.stat)
			src.say(pick( "I neeeda zzrink...", "Fugh...", "Where me am...", "I pischd on duh floor...","Why duh bluee ann sen how..."))

/mob/living/carbon/human/hobo/laraman
	real_name = "The Lara Man"

	Life(datum/controller/process/mobs/parent)
		if (..(parent))
			return 1

		if (src.stat)
			return

		src.setStatusMin("weakened", 10 SECONDS)
		if (prob(10))
			src.say(pick( "Don't look for Lara...", "Lara??", "Lara the oven!", "Please don't talk to Lara", "LAAAAARRRAAAAAAAA!!!" ,"L-Lara."))

/mob/living/carbon/human/syndicatemorrigan
	New()
		..()
		src.equip_new_if_possible((/obj/item/clothing/head/biker_cap), SLOT_HEAD)
		src.equip_new_if_possible((/obj/item/clothing/mask/gas/swat), SLOT_WEAR_MASK)
		src.equip_new_if_possible((/obj/item/clothing/under/rank/head_of_security/fancy_alt), SLOT_W_UNIFORM)
		src.equip_new_if_possible((/obj/item/clothing/suit/armor/vest), SLOT_WEAR_SUIT)
		src.equip_new_if_possible((/obj/item/clothing/gloves/black), SLOT_GLOVES)
		src.equip_new_if_possible((/obj/item/clothing/shoes/swat), SLOT_SHOES)

	Life(datum/controller/process/mobs/parent)
		if (..(parent))
			return 1

		if (prob(0) && !src.stat)
			src.emote("scream")

	initializeBioholder()
		. = ..()
		randomize_look(src, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, src)

/mob/living/carbon/human/syndicatemorrigandoc
	New()
		..()
		src.equip_new_if_possible((/obj/item/clothing/glasses/nightvision/sechud), SLOT_GLASSES)
		src.equip_new_if_possible((/obj/item/clothing/mask/surgical), SLOT_WEAR_MASK)
		src.equip_new_if_possible((/obj/item/clothing/under/scrub), SLOT_W_UNIFORM)
		src.equip_new_if_possible((/obj/item/clothing/suit/bio_suit/armored/nt), SLOT_WEAR_SUIT)
		src.equip_if_possible((/obj/item/clothing/gloves/black), SLOT_GLOVES)
		src.equip_new_if_possible((/obj/item/clothing/shoes/swat), SLOT_SHOES)


	Life(datum/controller/process/mobs/parent)
		if (..(parent))
			return 1

		if (prob(0) && !src.stat)
			src.emote("scream")

	initializeBioholder()
		. = ..()
		randomize_look(src, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, src)




// Areas

/area/morrigan
	name = "Morrigan Area Parent"
	icon_state = "red"
	requires_power = FALSE

// Areas before the station proper

/area/morrigan/routing
	name = "Syndicate Routing Depot"
	icon_state = "depot"

/area/morrigan/routing/transport
	name = "Prisoner Transport"

/area/morrigan/construction
	name = "Construction Area"
	icon_state = "construction"

/area/morrigan/holding
	name = "Holding Cell"
	icon_state = "brigcell"

/area/morrigan/teleporter
	name = "Cell Teleporter"
	icon_state = "teleporter"

/area/morrigan/warden
	name = "Warden's Office"
	icon_state = "security"

/area/morrigan/overseer
	name = "Overseer's Office"
	icon_state = "red"

/area/morrigan/derelict
	name = "Derelict Maintenance"
	icon_state = "green"
	ambient_light = "#131414"

/area/morrigan/derelict/hobo
	name = "Hobo Hovel"
	icon_state = "crewquarters"

// Station areas

/area/morrigan/station
	area_parallax_layers = list(
		/atom/movable/screen/parallax_layer/space_1,
		/atom/movable/screen/parallax_layer/space_2,
		/atom/movable/screen/parallax_layer/asteroids_near/sparse,
		)

// Security areas

/area/morrigan/station/security

/area/morrigan/station/security/brig
	name = "Morrigan Brig"
	icon_state = "brigcell"

/area/morrigan/station/security/main
	name = "Morrigan Security"
	icon_state = "security"

/area/morrigan/station/security/armory
	name = "Morrigan Armory"
	icon_state = "armory"

/area/morrigan/station/security/interrogation
	name = "Morrigan Interrogation"
	icon_state = "brig"

// Med/Sci areas

/area/morrigan/station/medical
	icon_state = "blue"

/area/morrigan/station/medical/main
	name = "Morrigan Medical Centre"
	icon_state = "medbay"

/area/morrigan/station/medical/reception
	name = "Morrigan Medical Reception"

/area/morrigan/station/medical/emergency
	name = "Morrigan Emergency Response"

/area/morrigan/station/medical/morgue
	name = "Morrigan Morgue"

/area/morrigan/station/medical/robotics
	name = "Morrigan Robotics"

/area/morrigan/station/medical/cloning
	name = "Morrigan Cloning"

/area/morrigan/station/medical/genetics
	name = "Morrigan Genetics"

/area/morrigan/station/medical/biological
	name = "Morrigan Bio-Lab"
	icon_state = "medcdc"

/area/morrigan/station/science
	name = "Morrigan Science Centre"
	icon_state = "science"

// Engineering areas

/area/morrigan/station/engineering
	name = "Morrigan Engineering"
	icon_state = "engineering"

// Civilian areas

/area/morrigan/station/civilian

/area/morrigan/station/civilian/bar
	name = "Morrigan Bar"
	icon_state = "bar"

/area/morrigan/station/civilian/kitchen
	name = "Morrigan Kitchen"
	icon_state = "kitchen"

/area/morrigan/station/civilian/cafe
	name = "Morrigan Mess Hall"
	icon_state = "cafeteria"

/area/morrigan/station/civilian/botany
	name = "Morrigan Botany"
	icon_state = "hydro"

/area/morrigan/station/civilian/chapel
	name = "Morrigan Chapel"
	icon_state = "chapel"

/area/morrigan/station/civilian/crewquarters
	name = "Morrigan Crew Lounge"
	icon_state = "crewquarters"

/area/morrigan/station/civilian/janitor
	name = "Morrigan Janitor's Office"
	icon_state = "janitor"

/area/morrigan/station/civilian/clown
	name = "Morrigan Clown Hole"
	icon_state = "green"

// Command areas

/area/morrigan/station/command
	icon_state = "purple"

/area/morrigan/station/command/CE
	name = "Morrigan Chief Quarters"

/area/morrigan/station/command/RD
	name = "Morrigan Research Director's Office"

/area/morrigan/station/command/MD
	name = "Morrigan Medical Director's Office"

/area/morrigan/station/command/HOP
	name = "Morrigan Customs Office"

/area/morrigan/station/command/HOS
	name = "Morrigan Commanders Quarters"

/area/morrigan/station/command/captain
	name = "Morrigan Captains Quarters"

/area/morrigan/station/command/eva
	name = "Morrigan EVA Storage"

/area/morrigan/station/command/bridge
	name = "Morrigan Bridge"

/area/morrigan/station/command/meeting
	name = "Morrigan Conference Room"

// Misc areas

/area/morrigan/station/hallway
	name = "Morrigan Hall"
	icon_state = "yellow"

/area/morrigan/station/exit
	name = "Morrigan Escape Wing"
	icon_state = "escape"

/area/morrigan/station/maintenance
	name = "Morrigan Maintenance"
	icon_state = "imaint"

/area/morrigan/station/disposals
	name = "Morrigan Disposals"
	icon_state = "disposal"

/area/morrigan/station/spy
	name = "NanoTrasen Listening Room"

/area/morrigan/station/factory
	name = "Manufacturing Line"
	icon_state = "robotics"

/area/morrigan/station/passage
	name = "Manufacturing Passage"

/area/morrigan/station/space
	name = "Morrigan Space"
	icon_state = "red"
	area_parallax_layers = list(
		/atom/movable/screen/parallax_layer/space_1,
		/atom/movable/screen/parallax_layer/space_2,
		/atom/movable/screen/parallax_layer/asteroids_near/sparse,
		)

// Podbays

/area/morrigan/station/podbay
	icon_state = "hangar"

/area/morrigan/station/podbay/security
	name = "Morrigan Security Podbay"

/area/morrigan/station/podbay/medical
	name = "Morrigan Medical Podbay"

// Papers

/obj/item/paper/prelude_1
	name = "Messy piece of paper"
	icon_state = "paper_caution_bloody"
	info ={"
	He said he'd be here, that where was some way out, I spent all my lunch money on this... <br>
	Did he bail out on me ? Why did he mention a vending machine... <br>
	I have to get out of here before the wardens come back.
	"}

/obj/item/paper/prelude_2
	name = "Old piece of paper"
	icon_state = "paper_burned"
	info ={"
	They're abandoning this place hunh, about damn time. The air here is foul.<br>
	Working here was a hazard anyways, last week we lost Carla to some strange looking fella.<br>
	Security wouldn't even bother coming up here. These shafts are a death sentence.<br>
	I miss the old Captain, he wouldn't stand for these deplorable conditions, the power goes out constantly!
	"}

/obj/item/paper/prelude_3
	name = "Torn off piece of paper"
	icon_state = "paper_burned"
	info ={"
	Manfiest role call: <br>
	Carla Bentson - absent <br>
	Hendrick L. Fold - absent <br>
	Bernadette Crimonty - absent <br>
	(the rest is torn off)
	"}

/obj/item/paper/prelude_4
	name = "Old letter"
	icon_state = "paper_burned"
	info ={"
	I'm tired of this! Half our employees are high on crank!<br>
	This has to stop, captain. We're constantly losing power and worse yet, we're losing engineers!<br>
	I don't know who's supplying them or how this stuff is getting in but I have a hunch Carla is behind it.<br>
	She hasn't even been showing up to work lately and nobodoy even knows where she is.<br>
	At this rate I'm starting to think she might be an NT sleeper agent or something.<br>
	Ever since she came back from the outpost expidition she's been acting strange...<br>
	Captain, please do something about this.
	"}

/obj/item/paper/prelude_5
	name = "Old email print-out"
	icon_state = "paper_burned"
	info ={"
	Attention All Employees,<br>
	It has come to our notice that performance on this station is uncharacteristically low. After much deliberation with our superiors,<br>
	we regret to inform you that we will be decommissioning sector 4a.<br>
	You will all be on paid leave while we investigate alarming testaments about certain crew members of this section of the station.<br>
	After the investigation is concluded will re-allocate competent and productive members to another section of the station.<br>
	Those deemed unfit will be sent back to training off station. Renovation will begin in the coming weeks.<br>
	<br>
	Your Head of Personnel,
	Inowatt M. Dewing

	"}

/obj/item/paper/prelude_6
	name = "Deranged Scribblings"
	icon_state = "paper_caution"
	info ={"
	I've been inspecting CARGO FOR YEARS, 9 YEARS, PERFECT RECORD... something about the way the undesirable cargo and trash gets...<br>
	COMPACTED is just so... soo.....<br>
	... CRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHER<br>
	CRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHER<br>
	CRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHERCRUSHER<br>
	"}

/obj/item/paper/prelude_7
	name = "What am I doing?"
	icon_state = "paper_caution"
	info ={"
	I don't know what's going on, ever since that journey I ... I just can't seem to gather my thoughts.<br>
	I barely remember anything, just a voice and someone with... blue hair... Lara ? Lieria ? Lenah...?<br>
	I don't know who they are but something tells me, something... I must... wires...I must... obey...<br>
	"}

/obj/item/paper/prelude_hobo
	name = "Badly worded note"
	icon_state = "paper"
	info ={"
	Ey dun evn kno y he insts abt goin out there we kno thms foks no good, ey git is adiktins thms crazies gon get him!
	"}

/obj/item/paper/prelude_hobo2
	name = "LARA"
	icon_state = "paper_caution"
	info ={"
	Don't TELL LARA. LARA, LARA, PLEASE NOT LARA. LARA? LARAAAAAA, OH LARA<br>
	Not LARA! LARA ? LARA. L A R A. LARA! HANDS OFF LARA, WHERE'S LARA?<br>
	Have you seen LARA ? please LARA ! Laraaaaaaa??
	"}

/obj/item/paper/prelude_hobo3
	name = "Note"
	icon_state = "paper_caution"
	info ={"
	There's been less people passin' by. No good... us NT fellars gotta stick together! I still remember the old days, I sure miss that old station...
	mushroom was it ? We started off as 5 and we'd smuggle in a few others. But we've had to slow it down, been drawin' too much attention yer see.<br>
	that soda machine been keeping our brews fresh! You'd be right surprised what kinda liquor you can brew with them sodas.<br>
	Damn syndies keep restockin' it too! Every wheneversday yes sirree. We've also sealed off most the parts that was causing trouble with them<br>
	crazies over on the other side. Still hopin' we get a sign of Johnny sometime soon though. Went out to scout for some crank days ago.
	"}

/obj/item/paper/Morrigan1
	name = "I'm doomed..."
	icon_state = "paper"
	info ={"
	I've gotten myself into a damn pickle again, and I FORGOT TO CLONE SCAN. Not that I'm looking forward to death but.. I think this is where<br>
	my story ends... Damn shitsec, it's just a damn ID ! Spacing me for it IS DEFINITELY NOT how to go about it...<br>
	I swear if I was security... wait maybe that's it ! If I tell these wardens I know stuff about the captain, they might think I'm defecting!<br>
	Or maybe it's better to wait for the NT contact... if there are any even here.
	"}

/obj/item/paper/Morrigan2
	name = "Hidden note"
	icon_state = "paper"
	info ={"
	I think they're on to us A... I'd PDA text you but they might be watching those too. Decided to leave the note in our usual spot.<br>
	We might need to hitch a ride out of here, stuffs gettin' too heated. I was already brigged twice and managed convince them that our sabotage<br>
	was mere accidents of incompetence. I don't think they're gonna keep buying it. I've already been implanted with a tracker I think.<br>
	Unless you wanna end up crammed into their damn robot shells I'd suggest you keep a low profile. Burn this once you read it and meet me<br>
	by Medical Janitor's room, you know behind the bush in 2 hours. Bring a disguise too, and for god sakes WEAR A MASK. <br>
	-J
	"}

/obj/item/paper/Morrigan3
	name = "Angry Diary Note"
	icon_state = "paper"
	info ={"
	Man, why can't we just kill her ?! No one looses the singularity an hour into our shift by 'accident'. There's no way that fool isn't a Trasey.<br>
	Why can't we vote on these things?! I hate this supervisor... He always lets OBVIOUS traitors go. I thought our job was to protect the station<br>
	 that doesn't include releasing these scumbags back out. We don't have enough proof my ass! I'm going to sign up for the Nuclear Operative team<br>
	  next week, I can't take this anymore.
	"}

/obj/item/paper/Morrigan4
	name = "Sci SUCKS"
	icon_state = "paper_caution_bloody"
	info ={"
	Last week it was spiders, this time it was weird SPACE ANTS ? Damn things nearly killed me ! They think it's funny to teleport these things<br>
	 onto holy lands, but just wait until damn wizards start showing up again and they need my help. God might forgive the worthy, but I won't.
	"}

/obj/item/paper/Morrigan5
	name = "Angry Note"
	icon_state = "paper"
	info ={"
	I SWEAR TO GOD, I don't care if she's the RD that SLOP Marissa needs to get her act together. If you're using MY chemdispenser,<br>
	PUT THE DAMN BEAKERS BACK. I'm sick and tired of having to beg Beatrice for her beakers. If I catch them misplacing them one more time<br>
	 I'm going to splash their face with a bucket full of acid.
	"}

/obj/item/paper/Morrigan6
	name ="Nukies?"
	icon_state = "paper"
	info ={"
	Hi Cappy! Honk :)<br>
	Iz me Klown!! Authorize armory I think nukies engi. Need Aa, please give ?<br>
	-Klown
	"}

/obj/item/paper/Morrigan7
	name = "Important Message From HQ"
	icon_state = "paper"
	info ={"
	Hello Alexander, <br>
	We're contacting you inform you that our situation here might be compromised. We've lost contact with Agent Ivy.<br>
	She isn't responding to any of our messages. Extraction is probably impossible. We're worried however. The messages<br>
	 appear to be going through, just without answers. It's possible they might have been captured and their device intercepted.<br>
	 I'd suggest locking down the drone facility and prevent possible counter spies or traitors. Try to ramp up production.<br>
	 We need to distract NT as much as possible, we cannot have them interfere with the grand scheme of things.<br>
	 Focus production on heavier units and begin contruction on Project Storm. A team backup team will arrive to help secure the area in 48 hours.<br>
	 We're counting on you back at HQ here. Report to us if anything changes, and stay alert.
	"}

/obj/item/paper/Morrigan8
	name = "Meeting Printout"
	icon_state = "paper"
	info ={"
	Gather heads, meet at conf room in 15 minutes, come alone.
	"}

/obj/item/paper/Morrigan9
	name = "Complaint to HQ"
	icon_state = "paper"
	info ={"
	HQ this is Captain Kalada S. Heuron,<br>
	I'm sending this message to talk about the recent situation going on here on Morrigan. We've been receiving an increasing influx of prisoners<br>
	 ones from Lero VI. While I appreciate your trust in our ability, we simply cannot accomodate this many. When I was informed this about this.. <br>
	I expected it to be a temporary solution while reconstruction of Maxima was in process. I understand that every station is sharing the burden, <br>
	but ours isn't nearly as big as the others. We don't have the manpower nor room for this many. We've had security personnel on overtime for 2 weeks,<br>
	We cannot continue like this. Please advise as soon as possible.
	--Transcript End. Message Delivered.--
	"}

/obj/item/paper/Morrigan10
	name = "NT is kinda cool.."
	icon_state = "paper"
	info ={"
	I've never been on any of their stations but your stories make them seem awesome! Is true they use laser weapons and stuff ? That's so cool...<br>
	I hear you're returning on the 8th! Think you could possibly... get me one of their fancy tasers? I'll of course pay you for it obviously..<br>
	I know it's a big risk and all so how about 20k? Seems like a fair deal to me.
	--Transcript End. Message Delivered to PDA.--
	"}

/obj/item/paper/Morrigan11
	name = "RECON DEFENSE PERIMETER ALERT"
	icon_state = "paper"
	info ={"
	<p style="text-align: center;">SECURITY ALERT</p>
	<p style="text-align: center;">WARNING SEVERAL UNIDENTIFIED VESSELS APPROACHING</p>
	<p style="text-align: center;">RESPONSE ADVISE</p>
	<p style="text-align: center;">ETA TO CONTACT: 13 MINUTES</p>
	<p style="text-align: center;">NUMBER OF VESSELS: 5</p>
	<p style="text-align: center;">A COPY OF THIS MESSAGE HAS BEEN SENT TO HQ</p>
	<p style="text-align: center;">ALERT STATUS AUTOMATICALLY SENT TO HEADS OF STAFF</p>
	<p style="text-align: center;"><br></p>
	"}

/obj/item/paper/Morrigan12
	name = "Left over note"
	icon_state = "paper"
	info ={"
	This is looking bad Alexander, most of security is already wiped out... I'm getting red alerts everywhere. I think the factory is inoperable.<br>
	We're going to have to mobilize the crew. Exceptionally, please allow Civ to arm themselves, it's just 6 of them I'm sure we could overwhelm them.<br>
	"}

/obj/item/paper/Morrigan13
	name = "This is it"
	icon_state = "paper_caution_bloody"
	info ={"
	Those damn Traseys... they found out our operation before we could complete Storm... Came in guns blazing like a bunch of savages. The factory <br>
	 it... it's ruined. Operations are completely halted. Most machinery was destroyed. Their nuke didn't go off at least and we've killed most <br>
	 of them.. but the cost was great on our side. My pda is shattered and I'm stuck behind this door. Air is running out and I think I've<br>
	  shrapnel in my stomach... I don't think I'm going to be able to be rescued. Tell my family I've always loved them. Long Live the Syndicate.
	"}

/obj/item/paper/Morrigan14
	name = "AUTOMATIC UPDATE SYSTEM"
	icon_state = "paper"
	info ={"
	<p style="text-align: center;">MORRIGAN STATUS UPDATE</p>
	<p style="text-align: center;">HULL INTEGRITY 68%</p>
	<p style="text-align: center;">BIOSCAN INDICATE CREW AT 49% CAPACITY</p>
	<p style="text-align: center;">CYBORG CAPACITY: 74%</p>
	<p style="text-align: center;">CAPTAIN KALADA S. HEURON: MIA</p>
	<p style="text-align: center;">HoS ALEXANDER NASH : MIA</p>
	<p style="text-align: center;">CE BERTHOLD H. RANTHER : MIA</p>
	<p style="text-align: center;">RD MARISSA BELFRON : MIA</p>
	<p style="text-align: center;">HoP WILLIAM B. RON : MIA</p>
	<p style="text-align: center;">MDir FREDRICH C. PALIDOME : PRESENT</p>
	<p style="text-align: center;">STATION POWER : 30%&nbsp;</p>
	<p style="text-align: center;">SITUATION CRITICAL</p>
	<p style="text-align: center;">--Transcript End. Message Delivered.--</p>
	"}

/obj/item/paper/Morrigan15
	name = "THERE WILL BE NO AA STOP ASKING"
	icon_state = "paper"
	info ={"
	READ THE FUCKING TITLE. NO FUCKING AA.
	"}

/obj/item/paper/Morrigan16
	name = "What's wrong with Albert?"
	icon_state = "paper"
	info ={"
	Hey Jess, don't you think Albert is acting a little strange... I could've sworn he never had a pink finger... didn't we always call him<br>
	 'foursies' or something for it ? He's also been doing a lot of EVA work... he never liked leaving the station.<br>
	 I don't know what to do or say. Surely I'm not the only one noticing this. We can talk more about this at lunch.<br>
	 See you soon,<br>
	 Hubert.
	"}

/obj/item/paper/Morrigan17
	name = "Reminder! New ID Cards!"
	icon_state = "paper"
	info ={"
	This is your reminder that we are changing the ID locks on certain doors after our little incident. This is a security measure and is mandatory. <br>
	Be sure to deposit your old ID by the end of the week for your new one. You will not be provided a new one if you don't give us back the old one. <br>
	Your old cards will not work anymore. We will be working extra hours to help deal with the temporary situation.<br>
	-Head of Personnel
	"}

/obj/item/paper/Morrigan18
	name = "You're Fired Nick"
	icon_state = "paper"
	info ={"
	You're fucking fired Nick. By the time you read this, I want you out of my department. That acid could've seriously injured me or you co-workers.<br>
	You've a clear disregard for safety here and I don't want you anywhere near us. Oh and the captain is aware of this too, so good luck getting a new job<br>
	I don't want to see your face ever again, keep the fucking ID and the mask. I already got a new one.<br>
	-Research Director.
	"}

/obj/item/paper/MorriganNT
	name = "Midly Crumbled Note"
	icon_state = "paper"
	info ={"
	I've swipped the CE's card while they were busy maintaining the singularity. He left it in his console and by the time he came back.. <br>
	I was already gone with it. We always needed a Head of Staff id with us. Not the most powerful one... <br>
	but it should probably do. I'll be waiting for you in the northern maints. Come alone please, you're the only one I trust.<br>
	-A
	"}
/obj/item/paper/MorriganNT2
	name = "Note #432"
	icon_state = "paper"
	info ={"
	Hello CentComm,
	This is agent Swallow, I've confirmed that there is indeed a way to self destruct this station. I don't know where yet, rumors say it in the bridge. <br>
	Sounds too risky to infil right now, they appear to be on high alert or something. We would appreciate some feedback, your last orders date from <br>
	a while ago. Is operation Blue still in action ? We're eagerly awaiting a response from you.<br>
	-May Nanotrasen never fall.
	"}

/obj/item/paper/MorriganNT3
	name = "Slightly Damaged Note"
	icon_state = "paper"
	info ={"
	I don't know man, this seems weird. How come we haven't heard anything from CC. It's been way too long... did they turn their backs on us?<br>
	We risked our necks out there to uncover the factory operation and now we're not even getting replies ? Our directives haven't been updated since. <br>
	Something is wrong here. I wanna tell A but he never takes these things well. Guy's an NT freak. We're already on thin ice, I'm planning to bail out of this operation. <br>
	One of the Medbay Pods is going in for maintenance in a few hours, perfect time to swipe the lock module with our hacked one. You in ? <br>
	-J
	"}

/obj/item/paper/MorriganNT4
	name = "We're so fucked"
	icon_state = "paper"
	info = {"
	They caught S. They caught S... THEY CAUGHT S. We're in deep shit now. Should've listened to J and dipped out of this whole thing. Oh god I'm probably next. <br>
	It's not worth it, this isn't worth dying for. They're going to turn me into their damn machines. Oh god, oh fuck. They must've caught A too, we haven't seen him in forever.<br>
	No no no no. No no no... The Pill... the Pill yes, the Pill. I need to retrieve it. I'd sooner die than become a soul-less machine. <br>
	To my family, you will never read this, but I love you all.
	"}

/obj/item/paper/MorriganNT5
	name = "In case you're locked out"
	icon_state = "paper"
	info = {"
	I've bought the Janitor's ID, we'll keep it as a spare. Should get you into some places at least. Just be sure to wear a mask and a helmet or something,<br>
	I don't think Sec will search you if you stick to maints, also carry a mop. We left it in Engineering, just say the keyword the A and he'll get you it.<br>
	-J
	"}

// Lockers with restricted access

/obj/storage/secure/closet/morrigan
	_max_health = LOCKER_HEALTH_STRONG
	_health = LOCKER_HEALTH_STRONG
	icon_state = "command"
	icon_closed = "command"
	icon_opened = "secure_blue-open"
	bolted = TRUE

/obj/storage/secure/closet/morrigan/hos
	name = "Head of Security's locker"
	reinforced = TRUE
	req_access = list(access_morrigan_HOS, access_morrigan_exit)
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/ce
	name = "Chief Engineer's Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_CE ,access_morrigan_captain, access_morrigan_exit)
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/rd
	name = "Research Director's Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_RD, access_morrigan_captain, access_morrigan_exit)
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/mdir
	name = "Medical Director's Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_mdir, access_morrigan_captain, access_morrigan_exit)
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/captain
	name = "Captain's Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_captain, access_morrigan_exit)
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/hop
	name = "Head of Personnel's Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_bridge, access_morrigan_captain, access_morrigan_exit)
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/security
	name = "Security Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_security, access_morrigan_HOS, access_morrigan_captain, access_morrigan_exit)
	icon_state = "sec"
	icon_closed = "sec"
	icon_opened = "secure_red-open"
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/brig
	name = "Contraband Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_security, access_morrigan_HOS, access_morrigan_captain, access_morrigan_exit)
	icon_state = "safe_locker"
	icon_closed = "safe_locker"
	icon_opened = "safe_locker-open"
	icon_greenlight = "safe-greenlight"
	icon_redlight = "safe-redlight"
	open_sound = 'sound/misc/safe_open.ogg'
	close_sound = 'sound/misc/safe_close.ogg'
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/engineer
	name = "Engineering Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_engineering, access_morrigan_CE, access_morrigan_captain, access_morrigan_exit)
	icon_state = "eng"
	icon_closed = "eng"
	icon_opened = "secure_yellow-open"
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/sci
	name = "Scientist Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_science, access_morrigan_RD, access_morrigan_captain, access_morrigan_exit)
	icon_state = "science"
	icon_closed = "science"
	icon_opened = "secure_white-open"
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/botany
	name = "Botanist Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_botany, access_morrigan_captain, access_morrigan_exit)
	icon_state = "secure_green"
	icon_closed = "secure_green"
	icon_opened = "secure_green-open"
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/medical
	name = "Engineering Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_medical, access_morrigan_mdir, access_morrigan_captain, access_morrigan_exit)
	icon_state = "medical"
	icon_closed = "medical"
	icon_opened = "secure_white-open"
	spawn_contents = list()

/obj/storage/secure/closet/morrigan/patho
	name = "Pathology Locker"
	reinforced = TRUE
	req_access = list(access_morrigan_medical, access_morrigan_mdir, access_morrigan_captain, access_morrigan_exit)
	icon_state = "secure_oj"
	icon_closed = "secure_oj"
	icon_opened = "secure_oj-open"
	spawn_contents = list()

// Secure Crates

/obj/storage/secure/crate/morrigan
	desc = "A secure crate."
	name = "Secure crate"
	icon_state = "securecrate"
	icon_opened = "securecrateopen"
	icon_closed = "securecrate"
	icon_redlight = "securecrater"
	icon_greenlight = "securecrateg"
	icon_sparks = "securecratesparks"
	icon_welded = "welded-crate"
	density = 1
	always_display_locks = 1
	throwforce = 50
	can_flip_bust = 1

/obj/storage/secure/crate/morrigan/gear
	desc = "A secure gear crate."
	name = "Gear crate"
	icon_state = "secgearcrate"
	density = 1
	icon_opened = "secgearcrateopen"
	icon_closed = "secgearcrate"
	req_access = list(access_morrigan_security, access_morrigan_HOS, access_morrigan_captain, access_morrigan_exit)
	spawn_contents = list()


//hobo dialogue man !!!!!

/obj/npc/trader/hobo
	icon = 'icons/obj/trader.dmi'
	icon_state = "hoboman"
	picture = "generic.png"
	name = "Hobo Bloke"
	trader_area = "/area/morrigan/hobo"
	angrynope = "Piss off mate."
	whotext = "Don't care who you are, get me the good shit and get paid!"

	New()
		..()
		/////////////////////////////////////////////////////////
		//// sell list //////////////////////////////////////////
		/////////////////////////////////////////////////////////
		src.goods_sell += new /datum/commodity/tools/welder(src)
		/////////////////////////////////////////////////////////
		//// buy list ///////////////////////////////////////////
		/////////////////////////////////////////////////////////
		src.goods_buy += new /datum/commodity/drugs/cyberpunk(src)
		/////////////////////////////////////////////////////////

		greeting= {"I haven't seen my wife in 30 years, only the drugs bring her back."}

		portrait_setup = "<img src='[resource("images/traders/[src.picture]")]'><HR><B>[src.name]</B><HR>"

		sell_dialogue = "Remember, only the good shit or I'll shank the fuck out of you!"

		buy_dialogue = "I KNOW you need these.. hehe."

		successful_purchase_dialogue = list("You bloody fool.",
			"Proper scammed.",
			"I fuckin nicked it.")

		failed_sale_dialogue = list("Nah mate not that.",
			"Fuck no mate.")

		successful_sale_dialogue = list("MARTHA HERE I COME!",
			"Sweet sweet high...")

		failed_purchase_dialogue = list("This is no charity, get the cash or bugger off.",
			"You're making me sound rich.")

		pickupdialogue = "Here's your shit. You know it wasn't worth that much yeah?"

		pickupdialoguefailure = "Bloody delusional you are, you haven't picked fuck all!"
