if(isServer) then {


	//Custom Spawns file//
	/*
	Custom group spawns Eg.

	[
		[953.237,4486.48,0.001],			// Position
		4,									// Number Of units
		"Random",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",	or ["Random","at"],		// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;

	Place your custom group spawns below
	*/

[
		[14012.053, 2806.3486, 0],				
		1,						
		"hard",						
		"Random",					
		4,						
		"Random",						
		"Random",				
		"Random",						
		"Bandit"						
	] call spawn_group;

[
		[14012.053, 2805.3486, 0],					
		1,						
		"easy",						
		"Random",					
		4,						
		"Random",						
		"Random",					
		"Random",						
		"Bandit"						
	] call spawn_group;

[
     		[14012.053, 2807.3486, 0],              					
      		2,                          						
     		"easy",                 						
    		"Random",             					
     		8,                          						
     		"Random",                  						
    		"Random",              					
     		"Random",                  						
     		"Bandit"                  						
  	] call spawn_group;

[
		[13441.577, 2774.9651, 0],				
		1,						
		"medium",						
		"M40A3",						
		4,						
		"Random",						
		"Random",						
		"Random",						
		"Bandit"						
	] call spawn_group;

[
		[13441.577, 2775.9651, 0],				
		2,						
		"easy",						
		"Random",						
		4,						
		"Random",						
		"Random",					
		"Random",						
		"Bandit"						
	] call spawn_group;

[
		[13441.577, 2773.9651, 0],				
		3,						
		"medium",						
		"Random",						
		6,						
		"Random",						
		"Random",					
		"Random",						
		"Bandit"						
	] call spawn_group;

[
		[13624.729, 3170.6475, 0],				
		2,						
		"medium",						
		"Random",						
		6,						
		"Random",						
		"Random",					
		"Random",						
		"Bandit"						
	] call spawn_group;

[
		[13729.605, 2946.4514, 17.954422],			
		1,						
		"extreme",					
		"M110_NVG_EP1",					
		10,						
		"DZ_LargeGunBag_EP1",				
		"Random",				
		"Random",						
		"Bandit"						
	] call spawn_group;

[
		[13699.859, 2883.9893, 0],				
		4,						
		"medium",						
		"Random",						
		10,						
		"Random",						
		"Random",				
		"Random",						
		"Bandit"						
	] call spawn_group;

[
		[13695.068, 2943.6411, 0],				
		3,						
		"medium",						
		"Random",						
		10,						
		"Random",						
		"Random",				
		"Random",						
		"Bandit"						
	] call spawn_group;

	[
		[14001,2761,0],					
		1,						
		"Random",						
		["Random","aa"],					
		4,						
		"Random",						
		"Random",						
		"Random",						
		"Bandit"						
	] call spawn_group;

	/*
	Custom static weapon spawns Eg. (with mutiple positions)

	[
		[									// Position(s) (can be multiple)
			[911.21,4532.76,2.62],
			[921.21,4542.76,2.62]
		],
		"M2StaticMG",						// Classname of turret
		"easy",								// Skill level of unit (easy, medium, hard, extreme, Random)
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		2,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;

	Place your custom static weapon spawns below
	*/

	[
		[						
			[13712.405, 2960.0889, 2.7218401],
			[13637.78, 3204.8618, 6.9115076]
		],
		"M2StaticMG_US_EP1",				
		"Random",						
		"Random",				
		"Bandit",						
		"Random",						
		4,						
		"Random",						
		"Random"						
	] call spawn_static;



	/*
	Custom Chopper Patrol spawn Eg.

	[
		[725.391,4526.06,0],				// Position to patrol
		[0,0,0],							// Position to spawn chopper at
		2000,								// Radius of patrol
		10,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;


	Place your heli patrols below
	*/





	/* 
	Custom Vehicle patrol spawns Eg. (Watch out they are stupid)

	[
		[725.391,4526.06,0],				// Position to patrol
		[725.391,4526.06,0],				// Position to spawn at
		200,								// Radius of patrol
		10,									// Number of waypoints to give
		"HMMWV_Armored",					// Classname of vehicle (make sure it has driver and gunner)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;

	Place your vehicle patrols below this line
	*/

[
		[13200,2960,0],					
		[13200,2960,0],					
		300,						
		10,						
		"RHIB",						
		"Random",						
		"Random",				
		"Bandit"						
	] spawn vehicle_patrol;

[
		[13600,3160,0],					
		[13600,3160,0],					
		300,						
		10,						
		"HMMWV_M1151_M2_DES_EP1",			
		"medium",						
		"Random",						
		"Bandit"						
	] spawn vehicle_patrol;

[
		[13900,2960,0],					
		[13900,2960,0],					
		300,						
		10,						
		"HMMWV_M998_crows_M2_DES_EP1",			
		"medium",						
		"Random",						
		"Bandit"						
	] spawn vehicle_patrol;

[
		[13500,3060,0],					
		[13500,3060,0],					
		300,						
		10,						
		"M113_UN_EP1",					
		"medium",						
		"Random",						
		"Bandit"						
	] spawn vehicle_patrol;

[
		[14000,2760,0],					
		[14000,2760,0],					
		80,						
		4,						
		"Ural_ZU23_TK_GUE_EP1",				
		"Random",						
		"Random",						
		"Bandit"						
	] spawn vehicle_patrol;



	/*
	Paradropped unit custom spawn Eg.

	[
		[911.21545,4532.7612,2.6292224],	// Position that units will be dropped by
		[0,0,0],							// Starting position of the heli
		400,								// Radius from drop position a player has to be to spawn chopper
		"UH1H_DZ",							// Classname of chopper (Make sure it has 2 gunner seats!)
		5,									// Number of units to be para dropped
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set.
		"Bandit",							// AI Type, "Hero" or "Bandit".
		true								// true: Aircraft will stay at position and fight. false: Heli will leave if not under fire. 
	] spawn heli_para;

	Place your paradrop spawns under this line
	*/

	[
		[13706.369, 2928.425, 0],					
		[0,-2640,200],						
		50,							
		"UH60M_EP1",						
		5,							
		"medium",							
		"Random",							
		6,							
		"Random",							
		"Random",					
		"Random",							
		"Bandit",							
		true							
	] spawn heli_para;
	
	diag_log format["WAI: Static mission for %1 loaded", missionName];

};
