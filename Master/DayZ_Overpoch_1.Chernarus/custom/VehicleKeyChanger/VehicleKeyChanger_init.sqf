/***********************************/ 	
/* Vehicle Key Changer v1.4        */
/* Written by OtterNas3            */
/* January, 11, 2014               */
/* Last update: 06/15/2014         */
/***********************************/


/////////////////////////////////////////////////
/////////////////////////////////////////////////
// Edit these settings to fit your needs/likes //
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/// Claim Vehicles that does not yet need Key ///
///////// 0 = Not allowed | 1 = Allowed /////////
vkc_claiming = 1;
/////////////////////////////////////////////////
//////// Claim Vehicles costs this Item /////////
/// Any Item can be used here, some examples: ///
//// ItemTinBar, ItemSilverBar, ItemGoldBar, ////
////// ItemSilverBar10oz, ItemGoldBar10oz, //////
///// ItemBriefcase20oz, ItemBriefcase100oz /////
//////// set to "0" to disable the costs ////////
vkc_claimingPrice = "10000";
/////////////////////////////////////////////////
////////// Change Key costs this Item// /////////
////////////// see above examples ///////////////
//////// set to "0" to disable the costs ////////
vkc_Price = "5000";
/////////////////////////////////////////////////
/////// Need KeyKit to use this function ////////
////////// 0 = Not needed | 1 = Needed //////////
vkc_needKeykit = 0;
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////// DONT EDIT BELOW ! ///////////////
/////////////////////////////////////////////////

ON_fnc_vkcReset = {
	player removeAction s_player_claimVehicle;
	s_player_claimVehicle = -1;
	player removeAction s_player_copyToKey;
	s_player_copyToKey = -1;
	lastKeyChangeCursorTarget = [objNull,objNull];
	vkc_cTarget = objNull;
};

/* Wait for player full ingame so we can access the action-menu */
waitUntil {!isNil "dayz_animalCheck"};

/* Initial Reset */
[] call ON_fnc_vkcReset;

