if(isServer) then {

	private 		["_complete","_crate_type","_crate_type2","_crate_type3","_mission","_position","_crate","_crate2","_crate3","_playerPresent","_rndnum","_rndgro","_num_guns","_num_tools","_num_items","_flare1","_flare2","_flare3","_flare4","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","_tree","_snwman"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Hard","Santas House {Christmas Event}","MainHero",true] call mission_init;
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#00b300' shadow='2' size='1.75'>Merry</t><br/><t align='left' color='#b30000' shadow='2' 	size='1.75'>Christmas:</t><br/><t align='left' color='#00b300'>FatCat's admins wish you a merry Christmas and a happy new year!</t>"];
	[nil, nil, rHINT, _hint] call RE;

	diag_log 		format["WAI: [Mission:[Hero] Santas House]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate_type2 	= crates_small call BIS_fnc_selectRandom;
	_crate_type3 	= crates_small call BIS_fnc_selectRandom;


	_crate 			= createVehicle [_crate_type,[(_position select 0)+4,(_position select 1)-2,0],[],0,"CAN_COLLIDE"];
	_crate2 		= createVehicle [_crate_type2,[(_position select 0)-3,(_position select 1)-1.5,0],[],0,"CAN_COLLIDE"];
	_crate3 		= createVehicle [_crate_type3,[(_position select 0)+5,(_position select 1)-1.5,0],[],0,"CAN_COLLIDE"];

	//Buildings
	_baserunover0 	= createVehicle ["MAP_snow",[(_position select 0), (_position select 1),0.09],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["MAP_bouda2_vnitrek",[(_position select 0) - 5, (_position select 1),0],[], 0, "CAN_COLLIDE"];
	_baserunover = [_baserunover0,_baserunover1];
	
	_directions = [0,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	
  _tree   = createVehicle ["MAP_t_picea1s",[(_position select 0)+4, (_position select 1),0],[], 0, "CAN_COLLIDE"]; 
  _snwman = createVehicle ["MAP_snowman",[(_position select 0), (_position select 1)-4,0],[], 0, "CAN_COLLIDE"]; 
	
	//Troops
	_rndnum 	= (3 + round(random 3));
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Hard",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Hard","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Hard",["Random","AA"],3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Hard","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) -50, (_position select 1) +50, 0],_rndnum,"Hard","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) +50, (_position select 1) -50, 0],_rndnum,"Hard","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;


	//Static Guns
	[[
		[(_position select 0) + 30, (_position select 1), 0],
		[(_position select 0) - 30, (_position select 1), 0],	
    [(_position select 0), (_position select 1) + 30, 0],
		[(_position select 0), (_position select 1) - 30, 0]
	],"M2StaticMG","Hard","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;





	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"],			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
		[_baserunover,_tree,_snwman],					// cleanup objects
		"Your FatCat-Team wish you a merry christmas and a happy new year!",	// mission announcement
		"Merry Christmas!",									// mission success
		"NO CHRISTMAS FOR YOU! >:("							// mission fail
	] call mission_winorfail;

	if(_complete) then {

		//Firework: Smoke is attached to each flare
		_flare1 = createVehicle ["F_40mm_green",[(_position select 0),(_position select 1),150],[],0,"CAN_COLLIDE"];
  	_flare2 = createVehicle ["F_40mm_green",[(_position select 0),(_position select 1),150],[],0,"CAN_COLLIDE"];
  	_flare3 = createVehicle ["F_40mm_red",[(_position select 0),(_position select 1),150],[],0,"CAN_COLLIDE"];
  	_flare4 = createVehicle ["F_40mm_red",[(_position select 0),(_position select 1),150],[],0,"CAN_COLLIDE"];
  	//Let the Shells move up
		_flare1 setVelocity [40,0,40];
		_flare2 setVelocity [-40,0,40];
		_flare3 setVelocity [0,40,40];
		_flare4 setVelocity [0,-40,40];
		
		//Spawn the Christmas loot
		[_crate,[30,ai_wep_box],4,0,1,[100,ammo_list]] call dynamic_crate;
		[_crate2,[2,crate_weapons_buildables],[7,crate_tools_buildable],[60,crate_items_buildables],1,[100,ammo_list]] call dynamic_crate;
		[_crate3,[30,crate_random],[20,crate_items],[45,crate_items_medical],1,[100,crate_items_food]] call dynamic_crate;

	};

	diag_log format["WAI: [Mission:[Hero] Santas House (Christmas Event)]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};