/obj/storage/secure/crate
	desc = "A secure crate."
	name = "Secure crate"
	icon_state = "securecrate"
	icon_opened = "securecrateopen"
	icon_closed = "securecrate"
	icon_redlight = "securecrater"
	icon_greenlight = "securecrateg"
	icon_sparks = "securecratesparks"
	icon_welded = "welded-crate"
	//var/emag = "securecrateemag"
	density = 1
	always_display_locks = 1
	throwforce = 50
	can_flip_bust = 1

/obj/storage/secure/crate/weapon
	desc = "A secure weapons crate."
	name = "Weapons crate"
	icon_state = "weaponcrate"
	density = 1
	icon_opened = "weaponcrateopen"
	icon_closed = "weaponcrate"

	confiscated_items
		name = "confiscated items crate"
		desc = "Secure storage for confiscated contraband."
		req_access_txt = "2"

	armory
		name = "secure weapons crate"
		req_access = list(access_maxsec)

		tranquilizer
			name = "tranquilizer crate"
			spawn_contents = list(/obj/item/gun/kinetic/dart_rifle = 2,\
			/obj/item/ammo/bullets/tranq_darts = 2,\
			/obj/item/ammo/bullets/tranq_darts/anti_mutant)

		phaser
			name = "phaser crate"
			spawn_contents = list(/obj/item/gun/energy/phaser_gun = 4)

		shotgun
			name = "shotgun crate"
			spawn_contents = list(/obj/item/gun/kinetic/riotgun = 4,\
			/obj/item/ammo/bullets/abg = 4)

		pod_weapons
			name = "pod weapons crate"
			spawn_contents = list(/obj/item/shipcomponent/mainweapon/disruptor_light = 2,\
			/obj/item/shipcomponent/mainweapon/laser = 2,\
			/obj/item/storage/box/missile_launcher)

/obj/storage/secure/crate/plasma
	desc = "A secure plasma crate."
	name = "Plasma crate"
	icon_state = "plasmacrate"
	density = 1
	icon_opened = "plasmacrateopen"
	icon_closed = "plasmacrate"

	armory
		name = "secure weapons crate"
		req_access = list(access_maxsec)

		anti_biological
			name = "anti-biological crate"
			spawn_contents = list(/obj/item/storage/box/flaregun = 2,\
			/obj/item/gun/flamethrower/assembled/loaded = 2)

/obj/storage/secure/crate/gear
	desc = "A secure gear crate."
	name = "Gear crate"
	icon_state = "secgearcrate"
	density = 1
	icon_opened = "secgearcrateopen"
	icon_closed = "secgearcrate"

// Armory secure crates
/obj/storage/secure/crate/gear/armory
	name = "secure weapons crate"
	req_access = list(access_maxsec)

/obj/storage/secure/crate/gear/armory/grenades
	name = "special grenades crate"
	spawn_contents = list(/obj/item/storage/box/QM_grenadekit_security = 2,\
	/obj/item/storage/box/QM_grenadekit_experimentalweapons,\
	/obj/item/storage/box/stinger_kit,\
	/obj/item/storage/box/stun_landmines)

/obj/storage/secure/crate/gear/armory/alcohol
	name = "secure alcohol crate"
	desc = "For the most dire of situations."
	spawn_contents = list(/obj/item/storage/box/cocktail_umbrellas,\
	/obj/item/storage/box/cocktail_doodads,\
	/obj/item/storage/box/straws,\
	/obj/item/storage/box/fruit_wedges,\
	/obj/item/storage/box/beer,\
	/obj/item/storage/box/glassbox,\
	/obj/item/reagent_containers/food/drinks/drinkingglass/random_style = 4,\
	/obj/item/reagent_containers/food/drinks/bottle/vodka = 3,\
	/obj/item/reagent_containers/food/drinks/curacao)

// Saxitoxin grenade crates

/obj/storage/secure/crate/gear/saxitoxin_grenades
	name = "nerve agent crate (DANGER)"
	req_access_txt = "52"
	spawn_contents = list(/obj/item/reagent_containers/syringe/atropine = 3,\
	/obj/item/chem_grenade/saxitoxin = 3)

/obj/storage/secure/crate/gear/saxitoxin_grenades/empty
	spawn_contents = list()

/obj/storage/secure/crate/bee
	name = "Secure Bee crate"
	desc = "A secure crate with a picture of a bee on it. Buzz."
	icon_state = "beecrate"
	density = 1
	icon_opened = "beecrateopen-secure"
	icon_closed = "beecrate-secure"

	loaded
		req_access = list(access_hydro)
		spawn_contents = list(/obj/item/bee_egg_carton = 5)

		var/blog = ""

		make_my_stuff()
			.=..()
			if (.)
				for(var/obj/item/bee_egg_carton/carton in src)
					carton.ourEgg.blog += blog
				return 1

