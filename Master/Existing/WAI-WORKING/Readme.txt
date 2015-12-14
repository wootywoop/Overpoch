//Readme//

Include is an Epoch Config and an Overpoch Config, Copy the Overpoch over if you are using Overpoch.

AI will be hostile to all players, there are no friendly AI with this conversion.

By default the missions will have AI with RPG's and Stingers that will be removed on death.

	In on_kill.sqf it is set up to remove the launchers always even if you change the config because the config does not always work.
	This is a known issue with the default WAI 2.2.0
	If you want to try the config to remove them you can chage the on_kill.sqf  line 107 from this
	
	
		_unit removeWeapon "RPG";
		_unit removeMagazine "PG7VR";
		
				
		
		_unit removeWeapon "stinger";
		_unit removeMagazine "stinger";
		
	
	to this
	
	if (wai_remove_rpg) then {
		_unit removeWeapon "RPG";
		_unit removeMagazine "PG7VR";
		};
				
		if (wai_remove_stinger) then {
		_unit removeWeapon "stinger";
		_unit removeMagazine "stinger";
		};
	
	spawn_rpg spawns AI with RPG.
	spawn_stinger spawns ai with Stinger Launchers
	
	spawn_group will spawn ai with no launchers
	
	example
	
	_rndnum = (2 + round (random 4));
	[[(_position select 0) -100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) -100, 0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) +100, (_position select 1) +100, 0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[(_position select 0) -100, (_position select 1) -100, 0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_rpg;
	[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_stinger;
	
By default AI drop smoke on death. This can be changed in the config.

		ai_smoke 					= true;			// AI drops smoke on death

By default the missions will have no static guns, they can be buggy and I think are reducing server FPS.

There are folders with the missions having Static guns if you would like to try them and are labeled as such. Copy and paste the entirty of the "mission with M2" to the mission folder if you want to try it.

This will work with any other mission you have created, you just need to change the

	if(_complete) then {
		[_crate,0,0,[25,crate_items_chainbullets],2] call dynamic_crate;
	};
	
	to
	
	if(_complete) then {
		[_crate,[10,ai_wep_box],0,[25,crate_items_chainbullets],1,[100,ammo_list]] call dynamic_crate;
	};
	
	to the mission.   The most important thing is the firts and last section. 
	
	The first section can only be a # or [xx,ai_wep_box]  the weapons are not called from the ai weapons configs
	
	The last section you must add [100,ammo_list] after what would be the backpack #