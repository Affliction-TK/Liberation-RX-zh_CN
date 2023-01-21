﻿if (!isServer && hasInterface) exitWith {};
params [ "_unit", "_class" ];
{
	if ((_unit distance2D _x) <= 500) then {["parasound"] remoteExec ["playSound", owner _x]};
} forEach (AllPlayers - (entities "HeadlessClient_F"));

_pos = (getPosATL _unit) vectorAdd [0, 0, 400];
_veh = createVehicle [_class, _pos, [], 0, "NONE"];
_veh addMPEventHandler ["MPKilled", { _this spawn kill_manager }];
_veh setdir (random 360);
_text = format ["玩家 %1 呼叫了空中支援.  正在投放: %2 !", name _unit, [_class] call get_lrx_name];
[gamelogic, _text] remoteExec ["globalChat", 0];
[_veh, objNull] spawn F_addParachute;
diag_log format [ "空投车辆 %1 | 位于 %2", _class , time ];