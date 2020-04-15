///Hispania Civilians Clothes

/*Nota: todos los sprites que sean pertenecientes al code hispania y tengan sus
respectivos sprites en las carpetas de iconos de hispania , es decir icons/hispania
deberan tener una linea de codigo demas para que funcionen "hispania_icon = TRUE"*/

//code by Danaleja2005

/obj/machinery/vending/walldrobe
	name = "\improper WallDrobe"
	desc = "Wall-mounted Clothes dispenser. Made by D&N Corp."
	product_ads = "Dress up in fashion and wear our amazing uniforms, hats, suits made of the best material, only with us N&D Corp!."
	icon = 'icons/hispania/obj/vending.dmi'
	icon_state = "walldrobe"
	icon_deny = "walldrobe-deny"
	icon_vend = "walldrobe-vend"
	density = FALSE //It is wall-mounted, and thus, not dense. --SuperxpdudeS
	vend_delay = 12

/obj/machinery/vending/walldrobe/cap
	name = "\improper Captain's WallDrobe"
	req_access = list(ACCESS_CAPTAIN)
	products = list(/obj/item/clothing/under/rank/command/captain/formal/light = 1,
					/obj/item/clothing/under/rank/command/captain/formal/dark = 1,
					/obj/item/clothing/head/caphat/dark = 1,
					/obj/item/clothing/head/caphat/light = 1,
					/obj/item/clothing/suit/armor/vest/captrenchcoat = 1,
					/obj/item/clothing/suit/captunic = 1,
					/obj/item/clothing/suit/captunic/capjacket = 1,
					/obj/item/clothing/under/captainparade = 1,
					/obj/item/clothing/under/rank/captain = 1,
					/obj/item/clothing/head/caphat/parade = 1,
					/obj/item/clothing/under/rank/captain = 1,
					/obj/item/clothing/under/rank/captain = 1,
					/obj/item/clothing/under/dress/dress_cap = 1,
					/obj/item/clothing/under/dress/dress_cap = 1,
					/obj/item/clothing/suit/armor/vest/capcarapace/alt = 1,
					/obj/item/clothing/shoes/brown = 1,
					/obj/item/clothing/shoes/laceup = 1,
					/obj/item/clothing/suit/mantle/armor/captain = 1,
					/obj/item/clothing/gloves/color/captain = 1)

/obj/machinery/vending/walldrobe/rd
	name = "\improper Research Director's WallDrobe"
	req_access = list(ACCESS_RD)
	products = list(/obj/item/clothing/suit/storage/labcoat/rdlargedark = 1,
					/obj/item/clothing/suit/storage/labcoat/rdlargeroundcutdark = 1,
					/obj/item/clothing/suit/bio_suit/scientist = 1,
					/obj/item/clothing/head/bio_hood/scientist = 1,
					/obj/item/clothing/under/rank/research_director = 1,
					/obj/item/clothing/suit/storage/labcoat = 1,
					/obj/item/clothing/suit/mantle/labcoat = 1,
					/obj/item/clothing/mask/gas = 1,
					/obj/item/clothing/shoes/white = 1,
					/obj/item/clothing/gloves/color/latex = 1)

/obj/machinery/vending/walldrobe/hos
	name = "\improper Head of Security's Walldrobe"
	req_access = list(ACCESS_HOS)
	products = list(/obj/item/clothing/under/rank/head_of_security = 1,
					/obj/item/clothing/under/rank/head_of_security/formal = 1,
					/obj/item/clothing/under/rank/head_of_security/corp = 1,
					/obj/item/clothing/under/rank/head_of_security/skirt = 1,
					/obj/item/clothing/suit/armor/hos = 1,
					/obj/item/clothing/suit/armor/hos/alt = 1,
					/obj/item/clothing/head/HoS = 1,
					/obj/item/clothing/head/HoS/beret = 1,
					/obj/item/clothing/suit/mantle/armor = 1,
					/obj/item/clothing/gloves/color/black/hos = 1)

/obj/machinery/vending/walldrobe/ce
	name = "\improper Chief Enginner's Walldrobe"
	req_access = list(ACCESS_CE)
	products = list(/obj/item/clothing/under/rank/chief_engineer = 1,
					/obj/item/clothing/under/rank/chief_engineer/skirt = 1,
					/obj/item/clothing/suit/mantle/chief_engineer = 1,
					/obj/item/clothing/gloves/color/yellow = 1,
					/obj/item/clothing/head/hardhat/white = 1,
					/obj/item/clothing/shoes/brown = 1,
					/obj/item/clothing/suit/storage/hazardvest = 1,
					/obj/item/clothing/head/beret/ce = 1)

/obj/machinery/vending/walldrobe/cmo
	name = "\improper Chief Medical Officer's Walldrobe"
	req_access = list(ACCESS_CMO)
	products = list(/obj/item/clothing/shoes/white = 1,
					/obj/item/clothing/under/rank/medical/blue = 1,
					/obj/item/clothing/head/surgery/blue = 1,
					/obj/item/clothing/under/rank/medical/green = 1,
					/obj/item/clothing/head/surgery/green = 1,
					/obj/item/clothing/under/rank/medical/purple = 1,
					/obj/item/clothing/head/surgery/purple = 1,
					/obj/item/clothing/suit/storage/labcoat/cmo = 1,
					/obj/item/clothing/under/rank/chief_medical_officer = 1,
					/obj/item/clothing/suit/mantle/labcoat/chief_medical_officer = 1,
					/obj/item/clothing/shoes/brown = 1)

