/*
 Say hello, and set Rank/Insigna
*/
waitUntil {sleep 1;GRLIB_player_spawned};

private _score = [player] call F_getScore;
private _rank = player getVariable ["GRLIB_Rank", "Private"];
private _ammo_collected = player getVariable ["GREUH_ammo_count",0];

// first time notice
if (_score == 0) then {	createDialog "liberation_notice" };

// set Rank
[] call set_rank;

private _msg = format ["欢迎 <t color='#00008f'>%1</t> !<br/><br/>
你的等级 : <t color='#000080'>%2</t><br/>
你的得分 : <t color='#008000'>%3</t><br/>
你的弹药 : <t color='#800000'>%4</t>", name player, _rank, _score, _ammo_collected];
[_msg, 0, 0, 10, 0, 0, 90] spawn BIS_fnc_dynamicText;
