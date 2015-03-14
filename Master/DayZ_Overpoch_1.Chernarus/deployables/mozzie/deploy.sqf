private ["_finished","_finishedTime","_posplr","_dirplr","_object"];

if (dayz_combat == 1) then {
    cutText [format["You are in Combat and cannot build a Mozzie."], "PLAIN DOWN"];
} else {
	player removeAction s_player_deploymozzie;
player removeMagazine "PartGeneric";
player removeMagazine "PartGeneric";
player removeMagazine "PartEngine";
player removeMagazine "ItemFuelBarrel";
player removeMagazine "PartVRotor";

	player playActionNow "Medic";
	[player,"repair",0,false,10] call dayz_zombieSpeak;
	[player,10,true,(getPosATL player)] spawn player_alertZombies;

	r_interrupt = false;
	r_doLoop = true;

	_finished = false;
	_finishedTime = diag_tickTime+18;

	while {r_doLoop} do {
		player playActionNow "Medic";
		if (diag_tickTime >= _finishedTime) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};

	if (_finished) then {
		_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
		_dirplr = getDir player;

		_object = "CSJ_GyroC" createVehicle (_posplr);
		_object setVariable ["ObjectID", "1", true];
		_object setVariable ["ObjectUID", "1", true];
		_object setVariable ["SpawnedMozzie",1,true];
		_object setVariable ["Sarge",1,true];

		player reveal _object;

		cutText [format["You've build a Mozzie."], "PLAIN DOWN"];
		sleep 10;
		cutText [format["Warning: Spawned Vehicles DO NOT SAVE after server restart!"], "PLAIN DOWN"];
	} else {
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
player addMagazine "PartGeneric";
player addMagazine "PartGeneric";
player addMagazine "PartEngine";
player addMagazine "ItemFuelBarrel";
player addMagazine "PartVRotor";
		cutText ["\n\nCanceled building a Mozzie.", "PLAIN DOWN"];
	};
};