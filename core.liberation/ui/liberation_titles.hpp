class RscTitles
{
   class intro1
   {
      name = "intro1";
      duration = 4;
      idd = -1;
      movingEnable = false;
      controls[] = {
         GenericLabelShadow, GenericLabel2
      };
	  class GenericLabel2 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.035 * safezoneH;
		x = 0.3 * safezoneW + safezoneX;
		w = 0.4 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = "基于一个〔GREUH〕任务";
		shadow = 1;
	  };
	  class GenericLabelShadow : GenericLabel2{
		shadow = 2;
	  };
   };

   class intro11
   {
      name = "intro11";
      duration = 4;
      idd = -1;
      movingEnable = false;
      controls[] = {
         GenericLabelShadow, GenericLabel2
      };
	  class GenericLabel2 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.035 * safezoneH;
		x = 0.3 * safezoneW + safezoneX;
		w = 0.4 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = "现在，重构和扩展到最好。。。";
		shadow = 1;
	  };
	  class GenericLabelShadow : GenericLabel2{
		shadow = 2;
	  };
   };
	    class intro12
   {
      name = "intro12";
      duration = 4;
      idd = -1;
      movingEnable = false;
      controls[] = {
         GenericLabelShadow, GenericLabel2
      };
	  class GenericLabel2 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.035 * safezoneH;
		x = 0.3 * safezoneW + safezoneX;
		w = 0.4 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = "[AKH pSiKO] 荣誉出品:";
		shadow = 1;
	  };
	  class GenericLabelShadow : GenericLabel2{
		shadow = 2;
	  };
   };

   class intro2
   {
      name = "intro2";
      duration = 7;
      idd = -1;
      movingEnable = false;
      controls[] = {
         VersionLabelShadow, Splash, VersionLabel, MOTDLabel, MOTDLabelShadow
      };
	  	class Splash {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_PICTURE;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.1 * safezoneH;
		x = 0.325 * safezoneW + safezoneX;
		w = 0.35 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = 0.6 * safezoneH;
		text = "res\splash_libe2.paa";
	  };
	  class VersionLabel {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		shadow = 1;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.035 * safezoneH;
		x = 0.45 * safezoneW + safezoneX;
		w = 0.3 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = $STR_MISSION_VERSION;
	  };
	  class VersionLabelShadow : VersionLabel {
		shadow = 2;
		font = FONTM;
	  };
	  class MOTDLabel {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		shadow = 1;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.025 * safezoneH;
		x = 0.3 * safezoneW + safezoneX;
		w = 0.4 * safezoneW;
		y = 0.70 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = $STR_MISSION_MOTD;
	  };
	  class MOTDLabelShadow : MOTDLabel {
		shadow = 2;
		font = FONTM;
	  };
   };

   class blank
   {
      name = "blank";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "";
      controls[] = {};
   };

   class fasttravel
   {
      name = "fasttravel";
      duration = 4;
      idd = -1;
      movingEnable = true;

      controls[] = {
         OuterBackground,GenericLabel111
      };
	  class OuterBackground {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_LEFT;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_BLACK;
		font = FONTM;
		sizeEx = 0.023;
		x = -3; y = -3;
		w = 9;  h = 9;
		text = "";
	  };
		class GenericLabel111 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.03;
		x = 0; y = 0.75;
		w = 1.0;  h = 0.1;
		text = $STR_DEPLOY_IN_PROGRESS;
	  };
   };

   class statusoverlay
   {
      name = "statusoverlay";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "uiNamespace setVariable ['GUI_OVERLAY', _this select 0];";
	  controls[] = { BGPicture,LabelScore,LabelAmmo,LabelManpower,LabelFuel,LabelCap,PictureAmmoShadow,PictureScoreShadow,PictureManpowerShadow,
		BGPictureActiveSectors,PictureFuelShadow,PictureCapShadow,PictureScore,PictureAmmo,PictureManpower,PictureFuel,PictureCap,PictureCombatReadinessShadow,
		PictureCombatReadiness,PictureIntelShadow,PictureIntel,LabelIntel,BGPictureSector,CaptureFrame_OPFOR,CaptureFrame_BLUFOR,CaptureFrame,LabelPoint,
	  LabelCombatReadiness,CentralShadow,CentralLabel,ActiveSectors,AlertBGPicture,AlertLabel,AlertTimer };
	  class BGPicture {
	  idc = -1;
		type =  CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0.8,0.8,0.8,0.9};
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.5;
		x = 0.95 * safezoneW + safezoneX;
		w = 0.075 * safezoneW;
		y = 0.395 * safezoneH + safezoneY;
		h = 0.183 * safezoneH;
		text = "res\gradient.paa";
	  };
	  class BGPictureSector : BGPicture {
	  	idc = 201;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.33 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
	  };
	  class GenericLabel69 {
		idc = -1;
		type =  CT_STATIC;
		style = ST_RIGHT;
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.022 * safezoneH;
		x = 0.905 * safezoneW + safezoneX;
		w = 0.08 * safezoneW;
		y = 0.5225 * safezoneH + safezoneY;
		h = 0.04 * safezoneH;
		text = "";
		shadow = 2;
	  };
	  class CentralLabel : GenericLabel69 {
		idc = 266;
		type = CT_STATIC;
		style = ST_CENTER;
		colorText[] = {1,1,0,1};
		sizeEx = 0.03 * safezoneH;
		x = 0 * safezoneW + safezoneX;
		w = 1 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
		text = "";
	  };
	  class CentralShadow : CentralLabel {
		idc = 267;
		shadow = 1;
	  };
	  class GenericPicture69 {
	  	idc = -1;
		type =  CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0.9,0.9,0.9,1};
		colorBackground[] = COLOR_NOALPHA;
		font = FONTM;
		sizeEx = 0.5;
		x = 0.985 * safezoneW + safezoneX;
		w = 0.012 * safezoneW;
		h = 0.0213333333 * safezoneH;
	  };

	 class PictureScore : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		text = "res\ui_arsenal.paa";
	  };
	  class PictureAmmo : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		text = "res\ui_ammo.paa";
	  };
	  class PictureFuel : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		text = "res\ui_fuel.paa";
	  };
	 class PictureManpower : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		text = "res\ui_manpo.paa";
	  };
	  class PictureCap : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
	  };
	  class PictureCombatReadiness : GenericPicture69 {
		idc = 135;
		y = (0.4 + ( ICONE_SPACY * 5 ) ) * safezoneH + safezoneY;
		text = "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa";
	  };
	  class PictureIntel : GenericPicture69 {
	  	colorText[] = {0,0.45,0.95,1};
		y = (0.4 + ( ICONE_SPACY * 6 ) - 0.0025) * safezoneH + safezoneY;
		text = "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa";
	  };

	  class PictureScoreShadow : PictureScore {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureAmmoShadow : PictureAmmo {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureFuelShadow : PictureFuel {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureManpowerShadow : PictureManpower {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureCapShadow : PictureCap {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureCombatReadinessShadow : PictureCombatReadiness {
	  	idc = -1;
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 5 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureIntelShadow : PictureIntel {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 6 ) - 0.0025 ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };

	  class LabelScore : GenericLabel69 {
	  	idc = 107;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		colorText[] = {1, 1, 1, 1};
	  };
	  class LabelAmmo : GenericLabel69 {
	  	idc = 102;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		colorText[] = {0.75, 0, 0, 1};
	  };
	  class LabelFuel : GenericLabel69 {
	  	idc = 103;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		colorText[] = {0.75, 0.75, 0, 1};
	  };
	  class LabelManpower : GenericLabel69 {
	  	idc = 101;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		colorText[] = {0, 0.75, 0, 1};
	  };
	  class LabelCap : GenericLabel69 {
	  	idc = 104;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		colorText[] = {0.8, 0.8, 0.8, 1};
	  };
	  class LabelCombatReadiness : GenericLabel69 {
	  	idc = 105;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 5 ) ) * safezoneH + safezoneY;
		colorText[] = {0.8, 0.8, 0.8, 1};
	  };
	  class LabelIntel : GenericLabel69 {
	  	idc = 106;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 6 ) - 0.0015 ) * safezoneH + safezoneY;
		colorText[] = {0, 0.45, 0.95, 1};
	  };

	  class CaptureFrameStandard {
		type =  CT_STATIC;
		font = FONTM;
		sizeEx = 0.023;
		text = "";
	};
	  class CaptureFrame : CaptureFrameStandard {
		idc = 202;
		style = ST_FRAME;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_OPFOR_NOALPHA;
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.085 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.012 * safezoneH;
	};
	class CaptureFrame_OPFOR : CaptureFrameStandard {
		idc = 203;
		style = CT_STATIC;
		colorText[] = {0.6, 0, 0, 1};
		colorBackground[] = {0.6, 0, 0, 1};
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.084 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.011 * safezoneH;

	};
	class CaptureFrame_BLUFOR : CaptureFrameStandard {
		idc = 244;
		style = CT_STATIC;
		colorText[] = {0, 0.2, 0.6, 1};
		colorBackground[] = {0, 0.2, 0.6, 1};
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.084 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.011 * safezoneH;
	};
	class LabelPoint : GenericLabel69 {
	  	idc = 205;
		text = "";
		style = ST_RIGHT;
		font = "PuristaBold";
		sizeEx = 0.024 * safezoneH;
		x = 0.8 * safezoneW + safezoneX;
		w = 0.2 * safezoneW;
		y = 0.33 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.7, 0, 0, 1};
	  };
	  class ActiveSectors
 		{
 			idc = 516;
 			type = CT_STRUCTURED_TEXT;
 			colorBackground[] = COLOR_NOALPHA;
 			style = ST_RIGHT;
			x = 0.7 * safezoneW + safezoneX;
			w = 0.295 * safezoneW;
			y = 0.8 * safezoneH + safezoneY;
			h = 0.2 * safezoneH;
 			text= "";
 			size = 0.02 * safezoneH;
 			sizeEx = 0.02 * safezoneH;
 			shadow = 2;
				font = FONTM;
				color = "#e0e000";
				align = "right";
				valign = "top";
 		};
 	class BGPictureActiveSectors : BGPicture {
	  	idc = 517;
		x = 0.93 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.8 * safezoneH + safezoneY;
		h = 0.2 * safezoneH;
	  };


	  class AlertBGPicture : BGPicture {
	  	idc = 401;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.27 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
	  };

	  class AlertLabel : GenericLabel69 {
	  	idc = 402;
		text = "";
		style = ST_CENTER;
		sizeEx = 0.022 * safezoneH;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.2675 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.85, 0, 0, 1};
	  };
	  class AlertTimer : GenericLabel69 {
	  	idc = 403;
		text = "";
		style = ST_CENTER;
		sizeEx = 0.026 * safezoneH;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.29 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.85, 0, 0, 1};
	  };
	};
	class DESTINY_HUD_MISS
	{
		idd = 98100;
		duration = 4;
		fadeIn = 0;
		fadeOut = 0;
		name = "DESTINY_HUD_MISS";
		onLoad = "uiNamespace setVariable ['DESTINY_HUD_MISS',_this select 0]";
		
		class ControlsBackground
		{
			class Control618624017
			{
				type = 0;
				idc = 0;
				x = 0.00000016;
				y = -0.0749998;
				w = 1.00000025;
				h = 1.15000022;
				style = 48;
				text = "addons\CMS\destiny_res\2.paa";
				colorBackground[] = {1,1,1,0};
				colorText[] = {0.2784,0.6745,0.7451,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
				
			};
			class ControlSpeed
			{
				type = 0;
				idc = 98101;
				x = 0.30000012;
				y = 0.82500011;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "速度:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);		
			};
			class ControlPerspective
			{
				type = 0;
				idc = 98102;
				x = 0.30000012;
				y = 0.97500012;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "视角:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);		
			};
			class ControlMode
			{
				type = 0;
				idc = 98103;
				x = 0.30000012;
				y = 0.90000011;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "模式:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
				
			};
			class ControlRadar
			{
				type = 0;
				idc = 98105;
				x = 0.30000012;
				y = 1.11424053;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "范围:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);			
			};
			class ControlDistance
			{
				type = 0;
				idc = 98104;
				x = 0.30000012;
				y = 1.05000012;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "高度:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
				
			};	
		};
	};
};
