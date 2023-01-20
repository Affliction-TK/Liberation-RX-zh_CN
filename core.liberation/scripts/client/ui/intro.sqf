waituntil {(time > 2) && (getClientStateNumber >= 10) && (getClientState == "BRIEFING READ")};
while {	(player getVariable ["GRLIB_score_set", 0] == 0) } do {
	titleText ["... 正在加载玩家数据 ...", "BLACK FADED", 100];
	uIsleep 2;
	titleText ["... 请等待 ...", "BLACK FADED", 100];
	uIsleep 2;
};

if ( isNil "cinematic_camera_started" ) then { cinematic_camera_started = false };

[] spawn cinematic_camera;

if (serverName == "DevSrv") then {
	GRLIB_introduction = false;
};

if ( GRLIB_introduction ) then {
	uisleep 2;
	cutRsc ["intro1","PLAIN",1,true];
	uisleep 2.5;
	cutRsc ["intro11","PLAIN",1,true];
	uisleep 2.5;
	cutRsc ["intro12","PLAIN",1,true];
	uisleep 2.5;
	cutRsc ["intro2","PLAIN",1,true];
	uisleep 8.5;
};

showcaminfo = true;
dostartgame = 0;
howtoplay = 0;

disableUserInput false;
disableUserInput true;
disableUserInput false;

waitUntil {
	sleep 0.1;
	( vehicle player == player && alive player && !dialog )
};

createDialog "liberation_menu";
waitUntil { dialog };

_noesckey = (findDisplay 5651) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];
waitUntil { dostartgame == 1 || howtoplay == 1 || !dialog };
disableUserInput true;
(findDisplay 5651) displayRemoveEventHandler ["KeyDown", _noesckey];
closeDialog 0;

if ( howtoplay == 1 ) then {
	[] call compileFinal preprocessFileLineNUmbers "scripts\client\ui\tutorial_manager.sqf";
};

cinematic_camera_started = false;
introDone = true;
dostartgame = 1;

// Load Player Context
waitUntil {sleep 1; GRLIB_player_spawned};
[player] remoteExec ["load_context_remote_call", 2];
