if (false) then { 
// player is in combat and cant pack his Little Bird
    cutText [format["You are in combat and cannot re-pack your LittleBird."], "PLAIN DOWN"];
} else {
	if (typeOf cursorTarget == "MH6J_EP1") then {
	// player is looking at a Bird and the target has a Bird classname
	// delete it first to avoid player changing to another target
		deletevehicle cursorTarget; 
		player removeAction s_player_deploybird2;
		player playActionNow "Medic";
		r_interrupt = false;
		player addMagazine "PartGeneric";
        player addMagazine "PartGeneric";
        player addMagazine "PartEngine";
        player addMagazine "PartFueltank";
        player addMagazine "PartVRotor";
        player addMagazine "ItemFuelBarrelEmpty";
        player addMagazine "PartGlass";
        player addMagazine "PartGlass";		
		_dis=10;
		_sfx = "repair";
		[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
		[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
		sleep 6;
		cutText [format["You have packed your Little Bird and been given back your materials"], "PLAIN DOWN"];
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
	} else {
		// player is not looking at a bird, or target does not have a bird classname
		cutText [format["You have to be facing your Little Bird to re-pack it!"], "PLAIN DOWN"];
	};
};