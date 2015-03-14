private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.95; // Percentage chance of event happening
_markerRadius = 150; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns
 
_loot_box = "RUVehicleBox";
_loot_lists = [
[
["KSVK_DZE","DMR","VSS_vintorez","m8_sharpshooter","SVD_CAMO"],
["5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","5Rnd_127x108_KSVK","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","Skin_Bandit1_DZ","Skin_Haris_Press_EP1_DZ","Skin_RU_Policeman_DZ","Skin_Pilot_EP1_DZ"]
],
[
["m240_scoped_EP1_DZE","M249_m145_EP1_DZE","M60A4_EP1_DZE","m8_SAW","Pecheneg_DZ"],
["100Rnd_556x45_M249","100Rnd_556x45_M249","100Rnd_556x45_M249","100Rnd_556x45_M249","100Rnd_556x45_M249","100Rnd_556x45_M249","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_556x45_BetaCMag","100Rnd_556x45_BetaCMag","100Rnd_556x45_BetaCMag","100Rnd_556x45_BetaCMag","100Rnd_556x45_BetaCMag","100Rnd_556x45_BetaCMag","100Rnd_762x54_PK","100Rnd_762x54_PK","100Rnd_762x54_PK","100Rnd_762x54_PK","100Rnd_762x54_PK","100Rnd_762x54_PK","Skin_Soldier_Bodyguard_AA12_PMC_DZ","Skin_INS_Soldier_CO_DZ","Skin_RU_Soldier_Crew_DZ","Skin_GUE_Commander_DZ"]
],
[
["M16A4_ACG_GL","M4A1_Aim_camo","M4A1_AIM_SD_camo","G36C","AK_107_kobra"],
["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","Skin_TK_Special_Forces_MG_EP1_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Rocket_DZ","Skin_GUE_Soldier_2_DZ"]
],
[
["M9","M9SD","Sa61_EP1","UZI_EP1","UZI_SD_EP1","glock17_EP1"],
["15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","20Rnd_B_765x17_Ball","20Rnd_B_765x17_Ball","20Rnd_B_765x17_Ball","20Rnd_B_765x17_Ball","30Rnd_9x19_UZI","30Rnd_9x19_UZI","30Rnd_9x19_UZI","30Rnd_9x19_UZI","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","Skin_SurvivorWcombat_DZ","Skin_INS_Lopotev_DZ","Skin_Rocker4_DZ","Skin_Drake_Light_DZ","Skin_Functionary1_EP1_DZ","Skin_Rocker1_DZ","Skin_FR_Rodriguez_DZ","Skin_Priest_DZ","Skin_FR_OHara_DZ","Skin_SurvivorWpink_DZ","Skin_INS_Bardak_DZ","Skin_Rocker2_DZ","Skin_SurvivorWsequishaD_DZ","Skin_SurvivorWurban_DZ","Skin_INS_Worker2_DZ","Skin_TK_INS_Warlord_EP1_DZ","Skin_Graves_Light_DZ"]
],
[
["BAF_LRR_scoped"],
["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1"]
],
[
["RPG7V","M32_EP1"],
["PG7V","PG7V","PG7V","PG7V","6Rnd_HE_M203","6Rnd_HE_M203","6Rnd_HE_M203","6Rnd_HE_M203","6Rnd_HE_M203","PipeBomb","PipeBomb","PipeBomb","HandGrenade","HandGrenade","HandGrenade","HandGrenade","HandGrenade","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_Stone","HandGrenade_West","HandGrenade_West","HandGrenade_West","HandGrenade_West","HandGrenade_West","HandGrenade_East","HandGrenade_East","HandGrenade_East","HandGrenade_East","HandGrenade_East","6Rnd_FlareWhite_M203","6Rnd_FlareWhite_M203","6Rnd_FlareWhite_M203","6Rnd_FlareGreen_M203","6Rnd_FlareGreen_M203","6Rnd_FlareGreen_M203","6Rnd_FlareRed_M203","6Rnd_FlareRed_M203","6Rnd_FlareRed_M203","6Rnd_FlareYellow_M203","6Rnd_FlareYellow_M203","6Rnd_FlareYellow_M203","6Rnd_Smoke_M203","6Rnd_Smoke_M203","6Rnd_Smoke_M203","6Rnd_SmokeRed_M203","6Rnd_SmokeRed_M203","6Rnd_SmokeRed_M203","6Rnd_SmokeGreen_M203","6Rnd_SmokeGreen_M203","6Rnd_SmokeGreen_M203","6Rnd_SmokeYellow_M203","6Rnd_SmokeYellow_M203","6Rnd_SmokeYellow_M203"]
],
[
["M107"],
["10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107"]
],
[
["BAF_AS50_scoped"],
["10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107"]
],
[
["DMR","M4SPR","M8_sharpshooter","M24","M40A3"],
["20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24"]
],
[
["MG36","Mk_48","M240","M249","M8_SAW"],
["100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249"]
],
[
["M16A2","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M16A4_ACG","M4A1","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
],
[
["M8_carbine","M8_carbineGL","M8_compact"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
_loot_amount = 75;
_wait_time = 1900; 
 
// Dont mess with theses unless u know what yours doing
_start_time = time;
_spawnRadius = 5000;
_spawnMarker = 'center';
 
if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
 
// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};
 
// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance and !_debug) exitWith {};
 
// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
 
diag_log(format["Spawning loot event at %1", _position]);
 
_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorRed";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorRed";
_debug_marker setMarkerAlpha 1;
};
 
diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;
 
// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end
 
// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
 
// Send Top Right message to users , requires Remote message script
_hint = parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Military Crate</t><br/><t align='center' color='#ffffff'>Bandit forces have lost a precious cargo, Check your Map for the Location!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

// Send center message to users 
//[nil,nil,rTitleText,"A special forces unit lost a precious cargo, Check your Map for the Location!", "PLAIN",10] call RE;

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

// Wait
sleep _wait_time;
 
// Clean up
EPOCH_EVENT_RUNNING = false;
deleteVehicle _loot_box;
deleteMarker _event_marker;
if (_debug) then {
deleteMarker _debug_marker;
};