_motor = _this select 3;
_qLoot = _motor getVariable "dnishpq";
_loot1 = [
	[["addWeaponCargoGlobal","Mk_48_DZ",[1,1,2]],["addMagazineCargoGlobal","100Rnd_762x51_M240",[1,2,3]]],	//Maried Loot
	[["addWeaponCargoGlobal","M249_DZ",[1,1,2]],["addMagazineCargoGlobal","200Rnd_556x45_M249",[1,2,3]]],	//Maried Loot
	[["addWeaponCargoGlobal","G36C",[1,1,2]],["addMagazineCargoGlobal","30Rnd_556x45_Stanag",[2,3,4]]],		//Maried Loot
	[["addWeaponCargoGlobal","DMR_DZ",[1,1,2]],["addMagazineCargoGlobal","20Rnd_762x51_DMR",[3,4,5]]],		//Maried Loot
	[["addWeaponCargoGlobal","AK_47_M",[1,1,2]],["addMagazineCargoGlobal","30Rnd_762x39_AK47",[2,3,4]]],	//Maried Loot
	[["addWeaponCargoGlobal","NVGoggles",[2,3,4]]],
	[["addWeaponCargoGlobal","ItemEtool",[2,3,4]]],
	[["addWeaponCargoGlobal","Binocular_Vector",[2,3,4]]],
	[["addMagazineCargoGlobal","ItemBloodBag",[6,8,10]]],
	[["addMagazineCargoGlobal","PartEngine",[2,3,4]]],
	[["addMagazineCargoGlobal","ItemBandage",[10,15,20]]],
	[["addMagazineCargoGlobal","HandGrenade_West",[3,5,7]]],
	[["addMagazineCargoGlobal","ItemBriefcase100oz",[1,1,2]]]
];
if (_qLoot > 0) then {
	for "_i" from 1 to _qLoot do {
		_holder = createVehicle ["WeaponHolder",position player,[],1.5,"CAN_COLLIDE"];
		{
			call compile format [
				"_holder %1 ['%2',%3];",
				_x select 0,
				_x select 1,
				(_x select 2) call BIS_fnc_selectRandom
			];
		} forEach (_loot1 call BIS_fnc_selectRandom);
	};
	_motor setVariable ["dnishpq",0,true];
};