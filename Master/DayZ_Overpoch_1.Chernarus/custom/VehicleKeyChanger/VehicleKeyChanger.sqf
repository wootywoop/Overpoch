/***********************************/ 	
/* Vehicle Key Changer v1.4        */
/* Written by OtterNas3            */
/* January, 11, 2014               */
/* Last update: 06/15/2014         */
/***********************************/


/* Setup the private variables */
private ["_magazinesPlayer","_max","_j","_actionArray","_targetVehicle","_targetVehicleID","_targetVehicleUID","_playerKeys","_playerKeysDisplayName","_targetVehicleKeyName","_itemKeyName","_targetVehicleClassname","_targetVehiclePos","_targetVehicleDir","_Price","_claimingPrice","_timeout"];

/* Remove the Action Menu entry */
player removeAction s_player_copyToKey;
s_player_copyToKey = 0;
player removeAction s_player_claimVehicle;
s_player_claimVehicle = 0;

/* Get the array and setup the variables */
_actionArray = _this select 3;
_targetVehicle = _actionArray select 0;
_targetVehicleID = _targetVehicle getVariable ["ObjectID","0"];
_targetVehicleUID = _targetVehicle getVariable ["ObjectUID","0"];
	

/* Check if the Vehicle is in the Database, if false exit */
if (_targetVehicleID == "0" && _targetVehicleUID == "0") exitWith {cutText ["Sorry but\nthis Vehicle does not support\nKeychange/Claiming!","PLAIN",0];s_player_copyToKey = -1;s_player_claimVehicle = -1;};

/* Setup more variables */
_playerKeys = _actionArray select 1;
_playerKeysDisplayName = _actionArray select 3;
_targetVehicleKeyName = _actionArray select 4;
_itemKeyName = _actionArray select 5;
_Price = _actionArray select 6;
_claimingPrice = _actionArray select 7;
_targetVehicleClassname = typeOf _targetVehicle;

_targetVehiclePos = getPosATL _targetVehicle;
_targetVehicleDir = getDir _targetVehicle;

/* Just in case it is a just bought vehicle and does not yet have a ObjectUID variable set */
if (_targetVehicleUID == "0") then {
	_targetVehicleUID = "";
	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_targetVehicleUID = _targetVehicleUID + str(round(_x));
	} forEach _targetVehiclePos;
	_targetVehicleUID = _targetVehicleUID + str(round(_targetVehicleDir + time));
	_targetVehicle setVariable["ObjectUID",_targetVehicleUID,true];
};
	
/* Setup the Key Names list to select from */
keyNameList = [];
for "_i" from 0 to (count _playerKeysDisplayName) -1 do {
	keyNameList set [(count keyNameList), _playerKeysDisplayName select _i];
};

/* Setup the Key Numbers list to select from */
keyNumberList = [];
for "_i" from 0 to (count _playerKeys) -1 do {
	keyNumberList set [(count keyNumberList), _playerKeys select _i];
};

/* Resetting menu variables*/
keyNameSelect = "";
exitscript = true;
snext = false;

/* Creating the menu */
copyMenu =
{
	private ["_keyMenu","_keyArray"];
	_keyMenu = [["",true], ["Select the new Key:", [-1], "", -5, [["expression", ""]], "1", "0"]];
	for "_i" from (_this select 0) to (_this select 1) do
	{
		_keyArray = [format['%1', keyNameList select (_i)], [_i - (_this select 0) + 2], "", -5, [["expression", format ["keyNameSelect = keyNameList select %1; keyNumberSelect = keyNumberList select %1", _i]]], "1", "1"];
		_keyMenu set [_i + 2, _keyArray];
	};
	_keyMenu set [(_this select 1) + 2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];
	if (count keyNameList > (_this select 1)) then
	{
		_keyMenu set [(_this select 1) + 3, ["Next", [12], "", -5, [["expression", "snext = true;"]], "1", "1"]];
	} else {
		_keyMenu set [(_this select 1) + 3, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];
	};
	_keyMenu set [(_this select 1) + 4, ["Exit", [13], "", -5, [["expression", "keyNameSelect = 'exitscript';"]], "1", "1"]];
	showCommandingMenu "#USER:_keyMenu";
};

/* Wait for the player to select a Key from the list */
_j = 0;
_max = 10;
if (_max > 9) then {_max = 10;};
while {keyNameSelect == ""} do {
	[_j, (_j + _max) min (count keyNameList)] call copyMenu;
	_j = _j + _max;
	waitUntil {keyNameSelect != "" || snext};
	snext = false;
};

