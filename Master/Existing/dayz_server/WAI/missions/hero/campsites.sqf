if(isServer) then {
private ["_complete","_crate_type","_crate_type2","_mission","_position","_crate","_playerPresent","_rndnum","_rndgro","_num_guns","_num_tools","_num_items","_num1x","_num1y","_num2x","_num2y","_num3x","_num3y","_num4x","_num4y","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","_baserunover8"];
// Get mission number, important we do this early
_mission = count wai_mission_data -1;
_position	= [30] call find_position;
[_mission,_position,"Extreme","Bandit Campsite","MainHero",true] call mission_init;
diag_log format["WAI: [Mission:[Hero] Bandit Campsites]: Starting... %1",_position];
// Set Random Numbers
_num1x = (25 + round(random 250));
_num1y = (25 + round(random 250));
_num2x = (25 + round(random 250));
_num2y = (-25 - round(random 250));
_num3x = (-25 - round(random 250));
_num3y = (-25 - round(random 250));
_num4x = (-25 - round(random 250));
_num4y = (25 + round(random 250));



//Setup the maincrate
_crate_type = crates_large call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
_crate setDir 0;



//Fireplaces
_baserunover0 = createVehicle ["Land_Campfire_burning",[(_position select 0)+(_num1x) - 3, (_position select 1)+(_num1y) -3,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover1 = createVehicle ["Land_Campfire_burning",[(_position select 0)+(_num2x) -3, (_position select 1)+(_num2y) +3,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Land_Campfire_burning",[(_position select 0)+(_num3x) +3, (_position select 1)+(_num3y) +3 ,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["Land_Campfire_burning",[(_position select 0)+(_num4x) +3, (_position select 1)+(_num4y) -3,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover4 = createVehicle ["Land_tent_east",[(_position select 0), (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover5 = createVehicle ["TentStorage",[(_position select 0)+(_num1x), (_position select 1)+(_num1y),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover6 = createVehicle ["TentStorageDomed",[(_position select 0)+(_num2x), (_position select 1)+(_num2y),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover7 = createVehicle ["TentStorageDomed",[(_position select 0)+(_num3x), (_position select 1)+(_num3y),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover8 = createVehicle ["TentStorageDomed2",[(_position select 0)+(_num4x), (_position select 1)+(_num4y),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7,_baserunover8];
_directions = [225,315,45,135,0,225,315,45,135];
{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
{ _x setVectorUp surfaceNormal position _x; } count _baserunover;

//Troops
_rndnum = (2 + round(random 4));
_rndgro = (1 + round(random 2));
[[_position select 0,_position select 1,0],_rndnum,"hard",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
for "_i" from 0 to _rndgro do {
[[_position select 0,_position select 1,0],_rndnum,"medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
};

//Static Guns
[[
[(_position select 0) + 10, (_position select 1) + 10, 0],
[(_position select 0)+(_num1x) + 2, (_position select 1)+(_num1y) + 2, 0],
[(_position select 0)+(_num2x) + 2, (_position select 1)+(_num2y) + 2, 0],
[(_position select 0)+(_num3x) + 2, (_position select 1)+(_num3y) + 2, 0],
[(_position select 0)+(_num4x) + 2, (_position select 1)+(_num4y) + 2, 0]
],"M2StaticMG","easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;


//Condition
_complete = [
[_mission,_crate], // mission number and crate
["crate"], // ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
[_baserunover], // cleanup objects
"Bandits own a campside with weapons in the tents. Check your map for the location!", // mission announcement
"Survivors have secured the campside!", // mission success
"Survivors did not secure the campside in time"	// mission fail
] call mission_winorfail;
if(_complete) then {
[_crate,50,20,6,3] call dynamic_crate;

};
diag_log format["WAI: [Mission:[Hero] Bandit Campside]: Ended at %1",_position];
h_missionsrunning = h_missionsrunning - 1;
};