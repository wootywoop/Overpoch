if(isServer) then {

	private			["_marker","_complete","_positionx","_crate_type","_mission","_position","_crate","_rndnum","_coords","_plane","_aiGrp","_pilot","_wp","_wp_pos","_loop","_half","_newPos","_plane2","_chute","_dropDir","_wp2","_fallCount","_crateFin","_missName","_vehpos"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;
	
	_coords 		= [30] call find_position;
	
	_missName = "C-130 Supply Drop";

	// Send Top Right message to users , requires Remote message script
_hint = parseText format["<t align='left' color='#00FF11' shadow='2' size='1.75'>New Mission:</t><br/><t align='left' color='#FFFFF9F'>A C-130 is dropping off supplies to a large Hero taskforce!</t>"];
[nil, nil, rHINT, _hint] call RE;

//Lets get the C130J Flying
_plane = createVehicle ["C130J", [0,0,500], [], 0, "FLY"];
_plane addEventHandler ["HandleDamage", {false}];

_plane engineOn true;
_plane flyInHeight 150;
_plane forceSpeed 175;

//Empty the plane
clearMagazineCargoGlobal _plane;
clearWeaponCargoGlobal _plane;

//Lets make AI for the plane and get them in it
_aiGrp = creategroup east;

_pilot = _aiGrp createUnit ["SurvivorW2_DZ",getPos _plane,[],0,"FORM"];
_pilot moveindriver _plane;
_pilot assignAsDriver _plane;

_wp = _aiGrp addWaypoint [[(_coords select 0), (_coords select 1),150], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp_pos = waypointPosition [_aiGrp,1];

_pilot addWeapon 'NVGoggles';
_pilot addWeapon 'ItemCompass';
_pilot addWeapon 'ItemRadio';
_pilot addWeapon 'ItemMap';
_pilot addWeapon 'ItemGPS';
sleep 5;

_loop = true;
_half = false;
while {_loop} do {
	if (!Alive _plane OR !Alive _pilot) then {
		sleep 5;
		
		// We are going to pretend the plane was shot down nearby
		deleteVehicle _plane;
		deleteVehicle _pilot;

		_newPos = [(_coords select 0) + (random(2000)),(_coords select 1) - (random(2000)),0];
		
		if (surfaceIsWater _newPos) then {
			//newPos is water, so lets just drop it on mark
			//This is a temporary fix for needed logic
			_newPos = _coords;
		};
		
		//Create the plane and kill it
		_plane2 = createVehicle ["C130J", [(_newPos select 0),(_newPos select 1),200], [], 0, "FLY"];
		
		_plane2 engineOn true;
		_plane2 flyInHeight 150;
		_plane2 forceSpeed 175;
		sleep 2;
		_plane2 setDamage 1;
		
		//Update the location
		
		[nil,nil,rTitleText,"The AN2 was shot down by UN Peacekeepers!\nGo Find the Supplies!", "PLAIN",10] call RE;
		
		_chute = createVehicle ["ParachuteMediumEast", [(_newPos select 0),(_newPos select 1),200], [], 0, "FLY"];
		_crate_type = crates_large call BIS_fnc_selectRandom;
		_crate	= createVehicle [_crate_type, [(_newPos select 0),(_newPos select 1),200],[],0,"CAN_COLLIDE"];
		_crate attachTo [_chute, [0, 0, 1]];
		
		_loop = false;
	};
	
	if ((Alive _plane) AND (Alive _pilot) AND ((_plane distance _wp_pos) <= 1200) AND (!(_half))) then {
		// Send Top Right message to users , requires Remote message script
		_hint = parseText format["<t align='left' color='#00FF11' shadow='2' size='1.75'>Mission Update!:</t><br/><t align='left' color='#FFFFF9F'>The C-130 is only 1200m out from the drop point!</t>"];
		[nil, nil, rHINT, _hint] call RE;
		
		//Keep on truckin'
		_plane forceSpeed 175;
		_plane flyInHeight 135;
		_plane setspeedmode "LIMITED";
		_half = true;
	};
	
	if ((Alive _plane) AND (Alive _pilot) AND ((_plane distance _wp_pos) <= 200)) then {
		//Drop the package
		
		_dropDir = getDir _plane;
		_newPos = [(getPosATL _plane select 0) - 15*sin(_dropDir), (getPosATL _plane select 1) - 15*cos(_dropDir), (getPosATL _plane select 2) - 10];
		// Send Top Right message to users , requires Remote message script
		_hint = parseText format["<t align='left' color='#00FF11' shadow='2' size='1.75'>Mission Update!:</t><br/><t align='left' color='#FFFFF9F'>The C-130 has reached the location and dropped the cargo!</t>"];
		[nil, nil, rHINT, _hint] call RE;
		
		
		_chute = createVehicle ["ParachuteMediumEast", _newPos, [], 0, "FLY"];
		
		_crate = createVehicle ["USVehicleBox", _newPos,[], 0, "CAN_COLLIDE"];
		
		_crate attachTo [_chute, [0, 0, 1]];
		
		deleteWaypoint [_aiGrp, 1];
		_wp2 = _aiGrp addWaypoint [[0,0,150], 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";
		_plane forceSpeed 350;
		_plane setSpeedmode "FULL";
		
		_loop = false;
	};
};

//The box was dropped, lets get it on the ground.
_fallCount = 0;
while {_fallCount < 45} do {
	if (((getPos _crate) select 2) < 1) then {_fallCount = 46};
	sleep 0.1;
	_fallCount = _fallCount + 0.1;
};

detach _crate;
_crate setpos [(getpos _crate select 0), (getpos _crate select 1), 0];
deletevehicle _chute;

_position = getPosATL _crate;

diag_log 		format["WAI: [Mission:[Bandit] C-130 Supply Drop]: Starting... %1",_position];

[_mission,_position,"Extreme","C-130 Supply Drop","MainBandit",true] call mission_init;

	//Troops
	_rndnum 	= (3 + round(random 1));
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_stinger;
	[[_position select 0,_position select 1,0],_rndnum,"Extreme","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_stinger;
	
	//Static Guns
	[[[(_position select 0) - 30, (_position select 1) + 30, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 30, (_position select 1) - 30, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 30, (_position select 1) + 30, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 30, (_position select 1) - 30, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	

	//Condition
	_complete = [
		[_mission,_crate],			// mission number and crate
		["crate"], // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_plane], 			// cleanup objects
		"A C-130 is dropping off supplies to a large Hero taskforce!",	// mission announcement
		"The C-130 supplies have been captured!",							// mission success
		"The Heros got away with the cargo"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[40,ai_wep_box],10,[50,crate_items_buildables],1,[100,ammo_list]] call dynamic_crate;
	};

	diag_log format["WAI: [Bandit] c-130 supply drop ended at %1",_position];

	b_missionsrunning = b_missionsrunning - 1;
};