/* Start the loop check */
while{true} do {
	sleep 3;

	if ((vehicle player) == player) then {
	
		if (speed player <= 1) then {

			if (!isNull cursorTarget) then {
				_cursorTarget = cursorTarget;
				
				if ((_cursorTarget isKindOf "Motorcycle" || _cursorTarget isKindOf "Car" || _cursorTarget isKindOf "Air" || _cursorTarget isKindOf "Ship")) then {

					if ((_cursorTarget distance player) <= 10) then {

						if (!isEngineOn _cursorTarget) then {

							vkc_carKey = _cursorTarget getVariable ["CharacterID","0"];

							if (vkc_claiming == 1) then {
							
								if (vkc_carKey == "0") then {

									if ((lastKeyChangeCursorTarget select 0) != _cursorTarget) then {
										player removeAction s_player_claimVehicle;
										s_player_claimVehicle = -1;
								
										lastKeyChangeCursorTarget set [0,_cursorTarget];
										vkc_cTarget = lastKeyChangeCursorTarget select 0;
									};

									if (vkc_cTarget getVariable ["VKC_claming_disabled", 0] == 0) then {
										vkc_magazinesPlayer = magazines player;
										vkc_itemsPlayer = items player;
									
										if (("ItemKeyKit" in vkc_itemsPlayer || vkc_needKeykit == 0) && (vkc_claimingPrice != "0" || ((parseNumber vkc_claimingPrice) < (player getVariable["cashMoney",0])))) then {
											vkc_objectID = vkc_cTarget getVariable ["ObjectID","0"];
											vkc_objectUID = vkc_cTarget getVariable ["ObjectUID","0"];

											if (!(vkc_objectID == "0" && vkc_objectUID == "0")) then {
												vkc_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
												vkc_temp_keys = [];
												vkc_temp_keysDisplayName = [];
												vkc_temp_keysDisplayNameParse = [];
											
												{
	
													if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in vkc_key_colors) then {
														vkc_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
														vkc_keyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
														vkc_temp_keysDisplayName set [count vkc_temp_keysDisplayName,vkc_keyName];
														vkc_temp_keys set [count vkc_temp_keys,str(vkc_ownerKeyId)];
													};
												} forEach vkc_itemsPlayer;

												if ((count vkc_temp_keys) > 0) then {
	
													if (s_player_claimVehicle < 0) then {
														s_player_claimVehicle = player addAction [("<t color='#00FFFF'>" + ("Claim Vehicle") + "</t>"),"custom\VehicleKeyChanger\VehicleKeyChanger.sqf",[vkc_cTarget,vkc_temp_keys,"0",vkc_temp_keysDisplayName,"0","0","0", vkc_claimingPrice],-1002,false,false,"",""];
													};
	
												} else {

													player removeAction s_player_claimVehicle;
													s_player_claimVehicle = -1;
												};

											} else {

												player removeAction s_player_claimVehicle;
												s_player_claimVehicle = -1;
											};

										} else {

											player removeAction s_player_claimVehicle;
											s_player_claimVehicle = -1;
										};

									} else {

										player removeAction s_player_claimVehicle;
										s_player_claimVehicle = -1;
									};

								} else {

									player removeAction s_player_claimVehicle;
									s_player_claimVehicle = -1;
								};

							} else {

								player removeAction s_player_claimVehicle;
								s_player_claimVehicle = -1;
							};

							if (vkc_carKey != "0") then {

								if ((lastKeyChangeCursorTarget select 1) != _cursorTarget) then {
									player removeAction s_player_copyToKey;
									s_player_copyToKey = -1;

									lastKeyChangeCursorTarget set [1,_cursorTarget];
									vkc_cTarget = lastKeyChangeCursorTarget select 1;
								};

								if (vkc_cTarget getVariable ["VKC_disabled",0] == 0) then {

									vkc_magazinesPlayer = magazines player;
									vkc_itemsPlayer = items player;

									if (("ItemKeyKit" in vkc_itemsPlayer || vkc_needKeykit == 0) && (vkc_Price != "0" || ((parseNumber vkc_Price) < (player getVariable["cashMoney",0])))) then {

										vkc_objectID = vkc_cTarget getVariable ["ObjectID","0"];
										vkc_objectUID = vkc_cTarget getVariable ["ObjectUID","0"];

										if (!(vkc_objectID == "0" && vkc_objectUID == "0")) then {
								
											vkc_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
											vkc_temp_keys = [];
											vkc_temp_keysDisplayName = [];
											vkc_temp_keysDisplayNameParse = [];
											vkc_temp_keysParse = [];

											{

												if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in vkc_key_colors) then {
													vkc_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
													vkc_keyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
													vkc_temp_keysDisplayName set [count vkc_temp_keysDisplayName,vkc_keyName];
													vkc_temp_keysDisplayNameParse set [vkc_ownerKeyId,vkc_keyName];
													vkc_temp_keys set [count vkc_temp_keys,str(vkc_ownerKeyId)];
													vkc_temp_keysParse set [vkc_ownerKeyId, _x];
												};
											} forEach vkc_itemsPlayer;

											vkc_hasKey = vkc_carKey in vkc_temp_keys;

											if (vkc_hasKey && (count vkc_temp_keys) > 1) then {
												vkc_carKeyName = (vkc_temp_keysDisplayNameParse select (parseNumber vkc_carKey));
												vkc_targetVehicleKey = (vkc_temp_keysParse select (parseNumber vkc_carKey));
												vkc_temp_keys = vkc_temp_keys - [vkc_carKey];
												vkc_temp_keysDisplayName = vkc_temp_keysDisplayName - [vkc_carKeyName];

												if (s_player_copyToKey < 0) then {
													s_player_copyToKey = player addAction [("<t color=""#0000FF"">" + ("Change Vehicle Key") + "</t>"),"custom\VehicleKeyChanger\VehicleKeyChanger.sqf",[vkc_cTarget, vkc_temp_keys, vkc_carKey, vkc_temp_keysDisplayName, vkc_carKeyName, vkc_targetVehicleKey, vkc_Price, "0"],-1002,false,false,"",""];
												};

											} else {
										
												player removeAction s_player_copyToKey;
												s_player_copyToKey = -1;
											};

										} else {
										
											player removeAction s_player_copyToKey;
											s_player_copyToKey = -1;
										};

									} else {
									
										player removeAction s_player_copyToKey;
										s_player_copyToKey = -1;
									};
							
								} else {
									
									player removeAction s_player_copyToKey;
									s_player_copyToKey = -1;
								};

							} else {
									
								player removeAction s_player_copyToKey;
								s_player_copyToKey = -1;
							};

						} else {
							
							[] call ON_fnc_vkcReset;
						};

					} else {

						[] call ON_fnc_vkcReset;
					};

				} else {

					[] call ON_fnc_vkcReset;
				};

			} else {

				[] call ON_fnc_vkcReset;
			};

		} else {

			[] call ON_fnc_vkcReset;
		};

	} else {

		[] call ON_fnc_vkcReset;
	};

};

