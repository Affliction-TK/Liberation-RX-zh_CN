﻿// *** GLOBAL DEFINITIOON ***

markers_reset = [99999,99999,0];
zeropos = [0,0,0];

// All Object classname used in LRX must be declared here

// *** DEFAULT ***
[] call compileFinal preprocessFileLineNUmbers format ["scripts\shared\default_classnames.sqf"];

// *** FRIENDLIES ***
[] call compileFinal preprocessFileLineNUmbers format ["mod_template\%1\classnames_west.sqf", GRLIB_mod_west];
if (isServer) then {
	[] call F_calcUnitsCost;
	publicVariable "infantry_units";
} else { waitUntil {sleep 0.1; !isNil "infantry_units"} };

// *** BADDIES ***
[] call compileFinal preprocessFileLineNUmbers format ["mod_template\%1\classnames_east.sqf", GRLIB_mod_east];

if (GRLIB_side_friendly == GRLIB_side_enemy) exitWith {
abort_loading_msg = format [
	"********************************\n
	FATAL! - Invalid Faction selection !\n\n
	Both faction use the same side (%1)\n\n
	Loading Aborted to protect data integrity.\n
	Correct the Side selection.\n
	*********************************", GRLIB_side_friendly];
	abort_loading = true;
};

// *** COLORS ***
// Default WEST
GRLIB_color_friendly = "ColorBLUFOR";

if (GRLIB_side_friendly == EAST) then {
	GRLIB_color_friendly = "ColorOPFOR";
};
if (GRLIB_side_friendly == INDEPENDENT) then {
	GRLIB_color_friendly = "colorIndependent";
};

// Default EAST
GRLIB_color_enemy = "ColorOPFOR";
GRLIB_color_enemy_bright = "ColorRED";

if (GRLIB_side_enemy == WEST) then {
	GRLIB_color_enemy = "ColorBLUFOR";
	GRLIB_color_enemy_bright = "ColorBlue";
};
if (GRLIB_side_enemy == INDEPENDENT) then {
	GRLIB_color_enemy = "colorIndependent";
	GRLIB_color_enemy_bright = "ColorGreen";
};

// *** CIVILIAN ***
[] call compileFinal preprocessFileLineNUmbers format ["mod_template\%1\classnames_civ.sqf", GRLIB_mod_west];

// *** INDEPENDENT ***
ind_recyclable = [
	["I_HMG_01_high_F",0,round (80 / GRLIB_recycling_percentage),0],
	["I_GMG_01_high_F",0,round (80 / GRLIB_recycling_percentage),0],
	["I_static_AA_F",0,round (80 / GRLIB_recycling_percentage),0],
	["I_static_AT_F",0,round (80 / GRLIB_recycling_percentage),0],
	["I_Mortar_01_F",0,round (300 / GRLIB_recycling_percentage),0],
	["I_Truck_02_covered_F",0,round (20 / GRLIB_recycling_percentage),0],
	["I_Truck_02_transport_F",0,round (20 / GRLIB_recycling_percentage),0],
	["I_Heli_light_03_dynamicLoadout_F",0,round (20 / GRLIB_recycling_percentage),0]
];

// *** MILITIA ***
[] call compileFinal preprocessFileLineNumbers "scripts\loadouts\init_loadouts.sqf";
if ( isNil "militia_squad" ) then {
	militia_squad = [
		"O_G_Soldier_SL_F",
		"O_G_Soldier_A_F",
		"O_G_Soldier_AR_F",
		"O_G_Soldier_AR_F",	
		"O_G_medic_F",
		"O_G_engineer_F",
		"O_G_Soldier_exp_F",
		"O_G_Soldier_GL_F",
		"O_G_Soldier_M_F",
		"O_G_Soldier_F",
		"O_G_Soldier_LAT_F",
		"O_G_Soldier_LAT_F",	
		"O_G_Soldier_lite_F",
		"O_G_Sharpshooter_F",
		"O_G_Soldier_TL_F",
		"O_Soldier_AA_F",
		"O_Soldier_AT_F"
	];
};

if ( isNil "militia_loadout_overide" ) then {
	militia_loadout_overide = [
		"O_Soldier_AA_F",
		"O_Soldier_AT_F"
	];
};

if ( isNil "militia_vehicles" ) then {
	militia_vehicles = [
		"O_G_Offroad_01_armed_F",
		"O_G_Offroad_01_armed_F",
		"O_G_Offroad_01_AT_F",
		"I_C_Offroad_02_LMG_F",
		"O_LSV_02_armed_F",
		"O_LSV_02_AT_F"
	];
};

// *** SUPPORT ***
// [CLASSNAME, MANPOWER, AMMO, FUEL, RANK]
support_box_noArsenal = [
	Box_Weapon_typename,
	Box_Ammo_typename,
	Box_Support_typename,
	Box_Launcher_typename,
	Box_Special_typename
];
support_vehicles = [
	[Arsenal_typename,0,35,0,0]
];

if (!GRLIB_enable_arsenal) then {
	Arsenal_typename = Box_Weapon_typename;
	support_vehicles = [
		[Arsenal_typename,0,180,0,0],
		[Box_Ammo_typename,0,0,0,0],
		[Box_Support_typename,0,250,0,GRLIB_perm_inf],
		[Box_Launcher_typename,0,200,0,GRLIB_perm_log],
		[Box_Special_typename,0,225,0,GRLIB_perm_tank]
	];
};

support_vehicles = support_vehicles + [
	[medicalbox_typename,5,25,0,0],
	[mobile_respawn,10,50,0,0],
	[canister_fuel_typename,0,25,10,0],
	[playerbox_typename,0,0,0,20],
	[Respawn_truck_typename,15,150,5,GRLIB_perm_log],
	["Land_RepairDepot_01_civ_F",10,300,0,GRLIB_perm_log],
	["Land_MedicalTent_01_MTP_closed_F",5,150,0,GRLIB_perm_log],
	[repair_sling_typename,10,300,0,GRLIB_perm_log],
	[fuel_sling_typename,0,150,60,GRLIB_perm_log],
	[ammo_sling_typename,0,600,0,GRLIB_perm_log],
	[medic_sling_typename,0,150,0,GRLIB_perm_log],
	[ammo_truck_typename,5,600,10,GRLIB_perm_tank],
	[repair_truck_typename,0,300,30,GRLIB_perm_tank],
	[fuel_truck_typename,5,150,70,GRLIB_perm_tank],
	[FOB_box_outpost,5,500,20,GRLIB_perm_log],
	[FOB_box_typename,10,1500,40,GRLIB_perm_max],
	[FOB_truck_typename,50,1500,50,GRLIB_perm_max],
	[fireworks_typename,0,500,0,GRLIB_perm_max],
	[ammobox_b_typename,0,round(300 / GRLIB_recycling_percentage),0,99999],
	[ammobox_o_typename,0,round(300 / GRLIB_recycling_percentage),0,99999],
	[ammobox_i_typename,0,round(300 / GRLIB_recycling_percentage),0,99999],
	[A3W_BoxWps,0,round(150 / GRLIB_recycling_percentage),0,99999],
	[waterbarrel_typename,0,round(100 / GRLIB_recycling_percentage),0,99999],
	[fuelbarrel_typename,0,round(60 / GRLIB_recycling_percentage),30,99999],
	[foodbarrel_typename,0,round(100 / GRLIB_recycling_percentage),0,99999]
] + support_vehicles_west;

// *** BUILDINGS ***
buildings = [[FOB_sign,0,0,0,99999]];
if (isNil "buildings_west_overide") then {
	buildings append buildings_default + buildings_west;
} else {
	buildings append buildings_west;
};

// *** SIMPLE OBJECTS ***
simple_objects = [
	"Land_ClutterCutter_large_F",
	"Land_PortableHelipadLight_01_F"
];

// *** ELITES ***
elite_vehicles = [];
{ if (_x select 4 == GRLIB_perm_max) then { elite_vehicles pushback (_x select 0)} } foreach light_vehicles + heavy_vehicles + air_vehicles + static_vehicles;

// *** Boats ***
boats_names = [
	"C_Scooter_Transport_01_F",
	"C_Boat_Civil_01_F",
	"C_Boat_Transport_02_F",
	"B_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F"
] + opfor_boats + boats_west;

boats_names_civ = [
	"C_Scooter_Transport_01_F",
	"C_Boat_Civil_01_F",
	"C_Boat_Transport_02_F",
	"C_Boat_Civil_01_police_F",
	"C_Boat_Civil_01_rescue_F"
];

// *** LRX - A3W ***
if ( isNil "guard_squad" ) then {
	guard_squad = [
		"O_GEN_Commander_F",
		"O_GEN_Soldier_F",
		"O_GEN_Soldier_F",
		"O_GEN_Soldier_F",
		"O_GEN_Soldier_F"
	];
};
if ( isNil "guard_loadout_overide" ) then {
	guard_loadout_overide = [
		"O_GEN_Commander_F"
	];
};

if ( isNil "divers_squad" ) then {
	divers_squad = [
		"O_diver_TL_F",
		"O_diver_TL_F",
		"O_diver_exp_F",
		"O_diver_exp_F",
		"O_diver_exp_F",
		"O_diver_F",
		"O_diver_F",
		"O_diver_F",
		"O_diver_F",
		"O_diver_F"
	];
};

if ( isNil "resistance_squad" ) then {
	resistance_squad = [
		"I_G_Soldier_SL_F",
		"I_G_Soldier_A_F",
		"I_G_Soldier_AR_F",
		"I_G_medic_F",
		"I_G_Soldier_exp_F",
		"I_G_Soldier_GL_F",
		"I_G_Soldier_M_F",
		"I_G_Soldier_F",
		"I_G_Soldier_LAT_F",
		"I_G_Soldier_lite_F",
		"I_G_Sharpshooter_F",
		"I_G_Soldier_TL_F"
	];
};

if ( isNil "resistance_squad_static" ) then {
	resistance_squad_static = "I_static_AA_F";
};

// *** SOURCES ***

// Static Weapons
list_static_weapons = [resistance_squad_static] + opfor_statics;
{
	private _veh = _x select 0;
	if (!(_veh in uavs)) then { list_static_weapons pushback _veh };
} foreach static_vehicles;

// Everything the AI troups should be able to resupply from
ai_resupply_sources = [
	Arsenal_typename,
	ammo_truck_typename,
	ammo_sling_typename,
	Box_Ammo_typename
] + ai_resupply_sources_west;

// Everything the AI troups should be able to healing from
ai_healing_sources = [
	Respawn_truck_typename,
	medicalbox_typename,
	medic_sling_typename,
	"Land_MedicalTent_01_MTP_closed_F"
] + ai_healing_sources_west;

// Everything the AI vehicle should be able to reammo from
vehicle_rearm_sources = [
	ammo_truck_typename,
	ammo_sling_typename,
	ammobox_b_typename,
	ammobox_o_typename,
	ammobox_i_typename
] + vehicle_rearm_sources_west;

// Everything the AI vehicle should be able to repair from
vehicle_repair_sources = [
	repair_sling_typename,
	repair_truck_typename,
	"B_APC_Tracked_01_CRV_F",
	"C_Offroad_01_repair_F",
	"B_G_Offroad_01_repair_F",
	"Land_RepairDepot_01_civ_F"
];

// *** TRANSPORT CONFIG ***
box_transport_config = [];
box_transport_offset = [];

[] call compileFinal preprocessFileLineNUmbers format ["mod_template\%1\classnames_transport.sqf", GRLIB_mod_west];
[] call compileFinal preprocessFileLineNUmbers format ["mod_template\%1\classnames_transport.sqf", GRLIB_mod_east];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config = [
	[ "C_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "B_G_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "I_G_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "O_G_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "O_Truck_03_transport_F", -6.5, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4] ],
	[ "B_Truck_01_transport_F", -6.5, [0, -0.4, 0.4], [0, -2.1, 0.4], [0, -3.8, 0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0, -0.4, 0.4], [0, -2.1, 0.4], [0, -3.8, 0.4] ],
	[ "B_Truck_01_medical_F", -6.5, [0, -0.4, 0.4], [0, -2.1, 0.4], [0, -3.8, 0.4] ],
	[ "B_Heli_Transport_03_F", -7.5, [0, 2.2, -1], [0, 0.8, -1], [0, -1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0, 2.2, -1], [0, 0.8, -1], [0, -1.0, -1] ],
	[ "I_Truck_02_transport_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "I_Truck_02_covered_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "C_Truck_02_transport_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "C_Truck_02_covered_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "C_Van_01_box_F", -5.3, [0, -1.05, 0.2], [0, -2.6, 0.2] ],
	[ "C_Van_01_transport_F", -5.3, [0, -1.05, 0.2], [0, -2.6, 0.2] ]
] + box_transport_config;

