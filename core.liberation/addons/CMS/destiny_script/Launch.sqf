#define DESTINY_HUD_speed ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98101)
#define DESTINY_HUD_HUD ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98102)
#define DESTINY_HUD_Mode ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98103)
#define DESTINY_HUD_Distance ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98104)
#define DESTINY_HUD_Radar ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98105)
closeDialog 669988;
DESTINY_Y = 0;
DESTINY_P = 0;
DESTINY_R = 0;
destiny_var_Sensitivity = 10;
Destiny_fnc_Effect = {
   _PP_colorI = ppEffectCreate ["ColorInversion",2501]; 
   _PP_colorI ppEffectEnable true; 
   _PP_colorI ppEffectAdjust [1,1,1]; 
   _PP_colorI ppEffectCommit 0; 
   _PP_colorI ppEffectForceInNVG true; 
   
   _PP_chrom = ppEffectCreate ["ChromAberration",200]; 
   _PP_chrom ppEffectEnable true; 
   _PP_chrom ppEffectAdjust [0.004,0.004,true]; 
   _PP_chrom ppEffectCommit 0; 
   _PP_chrom ppEffectForceInNVG true; 

   _PP_colorC = ppEffectCreate ["ColorCorrections",2500]; 
   _PP_colorC ppEffectEnable true; 
   _PP_colorC ppEffectAdjust [1,0.5, 0, [0, 0, 0, 0], [1, 1, 1, 0], [1, 1, 1, 0]]; 
   _PP_colorC ppEffectCommit 0; 
   _PP_colorC ppEffectForceInNVG true; 

   _PP_dynamic = ppEffectCreate ["DynamicBlur",500]; 
   _PP_dynamic ppEffectEnable true; 
   _PP_dynamic ppEffectAdjust [0.25]; 
   _PP_dynamic ppEffectCommit 0; 
   _PP_dynamic ppEffectForceInNVG true; 

    _PP_film = ppEffectCreate ["FilmGrain",2000]; 
    _PP_film ppEffectEnable true; 
    _PP_film ppEffectAdjust [1,.75,1,0.25,.25,true]; 
    _PP_film ppEffectCommit 0; 
    _PP_film ppEffectForceInNVG true; 
    [_PP_colorI,_PP_chrom,_PP_colorC,_PP_dynamic,_PP_film];
};
//初始发射阶段摄像头
DESTINY_fnc_createCAM = {
    Destiny_cam = "camera" camCreate getPosASL (_this # 0);
    Destiny_cam cameraEffect ["External", "BACK"];
    Destiny_cam camSetTarget (_this # 1);   //设置摄像头锁定的物体
    Destiny_cam camSetRelPos (_this # 2);   //设置发射阶段摄像头位置
    showCinemaBorder false;                 //不显示电影边框
    false setCamUseTI 0;                    //显示夜视效果
    Destiny_cam camCommit 0;
    cameraEffectEnableHUD true;
    sleep 3.5;
};
[_this # 0,_this # 1] spawn {
    DESTINY_VLS_DAODAN = _this # 1;
    EXIT_SCRIPT = false;
    cutText ["","BLACK OUT"];
    _TypePos = [0,0,1000];
    DESTINY_obj = "ammo_Missile_Cruise_01" createVehicle _TypePos;
    DESTINY_obj enableSimulation false;
    sleep 0.5;
	cutText ["","PLAIN"];
    _objUpVector = vectorUp DESTINY_VLS_DAODAN;
    _dirVector = vectorDir DESTINY_VLS_DAODAN;
    _oldPOS = getPosASL DESTINY_VLS_DAODAN;
    deleteVehicle DESTINY_VLS_DAODAN;
    DESTINY_obj setVectorDirAndUp [_dirVector,_objUpVector];
    DESTINY_obj setPosASL _oldPOS; 
    DESTINY_obj enableSimulation true;
	cutText ["","BLACK OUT"];
    [DESTINY_obj,DESTINY_obj,[10,50,10],false] call DESTINY_fnc_createCAM;
                                  

    _lastpos = getPosASL DESTINY_obj;
    _dir = getDir DESTINY_obj;
    DESTINY_Radar = 4000;
    _handlerID = addMissionEventHandler ["Draw3D", {
        {
            if ((alive _x) and (DESTINY_obj distance _x) <= DESTINY_Radar and (side group player) != (side group _x)) then {

                _M = format["%1米 ",round (DESTINY_obj distance _x)];
                if ((vehicle _x) != _x) then {
                    drawIcon3D ["a3\ui_f\data\gui\Cfg\Hints\icon_text\n_unknown_ca.paa", [1,1,1,1], ASLToAGL getPosASL _x, 1, 1, 45, _M + "[载具]",0, 0.03, "PuristaMedium","center",true];
                }else{
                    drawIcon3D ["a3\ui_f\data\gui\Cfg\Cursors\scroll_gs.paa", [1,1,1,1], ASLToAGL getPosASL _x, 1, 1, 45,_M + "[步兵]", 1, 0.03, "PuristaMedium","center",true];
                };
                
            };
        } forEach allUnits;
    }];

    setMousePosition [0.5, 0.5];
		X = 0.5;
		Y = 0.5;
        _lastpos = getPosASL DESTINY_obj;
        _dir = getDir DESTINY_obj;
        _EventHead = addMissionEventHandler ["EachFrame", {
			DESTINY_Y = X * destiny_var_Sensitivity;
			DESTINY_P = Y * destiny_var_Sensitivity;

            DESTINY_obj setVectorDirAndUp [
                [ sin DESTINY_Y * cos DESTINY_P,cos DESTINY_Y * cos DESTINY_P,sin DESTINY_P],
                [[ sin DESTINY_R,-sin DESTINY_P,cos DESTINY_R * cos DESTINY_P],-DESTINY_Y] call BIS_fnc_rotateVector2D
			];
		}];

		0 spawn {
			while {!(isNull DESTINY_obj)} do {
				setMousePosition [0.5, 0.5];
				sleep 0.01;
				DESTINY_A = getMousePosition;
                DESTINY_xx = (DESTINY_A # 0);
                DESTINY_yy = (DESTINY_A # 1);
                if (DESTINY_xx != 0.5) then {
                    X =  X - (0.5 - (DESTINY_A # 0));
                };
                if (!(DESTINY_yy >=0.499 and DESTINY_yy<=0.5)) then {
				    Y =  Y + (0.5 - (DESTINY_A # 1));
                };
			};
		};

    DESTINY_obj hideObject true;
    _effect = call Destiny_fnc_Effect;
    createDialog "TVGuidedMissile";

    while {!(isNull DESTINY_obj)} do {
        _n = player getVariable ["DESTINY_N",-1];
        _lastTime = time;
        _lastpos = getPosASL DESTINY_obj;
        _dir = getDir DESTINY_obj;
        Destiny_cam camSetTarget DESTINY_obj;
        Destiny_cam camSetRelPos [0,0,0];
        Destiny_cam camcommit 5 * (time - _lastTime);
		_vel = velocity DESTINY_obj;
		_spd = (_vel distance [0,0,0]) max 1;
		_perspectiveText= "弹头TV";
		_modeText = "热成像";
		_distancePOS = getPosASL DESTINY_obj;
		_meters = _distancePOS distance [_distancePOS # 0,_distancePOS # 1,0];

		cutRsc ["DESTINY_HUD_MISS","PLAIN"];
		DESTINY_HUD_speed ctrlSetText format["速度:                     %1 km/h",round _spd];
		DESTINY_HUD_HUD ctrlSetText format["视角:                     %1",_perspectiveText];
		DESTINY_HUD_Mode ctrlSetText format["模式:                     %1",_modeText];
		DESTINY_HUD_Distance ctrlSetText format["高度:                     %1 米",round _meters];
        DESTINY_HUD_Radar ctrlSetText format["雷达:                     %1 米",DESTINY_Radar]; 
    };

    ppEffectDestroy _effect;
    closeDialog 669989;
    (findDisplay 46) displayRemoveEventHandler ["KeyDown",player getVariable["DESTINY_HE",0]];
    removeMissionEventHandler ["Draw3D",_handlerID];
    removeMissionEventHandler ["EachFrame",_EventHead];
	Destiny_cam camSetPos [(_lastpos select 0) - 200*sin(_dir), (_lastpos select 1)-200*cos(_dir), (_lastpos select 2) + sin(45)*200];
	Destiny_cam camCommit 5;
	Destiny_cam camSetTarget _lastpos;
	_endTime = time + 5;
	while {time<_endtime} do {
        sleep 1
    };
    Destiny_cam cameraeffect ["terminate", "back"];
	camDestroy Destiny_cam;
    cutText ["","BLACK IN"];
};
