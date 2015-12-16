if(isServer) then {
	 
	private 		["_rndnum","_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [80] call find_position;
	[_mission,_position,"Hard","Communications Center","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Communication Center]: Starting... %1",_position];

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
	[[(_position select 0) -100, (_position select 1) +100, 0],_num,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	




	//Static Guns
	[[[(_position select 0) - 30, (_position select 1) + 30, 0]],"M2StaticMG","Hard","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 30, (_position select 1) - 30, 0]],"M2StaticMG","Hard","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 30, (_position select 1) + 30, 0]],"M2StaticMG","Hard","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 30, (_position select 1) - 30, 0]],"M2StaticMG","Hard","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;




	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"A jungle task force have set up a Communications Center! Go and ambush it to make it yours!",	// mission announcement
		"Survivors captured the Communications Center, HOOAH!!",										// mission success
		"Survivors were unable to capture the Communications Center"									// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[25,ai_wep_box],[8,crate_tools_sniper],[25,crate_items_high_value],[1,crate_backpacks_large]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Communications Center]: Ended at %1",_position];
	
	h_missionsrunning = h_missionsrunning - 1;
};