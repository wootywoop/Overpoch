if(isServer) then {

	private			["_fadeFire","_burn","_complete","_baserunover","_crate_type","_crate","_mission","_position","_num_guns","_num_tools","_num_items","_rndnum","_rndgro"];

	_fadeFire  = false;
	_burn = true;
	
	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;
	
	_position		= [30] call find_position;
    [_mission,_position,"Easy","Ural Attack","MainBandit",true] call mission_init;
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#00FF11' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>Heroes are defending a broken down Ural! Check your map for the location!</t>"];
	[nil, nil, rHINT, _hint] call RE;
	
	diag_log 		format["WAI: [Mission:[Bandit] Ural Attack]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0],[],10,"FORM"];

	//Base
	_baserunover 	= createVehicle ["UralWreck",[(_position select 0),(_position select 1),0],[],14,"FORM"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;
	if (_burn) then
			{
			PVDZE_obj_Fire = [_baserunover,10,time,false,_fadeFire];
			publicVariable "PVDZE_obj_Fire";
			_baserunover setVariable ["fadeFire",_fadeFire,true];
			};
	

	//Troops
	_rndnum 	= 2 + round (random 3);
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Easy","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Easy","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Easy","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Easy","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_stinger;
	
	
	//Condition
	_complete = [
		[_mission,_crate],		// mission number and crate
		["crate"], 				// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 		// cleanup objects
		"Heroes are defending a broken down Ural! Check your map for the location!",	// mission announcement
		"The supplies have been secured by bandits!",									// mission success
		"Bandits failed to secure the supplies"											// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[18,ai_wep_box],8,[30,crate_items_buildables],1,[100,ammo_list]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Ural Attack]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};