/* Player selected a Key, lets make the Vehicle update call */
if (keyNameSelect != "exitscript") then {
	
	/* Check again for the needed price or claiming price and remove em from the players inventory */
	_magazinesPlayer = magazines player;
	if (_Price != "0") then {
		/* Player still has the costs in hi inventory */
		if ((parseNumber _Price) < (player getVariable["cashMoney",0])) then {
			_coinsremove = parseNumber _claimingPrice;
			[player, _coinsremove] call SC_fnc_removeCoins;
			systemChat (format["Keychange costs %1 coins, thanks for your Payment!", _Price]);
		
		/* Player doesn't have the costs anymore, tried to trick the system? */
		} else {
			systemChat (format["Keychange costs %1 coins, you had it and tried to trick the system - Keychange for this Vehicle disabled!", _Price]);
			
			/* This disables the Keychange ability for this vehicle JUST for this Player */
			/* However he can relog and try again but it is a little punishment for trying to trick it */
			_targetVehicle setVariable ["VKC_disabled", 1];
			s_player_copyToKey = -1;
			s_player_claimVehicle = -1;
			breakOut "exit";
		};
	};
	
	if (_claimingPrice != "0") then {
		/* Player still has the costs in hi inventory */
		if ((parseNumber _claimingPrice) < (player getVariable["cashMoney",0])) then {
			_coinsremove = parseNumber _claimingPrice;
			[player, _coinsremove] call SC_fnc_removeCoins;
			systemChat (format["Claiming Vehicle costs %1 coins, thanks for your Payment!", _claimingPrice]);

		/* Player doesn't have the costs anymore, tried to trick the system? */
		} else {
			systemChat (format["Claiming Vehicle costs %1 coins, you had it and tried to trick the system - Claiming for this Vehicle disabled!", _claimingPrice]);

			/* This disables the Claiming ability for this vehicle JUST for this Player */
			/* However he can relog and try again but it is a little punishment for trying to trick it */
			_targetVehicle setVariable ["VKC_claiming_disabled", 1];
			s_player_copyToKey = -1;
			s_player_claimVehicle = -1;
			breakOut "exit";
		};
	};
	
	/* We got the Money lets do our Job */
	/* Lock the vehicle */
	_targetVehicle setVehicleLock "LOCKED";
	
	/* The super duper OneForAllAnimation... */
	player playActionNow "Medic";
	
	/* Remove the Key from the Toolbelt of the player and put it in the Backpack - No Backpack and the Key gets lost */
	if (_itemKeyName != "0") then {
		if (!isNull (unitBackpack player)) then {
			[player, _itemKeyName, 1] call BIS_fnc_invRemove;
			(unitBackpack (vehicle player)) addWeaponCargoGlobal [_itemKeyName, 1];
			systemChat (format["%1 has been moved to your Backpack", _targetVehicleKeyName]);
		};
	};
	
	/* This calls the custom update function which we put it in server_updateObject.sqf */
	PVDZE_veh_Update = [_targetVehicle, "vehiclekey", player, _targetVehicleClassname, keyNumberSelect, keyNameSelect, _targetVehicleID, _targetVehicleUID]; 
	publicVariableServer "PVDZE_veh_Update"; 

	/* Wait for success or timeout */
	_timeout = 20;
	while {_timeout > 0 && isNil "PVDZE_vkc_Success"} do {
		if (_Price != "0") then {
			cutText["~~ Performing Keychange ~~\n~~ Please wait ~~","PLAIN",0.5];
		};
		if (_claimingPrice != "0") then {
			cutText["~~ Performing Claim ~~\n~~ Please wait ~~","PLAIN",0.5];
		};
		sleep 1;
		_timeout = _timeout - 1;
	};

	/* Inform the player about the success and tell him to check the Key */
	if (!isNil "PVDZE_vkc_Success") then {
		if (_Price != "0") then {
			cutText["~~ Vehicle Keychange - SUCCESS ~~","PLAIN",1];
			systemChat (format["Changed Vehicle Key to %1", keyNameSelect]);
			systemChat (format["Please check Vehicle function with %1 before you throw away %2!", keyNameSelect, _targetVehicleKeyName]);
		};
		if (_claimingPrice != "0") then {
			cutText["~~ Vehicle Claiming - SUCCESS ~~","PLAIN",1];
			systemChat (format["You claimed this Vehicle with: %1", keyNameSelect]);
		};
		PVDZE_vkc_Success = nil;
		
		/* This updates the Vehicle as it is now, position, gear, damage, fuel */
		/* Should prevent the "backporting" some dudes reported. */
		/* Just fyi i never had that but just in case... */
		[nil,nil,nil,_targetVehicle] execVM "\z\addons\dayz_code\actions\forcesave.sqf";
	
	/* Something went wrong, inform the player and refund the costs */
	} else {
		if (_Price != "0") then {
			cutText["~~ Vehicle Keychange - FAIL ~~","PLAIN",1];
			systemChat (format["Sorry something went wrong", keyNameSelect]);
			systemChat (format["Please try again. If it keeps failing, please contact a Admin!", keyNameSelect, _targetVehicleKeyName]);
			[player,_Price] call BIS_fnc_invAdd;
			systemChat (format["Refunded %1",_Price]);
		};
		if (_claimingPrice != "0") then {
			cutText["~~ Vehicle Claiming - FAIL ~~","PLAIN",1];
			systemChat ("Sorry something went wrong");
			systemChat ("Please try again. If it keeps failing, please contact a Admin!");
			[player,_claimingPrice] call BIS_fnc_invAdd;
			systemChat (format["Refunded %1",_claimingPrice]);
		};
	};
};

/* Reset the action menu variables for a new run */
s_player_copyToKey = -1;
s_player_claimVehicle = -1;

/**************************************/
/* That's it, hope you enjoy this Mod */
/*                                    */
/* Yours sincerly,                    */
/* Otter                              */
/**************************************/