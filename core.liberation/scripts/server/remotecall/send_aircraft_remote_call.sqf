if (!isServer && hasInterface) exitWith {};
params ["_unit"];

_targetsector = [sectors_allSectors, _unit] call F_nearestPosition;
[getMarkerPos _targetsector, GRLIB_side_friendly] spawn spawn_air;

_msg = format ["指挥官 <t color='#00008f'>%1</t>, 请求了<br/><br/>
<t color='#F00000'>空中支援</t><br/><br/>
位于: <t color='#008000'>%2</t><br/>
<t size='0.7'>祝你好运 !!</t>", name _unit, markerText _targetsector];
[_msg, 0, 0, 10, 0, 0, 90] remoteExec ["BIS_fnc_dynamicText", 0];
sleep 7;
["lib_reinforcementsblu"] remoteExec ["bis_fnc_shownotification", 0];