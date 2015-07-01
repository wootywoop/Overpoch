private ["_unit_th1","_th_position","_th_group","_th_killunit_spawn","_th_killunit_spawnloc","_thTest","_th_random_messages","_custmsg","_thunitname","_thunitclass"]; 		// Declared Privates

diag_log format ["Treasure Hunt: Kill Unit Spawn initiated!"];
_thtest = _this select 0;
_thunitname = _this select 1;
_thunitclass = _this select 2;
_unit_th1 = objNull; 				// Declare _unit_th1 as object
_th_position = [7087, 7960]; 		// Setting position
_th_group = createGroup resistance; // Setting the group for _unit_th1
_th_killunit_spawn = [
    [1717, 3826],
    [10440, 2252],
    [6827, 3171],
    [12874, 10154],
    [11187, 12291],
    [6023, 7783],
    [7075, 7701],
    [2729, 5442],
    [4563, 6407],
    [7425, 5165],
    [9408, 8842],
    [10051, 5529],    
    [6658, 2296]    
];

_th_random_messages = [
    [format ["%1 won't stay down! Find him at a random church within Chenarus to show him who's boss and get a hint to his secret loot stash!!!", _thunitname]],
    [format ["%1 has risen again!! He's roaming another Church in the area! Seek him out and find his treasure!!!", _thunitname]],
    [format ["Find the priest %1, kill him and read his journal, hidden treasure awaits!!!!!", _thunitname]],
    [format ["Good news everyone! %1 has respawned... Let the hunt begin!!!!", _thunitname]],
    [format ["The hunt is on!!! Kill %1 and claim his hidden loot for yourself!!! Seek him out at random churches!!!!", _thunitname]],    
    [format ["%1 has been preaching about the end of the world at random churches within Chenarus... He is obviously insane. Kill him and a reward awaits you!!!!", _thunitname]],
    [format ["Race against the other players to find %1 and rob him of his treasure by reading his journal! He just respawned!!!!", _thunitname]],
    [format ["%1 lives again!!! Get it over with and rob him of his life and his loot!!!!", _thunitname]]
];



_thunitclass createUnit [_th_position, _th_group, "_unit_th1=this;",1,"PRIVATE"]; 	// Spawn the unit
_unit_th1 setVariable["name", _thunitname];
removeAllItems _unit_th1; 
diag_log format ["Treasure Hunt: Kill Unit Spawned!!"];
if (_thtest == 1) then 
{
    _unit_th1 addMPEventHandler ["MPkilled", {[_this, 1] execVM "\z\addons\dayz_server\scripts\treasurehunt\th_spawn_camp.sqf";}]; 	// Add event handler to _unit_th1 and make it run spawn camp script on death of _unit_th1
};

if (_thtest == 0) then 
{
    _unit_th1 addMPEventHandler ["MPkilled", {[_this, 0] execVM "\z\addons\dayz_server\scripts\treasurehunt\th_spawn_camp.sqf";}]; 	// Add event handler to _unit_th1 and make it run spawn camp script on death of _unit_th1
};

_th_killunit_spawnloc = _th_killunit_spawn select floor random count _th_killunit_spawn;
_unit_th1 setPos _th_killunit_spawnloc;

_custmsg = _th_random_messages select floor random count _th_random_messages;

thMessage = ["titleCut", format _custmsg];
publicVariable "thMessage";

if (_thtest == 1) then
{
    _unit_th1 setPos [1717, 3826];
    diag_log format ["Unit spawned in Pavlovo for testing purposes."];
};

[_thtest, _thunitname, _thunitclass, _unit_th1] spawn {
    //sleep 120;
    private ["_sleeptime","_thtest","_thunitname","_thunitclass","_unit_th1"];
    _thtest = _this select 0;
    _thunitname = _this select 1;
    _thunitclass = _this select 2;
    _unit_th1 = _this select 3;
    waitUntil {sleep 1; !alive _unit_th1};
    _sleeptime = 900 + random 900;
    if (_thtest == 1) then {
        _sleeptime = 45;
    };
    sleep _sleeptime;
    deleteVehicle _unit_th1;
    sleep 15;
    [_thtest, _thunitname, _thunitclass] execVM "\z\addons\dayz_server\treasurehunt\th_spawn_unit.sqf";           
};

/*
[_unit_th1, _thtest] spawn {
    private ["_unit","_thtest"];
    _unit = _this select 0;
    _thtest = _this select 1;
    while {alive _unit} do
    {
        _unit say "thsound1";
        if (_thtest == 1) then
        {
            diag_log format ["Treasure Hunt: Playing Sound"];
        };
        sleep 30; 
    };
};
*/