transport_vehicles = [];
{transport_vehicles pushBack ( _x select 0 )} foreach (box_transport_config);

// Additional offset per object
// objects in this list can be loaded on vehicle position defined above
box_transport_offset = [
	["B_supplyCrate_F", [0, 0, 0] ],
	["Box_NATO_Wps_F", [0, 0, -0.6] ],
	["Box_NATO_Ammo_F", [0, 0, -0.6] ],
	["Box_NATO_Support_F", [0, 0, -0.6] ],
	["Box_NATO_WpsSpecial_F", [0, 0, -0.6] ],
	["Box_NATO_WpsLaunch_F", [0, 0, -0.6] ],
	["Box_NATO_AmmoVeh_F", [0, 0, 0] ],
	["Box_East_AmmoVeh_F", [0, 0, 0] ],
	["Box_IND_AmmoVeh_F", [0, 0, 0] ],
	["Land_BarrelWater_F", [0, 0, -0.4] ],
	["Land_MetalBarrel_F", [0, 0, -0.4] ],
	["Land_FoodSacks_01_large_brown_idap_F", [0, 0, -0.4] ]
] + box_transport_offset;

box_transport_loadable = [];
{box_transport_loadable pushBack ( _x select 0 )} foreach (box_transport_offset);

// Big_units
vehicle_big_units = [
	"Land_Cargo_Tower_V1_F",
	"B_T_VTOL_01_infantry_F",
	"B_T_VTOL_01_vehicle_F",
	"B_T_VTOL_01_armed_F",
	"O_T_VTOL_01_infantry_F",
	"O_T_VTOL_01_vehicle_F",
	"O_T_VTOL_01_armed_F",
	"Land_SM_01_shed_F",
	"Land_Hangar_F"
] + vehicle_big_units_west;

