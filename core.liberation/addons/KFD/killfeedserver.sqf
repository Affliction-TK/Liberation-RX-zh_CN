/*private _killfeedlist = [];			//暂存数组
GlobalVariable = _killfeedlist;
publicVariable "GlobalVariable";

private _killfeedshow = "";			//最终显示
GlobalVariable = _killfeedshow;
publicVariable "GlobalVariable";*/

addMissionEventHandler ["EntityKilled", 
{
			_killerName = "";
			_victimName = "";
	
			_victim = _this select 0;
			_killer = _this select 1;
			
			if (!(_victim isKindOf "AllVehicles")) exitWith {};
			
			if (!(isplayer _killer)) then {
				_killerName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _killer] >> "Displayname");
				if(vehicle _killer != _killer) then {_killerName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _killer] >> "Displayname")};
			}else{_killerName = name _killer;};

			if (!(isplayer _victim)) then {
				_victimName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _victim] >> "Displayname");
				if(vehicle _victim != _victim) then {_victimName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _victim] >> "Displayname")};
			}else{_victimName = name _victim;};
	
			_weapon = currentWeapon _killer;
			_txt = gettext (configFile >> "cfgWeapons" >> _weapon >> "displayName");
			_pic = gettext (configFile >> "cfgWeapons" >> _weapon >> "picture");
			if (_pic == "") then {
				_weapon = typeOf (vehicle _killer);
				_pic = (getText (configFile >> "cfgVehicles" >> _weapon >> "picture"));
			};
			_dist = round (_victim distance _killer);
			if (_killer == _victim) exitWith{};
		
			catgivegames_kill_feed = [_killerName, _victimName, _txt, _dist, _pic];
			[catgivegames_kill_feed] remoteExec ["catgg_fnc_killfeed",0,false];
	}
];

/*_killfeedcount = count _killfeedlist;	//获取数组长度

while { _killfeedcount >= 1 } do		//每间隔4秒删除列表首项
{
	sleep 1;
	_killfeedlist deleteAt 0;
	sleep 4;
};*/
