﻿params ["_unit"];

if (isNil "_unit") exitWith {};
if (count (attachedObjects _unit) > 0) exitWith {};
if (_unit getVariable ["GRLIB_action_inuse", false]) exitWith {};

private _result = true;
if (_unit isKindOf "LandVehicle") then {
	_result = [format [localize "STR_HALO_VEH_ASK", GRLIB_AirDrop_Vehicle_cost], localize "STR_WARNING", true, true] call BIS_fnc_guiMessage;
	if (_result) then {
		private _ammo_collected = player getVariable ["GREUH_ammo_count", 0];
		if (GRLIB_AirDrop_Vehicle_cost > _ammo_collected) then {
			hintSilent localize "STR_GRLIB_NOAMMO";
			_result = false;
		};
	};
};
if (!_result) exitWith {};

if ( isNil "GRLIB_last_halo_jump" ) then { GRLIB_last_halo_jump = 0 };
if ( GRLIB_halo_param > 1 && ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) >= time ) exitWith {
	hint format [ localize "STR_HALO_DENIED_COOLDOWN", ceil ( ( ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) - time ) / 60 ) ];
};

createDialog "liberation_halo";
waitUntil { dialog };
dojump = 0;
halo_position = getPosATL _unit;

[ "halo_map_event", "onMapSingleClick", { halo_position = _pos } ] call BIS_fnc_addStackedEventHandler;
"spawn_marker" setMarkerTextLocal (localize "STR_HALO_PARAM");

while { dialog && alive _unit && dojump == 0 } do {
	"spawn_marker" setMarkerPosLocal halo_position;
	sleep 0.2;
};
closeDialog 0;

"spawn_marker" setMarkerPosLocal markers_reset;
"spawn_marker" setMarkerTextLocal "";
[ "halo_map_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;

if ( dojump > 0 ) then {
	halo_position = [ halo_position, floor(random 250), floor(random 360) ] call BIS_fnc_relPos;
	if (_unit isKindOf "LandVehicle") then {
		if ([GRLIB_AirDrop_Vehicle_cost] call F_pay) then {
			playSound "parasound";
			halo_position set [2, 400];
			_unit setPos halo_position; 
			[_unit, objNull] spawn F_addParachute;
			gamelogic globalChat format ["空投 %1 至 %2", [typeOf _unit] call F_getLRXName, halo_position];
		};
	} else {
		playSound "parasound";
		halo_position set [2, GRLIB_halo_altitude];
		GRLIB_last_halo_jump = round (time);
		halojumping = true;
		cutRsc ["fasttravel", "PLAIN", 1];
		[_unit, "hide"] remoteExec ["dog_action_remote_call", 2];
		sleep 2;

		private _player_pos = getPosATL _unit;
		private _units = units group _unit;
		private _my_squad = _unit getVariable ["my_squad", nil];
		if (!isNil "_my_squad") then { { _units pushBack _x } forEach units _my_squad };

		{
			if ( round (_x distance2D _player_pos) <= 30 && lifestate _x != 'INCAPACITATED' && vehicle _x == _x ) then {
				[_x, halo_position] spawn paraDrop;
				sleep (1 + floor(random 3));
			};
		} forEach _units;
	};
};
