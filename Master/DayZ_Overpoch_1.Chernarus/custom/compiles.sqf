
if (!isDedicated) then {
	player_build = compile preprocessFileLineNumbers "custom\snap_pro\player_build.sqf";
	snap_build = compile preprocessFileLineNumbers "custom\snap_pro\snap_build.sqf";
	dayz_spaceInterrupt = compile preprocessFileLineNumbers "custom\snap_pro\dayz_spaceInterrupt.sqf";
	
	fnc_usec_selfActions = compile preprocessFileLineNumbers "ZSC\compiles\fn_selfActions.sqf";
	player_unlockVault =   compile preprocessFileLineNumbers "custom\BuildVectors\compile\player_unlockVault.sqf";
    player_lockVault =     compile preprocessFileLineNumbers "custom\BuildVectors\compile\player_lockVault.sqf";
	player_death = compile preprocessFileLineNumbers "Recover_Skin\player_death.sqf";
	fnc_SetPitchBankYaw =       compile preprocessFileLineNumbers "custom\BuildVectors\fnc_SetPitchBankYaw.sqf";
    DZE_build_vector_file =         "custom\BuildVectors\build_vectors.sqf";
    build_vectors =                 compile preprocessFileLineNumbers DZE_build_vector_file;
	/*Plot*/
	PlotGetFriends 		= compile preprocessFileLineNumbers "zsc\plotManagement\plotGetFriends.sqf";
	PlotNearbyHumans 	= compile preprocessFileLineNumbers "zsc\plotManagement\plotNearbyHumans.sqf";
	PlotAddFriend 		= compile preprocessFileLineNumbers "zsc\scplotManagement\plotAddFriend.sqf";
	PlotRemoveFriend 	= compile preprocessFileLineNumbers "zsc\plotManagement\plotRemoveFriend.sqf";
	MaintainPlot    				= compile preprocessFileLineNumbers "zsc\plotManagement\maintain_area.sqf";
	PlotPreview    					= compile preprocessFileLineNumbers "zsc\plotManagement\plotToggleMarkers.sqf";
	PlotObjects                                     = compile preprocessFileLineNumbers "zsc\plotManagement\plotObjects.sqf"; // NEW
	/*Plot End*/
};