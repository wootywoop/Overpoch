private ["_thcounter","_thlootbox","_thloot_weapons","_thloot_mags","_thloot_backpacks","_thitemtemp","_thloot_items","_thrareness","_thrare","_thtempnum","_thclass","_thrarecount","_thweaponcount","_thammocount","_thbackpackcount","_thitemcount","_counter","_thspecnum","_thtest"];

_thlootbox = _this select 0;
_thtest = _this select 1;


// Here you can set the maximum number of items to spawn.
_thweaponcount = 10;
_thammocount = 20;
_thbackpackcount = 1;
_thitemcount = 30;


// Make sure the rareness is set to 100 incase something goes wrong and we end up with endless loops
_thrareness = 100;


diag_log format ["Treasure Hunt: Trying to fill lootbox"];

// The arrays below contain all the possible loot class names for each category. Format: ["CLASSNAME", rareness]
// Classname, check if it is not a problem to spawn on the server, people shouldn't be banned cause if it
// Rareness, anything below 40 wil probally spawn a lot. between 40 and 60 will spawn reasonably, 60-75 a little less. Anything above 75 is restricted to only adding one of that item per pass if the rareness is high enough.

_thloot_weapons = [
    ["M4A1_AIM_SD_camo", 40],
    ["Pecheneg_DZ", 55],
    ["M4SPR", 65],
    ["G36_C_SD_camo", 40],
    ["M16A4_ACG", 35],
    ["m107_DZ", 95],
    ["m8_Carbine", 40],
    ["revolver_gold_EP1", 60],
    ["m8_Carbine", 40],   
    ["m8_CarbineGL", 45],
    ["m8_Sharpshooter", 45],
    ["M16A2GL", 45],
    ["Sa58V_CCO_EP1", 45],
    ["Sa58V_RCO_EP1", 55],
    ["Sa58P_EP1", 40],
    ["M4A3_RCO_GL_EP1", 45],
    ["SCAR_H_LNG_Sniper", 80],
    ["ChainSaw", 90],
    ["ChainSawB", 90],
    ["ChainSawP", 90],
    ["ChainSawG", 90],
    ["ChainSawR", 90],
    ["m8_SAW", 50],
    ["SCAR_L_CQC", 70],
    ["SCAR_L_CQC_CCO_SD", 75],
    ["BAF_LRR_scoped", 95],
    ["BAF_L85A2_RIS_Holo", 50],
    ["SVD_Camo", 60],
    ["SCAR_H_CQC_CCO", 50],
    ["DMR_DZ", 80],
    ["M24", 30],
    ["M40A3", 50],
    ["M240_DZ", 40],
    ["M249_DZ", 50],
    ["SCAR_H_CQC_CCO_SD", 60],
    ["Mk_48_DZ", 50],
    ["M110_NVG_EP1", 90],
    ["g36a_camo", 10],
    ["NVGoggles", 30],
    ["ItemKeyKit", 30],
    ["Binocular_Vector", 30]
];

_thloot_mags = [
    ["15Rnd_9x19_M9SD", 50],
    ["30Rnd_762x39_SA58", 60],
    ["15Rnd_9x19_M9", 45],
    ["5Rnd_86x70_L115A1", 60],
    ["30Rnd_556x45_Stanag", 60],
    ["30Rnd_556x45_StanagSD", 40],
    ["20Rnd_762x51_DMR", 30],
    ["200Rnd_556x45_M249", 50],
    ["30Rnd_9x19_MP5SD", 30],
    ["8Rnd_9x18_MakarovSD", 30],
    ["1Rnd_HE_M203", 30],   
    ["100Rnd_762x51_M240", 30],
    ["15Rnd_9x19_M9SD", 50],
    ["20Rnd_762x51_SB_SCAR", 45],
    ["20Rnd_762x51_B_SCAR", 40],
    ["10Rnd_127x99_m107", 75],
    ["100Rnd_762x54_PK", 60]
];

_thloot_backpacks = [
    ["DZ_LargeGunBag_EP1", 40],
    ["DZ_Backpack_EP1", 5]
];

_thloot_items = [
    ["ItemBriefcase100oz", 90],
    ["FoodCanBakedBeans", 10],
    ["ItemSodaCoke", 10],
    ["ItemGoldBar10oz", 40],    
    ["ItemPainkiller", 30],
    ["ItemMorphine", 20],
    ["ItemBloodbag", 40],
    ["PartEngine", 10],
    ["fuel_pump_kit", 60],
    ["metal_panel_kit", 80],
    ["sandbag_nest_kit", 70],
    ["outhouse_kit", 60],
    ["CinderBlocks", 60],
    ["bulk_ItemSandbag", 75],
    ["ItemGenerator", 55],
    ["ItemCorrugated", 45],
    ["ItemWire", 55],
    ["ItemTankTrap", 30],
    ["ItemPole", 15],
    ["PartGeneric", 45],
    ["MortarBucket", 50],
    ["ItemTentDomed", 40],
    ["ItemComboLock", 75]
];

// Clear the lootbox
clearWeaponCargoGlobal _thlootbox;
clearMagazineCargoGlobal _thlootbox;

