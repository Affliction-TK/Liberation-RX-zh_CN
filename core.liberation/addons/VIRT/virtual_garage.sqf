﻿// LRX Virtual Garage
// by pSiKO

private _cfg = configFile >> "cfgVehicles";
private _myveh = [];
private _myveh_info = [];
private _myveh_lst = [];
private _max_vehicle = 5;
private _recycleable_blacklist = [];
{_recycleable_blacklist pushBack ( _x select 0 )} foreach (static_vehicles);

private _guid = getPlayerUID player;
private _refresh = true;
load_veh = 0;

createDialog "VIRT_vehicle_garage";
waitUntil { dialog };

while { dialog && alive player } do {
	_display = findDisplay 2301;
	ctrlEnable [ 120, false ];
	ctrlEnable [ 121, false ];

	if ( _refresh ) then {
		_refresh = false;

		_myveh_lst = [getPosATL player nearEntities [["LandVehicle","Air","Ship"], 150], {			
			alive _x && (count (crew _x) == 0 || typeOf _x in uavs) &&
			!([_x, "LHD", GRLIB_sector_size] call F_check_near) &&
			_x getVariable ["GRLIB_vehicle_owner", ""] == _guid &&
			!(typeOf _x in _recycleable_blacklist)
		}] call BIS_fnc_conditionalSelect;

		_myveh = [];
		_myveh_info = [];
		{_myveh pushBack [(typeOf _x), 0]} forEach _myveh_lst;  // veh list outside

		_i = 0;
		{
			if (_guid == _x select 3) then {
				_myveh pushBack [(_x select 0), 1, _i];
				_myveh_info pushBack _x;
				_i = _i + 1;			
			};
		} forEach GRLIB_garage;  // veh list inside

		lbClear 110;
		{
			_classnamevar = (_x select 0);
			_entrytext = getText (_cfg >> _classnamevar >> "displayName");
			_loctext = "";
			if (_x select 1 == 0 ) then {_loctext = "OUT" } else {_loctext = "IN"};
			(_display displayCtrl (110)) lnbAddRow [_entrytext, _loctext];

			_icon = getText ( _cfg >> (_x select 0) >> "icon");
			if(isText  (configFile >> "CfgVehicleIcons" >> _icon)) then {
				_icon = (getText (configFile >> "CfgVehicleIcons" >> _icon));
			};
			lnbSetPicture  [110, [((lnbSize 110) select 0) - 1, 0],_icon];

			if ( (_x select 1) == 0 ) then {
				(_display displayCtrl (110)) lnbSetColor [[((lnbSize 110) select 0) - 1, 0], [1,1,1,1]];
				(_display displayCtrl (110)) lnbSetColor [[((lnbSize 110) select 0) - 1, 1], [1,1,1,1]];
			} else {
				(_display displayCtrl (110)) lnbSetColor [[((lnbSize 110) select 0) - 1, 0], [0.4,0.4,0.4,1]];
				(_display displayCtrl (110)) lnbSetColor [[((lnbSize 110) select 0) - 1, 1], [0.4,0.4,0.4,1]];
			};
		} foreach _myveh;
	};

	if ( !isNil "GRLIB_garage_in_use" ) then { 
		hintSilent "车库繁忙 !!\n请稍后重试...";
		_refresh = true;
	} else {
		hintSilent "";

		if (count(_myveh) > 0) then {
			// Enable Button
			private _selected_item = lbCurSel 110;
			if (_selected_item != -1) then {
				_vehicle = _myveh select _selected_item;
				if ((_vehicle select 1) == 0) then {
					ctrlEnable [ 120, true ];
				} else {
					ctrlEnable [ 121, true ];
				};
			};

			if (load_veh != 0) then {
				private _color = "";
				private	_vehicle_name = (_display displayCtrl (110)) lnbText [_selected_item,0];

				// Load
				if (load_veh == 1) then {
					private _vehicle = _myveh_lst select _selected_item;
					private _timer = _vehicle getVariable ["GREUH_rearm_timer", 0];
					private _msg = format [ "%1\n重新武装冷却中 (%2 sec)\n请等待...", _vehicle_name, round (_timer - time) ];

					if (count ([_myveh_info, {(_guid == _x select 3)}] call BIS_fnc_conditionalSelect) >= _max_vehicle) exitWith { hintSilent (format [localize "STR_FULL_GARAGE", _max_vehicle]); sleep 2 };
					if (damage _vehicle != 0) exitWith { hintSilent "损坏的车辆不能存放 !"; sleep 2 };
					if (count (_vehicle getVariable ["GRLIB_ammo_truck_load", []]) > 0) exitWith { hintSilent localize "STR_CANT_PARK"; sleep 2 };
					if (count (crew _vehicle) > 0 && !(typeOf _vehicle in uavs)) exitWith { hintSilent localize "STR_CANT_PARKUAV"; sleep 2 };
					if (_timer >= time) exitWith { hintSilent _msg; sleep 2 };

					private _result = [localize "STR_ONLY_WEAPONS",localize "STR_WARNING", true, true] call BIS_fnc_guiMessage;
					if (_result) then {
						ctrlEnable [ 120, false ];
						[_vehicle, load_veh, _guid] remoteExec ["vehicle_garage_remote_call", 2];
						hintSilent (format [localize "STR_LOADED", _vehicle_name]);
					};
				};

				// Unload
				if (load_veh == 2) then {
					private _vehicle = (_myveh select _selected_item) select 2;
					ctrlEnable [ 121, false ];
					closeDialog 0;

					_veh_info = _myveh_info select _vehicle;
					_veh_class = _veh_info select 0;
					_color = _veh_info select 1;
					_ammo = _veh_info select 2;
					_lst_a3 = _veh_info select 4;
					_lst_r3f = _veh_info select 5;
					_compo = _veh_info select 6;
					buildtype = 10;
					build_unit = [_veh_class,_color,_ammo,_lst_a3,_lst_r3f,_compo];
					dobuild = 1;

					waitUntil {sleep 0.3; dobuild == 0};
					if (build_confirmed == 0) then {
						[_vehicle, load_veh, _guid] remoteExec ["vehicle_garage_remote_call", 2];
						hintSilent (format ["载具： %1\n从车库中取出.", getText (configFile >> "cfgVehicles" >> _veh_class >> "displayName")]);
					};
				};
				sleep 2;
				_refresh = true;
				load_veh = 0;
			};
		};
	};
	sleep 0.3;
};
