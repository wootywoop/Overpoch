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
      "CIV_EuroMan02_EP1",           
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
      "SurvivorW2_DZ",               
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
    "BanditW2_DZ",                             
    "Random",                                   
    "Bandit"                                   
  ] call spawn_group;

[
      [13441.577, 2774.9651, 0],           
      1,                 
      "medium",                 
      "Random",                 
      4,                 
      "Random",                 
      "Survivor2_DZ",                 
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
      "Haris_Press_EP1_DZ",               
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
      "Functionary1_EP1_DZ",               
      "Random",                 
      "Bandit"                 
   ] call spawn_group;

[
      [13624.729, 3170.6475, 0],           
      2,                 
      "medium",                 
      ["Random","aa"],                 
      6,                 
      "Random",                 
      "Functionary1_EP1_DZ",               
      "Random",                 
      "Bandit"                 
   ] call spawn_group;

  [
      [13695.613, 2925.842, 13.075159],         
      1,                 
      "extreme",               
      "ai_wep3",              
      10,                 
      "DZ_LargeGunBag_EP1",           
      "Sniper1_DZ",           
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
      "Survivor2_DZ",           
      "Random",                 
      "Bandit"                 
   ] call spawn_group;


[
      [13600,3160,0],           
      4,                 
      "medium",                 
      "Random",                 
      10,                 
      "Random",                 
      "Survivor2_DZ",           
      "Random",                 
      "Bandit"                 
   ] call spawn_group;


[
      [13695.068, 2943.6411, 0],           
      3,                 
      "medium",                 
      ["Random","at"],                 
      10,                 
      "Random",                 
      "FR_OHara_DZ",           
      "Random",                 
      "Bandit"                 
   ] call spawn_group;
/*
	[
		[3660.52,14883.2,0.001],			// Position
		5,									// Number Of units
		"extreme",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number or gun and rocket launcher. Syntax is "Random", for gun only or ["Random","AT"], for gun and launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;
	
	[
		[3688.94,14089.4,0.002],			// Position plane crash
		5,									// Number Of units
		"extreme",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number or gun and rocket launcher. Syntax is "Random", for gun only or ["Random","AT"], for gun and launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;
	
	[
		[3436.98,14210.6,0.001],			// Position snow man
		5,									// Number Of units
		"extreme",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number or gun and rocket launcher. Syntax is "Random", for gun only or ["Random","AT"], for gun and launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;

	[
		[3709.65,14505,0.002],			// Position
		5,									// Number Of units
		"extreme",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number or gun and rocket launcher. Syntax is "Random", for gun only or ["Random","AT"], for gun and launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;
	
	[
		[3827.2,14130.3,0.001],			// Position
		6,									// Number Of units
		"extreme",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number or gun and rocket launcher. Syntax is "Random", for gun only or ["Random","AT"], for gun and launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;
*/
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
         [13728.687, 2946.4109, 13.861853],           
         [13396.714, 2856.3987, 2.4032953],
         [13712.405, 2960.0889, 2.7218401],
         [13637.78, 3204.8618, 6.9115076]
      ],
      "M2StaticMG_US_EP1",           
      "Random",                 
      "Survivor2_DZ",           
      "Bandit",                 
      "Random",                 
      4,                 
      "Random",                 
      "Random"                 
   ] call spawn_static;
/*
	[
		[									// Position(s) (can be multiple) middle tower
			[3720.82,14487.3,29.192],
			[3380.02,14299.4,12.687],
			[2952.77,14334.1,19.282],
			[2925.67,14372,18.945]
		],
		"M2StaticMG",						// Classname of turret
		"extreme",								// Skill level of unit (easy, medium, hard, extreme, Random)
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		2,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;

*/
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
	[
		[3575.67,14522.2,0.002],			// Position to patrol
		[1300,12960,0],						// Position to spawn chopper at
		1000,								// Radius of patrol
		8,									// Number of waypoints to give
		"AH1Z",								// Classname of vehicle (make sure it has driver and two gunners)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;
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
/*
[
		[3750.51,14212.3,0.001],				// Position to patrol Middle
		[3750.51,14212.3,0.001],				// Position to spawn at
		400,								// Radius of patrol
		10,									// Number of waypoints to give
		"BMP3",					// Classname of vehicle (make sure it has driver and gunner)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;
	
	[
		[3475.67,14622.2,0.002],				// Position to patrol center of arena
		[3475.67,14622.2,0.002],				// Position to spawn at
		400,								// Radius of patrol
		10,									// Number of waypoints to give
		"2S6M_Tunguska",					// Classname of vehicle (make sure it has driver and gunner)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;
	
	[
		[3408.48,14400.2,0.001],				// Position to patrol Middle
		[3408.48,14400.2,0.001],				// Position to spawn at
		400,								// Radius of patrol
		10,									// Number of waypoints to give
		"M1A2_TUSK_MG",					// Classname of vehicle (make sure it has driver and gunner)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;

*/

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

	/*
	
	[
		[3045.19,14363.4,0.001],	// Position that units will be dropped by
		[1300,14960,0],							// Starting position of the heli
		700,								// Radius from drop position a player has to be to spawn chopper
		"UH1Y",							// Classname of chopper (Make sure it has 2 gunner seats!)
		10,									// Number of units to be para dropped
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set.
		"Bandit",							// AI Type, "Hero" or "Bandit".
		true								// true: Aircraft will stay at position and fight. false: Heli will leave if not under fire. 
	] spawn heli_para;
	
	*/
	
[
      [13706.369, 2928.425, 0],               
      [0,-2640,200],                 
      100,                     
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

[
      [13600,3260,0],               
      [16500,12860,200],                 
      700,                   
      "Mi171Sh_CZ_EP1",                 
      3,                     
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