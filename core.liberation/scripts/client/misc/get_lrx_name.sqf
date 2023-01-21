params ["_class"];

if (isNil"_class") exitWith {};
if (typeName _class != "STRING") exitWith {};

private _text = getText (configFile >> "cfgVehicles" >> _class >> "displayName");

if ( _class == FOB_box_typename ) then {
	_text = localize "STR_FOBBOX";
};
if ( _class == Arsenal_typename ) then {
	_text = localize "STR_ARSENAL_BOX";
};
if ( _class == FOB_truck_typename ) then {
	_text = localize "STR_FOBTRUCK";
};
if ( _class == Respawn_truck_typename ) then {
	_text = format ["%1 %2", localize "STR_RESPAWN_TRUCK", "(Truck)"];
};
if ( _class == mobile_respawn ) then {
	_text = format ["%1 %2", localize "STR_RESPAWN_TRUCK", "(Tent)"];
};
if ( _class == huron_typename ) then {
	_text = format ["%1 %2", localize "STR_RESPAWN_TRUCK", "(Heli)"];
};
if ( _class == canister_fuel_typename ) then {
	_text = "油箱";
};
if ( _class == waterbarrel_typename ) then {
	_text = "水桶";
};
if ( _class == fuelbarrel_typename ) then {
	_text = "燃料桶";
};
if ( _class == foodbarrel_typename ) then {
	_text = "食品托盘";
};
if ( _class == fireworks_typename ) then {
	_text = "烟花盒";
};
if ( _class == FOB_box_outpost ) then {
	_text = localize "STR_OUTPOSTBOX";
};
if ( _class == playerbox_typename ) then {
	_text = "玩家个人箱";
};
_text;