_id = (_this select 0);
_killer = _id select 0;
_victim = _id select 1;
_killWeapon  = _id select 2;
_distance = _id select 3;
_pic = _id select 4;
	
WeaponNameColor = "#FFCC00";
DistanceColor = "#FFCC00";	
killercolor = "#00ff00";
victimcolor = "#ff0000";

if ((name player) == _killer) then {
    _popup = format ["
			<t size='0.8' shadow='1' color='%2' shadowColor='#000000'>你击杀了 %1 | [%4m]</t>",
			_victim,
			killercolor,
			victimcolor,
			_distance];
    [_popup,0,0.8,2,0,0,7017] spawn bis_fnc_dynamicText;
};
   
if ((name player) == _victim) then {
    _popup = format ["
            <t size='1.5' shadow='1' color='%2' shadowColor='#000000'>%1</t>
            <t size='1.2' shadow='1' color='#FFFFFF' shadowColor='#000000'>击杀了</t>
            <t size='1.5' shadow='1' color='%3' shadowColor='#000000'>你</t><br/>
            <t size='1.2' shadow='1' color='#FFFFFF' shadowColor='#000000'>(</t>
            <t size='1.2' shadow='1' color='#FFCC00' shadowColor='#000000'>%4</t>
            <t size='1.2' shadow='1' color='#FFFFFF' shadowColor='#000000'>M)</t><br/>
			<img size='5' shadow='1' image='%5'/>",
            _killer,
            killercolor,
            victimcolor,
            _distance,
			_pic];
    [_popup,0,0.5,7,0,0,7017] spawn bis_fnc_dynamicText;
   };
		
__killfeedtemp = format["
	<t size='0.6'align='left'shadow='1'color='%5'>%1</t>
	<img size='0.6'align='left'shadow='1'image='%4'/>
	<t size='0.6'align='left'shadow='1'color='%6'>%2</t>
	<t size='0.6'align='left'shadow='1'color='%7'>[%3m]</t><br/>",
	_killer,
	_victim,
	_distance,
	_pic,
	killercolor,
	victimcolor,
	DistanceColor];
			
//_killfeedlist pushBack __killfeedtemp;
_killfeedshow =	__killfeedtemp; 

/*for "_i" from 0 to (count _myArray) -1 do {
	_killfeedshow = + (_killfeedlist select _i);
};*/
 
[_killfeedshow,[safezoneX + 0.8 * safezoneW,3.0],[safezoneY + 0.15 * safezoneH,0.5],3,0.2,0,7002] spawn BIS_fnc_dynamicText;
		 