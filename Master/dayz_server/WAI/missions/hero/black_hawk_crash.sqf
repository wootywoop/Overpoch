if(isServer) then {

	private 		["_fadeFire","_rndnum","_burn","_complete","_crate_type","_mission","_position","_num","_crate","_baserunover"];

	_fadeFire  = false;
	_burn = true;
	
	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Medium","Black Hawk Crash","MainHero",true] call mission_init;	
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#D60000' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>A Black Hawk carrying supplies has crashed and bandits are securing the site! Check your map for the location!</t>"];
	[nil, nil, rHINT, _hint] call RE;
	
	diag_log 		format["WAI: [Mission:[Hero] Black Hawk Crash]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];

	//Base
	_baserunover 	= createVehicle ["UH60_ARMY_Wreck_burned_DZ",[((_position select 0) + 5), ((_position select 1) + 5), 0],[],10,"FORM"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;
	if (_burn) then
			{
			PVDZE_obj_Fire = [_baserunover,10,time,false,_fadeFire];
			publicVariable "PVDZE_obj_Fire";
			_baserunover setVariable ["fadeFire",_fadeFire,true];
			};
	

	//Troops
	_rndnum = 4 + round (random 1);
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_stinger;
	
	//Static Guns
	[[
		[(_position select 0) + 20, (_position select 1) + 20, 0],
		[(_position select 0) - 20, (_position select 1) - 20, 0]
	],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"A Black Hawk carrying supplies has crashed and bandits are securing the site! Check your map for the location!",	// mission announcement
		"Survivors have secured the crashed Black Hawk!",																	// mission success
		"Survivors did not secure the crashed Black Hawk in time"															// mission fail
	] call mission_winorfail;

	diag_log format["WAI: [Mission:[Hero] Black Hawk Crash]: Ended at %1",_position];

	if(_complete) then {
		[_crate,[15,ai_wep_box],5,10,1,[100,ammo_list]] call dynamic_crate;
	};

	h_missionsrunning = h_missionsrunning - 1;
};