/obj/machinery/vending/walldrobe/sec
	name = "\improper Security's Walldrobe"
	req_access = list(ACCESS_SECURITY)
	products = list(/obj/item/clothing/under/rank/security/private = 4,
					/obj/item/clothing/under/rank/security/private/red = 4,
					/obj/item/clothing/head/beret/sec/private = 3,
					/obj/item/clothing/head/beret/sec/private/red = 3,
					/obj/item/clothing/head/officer/hat = 3,
					/obj/item/clothing/head/officer/hat/red = 3,
					/obj/item/clothing/head/soft/sec = 3,
					/obj/item/clothing/suit/armor/secjacket = 3,
					/obj/item/clothing/suit/hooded/wintercoat/security = 3)

/obj/machinery/vending/walldrobe/sec/podpilot
	name = "\improper Security Pod Pilot's Walldrobe"
	req_access = list(ACCESS_PILOT)
	products = list(/obj/item/clothing/head/beret/sec/private = 1,
					/obj/item/clothing/head/beret/sec/private/red = 1,
					/obj/item/clothing/under/rank/security/pod_pilot/formal = 1,
					/obj/item/clothing/under/rank/security/pod_pilot = 1,
					/obj/item/clothing/suit/armor/secjacket = 1,
					/obj/item/clothing/suit/hooded/wintercoat/security = 1)

/obj/machinery/vending/accesories
	name = "\improper Xtra"
	desc = "Accessories dispenser. Made by NT Corp."
	product_ads = "Get fashion and useful, funny accessories for make your work better an happy, only with us NT Corp!, Remember Work is the most important."
	icon = 'icons/hispania/obj/vending.dmi'
	icon_state = "Xtra"
	icon_vend = "Xtra-vend"
	density = TRUE
	vend_delay = 12

	products = list(		/obj/item/storage/wallet/random = 15,
					/obj/item/clothing/glasses/monocle = 5,
					/obj/item/clothing/glasses/regular = 5,
					/obj/item/clothing/ears/headphones = 5,
					/obj/item/clothing/accessory/necklace = 5,
					/obj/item/clothing/accessory/necklace = 5,
					/obj/item/clothing/accessory/necklace/dope = 5,
					/obj/item/clothing/accessory/necklace/locket = 5,
					/obj/item/clothing/accessory/armband = 5,
					/obj/item/lipstick = 5,
					/obj/item/lipstick/blue = 5,
					/obj/item/lipstick/lime= 5,
					/obj/item/lipstick/purple = 5,
					/obj/item/lipstick/jade = 5,
   					/obj/item/lipstick/black = 5,
   					/obj/item/lipstick/white = 5,
    				/obj/item/lipstick/green = 5,
   					/obj/item/clothing/head/kitty = 10,
   					/obj/item/clothing/head/kitty/mouse= 10,
   					/obj/item/clothing/head/collectable/rabbitears = 10,
					/obj/item/clothing/head/hairflower = 5,
    				/obj/item/stack/sheet/animalhide/monkey = 5,
    				/obj/item/stack/sheet/animalhide/lizard = 5)
	contraband = list(		/obj/item/stack/sheet/animalhide/human = 5)
	prices = list(			/obj/item/storage/wallet/random = 300,
					/obj/item/clothing/glasses/monocle = 400,
					/obj/item/clothing/glasses/regular = 400,
					/obj/item/clothing/ears/headphones = 450,
					/obj/item/clothing/accessory/necklace = 300,
					/obj/item/clothing/accessory/necklace/dope = 500,
					/obj/item/clothing/accessory/necklace/locket = 1200,
					/obj/item/clothing/accessory/armband = 250,
					/obj/item/lipstick = 200,
					/obj/item/lipstick/green = 200,
					/obj/item/lipstick/blue = 200,
					/obj/item/lipstick/lime= 220,
					/obj/item/lipstick/purple = 200,
					/obj/item/lipstick/jade = 220,
    				/obj/item/lipstick/black = 200,
    				/obj/item/lipstick/white = 200,
    				/obj/item/clothing/head/kitty = 350,
    				/obj/item/clothing/head/kitty/mouse = 350,
   					/obj/item/clothing/head/collectable/rabbitears = 350,
    				/obj/item/clothing/head/hairflower = 200,
    				/obj/item/stack/sheet/animalhide/monkey = 500,
    				/obj/item/kitchen/knife/folding/wood = 300,
    				/obj/item/kitchen/knife/folding/normal = 550,
    				/obj/item/kitchen/knife/folding/butterfly = 550,
    				/obj/item/stack/sheet/animalhide/lizard = 500)
	premium = list(/obj/item/kitchen/knife/folding/wood =5,/obj/item/kitchen/knife/folding/normal =5,/obj/item/kitchen/knife/folding/butterfly =5)
