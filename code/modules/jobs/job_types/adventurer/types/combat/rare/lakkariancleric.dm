/datum/advclass/combat/lakkariancleric // terra was here! <3
	name = "Lakkarian Cleric"
	tutorial = "A follower of the Order of the Southern Sun. Acolytes who underwent years of martial training, they seek to root out the corruption caused by the Four in Faience and spread the word of the Sun Queen."
	allowed_races = RACES_PLAYER_ELF
	outfit = /datum/outfit/job/adventurer/lakkariancleric
	vampcompat = FALSE
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	maximum_possible_slots = 2
	allowed_patrons = /datum/patron/divine/astrata

/datum/outfit/job/adventurer/lakkariancleric/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	H.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'

	head = /obj/item/clothing/head/helmet/ironpot/lakkariancap
	armor = /obj/item/clothing/armor/gambeson/lakkarijupon
	shirt = /obj/item/clothing/shirt/undershirt/fancy
	gloves = /obj/item/clothing/gloves/leather
	wrists = /obj/item/clothing/neck/psycross/silver/astrata
	pants = /obj/item/clothing/pants/trou/leather/quiltedkilt
	shoes = /obj/item/clothing/shoes/boots/leather
	neck = /obj/item/clothing/neck/coif/cloth // price to pay for being a speedy class, less neck protection
	belt = /obj/item/storage/belt/leather
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/reagent_containers/food/snacks/hardtack = 1)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) // years of martial training would make you quite athletic
		H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/labor/mathematics, 1, TRUE)

		H.change_stat(STATKEY_END, 2)
		H.change_stat(STATKEY_SPD, 2) // haha elves go nyoom
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	var/weapons = list("Silver Sengese","Silver Rungu")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Silver Sengese")
			beltl = /obj/item/weapon/sword/scimitar/sengese/silver
			H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		if("Silver Rungu")
			beltr = /obj/item/weapon/mace/silver/rungu
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
	var/holder = H.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(H)