// Whitelist Vehicle (recycle)
GRLIB_vehicle_whitelist = [
	ammobox_b_typename,
	ammobox_o_typename,
	ammobox_i_typename,
	mobile_respawn,
	A3W_BoxWps,
	canister_fuel_typename,
	waterbarrel_typename,
	fuelbarrel_typename,
	foodbarrel_typename,
	medicalbox_typename
] + GRLIB_vehicle_whitelist_west + opfor_statics;

// Blacklist Vehicle (lock, paint, delete)
GRLIB_vehicle_blacklist = [
	FOB_sign,
	ammobox_b_typename,
	ammobox_o_typename,
	ammobox_i_typename,
	canister_fuel_typename,
	waterbarrel_typename,
	fuelbarrel_typename,
	foodbarrel_typename,
	medicalbox_typename,
	fireworks_typename
] + GRLIB_vehicle_blacklist_west;

// Recycleable objects
GRLIB_recycleable_blacklist = [FOB_sign];
GRLIB_recycleable_classnames = ["LandVehicle","Air","Ship","StaticWeapon","Slingload_01_Base_F","Pod_Heli_Transport_04_base_F"];
{
	if (!((_x select 0) in GRLIB_recycleable_blacklist)) then {GRLIB_recycleable_classnames pushBack (_x select 0)};
} foreach (support_vehicles + buildings + opfor_recyclable);

