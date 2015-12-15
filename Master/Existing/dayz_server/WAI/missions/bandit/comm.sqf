if(isServer) then {
	 
	private 		["_rndnum","_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Hard","Communications Center","MainBandit",true] call mission_init;
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#00FF11' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>Heroes have setup a Communications Center, are you bandit enough to take them down?</t>"];
	[nil, nil, rHINT, _hint] call RE;

	diag_log 		format["WAI: [Mission:[Bandit] Comunication Center]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Buildings
	_baserunover0 	= createVehicle ["Land_telek1",[(_position select 0) - 1, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["Fort_Nest_M240",[(_position select 0) - 20, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["Fort_Nest_M240",[(_position select 0) + 20, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["Fort_Nest_M240",[(_position select 0), (_position select 1) - 20,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover4 	= createVehicle ["Fort_Nest_M240",[(_position select 0), (_position select 1) + 20,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4];
	
	_directions = [90,270,90,180,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	
	//Group Spawning
	_rndnum = 3 + round (random 3);
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_stinger;
	
	//Static Guns
	[[[(_position select 0) - 30, (_position select 1) + 30, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 30, (_position select 1) - 30, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 30, (_position select 1) + 30, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 30, (_position select 1) - 30, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"Heroes have setup a Communications Center, are you bandit enough to take them down?",	// mission announcement
		"Bandits have captured the Communications Center",										// mission success
		"Bandits did not capture the Communications Center in time"									// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[25,ai_wep_box],[8,crate_tools_sniper],[25,crate_items_high_value],[1,crate_backpacks_large],[100,ammo_list]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Communications Center]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};