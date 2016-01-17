if(isServer) then {
	 
	private 		["_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","_baserunover8"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [80] call find_position;
	[_mission,_position,"Hard","Gemstone Mine","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Gemstone Mine]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Buildings


	_baserunover0 	= createVehicle ["MAP_Pristresek_mensi",[(_position select 0) - 1.1, (_position select 1) - 10.655, -0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["MAP_fort_rampart",[(_position select 0) - 4.2, (_position select 1) + 2, 0.734],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["MAP_fort_rampart",[(_position select 0) + 4.2, (_position select 1) +2, 0.734],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["MAP_R2_RockWall",[(_position select 0), (_position select 1) +22.97, -24.15],[], 0, "CAN_COLLIDE"];
	_baserunover4 	= createVehicle ["Land_Wheel_cart_EP1",[(_position select 0) + 3, (_position select 1) - 5.4, -0.2],[], 0, "CAN_COLLIDE"];
  _baserunover5 	= createVehicle ["Bunker_PMC",[(_position select 0), (_position select 1) + 10.3816,-0.5077],[], 0, "CAN_COLLIDE"];
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5];
	
	_directions = [0,90,270,104.4,50,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	
	//Troops
	_num = 4 + round (random 3);
	[[_position select 0,_position select 1,0],_num,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],3,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
  [[_position select 0,_position select 1,0],1,"Hard",["Random","AA"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
  [[_position select 0,_position select 1,0],1,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
  [[_position select 0,_position select 1,0],1,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
  [[_position select 0,_position select 1,0],1,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
  [[_position select 0,_position select 1,0],1,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
  [[_position select 0,_position select 1,0],1,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
  [[_position select 0,_position select 1,0],1,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

;
	 
	//Static Guns
	[[[(_position select 0), (_position select 1) + 3.9685, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0), (_position select 1) - 9.7922, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;


	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"Heavy armed Tresure Hunters with some explosives discovered a abandoned Gemstone Mine. Get the tresure Chest before they leave this place! ",	// mission announcement
		"Survivors captured the Gems!",															// mission success
		"Survivors were unable to capture the Gems."														// mission fail
	] call mission_winorfail;

	if(_complete) then {
    [_crate,[7,crate_item_gem_high],[10,crate_item_gold],[20,crate_items_minerals],[10,crate_item_raw] call dynamic_crate; 
	};

	diag_log format["WAI: [Mission:[Hero] Gemstone Mine]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};