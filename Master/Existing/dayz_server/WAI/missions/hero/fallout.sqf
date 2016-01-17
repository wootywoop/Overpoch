if(isServer) then {
private 		["_rndnum","_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4"];

// Get mission number, important we do this early
_mission = count wai_mission_data -1;
_position	= [80] call find_position;
[_mission,_position,"Extreme","Fallout Shelter","MainHero",true] call mission_init;
diag_log format["WAI: [Mission:[Hero] Fallout Shelter]: Starting... %1",_position];
//Setup the crate
_crate_type 	= crates_small call BIS_fnc_selectRandom;
_crate 		= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];

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
_num = 4 + round (random 3);
[[_position select 0,_position select 1,0],_num,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],2,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],2,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

//Humvee Patrol
[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"HMMWV_Armored","Hard","Bandit","Bandit",_mission] call vehicle_patrol;

//Static Guns
[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;


//Condition
_complete = [
[_mission,_crate], // mission number and crate
["crate"], // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
[_baserunover], // cleanup objects
"Some Outlaws are trying to get loot from a abandoned fallout shelter. Kill then and get the loot first!",	// mission announcement
"Survivors have secured the fallout shelter!",																	// mission success
"The Outlaws safed the loot and buried the shelter!"
] call mission_winorfail;

if(_complete) then {
[_crate,75,35,26,4] call dynamic_crate;

};
diag_log format["WAI: [Mission:[Hero] Fallout Shelter]: Ended at %1",_position];
h_missionsrunning = h_missionsrunning - 1;
};