// Filter Mods
infantry_units = [ infantry_units ] call F_filterMods;
light_vehicles = [ light_vehicles ] call F_filterMods;
heavy_vehicles = [ heavy_vehicles ] call F_filterMods;
air_vehicles = [ air_vehicles ] call F_filterMods;
support_vehicles = [ support_vehicles ] call F_filterMods;
static_vehicles = [ static_vehicles ] call F_filterMods;
buildings = [ buildings ] call F_filterMods;
build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];
militia_squad = [ militia_squad , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
militia_vehicles = [ militia_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles = [ opfor_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [ opfor_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [ opfor_battlegroup_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [ opfor_battlegroup_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports_truck = [ opfor_troup_transports_truck , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports_heli = [ opfor_troup_transports_heli , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_air = [ opfor_air , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilians = [ civilians , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilian_vehicles = [ civilian_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
opfor_squad_low_intensity = [
	opfor_squad_leader,
	opfor_medic,
	opfor_rpg,
	opfor_marksman,
	opfor_sentry,
	opfor_sentry,
	opfor_sentry
];
opfor_squad_8_standard = [
	opfor_squad_leader,
	opfor_medic,
	opfor_machinegunner,
	opfor_rpg,
	opfor_heavygunner,
	opfor_sharpshooter,
	opfor_marksman,
	opfor_grenadier
];
opfor_squad_8_infkillers = [
	opfor_squad_leader,
	opfor_medic,
	opfor_machinegunner,
	opfor_heavygunner,
	opfor_marksman,
	opfor_sniper,
	opfor_sharpshooter,
	opfor_rifleman,
	opfor_rifleman,
	opfor_rpg
];
opfor_squad_8_tankkillers = [
	opfor_squad_leader,
	opfor_medic,
	opfor_machinegunner,
	opfor_rpg,
	opfor_rpg,
	opfor_at,
	opfor_at,
	opfor_at
];
opfor_squad_8_airkillers = [
	opfor_squad_leader,
	opfor_medic,
	opfor_machinegunner,
	opfor_rpg,
	opfor_aa,
	opfor_aa,
	opfor_aa,
	opfor_aa
];
all_resistance_troops = [] + militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_troup_transports_heli + opfor_troup_transports_truck + opfor_vehicles_low_intensity + opfor_statics + opfor_boats);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_troup_transports_heli;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
squads_names = [
	localize "STR_LIGHT_RIFLE_SQUAD",
	localize "STR_RIFLE_SQUAD",
	localize "STR_AT_SQUAD",
	localize "STR_AA_SQUAD",
	localize "STR_MIXED_SQUAD"
];
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];
GRLIB_rank_level = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
GRLIB_ignore_colisions = [
	huron_typename,
	Arsenal_typename,
	mobile_respawn,
	canister_fuel_typename,
	medicalbox_typename,
	fireworks_typename,
	"Helper_Base_F",
	"Blood_01_Base_F",
	"MedicalGarbage_01_Base_F",
  	"ReammoBox_F",
	"StaticMGWeapon",
	"StaticGrenadeLauncher",
	"StaticMortar",
	"CamoNet_BLUFOR_open_F",
	"CamoNet_BLUFOR_big_F",
	"Land_NavigLight",
	"Lamps_base_F",
	"Land_HelipadSquare_F",
	"PowerLines_base_F",
	"PowerLines_Small_base_F",
	"PowerLines_Wires_base_F",
	"Land_ClutterCutter_large_F",
 	"Land_PowLine_wire_BB_EP1",
 	"Land_PowLine_wire_AB_EP1",
 	"Land_PowLine_wire_A_left_EP1",
 	"Land_PowLine_wire_A_right_EP1"
];

// Ammobox you want keep contents
GRLIB_Ammobox_keep = [
	A3W_BoxWps,
	playerbox_typename,
	medicalbox_typename,
	Box_Weapon_typename,
	Box_Ammo_typename,
	Box_Support_typename,
	Box_Launcher_typename,
	Box_Special_typename,
	"mission_USLaunchers",
	"CUP_LocalBasicWeaponsBox",
	"gm_AmmoBox_1000Rnd_762x51mm_ap_DM151_g3"
];

GRLIB_player_grave = [
	"Land_Grave_rocks_F",
	"Land_Grave_forest_F",
	"Land_Grave_dirt_F"
];

// Air Drop Support
if ( isNil "GRLIB_AirDrop_Taxi_cost" ) then {
	GRLIB_AirDrop_Taxi_cost = 100;
};

if ( isNil "GRLIB_AirDrop_1" ) then {
	GRLIB_AirDrop_1 = [
		"I_Quadbike_01_F",
		"I_G_Offroad_01_F",
		"I_G_Quadbike_01_F",
		"C_Offroad_01_F",
		"B_G_Offroad_01_F"
	];
};
if ( isNil "GRLIB_AirDrop_1_cost" ) then {
	GRLIB_AirDrop_1_cost = 50;
};

if ( isNil "GRLIB_AirDrop_2" ) then {
	GRLIB_AirDrop_2 = [
		"I_G_Offroad_01_armed_F",
		"B_G_Offroad_01_armed_F",
		"O_G_Offroad_01_armed_F",
		"I_C_Offroad_02_LMG_F"
	];
};
if ( isNil "GRLIB_AirDrop_2_cost" ) then {
	GRLIB_AirDrop_2_cost = 100;
};

if ( isNil "GRLIB_AirDrop_3" ) then {
	GRLIB_AirDrop_3 = [
		"I_MRAP_03_hmg_F",
		"I_MRAP_03_gmg_F",
		"B_T_MRAP_01_hmg_F",
		"B_T_MRAP_01_gmg_F"
	];
};
if ( isNil "GRLIB_AirDrop_3_cost" ) then {
	GRLIB_AirDrop_3_cost = 200;
};

if ( isNil "GRLIB_AirDrop_4" ) then {
	GRLIB_AirDrop_4 = [
		"B_Truck_01_transport_F",
		"B_Truck_01_covered_F",
		"I_Truck_02_covered_F",
		"I_Truck_02_transport_F"
	];
};
if ( isNil "GRLIB_AirDrop_4_cost" ) then {
	GRLIB_AirDrop_4_cost = 300;
};

if ( isNil "GRLIB_AirDrop_5" ) then {
	GRLIB_AirDrop_5 = [
		"I_APC_Wheeled_03_cannon_F",
		"I_APC_tracked_03_cannon_F",
		"B_APC_Wheeled_03_cannon_F",
		"B_APC_Wheeled_01_cannon_F"
	];
};
if ( isNil "GRLIB_AirDrop_5_cost" ) then {
	GRLIB_AirDrop_5_cost = 750;
};

if ( isNil "GRLIB_AirDrop_6" ) then {
	GRLIB_AirDrop_6 = [
		"C_Boat_Civil_01_F",
		"C_Boat_Transport_02_F",
		"B_Boat_Transport_01_F",
		"I_C_Boat_Transport_02_F"
	];
};
if ( isNil "GRLIB_AirDrop_6_cost" ) then {
	GRLIB_AirDrop_6_cost = 250;
};
if ( isNil "GRLIB_AirDrop_7_cost" ) then {
	GRLIB_AirDrop_7_cost = 2000;
};
