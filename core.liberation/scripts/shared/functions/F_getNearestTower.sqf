params [ "_postosearch", "_side", "_limit" ];

private _sector_to_return = "";
private  _sectors_to_search = [];
if ( _side == GRLIB_side_enemy ) then {
	_sectors_to_search = (sectors_tower - blufor_sectors);
} else {
	_sectors_to_search = [ blufor_sectors , { _x in sectors_tower } ] call BIS_fnc_conditionalSelect;
};

_sectors_to_search = [ _sectors_to_search , { (markerPos _x) distance _postosearch < _limit } ] call BIS_fnc_conditionalSelect;

private _sectors_to_search_sorted = [ _sectors_to_search , [_postosearch] , { (markerPos _x) distance _input0 } , 'ASCEND' ] call BIS_fnc_sortBy;
if ( count _sectors_to_search_sorted > 0 ) then { _sector_to_return = _sectors_to_search_sorted select 0};

_sector_to_return;
