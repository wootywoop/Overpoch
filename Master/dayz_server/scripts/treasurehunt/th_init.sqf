private ["_thTest","_thunitname","_thunitclass"]; 		// Declared Privates

diag_log format ["Treasure Hunt: Kill Unit Spawn initiated!"];

_thunitname = "Father Dave"; // Name of the unit
_thunitclass = "RU_Priest"; // Skin class name for the unit
_thtest = 0; // Setting for testing, passes through the whole script. It sets respawn timer to a  minute and the unit will always spawn in pavlovo. All items will spawn in the crate and there will be marker for the crate.


[_thtest, _thunitname, _thunitclass] execVM "\z\addons\dayz_server\scripts\treasurehunt\th_spawn_unit.sqf"; 