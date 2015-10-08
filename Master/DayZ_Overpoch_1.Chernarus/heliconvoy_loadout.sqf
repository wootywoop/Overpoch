s_colect_heli = -1;
while {true} do {
	_donn_cursorTarget = cursorTarget;
	_objVar = _donn_cursorTarget getVariable ["dnishpq",0];
	_isHeliLoot = false;
	if (!isNil "_objVar") then {
		if (_objVar > 0) then {
			if (player distance _donn_cursorTarget < ((sizeOf typeOf _donn_cursorTarget)/2 + 4)) then {
				_isHeliLoot = true;
			};
		};
	};
	if (_isHeliLoot) then {
		if (s_colect_heli < 0) then {
			_heliTxt = "The heli convoy has been taken down! Loot has been spotted at the crash sites.";
			if (alive _donn_cursorTarget) then {_heliTxt = "Collect heli items!";};
			s_colect_heli = player addaction[("<t color=""#6666bb"">" + _heliTxt + "</t>"),"andre_heliConvoy_itens.sqf",_donn_cursorTarget,5,false,true,"",""];
		};
	} else {
		player removeAction s_colect_heli;
		s_colect_heli = -1;
	};
	uiSleep 1.5;
};