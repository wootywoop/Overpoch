private ["_thpositionx","_thpositiony","_thrange","_thareas","_thtext","_thtemp","_thunitkiller","_thunit","_thlootbox","_thunitname","_thunitkillername","_thMarker","_thTest","_thspecnum","_therangecorrect"];

_thtemp = _this select 0;
_thunit = _thtemp select 0;
_thunitkiller = _thtemp select 1;
_thtest = _this select 1;
_thunitname = _thunit getVariable "name";
_thunitkillername = name _thunitkiller;
_thlootbox = objNull;

diag_log format ["Treasure Hunt: %1 killed by %2",_thunitname ,_thunitkillername];

// The _thareas array defines all the positions where the loot can spawn and the hint. [X, Y, Radius, hint]
_thareas = [
    [3816, 3343, 400, "south of the windy Mountain"],
    [7877, 7818, 600, "on the slopes of Lesnoy Khrebet"],
    [7419, 4222, 450, "in the forests between Chernogorsk and Mogelevka"],
    [10268, 11509, 600, "south of Black Mountain"],
    [13654, 11567, 200, "east of Willow Lake"],
    [13948, 12580, 400, "north-east of Black Lake"],
    [12862, 13097, 600, "north of the Hero trader"],
    [12040, 13844, 650, "north of the North East Airfield"],
    [10853, 13649, 450, "north of Krasnostav"],
    [8914, 13697, 800, "west of the Pobeda Dam"],
    [2128, 13280, 600, "north of Skalka"],
    [6744, 10636, 800, "south of Devil's Castle"],
    [6029, 12142, 450, "north-west of Devil's Castle"],
    [5387, 6242, 400, "east of Rogovo"]
];

// Select a random area to spawn the camp from _thareas
_thtemp = _thareas select floor random count _thareas; 
// Get Position X from the random _thTemp
_thpositionx = _thtemp select 0;
// Get Position Y from the random _thTemp
_thpositiony = _thtemp select 1;
// Get range where the camp can spawn
_thrange = _thtemp select 2;
_therangecorrect = _thrange / 2;
// Get the hint text
_thtext = _thtemp select 3;

// Send a custom remote message to the killer of the th1_unit.
customRemoteMessage = ["titleCut", format["%1 had a journal. It said %2 found a hidden stash filled with loot!! It is hidden somewhere in the forests %3! Go collect it it for yourself!", _thunitname, _thunitname, _thtext], _thunitkiller];
publicVariable "customRemoteMessage";

// take the center position and add a random x and y value and add it to the center position.  Subtract half to make sure it's in the area. Consider revising!!!
_thpositionx = _thpositionx - _therangecorrect;
_thpositionx = _thpositionx + random _thrange;
_thpositiony = _thpositiony - _therangecorrect;
_thpositiony = _thpositiony + random _thrange;

if (_thtest == 1) then
{
    _thspecnum = random 99999;
    _thMarker = createMarker [format["thmarke%1r",_thspecnum], [_thpositionx, _thpositiony]];
    _thMarker setMarkerColor "ColorGreen";
    _thMarker setMarkerShape "ELLIPSE";
    _thMarker setMarkerBrush "Grid";
    _thMarker setMarkerText "Loot!";
    _thMarker setMarkerSize [_thrange / 2,_thrange / 2];
};

/*
_this = createVehicle ["Land_CamoNet_NATO", [_thpositionx + 47, _thpositiony + 18, 0], [], 0, "CAN_COLLIDE"];
_this setPos [_thpositionx + 47, _thpositiony + 18, 0];
*/

_this = createVehicle ["USVehicleBox", [_thpositionx + 43, _thpositiony + 16], [], 0, "CAN_COLLIDE"];
_this setDir -50.022877;
_thlootbox = _this;
_thlootbox setVariable ["permaLoot",true];

[_thlootbox, _thtest] execVM "\z\addons\dayz_server\scripts\treasurehunt\th_loot_filler.sqf";

/*
_this = createVehicle ["HMMWVWreck", [_thpositionx + 49, _thpositiony + 16, 0], [], 0, "CAN_COLLIDE"];
_this setPos [_thpositionx + 49, _thpositiony + 16, 0];
*/



