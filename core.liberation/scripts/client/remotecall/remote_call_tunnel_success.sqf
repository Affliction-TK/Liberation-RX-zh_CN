params [ "_position", "_bonus" ];

if (isDedicated || (!hasInterface && !isServer)) exitWith {};

private _msg = format ["你胜利了 !<br/>这个 <t color='#008f00'>游击队</t> 隧道 <t color='#008f00'>%1</t>,<br/><br/>
已经成功 <t color='#00008f'>清理</t> !!<br/>
接受你的奖励: <t color='#8f0000'>%2 XP</t>.<br/><br/>谢谢你的帮助.", _position, _bonus];
[_msg, 0, 0, 10, 0, 0, 90] spawn BIS_fnc_dynamicText;

playSound "taskSucceeded";
