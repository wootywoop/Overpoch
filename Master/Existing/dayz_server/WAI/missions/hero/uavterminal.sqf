if(isServer) then {

	private 		["_rndnum","_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3"];

	_fadeFire  = false;
	_burn = true;
	
	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Easy","UAV-Terminal","MainHero",true] call mission_init;	
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#00b37d' shadow='4' size='1.75'>UAV-Terminal:</t><br/><t align='left' color='#FFFFF9F'>A group of crazy engineers are setting up a drone from a military camp. Stop them before they can launch it!</t>"];
	[nil, nil, rHINT, _hint] call RE;
	
	diag_log 		format["WAI: [Mission:[Hero] UAV-Terminal]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];

	//this will build up a bunker
	_baserunover0 	= createVehicle ["USMC_WarfareBUAVterminal",[(_position select 0) +3, (_position select 1),0],[],0, "CAN_COLLIDE"];             //Left bunker side
	_baserunover1 	= createVehicle ["Misc_cargo_cont_net2",[(_position select 0) + 7, (_position select 1) + 1,0],[], 0, "CAN_COLLIDE"];       //right bunker side
	_baserunover2 	= createVehicle ["Misc_cargo_cont_net3",[(_position select 0) + 7, (_position select 1) + 7,0],[], 0, "CAN_COLLIDE"];   //connection north
	_baserunover3 	= createVehicle ["Base_WarfareBContructionSite",[(_position select 0) + 0, (_position select 1) - 10,0],[], 0, "CAN_COLLIDE"];    //Connection south
	
 
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3];      
	
	_directions = [0,45,0,35];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
  
//Spawn the MQ9

_drone 	= createVehicle ["MQ9PredatorB",[(_position select 0) - 8, (_position select 1)- 4,0],[],0, "CAN_COLLIDE"];
if (!isEngineOn _drone) then {_drone engineOn true};  
_drone lock true;	

	//Troops
	_rndnum = 3 + round (random 1);
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"easy","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;

  


	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover,_drone], 	// cleanup objects
		"A group of crazy engineers are setting up a drone from a military camp. Stop them before they can launch it!",	// mission announcement
		"Survivors stopped the launch of the drone !",																	// mission success
		"The drone was defective and the group fled."															// mission fail
	] call mission_winorfail;

	diag_log format["WAI: [Mission:[Hero] UAV-Drone]: Ended at %1",_position];

  if(_complete) then {
    if (isEngineOn _drone) then {_drone engineOn false};
		[_crate,[15,ai_wep_box],10,[50,crate_items_buildables],1,[100,ammo_list]] call dynamic_crate;
	};

	h_missionsrunning = h_missionsrunning - 1;
};