/obj/storage/secure/crate/eng
	name = "Engineering crate"
	desc = "A yellow crate."
	icon_state = "engcrate"
	density = 1
	icon_opened = "engcrate-open"
	icon_closed = "engcrate"

	explosives
		name = "engineering explosive crate"
		desc = "Contains controlled explosives designed for trench use."
		req_access = list(access_engineering)
		spawn_contents = list(/obj/item/pipebomb/bomb/engineering = 6)

	interdictor
		name = "interdictor fabrication crate"
		desc = "Contains a drive with spatial interdictor manufacture data, power cells, and a usage guide for spatial interdictors."
		req_access = list(access_engineering)

		make_my_stuff()
			if (..()) // make_my_stuff is called multiple times due to lazy init, so the parent returns 1 if it actually fired and 0 if it already has
				var/obj/item/disk/data/floppy/manudrive/interdictor_parts/B1 = new(src)
				B1.pixel_x = 8
				B1.pixel_y = 3

				var/obj/item/cell/supercell/B2 = new(src)
				B2.pixel_x = -6
				B2.pixel_y = -3

				var/obj/item/cell/supercell/B3 = new(src)
				B3.pixel_x = -6

				var/obj/item/cell/supercell/B4 = new(src)
				B4.pixel_x = -6
				B4.pixel_y = 3

				var/obj/item/paper/book/from_file/interdictor_guide/B5 = new(src)
				B5.pixel_y = 1
				return 1

/obj/storage/secure/crate/medical
	desc = "A secure medical crate."
	name = "medical crate"
	icon_state = "securemedicalcrate"
	density = 1
	icon_opened = "securemedicalcrateopen"
	icon_closed = "securemedicalcrate"
	weld_image_offset_Y = -2
	req_access = list(access_medical_lockers)

	monkey
		name = "Lab Monkey Crate"
		desc = "Warning: Contains live monkeys!"
		req_access = list(access_medical_lockers, access_tox_storage)

//puzzle for morrigan
/obj/storage/crate/morrigancargo
	name = "Morrigan Cargo Crate"
	locked = TRUE
	var/contraband_items = list()
	var/random_shit_to_spawn = list()
	var/max_contra_amount = 2
	var/contra_contained = 0 //will be useful for contraband check

	New()
		..()
		if (src.spawn_contents && make_my_stuff())
			spawn_contents = null
		name = "Order #[rand(100,10000)]"

	make_my_stuff()
		if (!islist(src.spawn_contents))
			return
		for (var/amount in 1 to rand(4, 12))
			var/thing_to_spawn = pick(random_shit_to_spawn)
			var/contra_to_spawn = pick(contraband_items)
			new thing_to_spawn(src)
			if (prob(15) && contra_contained < max_contra_amount)
				new contra_to_spawn(src)
				contra_contained++
		return TRUE

	engineer
		icon_state = "engcrate"
		density = 1
		icon_opened = "engcrate-open"
		icon_closed = "engcrate"
		contraband_items = list(/obj/item/clothing/head/NTberet, /obj/item/electronics/disk, /obj/item/device/guardbot_tool/smoker, /obj/item/motherboard, /obj/item/assembly/prox_ignite, /obj/item/reagent_containers/food/drinks/fueltank)
		random_shit_to_spawn = list(/obj/item/electronics/board,
		/obj/item/electronics/fuse,
		/obj/item/electronics/battery,
		/obj/item/electronics/board,
		/obj/item/electronics/resistor,
		/obj/item/electronics/switc,
		/obj/item/device/net_sniffer,
		/obj/item/storage/box/cablesbox)
		spawn_contents = list(/obj/item/device/radio)

	medical
		icon_state = "securemedicalcrate"
		density = 1
		icon_opened = "securemedicalcrateopen"
		icon_closed = "securemedicalcrate"
		weld_image_offset_Y = -2
		contraband_items = list(/obj/item/reagent_containers/iv_drip/blood,	/obj/item/storage/pill_bottle/cyberpunk, /obj/item/storage/pill_bottle/crank, /obj/item/storage/pill_bottle/methamphetamine)
		random_shit_to_spawn = list(/obj/item/scalpel, /obj/item/device/analyzer/healthanalyzer_organ_upgrade,
		/obj/item/device/analyzer/healthanalyzer_upgrade,
		/obj/item/device/analyzer/atmosanalyzer_upgrade,
		/obj/item/hemostat,
		/obj/item/robodefibrillator,
		/obj/item/body_bag,
		/obj/item/reagent_containers/iv_drip,
		/obj/item/device/analyzer/genetic,
		/obj/item/storage/pill_bottle/antirad,
		/obj/item/storage/pill_bottle/salicylic_acid,
		/obj/item/storage/pill_bottle/epinephrine,
		)
		spawn_contents = list(/obj/item/device/analyzer/healthanalyzer)

	security
		icon_state = "weaponcrate"
		density = 1
		icon_opened = "weaponcrateopen"
		icon_closed = "weaponcrate"
		contraband_items = list(/obj/item/gun/russianrevolver/fake357, /obj/item/gun/energy/blaster_pod_wars/nanotrasen, /obj/item/clothing/suit/det_suit/beepsky)
		random_shit_to_spawn = list(/obj/item/storage/box/handcuff_kit,
		/obj/item/ammo/ammobox,
		/obj/item/ammo/bullets/smoke,
		/obj/item/chem_grenade/fog,
		/obj/item/chem_grenade/flashbang,
		/obj/item/device/detective_scanner,
		/obj/item/clothing/under/misc/prisoner,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/shoes/swat,
		/obj/item/clothing/under/misc/syndicate
		)
		spawn_contents = list(/obj/item/kitchen/food_box/donut_box)
