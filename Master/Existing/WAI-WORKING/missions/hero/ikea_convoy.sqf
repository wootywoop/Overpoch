if(isServer) then {

	private			["_complete","_dir","_rndnum","_crate_type","_mission","_position","_vehclass3","_vehclass2","_vehicle3","_vehicle2","_playerPresent","_vehicle","_vehclass","_crate"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Hard","Disabled Convoy","MainHero",true] call mission_init;
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#D60000' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>An Ikea delivery has been hijacked by bandits, take over the convoy and the building supplies are yours!</t>"];
	[nil, nil, rHINT, _hint] call RE;

	diag_log 		format["WAI: [Mission:[Hero] Disabled Convoy]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	
	//Troops
	_rndnum = 3 + round (random 3);
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_stinger;
	
	//Static Guns
	[[
		[(_position select 0) + 25, (_position select 1) + 25, 0],
		[(_position select 0) - 25, (_position select 1) - 25, 0],
		[(_position select 0) + 25, (_position select 1) - 25, 0]
	],"M2StaticMG","Hard","Bandit","Bandit",1,2,"Random","Random",_mission] call spawn_static;

	//Heli Para Drop
	[[(_position select 0),(_position select 1),0],[0,0,0],400,"BAF_Merlin_HC3_D",10,"Random","Random",4,"Random","Bandit","Random","Bandit",false,_mission] spawn heli_para;

	// Spawn Vehicles
	_dir 			= floor(round(random 360));

	_vehclass 		= cargo_trucks 		call BIS_fnc_selectRandom;		// Cargo Truck
	_vehclass2 		= refuel_trucks 	call BIS_fnc_selectRandom;		// Refuel Truck
	_vehclass3 		= military_unarmed 	call BIS_fnc_selectRandom;		// Military Unarmed

	_vehicle		= [_vehclass,_position,_mission,false,_dir] 	call custom_publish;
	_vehicle2		= [_vehclass2,_position,_mission,false,_dir] call custom_publish;
	_vehicle3		= [_vehclass3,_position,_mission,false,_dir] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Hero] ikea_convoy spawned a %1",_vehclass];
		diag_log format["WAI: [Hero] ikea_convoy spawned a %1",_vehclass3];
		diag_log format["WAI: [Hero] ikea_convoy spawned a %1",_vehclass2];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],				// mission number and crate
		["crate"], 						// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle,_vehicle2,_vehicle3],	// cleanup objects
		"An Ikea delivery has been hijacked by bandits, take over the convoy and the building supplies are yours!",	// mission announcement
		"Survivors have secured the building supplies!",															// mission success
		"Survivors did not secure the convoy in time"																// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[5,crate_weapons_buildables],[4,crate_tools_buildable],[30,crate_items_buildables],1,[100,ammo_list]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Disabled Convoy]: Ended at %1",_position];
	
	h_missionsrunning = h_missionsrunning - 1;
};