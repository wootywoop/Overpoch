if(isServer) then {
	
	private 		["_rndnum","_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","_baserunover8","_baserunover9","_baserunover10","_baserunover11","_baserunover12","_baserunover13","_baserunover14","_baserunover15","_baserunover16","_baserunover17","_baserunover18","_baserunover19","_baserunover20","_baserunover21","_baserunover22","_baserunover23","_baserunover24","_baserunover25","_baserunover26","_baserunover27","_baserunover28","_baserunover29","_baserunover30","_baserunover31","_baserunover32","_baserunover34","_baserunover35","_baserunover36","_baserunover37","_baserunover38","_baserunover39","_baserunover40","_baserunover41","_baserunover42","_baserunover43","_baserunover44","_baserunover45","_baserunover46","_baserunover47"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"medium","Bunker","MainHero",true] call mission_init;
	// Send Top Right message to users , requires Remote message script
	_hint = parseText format["<t align='left' color='#002baa' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>Some bandits have killed a rich family in a bunker and made it their own. Go to the Bunker and kill them all!</t>"];
	[nil, nil, rHINT, _hint] call RE;

	diag_log 		format["WAI: [Mission:[Hero] Bunker]: Starting... %1",_position];

	//Setup the crate with the center coodinates
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Spawn a bunker with the coordinatereference >crate(X|Y|Z)< additional objects will get only a offset from this coordinate
	_baserunover0 	= createVehicle ["Land_MBG_Shoothouse_1",[(_position select 0), (_position select 1),0],[],0, "CAN_COLLIDE"];             //Left bunker side
	_baserunover1 	= createVehicle ["Land_MBG_Shoothouse_1",[(_position select 0) + 22.5712, (_position select 1),0],[], 0, "CAN_COLLIDE"];       //right bunker side
	_baserunover2 	= createVehicle ["MBG_Cinderwall_5_InEditor",[(_position select 0) + 11.3349, (_position select 1) - 12.715,+ 0.4],[], 0, "CAN_COLLIDE"];   //connection north
	_baserunover3 	= createVehicle ["MBG_Cinderwall_5_InEditor",[(_position select 0) + 11.3349, (_position select 1) + 12.227,+ 0.4],[], 0, "CAN_COLLIDE"];    //Connection south
	_baserunover4 	= createVehicle ["MBG_Cinderwall_2p5_InEditor",[(_position select 0) + 32.1128, (_position select 1) + 4.527,+ 0.4],[], 0, "CAN_COLLIDE"];          //perma dorrwayblock
  _baserunover5 	= createVehicle ["MBG_Cinderwall_2p5_InEditor",[(_position select 0) - 9.46, (_position select 1) - 11.255,+ 0.4],[], 0, "CAN_COLLIDE"];          //perma dorrwayblock
  _baserunover6 	= createVehicle ["MBG_Cinderwall_2p5_InEditor",[(_position select 0) - 7.6973, (_position select 1) + 12.188, +0.4],[], 0, "CAN_COLLIDE"];          //perma dorrwayblock
  _baserunover7 	= createVehicle ["MBG_Cinderwall_5_WoodDoor_InEditor",[(_position select 0) - 7.6973, (_position select 1) + 12.188,- 0.06],[], 0, "CAN_COLLIDE"];          //door
  _baserunover8 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 7.341, (_position select 1) + 10.018,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover9 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 2.085, (_position select 1) + 10.018,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover10 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 3.1782, (_position select 1) + 10.018,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover11 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 8.4296, (_position select 1) + 10.018,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters 
  _baserunover12 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 13.7104, (_position select 1) + 10.018,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover13 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 18.9619, (_position select 1) + 10.018,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover14 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 24.2251, (_position select 1) + 10.018,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover15 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 29.4765, (_position select 1) + 10.018,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover16 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 7.341, (_position select 1) + 4.818,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover17 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 2.085, (_position select 1) + 4.818,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover18 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 3.1782, (_position select 1) + 4.818,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover19 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 8.4296, (_position select 1) + 4.818,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters 
  _baserunover20 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 13.7104, (_position select 1) + 4.818,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover21 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 18.9619, (_position select 1) + 4.818,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover22 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 24.2251, (_position select 1) + 4.818,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover23 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 29.4765, (_position select 1) + 4.818,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover24 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 7.341, (_position select 1) - 0.482,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover25 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 2.085, (_position select 1) - 0.482,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover26 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 3.1782, (_position select 1) - 0.482,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover27 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 8.4296, (_position select 1) - 0.482,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters 
  _baserunover28 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 13.7104, (_position select 1) - 0.482,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover29 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 18.9619, (_position select 1) - 0.482,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover30 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 24.2251, (_position select 1) - 0.482,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover31 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 29.4765, (_position select 1) - 0.482,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover32 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 7.341, (_position select 1) - 5.682,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover33 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 2.085, (_position select 1) - 5.682,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover34 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 3.1782, (_position select 1) - 5.682,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover35 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 8.4296, (_position select 1) - 5.682,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters 
  _baserunover36 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 13.7104, (_position select 1) - 5.682,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover37 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 18.9619, (_position select 1) - 5.682,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover38 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 24.2251, (_position select 1) - 5.682,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover39 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 29.4765, (_position select 1) - 5.682,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover40 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 7.341, (_position select 1) - 10.982,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters 
  _baserunover41 	= createVehicle ["MetalFloor_DZ",[(_position select 0) - 2.085, (_position select 1) - 10.982,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover42 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 3.1782, (_position select 1) - 10.982,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover43 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 8.4296, (_position select 1) - 10.982,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover44 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 13.7104, (_position select 1) - 10.982,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover45 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 18.9619, (_position select 1) - 10.982,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover46 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 24.2251, (_position select 1) - 10.982,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  _baserunover47 	= createVehicle ["MetalFloor_DZ",[(_position select 0) + 29.4765, (_position select 1) - 10.982,+ 2.85],[], 0, "CAN_COLLIDE"];          //Metal Floor Roof    height = 2,85 meters
  // ignore any damage for the Bunker. (indestructable)       Indistructable= false, Destructabe = true
  _baserunover0 allowDamage false;
  _baserunover1 allowDamage false;
  _baserunover2 allowDamage false;
  _baserunover3 allowDamage false;
  _baserunover4 allowDamage false;
  _baserunover5 allowDamage false;
  _baserunover6 allowDamage false;
  _baserunover7 allowDamage false;
  _baserunover8 allowDamage false;
  _baserunover9 allowDamage false;
  _baserunover10 allowDamage false;
  _baserunover11 allowDamage false;
  _baserunover12 allowDamage false;
  _baserunover13 allowDamage false;
  _baserunover14 allowDamage false;
  _baserunover15 allowDamage false;
  _baserunover16 allowDamage false;
  _baserunover17 allowDamage false;
  _baserunover18 allowDamage false;
  _baserunover19 allowDamage false;
  _baserunover20 allowDamage false;
  _baserunover21 allowDamage false;
  _baserunover22 allowDamage false;
  _baserunover23 allowDamage false;
  _baserunover24 allowDamage false;
  _baserunover25 allowDamage false;
  _baserunover26 allowDamage false;
  _baserunover27 allowDamage false;
  _baserunover28 allowDamage false;
  _baserunover29 allowDamage false;
  _baserunover30 allowDamage false;
  _baserunover31 allowDamage false;
  _baserunover32 allowDamage false;
  _baserunover33 allowDamage false;
  _baserunover34 allowDamage false;
  _baserunover35 allowDamage false;
  _baserunover36 allowDamage false;
  _baserunover37 allowDamage false;
  _baserunover38 allowDamage false;
  _baserunover39 allowDamage false;
  _baserunover40 allowDamage false;
  _baserunover41 allowDamage false;
  _baserunover42 allowDamage false;
  _baserunover43 allowDamage false;
  _baserunover44 allowDamage false;
  _baserunover45 allowDamage false;
  _baserunover46 allowDamage false;
  _baserunover47 allowDamage false;
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7,_baserunover8,_baserunover9,_baserunover10,_baserunover11,_baserunover12,_baserunover13,_baserunover14,_baserunover15,_baserunover16,_baserunover17,_baserunover18,_baserunover19,_baserunover20,_baserunover21,_baserunover22,_baserunover23,_baserunover24,_baserunover25,_baserunover26,_baserunover27,_baserunover28,_baserunover29,_baserunover30,_baserunover31,_baserunover32,_baserunover33,_baserunover34,_baserunover35,_baserunover36,_baserunover37,_baserunover38,_baserunover39,_baserunover40,_baserunover41,_baserunover42,_baserunover43,_baserunover44,_baserunover45,_baserunover46,_baserunover47];    
	
	_directions = [0,0,0,0,90,90,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	
	//Troops: 1 Group Leftside more south, 1 Group center side, 1 Group right side, 1 Group left side more north
	_rndnum = 3 + round (random 3);
	[[(_position select 0) 0, (_position select 1) - 6, 0],_rndnum,"medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +11, (_position select 1) 0, 0],_rndnum,"medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) +22, (_position select 1) - 6, 0],_rndnum,"medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;
	[[(_position select 0) 0, (_position select 1) + 6, 0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_rpg;

	
	//Condition is set to kill because you have to kill all AI into the Bunker to access the crate.
	_complete = [
		[_mission,_crate],	// mission number and crate
		["kill"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"Some bandits have killed a rich family in a bunker and made it their own. Go to the Bunker and kill them all!",	// mission announcement
		"Survivors captured the bunker!",															// mission success
		"The bandits have destroyed the bunker and taken the loot."														// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[35,ai_wep_box],[10,crate_tools_sniper],[60,crate_items_high_value],[2,crate_backpacks_large],[100,ammo_list]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Bunker]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};