diag_log format ["Treasure Hunt: Randomize items in lootbox"];
if (_thtest == 1) then
{
    _thspecnum = count _thloot_weapons;
    _counter = 0;
    while {_counter < _thspecnum} do
    {
        _thitemtemp = _thloot_weapons select _counter;
        _thclass = _thitemtemp select 0;
        _thlootbox addWeaponCargoGlobal[_thclass, 1];
        _counter = _counter + 1;        
    };
    _thspecnum = count _thloot_mags;
    _counter = 0;
    while {_counter < _thspecnum} do
    {
        _thitemtemp = _thloot_mags select _counter;
        _thclass = _thitemtemp select 0;
        _thlootbox addMagazineCargoGlobal[_thclass, 1];
        _counter = _counter + 1;        
    };
    _thspecnum = count _thloot_items;
    _counter = 0;
    while {_counter < _thspecnum} do
    {
        _thitemtemp = _thloot_items select _counter;
        _thclass = _thitemtemp select 0;
        _thlootbox addMagazineCargoGlobal[_thclass, 1];
        _counter = _counter + 1;        
    };    
};

// set up for loop to fill lootbox with random weapons
_thcounter = 0;
while {_thcounter<_thweaponcount} do
{
    // Set temp var for a random class name and random number to spawn
    _thitemtemp = _thloot_weapons select floor random count _thloot_weapons;
    _thclass = _thitemtemp select 0;
    _thrare = _thitemtemp select 1;
    _thrarecount = 0;
    while {_thrareness < 10} do
    {
        _thrareness = ceil random 10;
        _thrarecount = _thrarecount + 1;
    };
    if (_thrare < _thrareness) then
    {
        _thtempnum = ceil random 5;
        if (_thrareness > 75) then
        {
            _thtempnum = 1;
        };
        // Add random number to counter
        _thcounter = _thcounter + _thtempnum;
        diag_log format ["Treasure Hunt: Filling lootbox with: %1 x %2", _thitemtemp select 0, _thtempnum];
        // Add the random class name to the lootbox
        _thlootbox addWeaponCargoGlobal[_thclass, _thtempnum];
    } 
    
};

// set up for loop to fill lootbox with random ammo
_thcounter = 0;
while {_thcounter<_thammocount} do
{
    // Set temp var for a random class name and random number to spawn
    _thitemtemp = _thloot_mags select floor random count _thloot_mags;
    _thclass = _thitemtemp select 0;
    _thrare = _thitemtemp select 1;
    _thrareness = ceil random 100;
    _thrarecount = 0;
    while {_thrareness < 10} do
    {
        _thrareness = ceil random 10;
        _thrarecount = _thrarecount + 1;
    };    
    if (_thrare < _thrareness) then
    {
        _thtempnum = ceil random 5;
        if (_thrareness > 75) then
        {
            _thtempnum = 1;
        };
        // Add random number to counter
        _thcounter = _thcounter + _thtempnum;
        diag_log format ["Treasure Hunt: Filling lootbox with: %1 x %2", _thitemtemp select 0, _thtempnum];
        // Add the random class name to the lootbox
        _thlootbox addMagazineCargoGlobal[_thclass, _thtempnum];
    } 
};

// set up for loop to fill lootbox with random backpacks
_thcounter = 0;
while {_thcounter<_thbackpackcount} do
{
    // Set temp var for a random class name and random number to spawn
    _thitemtemp = _thloot_backpacks select floor random count _thloot_backpacks;
    _thclass = _thitemtemp select 0;
    _thrare = _thitemtemp select 1;
    _thrareness = ceil random 100;
    _thrarecount = 0;
    while {_thrareness < 10} do
    {
        _thrareness = ceil random 10;
        _thrarecount = _thrarecount + 1;
    };    
    if (_thrare < _thrareness) then
    {
        _thtempnum = ceil random 5;
        if (_thrareness > 75) then
        {
            _thtempnum = 1;
        };
        // Add random number to counter
        _thcounter = _thcounter + _thtempnum;
        diag_log format ["Treasure Hunt: Filling lootbox with: %1 x %2", _thitemtemp select 0, _thtempnum];
        // Add the random class name to the lootbox
        _thlootbox addBackpackCargoGlobal[_thclass, _thtempnum];
    } 
};

// set up for loop to fill lootbox with random items
_thcounter = 0;
while {_thcounter<_thitemcount} do
{
    // Set temp var for a random class name and random number to spawn
    _thitemtemp = _thloot_items select floor random count _thloot_items;
    _thclass = _thitemtemp select 0;
    _thrare = _thitemtemp select 1;
    _thrareness = ceil random 100;
    _thrarecount = 0;
    while {_thrareness < 10} do
    {
        _thrareness = ceil random 10;
        _thrarecount = _thrarecount + 1;
    };    
    if (_thrare < _thrareness) then
    {
        _thtempnum = ceil random 5;
        if (_thrareness > 75) then
        {
            _thtempnum = 1;
        };
        // Add random number to counter
        _thcounter = _thcounter + _thtempnum;
        diag_log format ["Treasure Hunt: Filling lootbox with: %1 x %2", _thitemtemp select 0, _thtempnum];
        // Add the random class name to the lootbox
        _thlootbox addMagazineCargoGlobal[_thclass, _thtempnum];
    } 
};

diag_log format ["Treasure Hunt: Lootbox filled!"];


waitUntil{{isPlayer _x && _x distance _thlootbox < 5 } count playableunits > 0}; 
customRemoteMessage = ["titleCut", format ["The secret stash has been found!!!"]];
publicVariable "customRemoteMessage";
diag_log format ["Treasure Hunt: Stash found!"];
