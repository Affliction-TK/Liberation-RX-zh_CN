// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_helpCivilian.sqf

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private ["_nbUnits", "_outpost", "_objects"];

_setupVars =
{
	_missionType = "帮助平民";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = AI_GROUP_MEDIUM;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	//_missionHintText = format ["一个武装的 <t color='%1'>哨站</t> 在标记附近发现了装有武器的板条箱，快去抓住它！", sideMissionColor]
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	//{ deleteVehicle _x } forEach _objects;
};

_successExec =
{
	// Mission complete

	_successHintMessage = "所有的平民都得到了帮助，干得好。";
};

_this call sideMissionProcessor;
