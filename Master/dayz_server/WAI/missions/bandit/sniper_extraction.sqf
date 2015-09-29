if(isServer) then {

	private 		["_complete","_vehicle","_rndnum","_crate_type","_crate","_mission","_tanktraps","_mines","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	//Military Chopper
	_vehclass 		= armed_chopper call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");

	_position		= [30] call find_position;
	[_mission,_position,"Hard",format["Sniper Extraction %1", _vehname],"MainBandit",true] call mission_init;	
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#00FF11' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>Heroes have captured a lot of sniper rifles from the Takistani bandit clan, make your move as a bandit whilst they are planning a getaway</t>"];
	[nil, nil, rHINT, _hint] call RE;

	diag_log 		format["WAI: [Mission:[Bandit] Sniper Extraction]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	
	//Troops
	_rndnum = 3 + round (random 4);
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_stinger;

	//Static Guns
	[[
		[(_position select 0) + 30, (_position select 1) - 30, 0],
		[(_position select 0) + 30, (_position select 1) + 30, 0],
		[(_position select 0) - 30, (_position select 1) - 30, 0],
		[(_position select 0) - 30, (_position select 1) + 30, 0]
	],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	
	//Spawn vehicle
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] sniper_extraction spawned a %1",_vehname];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
		[_vehicle], 		// cleanup objects
		"Heroes have captured a lot of sniper rifles from the Takistani bandit clan, make your move as a bandit whilst they are planning a getaway",		// mission announcement
		"Bandits have secured the snipers and taken the chopper!",		// mission success
		"Bandits did not secure the sniper rifles in time"				// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[26,ai_wep_box],[4,crate_tools_sniper],[4,crate_items_sniper],1,[100,ammo_list]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Sniper Extraction]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};