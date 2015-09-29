if(isServer) then {

	/* GENERAL CONFIG */

		debug_mode					= false;		// enable debug
		use_blacklist				= true;			// use blacklist
		blacklist					= [
			[[0,16000,0],[1000,-0,0]],				// Left
			[[0,16000,0],[16000.0,14580.3,0]]		// Top
			
		];

	/* END GENERAL CONFIG */

	/* AI CONFIG */

		ai_clear_body 				= false;		// instantly clear bodies
		ai_clean_dead 				= true;			// clear bodies after certain amount of time
		ai_cleanup_time 			= 1200;			// time to clear bodies in seconds
		ai_clean_roadkill			= false; 		// clean bodies that are roadkills
		ai_roadkill_damageweapon	= 0;			// percentage of chance a roadkill will destroy weapon AI is carrying


		ai_modecombat 				= "RED";
		behaviour_ai 				= "Stealth";

		ai_smoke 					= true;			// AI drops smoke on death
		ai_share_info				= true;			// AI share info on player position
		ai_share_distance			= 1200;			// distance from killed AI for AI to share your rough position

		ai_kills_gain				= true;			// add kill to bandit/human kill score
		ai_humanity_gain			= true;			// gain humanity for killing AI
		ai_add_humanity				= 50;			// amount of humanity gained for killing a bandit AI
		ai_remove_humanity			= 50;			// amount of humanity lost for killing a hero AI
		ai_special_humanity			= 150;			// amount of humanity gain or loss for killing a special AI dependant on player alignment
		
		ai_skill_extreme			= [["aimingAccuracy",1.00],["aimingShake",1.00],["aimingSpeed",1.00],["endurance",1.00],["spotDistance",1.00],["spotTime",1.00],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Extreme
		ai_skill_hard				= [["aimingAccuracy",1.00],["aimingShake",1.00],["aimingSpeed",1.00],["endurance",1.00],["spotDistance",1.00],["spotTime",1.00],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Hard
		ai_skill_medium				= [["aimingAccuracy",0.90],["aimingShake",0.90],["aimingSpeed",0.90],["endurance",1.00],["spotDistance",0.90],["spotTime",0.90],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Medium
		ai_skill_easy				= [["aimingAccuracy",0.80],["aimingShake",0.80],["aimingSpeed",0.80],["endurance",1.00],["spotDistance",0.80],["spotTime",0.80],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Easy
		ai_skill_supereasy			= [["aimingAccuracy",0.70],["aimingShake",0.70],["aimingSpeed",0.70],["endurance",1.00],["spotDistance",0.70],["spotTime",0.70],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// SuperEasy
		ai_skill_random				= [ai_skill_extreme,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_easy];

		ai_static_useweapon			= true;	// Allows AI on static guns to have a loadout 	
		ai_static_weapons			= ["KORD_high_TK_EP1","DSHKM_Ins","M2StaticMG"];	// static guns

		ai_static_skills			= false;	// Allows you to set custom array for AI on static weapons. (true: On false: Off) 
		ai_static_array				= [["aimingAccuracy",0.20],["aimingShake",0.70],["aimingSpeed",0.75],["endurance",1.00],["spotDistance",0.70],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];

		ai_gear0					= [["ItemBandage","ItemBandage","ItemPainkiller","ItemMorphine"],["ItemKnife","ItemRadio"]];
		ai_gear1					= [["ItemBandage","ItemBandage","ItemPainkiller","ItemMorphine"],["ItemKnife","ItemGPS"]];
		ai_gear_random				= [ai_gear0,ai_gear1];	// Allows the possibility of random gear

ai_wep_assault = [["RH_hk417sgleotech","20Rnd_762x51_DMR"],
						["RH_hk417aim","20Rnd_762x51_DMR"],
						["RH_hk417eotech","20Rnd_762x51_DMR"],
						["RH_hk417saim","20Rnd_762x51_DMR"],
						["RH_hk417seotech","20Rnd_762x51_DMR"],
						["RH_hk417sglaim","20Rnd_762x51_DMR"],
						["RH_m1ssp","20Rnd_762x51_DMR"],
						["RH_m14aim","20Rnd_762x51_DMR"],
						["RH_m14eot","20Rnd_762x51_DMR"],
						["RH_m1saim","20Rnd_762x51_DMR"],
						["RH_m1seot","20Rnd_762x51_DMR"],
						["RH_m1sshd","20Rnd_762x51_DMR"],
						["RH_m1staim","20Rnd_762x51_DMR"],
						["RH_m1steot","20Rnd_762x51_DMR"],
						["RH_m1stshd","20Rnd_762x51_DMR"],
						["RH_m1stsp","20Rnd_762x51_DMR"],


						["RH_masaim","30Rnd_556x45_Stanag"],
						["RH_sc2shd","20Rnd_762x51_DMR"],
						["RH_masbaim","30Rnd_556x45_Stanag"],
						["RH_masbeotech","30Rnd_556x45_Stanag"],
						["RH_maseotech","30Rnd_556x45_Stanag"],
						["RH_sc2aim","20Rnd_762x51_DMR"],
						["RH_sc2eot","20Rnd_762x51_DMR"],
						["RH_sc2sp","20Rnd_762x51_DMR"],
						["RH_sc2shd","20Rnd_762x51_DMR"],
						["FHQ_ACR_BLK_CCO","FHQ_rem_30Rnd_680x43_ACR"],
						["FHQ_ACR_BLK_CCO_F","FHQ_rem_30Rnd_680x43_ACR"],
						["FHQ_ACR_BLK_CCO_GL","FHQ_rem_30Rnd_680x43_ACR"],
						["FHQ_ACR_BLK_CCO_GL_F","FHQ_rem_30Rnd_680x43_ACR"],
						["FHQ_ACR_BLK_HWS","FHQ_rem_30Rnd_680x43_ACR"],
						["FHQ_ACR_BLK_HWS_F","FHQ_rem_30Rnd_680x43_ACR"],
						["FHQ_ACR_BLK_HWS_GL","FHQ_rem_30Rnd_680x43_ACR"],
						["FHQ_ACR_BLK_HWS_GL_F","FHQ_rem_30Rnd_680x43_ACR"]]; 
							




        ai_wep_machine = [["MK_48_DZ","100Rnd_762x51_M240"],
						["M60A4_EP1_DZE","100Rnd_762x51_M240"],
						["M249_EP1_DZ","200Rnd_556x45_M249"],
						["Pecheneg_DZ","100Rnd_762x54_PK"],
						["M240_DZ","100Rnd_762x51_M240"]];
						


        ai_wep_sniper = [["M14_EP1","20Rnd_762x51_DMR"],
						["SCAR_H_LNG_Sniper_SD","20Rnd_762x51_SB_SCAR"],
						["SVD_CAMO","10Rnd_762x54_SVD"],
						["VSS_Vintorez","20Rnd_9x39_SP5_VSS"],
						["DMR_DZ","20Rnd_762x51_DMR"],
						["BAF_LRR_scoped","5Rnd_86x70_L115A1"],
						["M40A3","5Rnd_762x51_M24"]];
						
		ai_m107 = [["m107_DZ","10Rnd_127x99_m107"]];				
						
        ai_wep_random =	[ai_wep_assault,ai_wep_assault,ai_wep_assault,ai_wep_sniper,ai_wep_machine]; // random weapon 60% chance assault rifle,20% light machine gun,20% sniper rifle
		ai_wep_box = ["Sa58P_EP1","Sa58V_CCO_EP1","Sa58V_EP1","Sa58V_RCO_EP1","AKS_74_kobra","AKS_74_U","AKS_GOLD","AK_47_M","AK_74","FN_FAL","FN_FAL_ANPVS4","G36A_camo","G36C","G36C_camo","G36K_camo","M24_des_EP1","G36_C_SD_camo","LeeEnfield","M16A2","M16A2GL","M16A4_ACG","M4A1","M4A1_Aim","M4A1_AIM_SD_camo","M4A1_HWS_GL_camo","M4A3_CCO_EP1","SVD_CAMO","SCAR_H_LNG_Sniper_SD","DMR_DZ","SVD","VSS_vintorez","M107_DZ","M14_EP1","M24","M40A3","SVD_des_EP1","Winchester1866","Saiga12K","M1014","MR43","Remington870_lamp","UZI_EP1","bizon_silenced","Sa61_EP1","UZI_SD_EP1","MP5A5","MP5SD","KSVK_DZE","M249_m145_EP1_DZE","M60A4_EP1_DZE"];
		
		ammo_list = ["FHQ_rem_30Rnd_680x43_ACR","30Rnd_556x45_Stanag","20Rnd_762x51_DMR","FHQ_rem_30Rnd_680x43_ACR_SD","5Rnd_762x51_M24","20Rnd_762x51_FNFAL","30Rnd_556x45_StanagSD","20Rnd_762x51_DMR","5Rnd_86x70_L115A1","FHQ_rem_20Rnd_762x51_PMAG_NT","20Rnd_762x51_B_SCAR","FHQ_rem_20Rnd_762x51_PMAG_NT_SD","10Rnd_762x54_SVD","vil_10Rnd_762x54_SV","20Rnd_762x51_SB_SCAR","gms_k98_mag","30Rnd_762x39_AK47","vil_20Rnd_762x51_G3","30Rnd_545x39_AK","5x_22_LR_17_HMR","5Rnd_86x70_L115A1","5Rnd_127x108_KSVK","20Rnd_9x39_SP5_VSS",
					"FHQ_rem_30Rnd_680x43_ACR","30Rnd_556x45_Stanag","20Rnd_762x51_DMR","FHQ_rem_30Rnd_680x43_ACR_SD","5Rnd_762x51_M24","20Rnd_762x51_FNFAL","30Rnd_556x45_StanagSD","20Rnd_762x51_DMR","5Rnd_86x70_L115A1","FHQ_rem_20Rnd_762x51_PMAG_NT","20Rnd_762x51_B_SCAR","FHQ_rem_20Rnd_762x51_PMAG_NT_SD","10Rnd_762x54_SVD","vil_10Rnd_762x54_SV","20Rnd_762x51_SB_SCAR","gms_k98_mag","30Rnd_762x39_AK47","vil_20Rnd_762x51_G3","30Rnd_545x39_AK","5x_22_LR_17_HMR","5Rnd_86x70_L115A1","5Rnd_127x108_KSVK","20Rnd_9x39_SP5_VSS",
					"30Rnd_556x45_Stanag","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_FNFAL","30Rnd_556x45_StanagSD","5Rnd_86x70_L115A1","10Rnd_762x54_SVD","20Rnd_762x51_SB_SCAR","30Rnd_762x39_AK47","30Rnd_545x39_AK","5Rnd_86x70_L115A1","5Rnd_127x108_KSVK","20Rnd_9x39_SP5_VSS","100Rnd_556x45_M249","30Rnd_762x39_SA58","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_762x54_PK","15Rnd_W1866_Slug","2Rnd_shotgun_74Pellets","2Rnd_shotgun_74Slug","8Rnd_B_Beneli_74Slug","8Rnd_B_Beneli_Pellets","10x_303","8Rnd_B_Saiga12_74Slug",
					"30Rnd_556x45_Stanag","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_FNFAL","30Rnd_556x45_StanagSD","5Rnd_86x70_L115A1","10Rnd_762x54_SVD","20Rnd_762x51_SB_SCAR","30Rnd_762x39_AK47","30Rnd_545x39_AK","5Rnd_86x70_L115A1","5Rnd_127x108_KSVK","20Rnd_9x39_SP5_VSS","100Rnd_556x45_M249","30Rnd_762x39_SA58","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_762x54_PK","15Rnd_W1866_Slug","2Rnd_shotgun_74Pellets","2Rnd_shotgun_74Slug","8Rnd_B_Beneli_74Slug","8Rnd_B_Beneli_Pellets","10x_303","8Rnd_B_Saiga12_74Slug"];
					        		
		ai_packs					= ["DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
		ai_hero_skin				= ["FR_AC","FR_AR","FR_Corpsman","FR_GL","FR_Marksman","FR_R","FR_Sapper","FR_TL"];
		ai_bandit_skin				= ["Ins_Soldier_GL_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","GUE_Commander_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","GUE_Soldier_CO_DZ","BanditW1_DZ","BanditW2_DZ","Bandit1_DZ","Bandit2_DZ","UN_CDF_Soldier_Crew_EP1","USMC_Soldier_GL","GER_Soldier_TL_EP1","US_Soldier_AA_EP1","CZ_Soldier_DES_EP1","USMC_SoldierS_Sniper","RU_Worker4","Functionary2","RU_Policeman_DZ","Citizen1","SurvivorWpink_DZ","SurvivorW3_DZ","CIV_EuroMan02_EP1"];
		ai_special_skin				= ["Functionary1_EP1_DZ"];
		ai_all_skin					= [ai_hero_skin,ai_bandit_skin,ai_special_skin];

		ai_add_skin					= true;			// adds unit skin to inventory on death
		
	/* END AI CONFIG */

	/* WAI MISSIONS CONFIG */
		wai_mission_system			= true;	// use built in mission system

		wai_mission_markers			= ["DZMSMajMarker","DZMSMinMarker","DZMSBMajMarker","DZMSBMinMarker"];
		wai_avoid_missions			= 1000;								// avoid spawning missions this close to other missions, these are defined in wai_mission_markers
		wai_avoid_traders			= 1000;								// avoid spawning missions this close to traders
		wai_avoid_town				= 0;								// avoid spawning missions this close to towns, *** doesn't function with infiSTAR enabled ***
		wai_avoid_road				= 0;								// avoid spawning missions this close to roads
		wai_avoid_water				= 500;								// avoid spawning missions this close to water

		
		wai_mission_timer			= [300,900];						// time between missions 5-15 minutes
		wai_mission_timeout			= [1500,3000]; 						// time each missions takes to despawn if inactive 15-30 minutes
		wai_timeout_distance		= 700;								// if a player is this close to a mission then it won't time-out
		
		wai_clean_mission			= true;								// clean all mission buildings after a certain period
		wai_clean_mission_time		= 1200;								// time after a mission is complete to clean mission buildings

		wai_mission_fuel			= [5,60];							// fuel inside mission spawned vehicles [min%,max%]
		wai_vehicle_damage			= [20,70];							// damages to spawn vehicles with [min%,max%]
		wai_keep_vehicles			= false;								// save vehicles to database and keep them after restart
		wai_lock_vehicles			= false;								// lock mission vehicles and add keys to random AI bodies (be careful with ai_clean_dead if this is true)
		
		wai_crates_smoke			= true;								// pop smoke on crate when mission is finished during daytime
		wai_crates_flares			= true;								// pop flare on crate when mission is finished during nighttime
		
		wai_players_online			= 1; 								// number of players online before mission starts
		wai_server_fps				= 5; 								// missions only starts if server FPS is over wai_server_fps
		
		wai_kill_percent			= 0;								// percentage of AI players that must be killed at "crate" missions to be able to trigger completion

		wai_high_value				= true;								// enable the possibility of finding a high value item (defined below crate_items_high_value) inside a crate
		wai_high_value_chance		= 25;								// chance in percent you find above mentioned item

		wai_enable_minefield		= true;								// enable minefields to better defend missions
		wai_use_stinger				= true;								// add a stinger launcher to each spawned AI group
		wai_use_rpg					= true;								// add an rpg launcher to each spawned AI group
		wai_remove_stinger			= true;								// remove stinger launcher from AI on death
		wai_remove_rpg				= true;								// remove rpg launcher from AI on death
		

		// Missions
		wai_radio_announce			= true;								// Setting this to true will announce the missions to those that hold a radio only
		wai_hero_limit				= 3;								// define how many hero missions can run at once
		wai_bandit_limit			= 1;								// define how many bandit missions can run at once
		/* wai_special_limit			= 1;								// define how many special missions can run at once */
		wai_hero_missions			= [ 								// ["mission filename",% chance of picking this mission],Make sure the chances add up to 100,or it will not be accurate percentages
									["armed_vehicle",9],
									["bandit_base",8],
									["black_hawk_crash",8],
									["c130",8],
									["c130_supply",9],
									["captured_mv22",8],
									["comm",8],
									["destroyed_ural",8],
									["disabled_milchopper",8],
									["ikea_convoy",9],
									["mayors_mansion",8],
									["weapon_cache",9]	
									];
			wai_bandit_missions		= [
									["armed_vehicle",9],
									["black_hawk_crash",8],
									["broken_down_ural",8],
									["c130",8],
									["c130_supply",9],
									["captured_mv22",8],
									["comm",8],
									["hero_base",8],
									["ikea_convoy",9],
									["presidents_mansion",8],
									["sniper_extraction",8],
									["weapon_cache",9]							
									];	
		
		// Vehicle arrays
		armed_vehicle 				= ["ArmoredSUV_PMC_DZE","GAZ_Vodnik_DZE","BTR90_HQ","LAV25_HQ","HMMWV_M1151_M2_CZ_DES_EP1_DZE","HMMWV_M998A2_SOV_DES_EP1_DZE","LandRover_MG_TK_EP1_DZE","LandRover_Special_CZ_EP1_DZE","Offroad_DSHKM_Gue_DZE","Pickup_PK_GUE_DZE","Pickup_PK_INS_DZE","Pickup_PK_TK_GUE_EP1_DZE","UAZ_MG_TK_EP1_DZE"];
		armed_chopper 				= ["CH_47F_EP1_DZE","UH1H_DZE","Mi17_DZE","UH60M_EP1_DZE","UH1Y_DZE","MH60S_DZE"];
		civil_chopper 				= ["AH6X_DZ","BAF_Merlin_DZE","MH6J_DZ","Mi17_Civilian_DZ"];
		military_unarmed 			= ["GAZ_Vodnik_MedEvac","HMMWV_Ambulance","HMMWV_Ambulance_CZ_DES_EP1","HMMWV_DES_EP1","HMMWV_DZ","HMMWV_M1035_DES_EP1","LandRover_CZ_EP1","LandRover_TK_CIV_EP1","UAZ_CDF","UAZ_INS","UAZ_RU","UAZ_Unarmed_TK_CIV_EP1","UAZ_Unarmed_TK_EP1","UAZ_Unarmed_UN_EP1"];
		cargo_trucks 				= ["Kamaz","MTVR_DES_EP1","Ural_CDF","Ural_TK_CIV_EP1","Ural_UN_EP1","V3S_Open_TK_CIV_EP1","V3S_Open_TK_EP1"];
		refuel_trucks				= ["KamazRefuel_DZ","MtvrRefuel_DES_EP1_DZ","UralRefuel_TK_EP1_DZ","V3S_Refuel_TK_GUE_EP1_DZ"];
		civil_vehicles 				= ["hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open_EP1","SUV_Blue","SUV_Camo","SUV_Charcoal","SUV_Green","SUV_Orange","SUV_Pink","SUV_Red","SUV_Silver","SUV_TK_CIV_EP1","SUV_White","SUV_Yellow"];

		// Dynamic box array
		crates_large				= ["USVehicleBox","RUVehicleBox","TKVehicleBox_EP1"];
		crates_medium				= ["USBasicWeaponsBox","RUBasicWeaponsBox","USSpecialWeaponsBox","USSpecialWeapons_EP1","RUSpecialWeaponsBox","SpecialWeaponsBox","TKSpecialWeapons_EP1","CZBasicWeapons_EP1","UNBasicWeapons_EP1"];
		crates_small				= ["GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"];

		crate_weapons_buildables	= ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"];
		
		crate_tools					= ["ItemKeyKit","Binocular","Binocular_Vector","ItemCompass","ItemCrowbar","ItemEtool","ItemFishingPole","ItemFlashlightRed","ItemGPS","ItemHatchet_DZE","ItemKnife","ItemMachete","ItemMatchbox_DZE","ItemToolbox","NVGoggles"];
		crate_tools_buildable		= ["ItemToolbox","ItemEtool","ItemCrowbar","ItemKnife"];
		crate_tools_sniper			= ["ItemCompass","Binocular","Binocular_Vector","NVGoggles","ItemGPS"];

		crate_items					= ["FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemBandage","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","ItemGoldBar","ItemGoldBar10oz","CinderBlocks","ItemCanvas","ItemComboLock","ItemLightBulb","ItemLockbox","ItemSandbag","ItemTankTrap","ItemWire","MortarBucket","PartEngine","PartFueltank","PartGeneric","PartGlass","PartPlankPack","PartVRotor","PartWheel"];
		crate_items_high_value		= ["ItemBriefcase100oz","ItemVault","30m_plot_kit"];
		crate_items_food			= ["ItemWaterbottle","FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked"];
		crate_items_buildables		= [["CinderBlocks",4],"ItemSandbag","MortarBucket","bulk_PartGeneric","bulk_ItemSandbag","bulk_ItemTankTrap","CinderBlocks","ItemSandbag",["MortarBucket",1],"metal_panel_kit"];
		crate_items_vehicle_repair	= ["PartEngine","PartFueltank","PartGeneric","PartGlass","PartVRotor","PartWheel"];
		crate_items_medical			= ["ItemWaterbottle","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","ItemBandage","FoodCanFrankBeans","FoodCanPasta"];
		crate_items_chainbullets	= ["2000Rnd_762x51_M134","200Rnd_762x51_M240","100Rnd_127x99_M2","50Rnd_127x107_DSHKM"];
		crate_items_sniper			= [["ItemPainkiller",5],"Skin_Sniper1_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_GUE_Soldier_Sniper_DZ"];
		crate_items_president		= ["ItemDocument","ItemGoldBar10oz","ItemBriefcase100oz"];

		crate_backpacks_all			= ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_TerminalPack_EP1","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_CompactPack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
		crate_backpacks_large		= ["DZ_GunBag_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1","DZ_CivilBackpack_EP1"];

		crate_random				= [crate_items,crate_items_food,crate_items_buildables,crate_items_vehicle_repair,crate_items_medical,crate_items_chainbullets];

	/* END WAI MISSIONS CONFIG */

	/* STATIC MISSIONS CONFIG */

		static_missions				= true;		// use static mission file
		custom_per_world			= true;		// use a custom mission file per world

	/* END STATIC MISSIONS CONFIG */

	WAIconfigloaded = true;

};
