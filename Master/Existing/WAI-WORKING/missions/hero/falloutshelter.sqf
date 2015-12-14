if(isServer) then {

	private 		["_rndnum","_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4"];

	_fadeFire  = false;
	_burn = true;
	
	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Extreme","Fallout Shelter","MainHero",true] call mission_init;	
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#ffe700' shadow='4' size='1.75'>Fallout Shelter:</t><br/><t align='left' color='#FFFFF9F'>Some Outlaws are trying to get loot from an abandoned fallout shelter. Kill them and get the loot first! </t>"];
	[nil, nil, rHINT, _hint] call RE;
	
	diag_log 		format["WAI: [Mission:[Hero] Fallout Shelter]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];

	//this will build up a bunker
	_baserunover0 	= createVehicle ["Land_MBG_HeavyShelter",[(_position select 0), (_position select 1),0],[],0, "CAN_COLLIDE"];             //Left bunker side
	_baserunover1 	= createVehicle ["Foodbox2",[(_position select 0) + 0, (_position select 1) +1,0],[], 0, "CAN_COLLIDE"];       //right bunker side
	_baserunover2 	= createVehicle ["AmmoBoxSmall_762",[(_position select 0) - 1, (_position select 1) + 0,0],[], 0, "CAN_COLLIDE"];   //connection north
	_baserunover3 	= createVehicle ["AmmoBoxSmall_762",[(_position select 0) + 1, (_position select 1) + 0,0],[], 0, "CAN_COLLIDE"];    //Connection south
	_baserunover4 	= createVehicle ["MedBox0",[(_position select 0) + 0, (_position select 1) - 1,0],[], 0, "CAN_COLLIDE"];          //perma dorrwayblock
 
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4];      
	
	_directions = [0,0,0,0,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	

	//Troops
	_rndnum = 4 + round (random 1);
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Hard","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Hard","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Hard","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_stinger;
  
  
  //Static mounted guns
	[[
		[(_position select 0) - 10, (_position select 1) + 0, 0],
		[(_position select 0) + 10, (_position select 1) + 0, 0],
    [(_position select 0) + 0, (_position select 1) + 10, 0],
		[(_position select 0) + 0, (_position select 1) - 10, 0]
	],"M2StaticMG","medium","Bandit","Bandit",1,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"Some Outlaws are trying to get loot from an abandoned fallout shelter. Kill them and get the loot first!",	// mission announcement
		"Survivors have secured the fallout shelter!",																	// mission success
		"The Outlaws have taken the loot and destroyed the shelter!"															// mission fail
	] call mission_winorfail;

	diag_log format["WAI: [Mission:[Hero] Fallout Shelter]: Ended at %1",_position];

  if(_complete) then {
		[_crate,[70,ai_wep_box],10,[100,crate_items_buildables],1,[150,ammo_list]] call dynamic_crate;
	};

	h_missionsrunning = h_missionsrunning - 1;
};