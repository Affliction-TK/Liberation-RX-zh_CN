class DESTINY_Launch_Missile
{
	idd = 669988;
	
	class Controls
	{
		class Control1_BG
		{
			type = 0;
			idc = 0;
			x = -0.17499955;
			y = -0.42499949;
			w = 1.35000044;
			h = 1.80000063;
			style = 48;
			text = "addons\CMS\destiny_res\1.paa";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			moving = true;
			
		};

		class Control1_BUT
		{
			type = 16;
			idc = -1;
			x = 0.66500013;
			y = 0.76500016;
			w = 0.35000002;
			h = 0.12500003;
			style = 2;
			text = "启动";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {1,1,1,1};
			color2[] = {0.502,0.6,1,1};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {1,0.7131,0,1};
			font = "PuristaMedium";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			onButtonClick = "_this call DESTINY_fnc_readLaunch;";
			//onButtonClick = createDialog "TVGuidedMissile";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		
	};
};

class TVGuidedMissile
{
	idd = 669989;
	onLoad = "";
	movingenable = 0;
	enableMouse = 0;
	class ControlsBackground
	{
		class Control
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW;
			y = safeZoneY + safeZoneH;
			w = safeZoneW * 1;
			h = safeZoneH * 1;
			style = 0;
			text = "";
			colorBackground[] = {0.498,0.6706,0.2902,0};
			colorText[] = {0.502,0.3294,0.7098,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onDestroy = "'HelicopterExploBig' createVehicle (getpos DESTINY_obj);deleteVehicle DESTINY_obj";
		};
		
	};
};