if (!isServer && hasInterface) exitWith {};
params ["_unit"];

_targetsector = [sectors_allSectors, _unit] call F_nearestPosition;
[getMarkerPos _targetsector, GRLIB_side_friendly] spawn spawn_air;

_msg = format ["ָ�ӹ� <t color='#00008f'>%1</t>, ������<br/><br/>
<t color='#F00000'>����֧Ԯ</t><br/><br/>
λ��: <t color='#008000'>%2</t><br/>
<t size='0.7'>ף����� !!</t>", name _unit, markerText _targetsector];
[_msg, 0, 0, 10, 0, 0, 90] remoteExec ["BIS_fnc_dynamicText", 0];
sleep 7;
["lib_reinforcementsblu"] remoteExec ["bis_fnc_shownotification", 0];