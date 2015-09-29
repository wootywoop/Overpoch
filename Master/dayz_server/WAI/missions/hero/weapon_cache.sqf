if(isServer) then {

	private 		["_complete","_crate_type","_mission","_position","_crate","_playerPresent","_rndnum","_rndgro","_num_guns","_num_tools","_num_items"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Medium","Weapon Cache","MainHero",true] call mission_init;
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#D60000' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>Bandits have obtained a weapon crate. Check your map for the location!</t>"];
	[nil, nil, rHINT, _hint] call RE;

	diag_log 		format["WAI: [Mission:[Hero] Weapon Cache]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Troops
	_rndnum 	= (3 + round(random 3));
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_stinger;
	
	//Static Guns
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) - 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"],			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
		[],					// cleanup objects
		"Bandits have obtained a weapon crate. Check your map for the location!",	// mission announcement
		"Survivors have secured the weapon cache!",									// mission success
		"Survivors did not secure the weapon cache in time"							// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[16,ai_wep_box],4,0,1,[100,ammo_list]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Weapon Cache]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};