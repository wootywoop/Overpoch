_motor = _this select 3;
_qLoot = _motor getVariable "dnishpq";
_loot1 = [
	[["addWeaponCargoGlobal","Mk_48_DZ",[1,1,2]],["addMagazineCargoGlobal","100Rnd_762x51_M240",[1,2,3]]],	//Maried Loot
	[["addWeaponCargoGlobal","M249_DZ",[1,1,2]],["addMagazineCargoGlobal","200Rnd_556x45_M249",[1,2,3]]],	//Maried Loot
	[["addWeaponCargoGlobal","USSR_cheytacM200",[1,1,2]],["addMagazineCargoGlobal","USSR_5Rnd_408",[2,3,4]]],		//Maried Loot
	[["addWeaponCargoGlobal","vil_HK417s",[1,1,2]],["addMagazineCargoGlobal","RH_20Rnd_762x51_hk417",[3,4,5]]],		//Maried Loot
	[["addWeaponCargoGlobal","AK_47_M",[1,1,2]],["addMagazineCargoGlobal","30Rnd_762x39_AK47",[2,3,4]]],	//Maried Loot
	[["addWeaponCargoGlobal","NVGoggles",[2,3,4]]],
	[["addWeaponCargoGlobal","ItemEtool",[2,3,4]]],
	[["addWeaponCargoGlobal","ItemCrowbar",[2,3,4]]],
	[["addWeaponCargoGlobal","ItemToolbox",[2,3,4]]],
	[["addMagazineCargoGlobal","MortarBucket",[3,4,6]]],
	[["addMagazineCargoGlobal","CinderBlocks",[2,3,4]]],
	[["addMagazineCargoGlobal","ItemPole",[3,4,8]]],
	[["addMagazineCargoGlobal","ItemVault",[2,2,2]]],
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