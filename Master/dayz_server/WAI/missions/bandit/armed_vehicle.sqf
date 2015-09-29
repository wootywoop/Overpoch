if(isServer) then {

	private 		["_complete","_crate","_mission","_static_gun","_crate_type","_rndnum","_playerPresent","_vehname","_vehicle","_position","_vehclass"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;
	
	//Armed Land Vehicle
	_vehclass 		= armed_vehicle call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");

	_position		= [30] call find_position;
	[_mission,_position,"Medium",format["Disabled %1",_vehname],"MainBandit",true] call mission_init;
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#00FF11' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>Heroes have taken an armed vehicle from the bandits! Check your map for the location!</t>"];
	[nil, nil, rHINT, _hint] call RE;

	diag_log 		format["WAI: [Mission:[Bandit] Armed Vehicle]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	
	//Troops
	_rndnum = (2 + round (random 4));
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_stinger;
	
	//Static Guns
	_static_gun = ai_static_weapons call BIS_fnc_selectRandom;
	[[
		[(_position select 0),(_position select 1) + 10, 0]
	],_static_gun,"Medium","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	//Spawn vehicles
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] armed_vehicle spawned a %1",_vehname];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle], 		// cleanup objects
		"Heroes have taken an armed vehicle from the bandits! Check your map for the location!",	// mission announcement
		"Bandits have secured the armed vehicle!",													// mission success
		"Bandits did not secure the armed vehicle in time"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[10,ai_wep_box],0,[25,crate_items_chainbullets],1,[100,ammo_list]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Armed Vehicle]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};