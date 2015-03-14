if (false) then { 
// player is in combat and cant pack his mozzie
    cutText [format["You are in combat and cannot re-pack your Mozzie."], "PLAIN DOWN"];
} else {
	if (typeOf cursorTarget == "CSJ_GyroC") then {
	// player is looking at a bike and the target has a bike classname
	// delete it first to avoid player changing to another target
		deletevehicle cursorTarget; 
		player removeAction s_player_deploymozzie2;
		player playActionNow "Medic";
		r_interrupt = false;
		player addMagazine "PartGeneric";
        player addMagazine "PartGeneric";
        player addMagazine "PartEngine";
        player addMagazine "ItemFuelBarrelEmpty";
        player addMagazine "PartVRotor";		
		_dis=10;
		_sfx = "repair";
		[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
		[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
		sleep 6;
		cutText [format["You have packed your Mozzie and been given back your materials"], "PLAIN DOWN"];
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
	} else {
		// player is not looking at a Mozzie, or target does not have a bike classname
		cutText [format["You have to be facing your Mozzie to re-pack it!"], "PLAIN DOWN"];
	};
};