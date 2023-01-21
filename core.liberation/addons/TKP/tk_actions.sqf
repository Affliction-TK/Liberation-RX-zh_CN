params ["_killer", "_unit"];

if (player != _killer || ([] call is_admin)) exitWith {};
private _kill = BTC_logic getVariable [getPlayerUID player, 0];

if (!isNil "_unit") then {
	private _msg = format [localize "STR_TK_INFO2", name _unit];
	[_msg, 0, 0, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
	sleep 5;
};

switch (true) do {
	case (_kill < GRLIB_tk_count) : {
		waitUntil {!(isNull (findDisplay 46))};
		private _msg = format ["停止友军误击行为!!<br/><br/>剩余警告次数： %1", (GRLIB_tk_count - _kill)];
		[_msg, 0, 0, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
		player setDamage 0.7;
	};

	case (_kill == GRLIB_tk_count) : {
		waitUntil {!(isNull (findDisplay 46))};
		private _msg = format ["停止友军误击行为, <t color='#ff0000'>这是最后一次警告！</t>"];
		[_msg, 0, 0, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
		player setDamage 0.7;
	};

	case (_kill > GRLIB_tk_count) : {
		closeDialog 0;
		closeDialog 0;
		closeDialog 0;
		GRLIB_introduction = false;
		cinematic_camera_started = false;
		sleep 1;
		waitUntil {!(isNull (findDisplay 46))};
		player enableSimulationGlobal false;
		disableUserInput true;
		createDialog "deathscreen";
		waitUntil { dialog };
		player setpos [0,0,0];
		_noesckey = (findDisplay 5651) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];
		ctrlSetText [4867, "你被禁封了"];
		sleep 3;
		ctrlSetText [4867, "由于恶意行为..."];
		sleep 3;
		ctrlSetText [4867, "...你不再"];
		sleep 3;
		ctrlSetText [4867, "被允许进入."];
		sleep 3;
		ctrlSetText [4867, ""];
		sleep 3;
		disableUserInput false;
		disableUserInput true;
		disableUserInput false;
		(findDisplay 5651) displayRemoveEventHandler ["KeyDown", _noesckey];
		endMission "LOSER";
		sleep 300;
	};
};
