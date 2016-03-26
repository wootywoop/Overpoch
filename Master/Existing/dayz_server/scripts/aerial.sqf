if (isServer) then {
	_gridN = 15;
	_mapSize = 15360; //CHERNARUS
	donn_hwps = [];
	for "_i" from 1 to (_gridN - 1) do {
		_wpx = (_i/_gridN)*_mapSize;
		for "_y" from 1 to (_gridN - 1) do {
			_wpy = (_y/_gridN)*_mapSize;
			if !(surfaceIsWater [_wpx,_wpy]) then {donn_hwps = donn_hwps + [[_wpx,_wpy,0]];};
		};
	};
	donn_heliConvy = [
		/*0*/["UH1Y",0,["14Rnd_FFAR","4000Rnd_762x51_M134","4000Rnd_762x51_M134"],3],
		/*1*/["UH1H_DZ",4,["100Rnd_762x51_M240","100Rnd_762x51_M240"],4],
		/*2*/["UH60M_EP1_DZ",4,["4000Rnd_762x51_M134","4000Rnd_762x51_M134"],4],
		/*3*/["CH_47F_EP1_DZE",6,["100Rnd_762x51_M240","4000Rnd_762x51_M134","4000Rnd_762x51_M134"],6],
		/*4*/["AH6J_EP1_DZ",1,[],2] //ARMED (PILOT)
	];
	//HELI MAIN CONFIG BEGIN
	_heliFormation =[[0,0,2],[2,2],[4,4,4,4,4],[3],[3],[1,1]];
	_heliAltitude =[[60,60,115],[100,100],[50,50,50,50,50],[100],[100],[115,115]];
	_heliSpeed =["NORMAL","NORMAL","FULL","LIMITED","NORMAL","FULL"];
	//HELI MAIN CONFIG END
	_spawn = [100,100,400];
	donn_heli_HD = {
		_heliHurt = _this select 0;
		_damage = _this select 2;
		if !(canMove _heliHurt) then {
			if (_heliHurt getVariable "dncmv") then {
				_heliHurt setVariable ["dncmv",false,false];
				{
					if (random 100 > 50) then {_x action ["Eject",_heliHurt];} else {_x setPos getPos _heliHurt;};
				} forEach crew _heliHurt;
			};
		};
		_damage
	};
	donn_heli_unit_HD = {
		_hurtedOne = _this select 0;
		_damage = _this select 2;
		_ofender = _this select 3;
		_grp = group _hurtedOne;
		if (combatMode _grp != "RED" && isPlayer _ofender) then {
			{_x enableAi "TARGET";} forEach units _grp;
			{_x enableAi "AUTOTARGET";} forEach units _grp;
			_grp reveal [_ofender,1.5];
			_grp setCombatMode "RED";_grp setBehaviour "COMBAT";
		};
		_damage
	};	
	donn_heli_unitKill = {
		_unit = _this select 0;
		_role = assignedVehicleRole _unit;
		if ((assignedVehicleRole _unit) select 0 == "Driver") then {
			_vehEject = assignedVehicle _unit;
			{
				if (random 100 > 40) then {_x action ["Eject",_vehEject];} else {_x setPos getPos _vehEject};
			} forEach crew _vehEject;
		};
		if ({alive _x} count units group _unit == 0) then {donn_heliGrps = donn_heliGrps - [group _unit];};
		_unit setVariable ["cashMoney",12500 + (round random 5) * 1000,true];
	};
	donn_makeAeroRoute = {
		_origin = _this select 0;
		_heli_group = _this select 1;
		_speed = _this select 2;
		_posBefore = _origin;
		_posNow = _origin;
		_wp = _heli_group addWaypoint [_posNow,0,0];
		_wp setWaypointCompletionRadius 65;
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed _speed;
		_posNext = [0,0,0];
		for "_c" from 1 to 5 do {
			_distToBefore = 0;
			_distToNext = 0;
			_found = false;
			for "_x" from 1 to 200 do {
				_posNext = donn_hwps call BIS_fnc_selectRandom;
				_distToNext = _posNow distance _posNext;
				_distToBefore = _posNext distance _posBefore;
				if (_distToNext > 3000 && _distToBefore > 4000) exitWith {};
				uiSleep 0.001;
			};
			if (!_found) then {_posNext = donn_hwps call BIS_fnc_selectRandom;};
			_wp = _heli_group addWaypoint [_posNext,0,_c];
			_wp setWaypointCompletionRadius 65;
			_wp setWaypointType "MOVE";
			_wp setWaypointSpeed _speed;
			_posNow = _posNext;
		};
		_wp = _heli_group addWaypoint [_origin,0,6];
		_wp setWaypointCompletionRadius 65;
		_wp setWaypointType "CYCLE";
		_wp setWaypointSpeed _speed;
	};
	donn_heliGrps = [];
	[] spawn {
		while {{!isNull _x} count donn_heliGrps > 0} do {
			{
				_grp = _x;
				_forceIn = true;
				{
					if (_grp knowsAbout _x >= 1.5) then {_grp reveal [_x,4];_forceIn = false;};
				} forEach playableUnits;
				if (_forceIn) then {
					if (combatMode _grp != "BLUE") then {
						{_x disableAi "TARGET";uiSleep 0.001;} forEach units _grp;
						{_x disableAi "AUTOTARGET";uiSleep 0.001;} forEach units _grp;
						_grp setCombatMode "BLUE";_grp setBehaviour "CARELESS";
					};
					{
						if (vehicle _x == _x) then {[_x] orderGetIn true;uiSleep 0.001;};
					} forEach units _grp;
				};
			} forEach donn_heliGrps;	
			uiSleep 10;
		};
		diag_log "[COMBOIOS AEREOS] FIM.";
	};
	for "_cs" from 1 to (count _heliFormation) do {
		diag_log ("[HELI CONVOY] Initialized Spawn! " + str _cs);
		_heli_group = createGroup EAST;
		donn_heliGrps = donn_heliGrps + [_heli_group];
		_convoy = _heliFormation select (_cs-1);
		_convoyH = _heliAltitude select (_cs-1);
		_convoyS = _heliSpeed select (_cs-1);
		_qtd = count _convoy;
		_helis = [];
		{_helis = _helis + [donn_heliConvy select _x];} forEach _convoy;
		for "_n" from 1 to _qtd do {
			private ["_firstDriver"];
			_heli = _helis select (_n-1);
			_flyHeight = _convoyH select (_n-1);
			_motor = createVehicle [_heli select 0,_spawn,[],50,"FLY"];
			/*
			uiSleep 1;
			[_cs,_n,_motor] spawn {
				_cs = _this select 0;
				_n = _this select 1;
				_motor = _this select 2;
				while {true} do {
					diag_log ("[HELICRE] "+str _cs+"-"+str _n+": "+str count crew _motor);
					uiSleep 4;
				};
			};			
			*/
			{deleteVehicle _x;} forEach crew _motor;
			_motor removeAllEventHandlers "handleDamage";
			_motor addEventHandler ["handleDamage",{_this call donn_heli_HD}];
			_motor setVariable ["dncmv",true,false];
			_motor setVariable ["dnishp",true,true];
			_motor setVariable ["dnishpq",_heli select 3,true];
			_motor setFuel 1;
			_motor setVehicleLock "LOCKED";
			_motor flyInHeight _flyHeight;
			_ammos = _heli select 2;
			{_ammo = _x;for "_a" from 1 to 8 do {_motor addMagazineTurret [_ammo,[_forEachIndex]];};} forEach _ammos;
			_driverCount = 1;
			_turreterCount = count _ammos;
			_cargorsCount = _heli select 1;
			_crewCount = _driverCount + _turreterCount + _cargorsCount;
			_gunnerPos = 0;
			for "_y" from 1 to _crewCount do {
				_unit = _heli_group createUnit ["TK_INS_Bonesetter_EP1",[50,50,0],[],50,"PRIVATE"];
				_unit removeAllEventHandlers "killed";
				_unit removeAllEventHandlers "handleDamage";
				_unit addEventHandler ["killed",{_this call donn_heli_unitKill;}];
				_unit addEventHandler ["handleDamage",{_this call donn_heli_unit_HD}];
				[_unit] joinSilent _heli_group;
				_unit setSkill 0.85;
				removeAllWeapons _unit;
				{_unit removeMagazine _x} forEach magazines _unit;
				_unit addWeapon "RPK_74";
				_unit selectWeapon "RPK_74";
				for "_pa" from 1 to 2 do {_unit addMagazine "75Rnd_545x39_RPK";};			
				if (_y == 1) then {
					_unit assignAsDriver _motor;
					_unit moveInDriver _motor;
					_unit setSkill ["aimingAccuracy",0.65];
				};
				if (_y > 1 && _y <= 1 + _turreterCount) then {
					_unit assignAsGunner _motor;
					_unit moveInTurret [_motor,[_gunnerPos]];
					_gunnerPos = _gunnerPos + 1;
					_unit setSkill ["aimingAccuracy",1];
				};
				if (_y > 1 + _turreterCount) then {
					_unit assignAsCargo _motor;
					_unit moveInCargo _motor;
					_unit setSkill ["aimingAccuracy",0.65];
				};
			};
			{_x disableAi "TARGET";uiSleep 0.001;} forEach units _heli_group;
			{_x disableAi "AUTOTARGET";uiSleep 0.001;} forEach units _heli_group;
			_heli_group setCombatMode "BLUE";_heli_group setBehaviour "CARELESS";
			_sphere = createVehicle ["Sign_sphere100cm_EP1",[0,0,0],[],0,"CAN_COLLIDE"];
			_sphere attachTo [_motor,[0,0,3]];
		};
		[donn_hwps call BIS_fnc_selectRandom,_heli_group,_convoyS] call donn_makeAeroRoute;
		uiSleep (60*20);
	};
};