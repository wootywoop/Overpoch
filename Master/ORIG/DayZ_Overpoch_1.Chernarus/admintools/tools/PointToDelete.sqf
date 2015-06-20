private ["_delobj","_player"];
_player = player;

_delobj = cursorTarget;
deleteVehicle _delobj;

_objectID = _delobj getVariable ["ObjectID", "0"];
_objectUID = _delobj getVariable ["ObjectUID", "0"];

PVDZE_obj_Delete = [_objectID, _objectUID, (name _player)];
publicVariableServer "PVDZE_obj_Delete";

_dotxt = format["%1 Destroyed and Deleted", _delobj];
titleText [_dotxt,"PLAIN DOWN"]; titleFadeOut 4;

// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has deleted %3",name _player,getPlayerUID _player,_delobj];
	[] spawn {publicVariable "usageLogger";};
};
// Tool use broadcaster
if(!((getPlayerUID _player) in SuperAdminList) && broadcastToolUse) then {
	useBroadcaster = format["%1 -- has deleted a %2",name _player,_delobj];
	[] spawn {publicVariableServer "useBroadcaster";};
};