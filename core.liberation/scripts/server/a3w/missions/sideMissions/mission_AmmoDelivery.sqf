// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_AmmoDelivery.sqf

if (!isServer) exitwith {};
if (!isNil "GRLIB_A3W_Mission_MR") exitWith {};
#include "sideMissionDefines.sqf"

private ["_nbUnits", "_townName","_buildingpositions", "_man1", "_marker_zone"];

_setupVars =
{
	_missionType = "运送弹药";
	_missionLocation = [sectors_military] call getMissionLocation;
	_townName = markerText _missionLocation;
	_ignoreAiDeaths = true;
	_locationsArray = nil;
};

_setupObjects =
{
	_missionPos = (markerPos _missionLocation vectorAdd [([[-50,0,50], 20] call F_getRND), ([[-50,0,50], 20] call F_getRND), 0]);
	_mission_grp = createGroup [GRLIB_side_civilian, true];
	_man1 = _mission_grp createUnit ["C_Marshal_F", _missionPos, [], 0, "NONE"];
	_man1 setVariable ['GRLIB_can_speak', true, true];
	_man1 setVariable ['GRLIB_A3W_Mission_DA', true, true];
	_man1 allowDamage false;
	[_man1, "LHD_krajPaluby"] spawn F_startAnimMP;
	_marker_zone = createMarker ["A3W_Mission_DF", _missionPos];
	_marker_zone setMarkerColor "ColorCivilian";
	_marker_zone setMarkerShape "ELLIPSE";
	_marker_zone setMarkerBrush "FDiagonal";
	_marker_zone setMarkerSize [20,20];

	_missionHintText = format ["弹药运输： &lt;br/&gt;&lt;t size='1.25' color='%1'&gt;%2&lt;/t&gt;&lt;br/&gt;&lt;br/&gt;&lt;t color='#00F000'&gt;通过&lt;/t&gt; 对话 &lt;t color='#0000F0'&gt;将军&lt;/t&gt; 来获得信息.", sideMissionColor, _townName];
	A3W_sectors_in_use = A3W_sectors_in_use + [_missionLocation];
	true;
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_waitUntilSuccessCondition = {
	_ret = false;
	private _barrels = [_man1 nearEntities [A3W_BoxWps, 20], {isNil {_x getVariable "R3F_LOG_objets_charges"} && !(_x getVariable ['R3F_LOG_disabled', false])}] call BIS_fnc_conditionalSelect;
	if (count _barrels == 3) then {
		sleep 1;
		[_missionType, _man1] remoteExec ["remote_call_a3w_info", 0];
		{ deleteVehicle _x } forEach _barrels;
		_ret = true;
	};
	_ret;
 };

_failedExec = {
	// Mission failed
	deleteVehicle _man1;
	deleteMarker _marker_zone;
	_failedHintMessage = format ["弹药运输...&lt;br/&gt;&lt;t color='%1'&gt;失败了&lt;/t&gt; !!&lt;br/&gt;&lt;br/&gt;当地居民很不高兴......", sideMissionColor, _townName];
	A3W_delivery_failed = A3W_delivery_failed + 1;
	A3W_sectors_in_use = A3W_sectors_in_use - [_missionLocation];
};

_successExec = {
	sleep 3;
	// Mission completed
	_successHintMessage = format ["弹药运输&lt;br/&gt;&lt;t color='%1'&gt;成功&lt;/t&gt; !!&lt;br/&gt;&lt;br/&gt;弹药箱已经交付，干得好。", sideMissionColor];
	[ammobox_i_typename, _missionPos, false] call boxSetup;
	deleteVehicle _man1;
	deleteMarker _marker_zone;
	A3W_delivery_failed = 0;
	A3W_sectors_in_use = A3W_sectors_in_use - [_missionLocation];
};

_this call sideMissionProcessor;
