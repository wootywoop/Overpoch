/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio true;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// Player kills in chat
DZE_DeathMsgGlobal = false;
DZE_DeathMsgTitleText = false;

// DayZ Epochconfig
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // This is the overall area used to determine where to spawn vehicles, road debris, and helicopter crashes. (Default: 10000) 
MaxVehicleLimit = 300; // Controls the max overall vehicle limit if this limit is reached no new vehicles will spawn. 
MaxDynamicDebris = 150; // Default = 100
MaxMineVeins = 40;
MaxAmmoBoxes = 15;
dayz_MapArea = 14000; // Default = 10000
dayz_minpos = -1; 
dayz_maxpos = 16000;
dayz_spawnselection = 0;
dayz_paraSpawn = false; // Experimental feature that will parachute spawn all players into the game. (Default: false) 
dayz_sellDistance_vehicle = 80;
dayz_sellDistance_boat = 80;
dayz_sellDistance_air = 80;
dayz_maxLocalZombies = 25;
dayz_maxGlobalZombiesInit = 30;
dayz_maxGlobalZombiesIncrease = 10;
dayz_maxZeds = 500;
dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 5; // Default: 0
DynamicVehicleDamageHigh = 50; // Default: 100
DynamicVehicleFuelLow = 3;
DynamicVehicleFuelHigh = 35;
DZE_vehicleAmmo = 1; //Default = 0, deletes ammo from vehicles with machine guns every restart if set to 0.
DZE_BackpackGuard = false; //Default = True, deletes backpack contents if logging out or losing connection beside another player if set to true.
DZE_BuildingLimit = 1000; //Default = 150, decides how many objects can be built on the server before allowing any others to be built. Change value for more buildings.
DZE_TRADER_SPAWNMODE = false; //Vehicles bought with traders will parachute in instead of just spawning on the ground.
DZE_BuildOnRoads = false; // Default: False
DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["ItemVault"] (NOTE: The objects magazine classname)
DZE_vectorDegrees = [0.01, 0.1, 1, 5, 15, 45, 90];
DZE_curDegree = 45; //Starting rotation angle. //Prefered any value in array above
DZE_dirWithDegrees = true; //When rotating objects with Q&E, use the custom degrees
DZE_GodModeBase = true;  //unbreakable bases
DZE_requireplot = 1;   //removes need for plot pole
DZE_HeliLift = false;     //epoch default heli lifting
DZE_R3F_WEIGHT = true;   //remove weight system
DZE_PlotPole = [150,400];   //plot pole radius, exclusion zone
DZE_PlayerZed = false;    //player spawns back as zed
DZE_ForceNameTagsInTrader = true; //Forces player names in traders
DZE_SelfTransfuse = true; //Self blood transfusion
DZE_selfTransfuse_Values = [6000, 200, 240]; //[blood amount, infection chance, cool-down (seconds)]
DZE_MissionLootTable = true;  //Edit for custom loot
setViewDistance 2200;	//sets view distance
setTerrainGrid 20;	//sets terrain detail
/*ZSC*/
DZE_ConfigTrader = true;
/*ZSC*/

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

dayz_poleSafeArea = 150; // Default = 30m, the buildable distance

//Load in compiled functions
call compile preprocessFileLineNumbers "custom\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "custom\compiles.sqf";							 //Compile custom compiles
/*ZSC*/	
call compile preprocessFileLineNumbers "ZSC\gold\ZSCinit.sqf";
/*ZSC*/		
progressLoadingScreen 0.5;
//call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
call compile preprocessFileLineNumbers "server_traders_cherno_11.sqf";
call compile preprocessFileLineNumbers "admintools\config.sqf"; // Epoch admin Tools config file
call compile preprocessFileLineNumbers "admintools\variables.sqf"; // Epoch admin Tools variables
call compile preprocessFileLineNumbers "logistic\init.sqf"; //logistics - lift and tow
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	//_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	execVM "ZSC\compiles\playerHud.sqf";
	
	// Epoch Admin Tools
	if ( !((getPlayerUID player) in AdminList) && !((getPlayerUID player) in ModList)) then 
		{
		 [] execVM "admintools\antihack\antihack.sqf"; // Epoch Antihack with bypass
		};

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	execVM "service_point\service_point.sqf";  //Auto Refuel, Repair and Rearm

	_nil = [] execVM "custom\remote\remote.sqf";
	_nul = [] execVM "DZAI_Client\dzai_initclient.sqf";
	
	if (isNil 'debugMonitor') then 
	{
    debugMonitor = true;
    _nill = execvm "custom\debug_monitor.sqf";
	};
};

#include "\z\addons\dayz_code\system\REsec.sqf"

//Start Dynamic Weather
execVM "custom\DynamicWeatherEffects.sqf";


#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

[] execVM "custom\base_SafeArea.sqf";

DefaultMagazines = ["ItemBandage","ItemBandage","ItemPainkiller"];
DefaultWeapons = ["ItemFlashlight"];
DefaultBackpack = "";
DefaultBackpackWeapon = "";

//Load custom scripts

[] execvm 'AGN\agn_SafeZoneCommander.sqf';  //Trader Safe Zones
[] execVM "admintools\Activate.sqf"; // Epoch admin tools
waitUntil {!isNil "PVDZE_plr_LoginRecord"};
if (!isDedicated && {dayzPlayerLogin2 select 2}) then {execVM "spawn\spawn.sqf";};
execVM "RC\init.sqf";