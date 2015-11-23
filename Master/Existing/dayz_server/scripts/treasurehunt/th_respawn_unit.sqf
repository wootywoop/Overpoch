private ["_unit_th1","_th_position","_th_group","_th_killunit_spawn","_th_killunit_spawnloc","_thTest","_th_random_messages","_custmsg","_thunitname"]; 		// Declared Privates

diag_log format ["Treasure Hunt: Kill Unit Spawn initiated!"];
_thtest = _this select 0;
_thunitname = _this select 1;
_unit_th1 = objNull; 				// Declare _unit_th1 as object
_th_position = [7087, 7960]; 		// Setting position
_th_group = createGroup resistance; // Setting the group for _unit_th1
_th_killunit_spawn = [
    [1717, 3826], //pavlovo
    [10440, 2252], // elecktro
    [6827, 3171], //small church north east of cherno
    [12874, 10154], //berezino church
    [11187, 12291], // kraz
    [6023, 7783], // stary
    [7075, 7701], //noy
    [2729, 5442], //zelenogorsk
    [4563, 6407], // pogorevka
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
    [format ["%1 lives again!!! Get it over with and rob him of his life and his loot!!!!", _thunitname]]
];



"RU_Priest" createUnit [_th_position, _th_group, "_unit_th1=this;",1,"PRIVATE"]; 	// Spawn the unit

diag_log format ["Treasure Hunt: Kill Unit Re-Spawned!!"];

_unit_th1 addMPEventHandler ["MPkilled", {[_this, _thtest] execVM "\z\addons\dayz_server\scripts\treasurehunt\th_spawn_camp.sqf";}]; 	// Add event handler to _unit_th1 and make it run spawn camp script on death of _unit_th1
_unit_th1 setIdentity _thunitname;
_th_killunit_spawnloc = _th_killunit_spawn select floor random count _th_killunit_spawn;
_unit_th1 setPos _th_killunit_spawnloc;

_custmsg = _th_random_messages select floor random count _th_random_messages;

customRemoteMessage = ["titleCut", format _custmsg];
publicVariable "customRemoteMessage";

if (_thtest == 1) then
{
    _unit_th1 setPos [1717, 3826];
    diag_log format [_custmsg];
};

/*
[_unit_th1, _thtest] spawn {
    private ["_unit","_thtest"];
    _unit = _this select 0;
    _thtest = _this select 1;
    while {alive _unit} do
    {
        _unit say3d "thsound1";
        if (_thtest == 1) then
        {
            diag_log format ["Treasure Hunt: Playing Sound"];
        };
        sleep 30; 
    };
};
*/