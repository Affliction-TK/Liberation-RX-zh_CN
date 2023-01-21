class Params
{
	class MissionOptions{
		title = "== 任务选项 ==";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Introduction {
		title = "介绍";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class DeploymentCinematic {
		title = "部署动画";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 0;
	};
	class Unitcap{
		title = "AI单位最大数量";
		values[] = {0.5,0.75,1,1.25,1.5,2};
		texts[] = {"50% - 建议为本地托管","75% - 推荐为专用服务器","100% - 推荐专用服务器","125% - 推荐专用服务器和无头客户端","150% - 推荐使用具有多个无头客户端的专用服务器","200% - 推荐使用具有多个无头客户端的专用服务器"};
		default = 1;
	};
	class FancyInfo {
		title = "花式信息";
		values[] = { 2, 1, 0 };
		texts[] = { "启用", "信息", "禁用" };
		default = 1;
	};
	class HideOpfor {
		title = "隐藏Opfor地区标记";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 0;
	};
	class Thermic {
		title = "热成像装备";
		values[] = { 2, 1, 0 };
		texts[] = { "启用", "仅在夜间", "禁用" };
		default = 1;
	};
	class DeathChat {
		title = "受伤时禁止聊天/语音";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 0;
	};
	class Space6 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class EnableArsenal {
		title = "虚拟武器库";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class FilterArsenal {
		title = "武器库过滤模式";
		values[] = { 0,1,2,3 };
		texts[] = {"禁用", "松懈：武器库只显示玩家一方的装备，但是可以使用其他物品。","严谨：玩家只能使用当前武器库中的装备。","严谨+MOD：玩家只能使用当前武器库和MOD中的装备。"};
		default = 1;
	};
	class Space8 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class ModPresetWest {
		title = "MOD预设-友方";
		values[] = { 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26 };
		texts[] = {
					"ArmA3 NATO",
					"ArmA3 CSAT",
					"ArmA3 AAF",
					"CUP BAF Desert",
					"CUP USMC Woodland",
					"CUP USMC Desert",
					"CUP AFRF Modern MSV",
					"EJW Task Force",
					"R3F WEST Desert",
					"R3F WEST Woodland",
					"RHS US Armed Force",
					"RHS AF Russian Fed.",
					"FFAA SPAIN Woodland",
					"GM WEST",
					"GM WEST Winter",
					"GM EAST",
    				"GM EAST Winter",
					"OPTRE West",
					"West Sahara UNA",
					"SoG USA",
					"SoG VIETCONG",
					"Project Opfor Ukrainian Army",
					"3CB British Army Woodland",
					"3CB British Army Desert",
					"3CB Chernarussian Red Star",
					"Bundenswehr Tropentarn",
					"CWR Cold War Rearmed III - US"
				};
		default = 0;
	};
	class ModPresetEast {
		title = "MOD预设-敌人";
		values[] = { 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29 };
		texts[] = {
					"ArmA3 CSAT",
					"ArmA3 NATO",
					"ArmA3 AAF",
					"ArmA3 CSAT Urban",
					"CUP Takistan",
					"CUP USMC Woodland",
					"CUP USMC Desert",
					"CUP AFRF Modern MSV",
					"CUP Royal Army Corps",
					"EJW Taliban",
 					"R3F WEST Desert",
					"R3F WEST Wood",
					"RHS US Armed Force",
					"RHS AF Russian Fed.",
					"FFAA SPAIN Wood",
					"GM WEST",
					"GM WEST Winter",
					"GM EAST",
					"GM EAST Winter",
					"OPTRE East",
					"West Sahara FIA",
					"SoG USA",
					"SoG VIETCONG",
					"Project Opfor Takistani Army",
					"Project Opfor Sahrani Army",
					"Project Opfor Ukrainian Army",
					"3CB British Army Woodland",
					"3CB British Army desert",
					"3CB Chernarussian Red Star",
					"CWR Cold War Rearmed III - SOVIET"
				};
		default = 0;
	};
	class Space5 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class ForcedLoadout {
		title = "强制默认装备";
		values[] = { 0,1,2 };
		texts[] = { "禁用", "预设 1", "预设 2" };
		default = 1;
	};
	class EnglishOpfor {
		title = "强制Opfor说英语";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 0;
	};
	class FobType{
		title = "初始FOB车辆";
		values[] = {0,1};
		texts[] = {"支奴干", "卡车"};
		default = 0;
	};
	class HuronType{
		title = "移动重生直升机类型";
		values[] = {0,1,2,3};
		texts[] = {"禁用", "CH-67 Huron", "CH-49 Mohawk", "UH-80 Ghost Hawk"};
		default = 0;
	};
	class MaximumFobs{
		title = "允许的最大FOB数";
		values[] = {3,5,7,10,15,20,26};
		texts[] = {3,5,7,10,15,20,26};
		default = 5;
	};
	class PassiveIncome{
		title = "替换弹药箱以直接获取弹药收入";
		values[] = {1,0};
		texts[] = { "启用", "禁用" };
		default = 0;
	};
	class Space1 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Difficulty {
		title = "难度";
		values[] = { 0.5, 0.75, 1, 1.25, 1.5, 2, 4, 10 };
		texts[] = { "观光游", "新兵入伍", "行伍匹夫", "久经沙场", "百炼成钢", "很强很暴力", "噩梦", "无人生还"};
		default = 1;
	};
	class Aggressivity{
		title = "OPFOR攻击性";
		values[] = {0.25,0.5,1,2,4};
		texts[] = {"乏力", "软弱","常规","强劲","疯狂"};
		default = 1;
	};
	class AdaptToPlayercount{
		title = "随玩家数量调整敌军活动";
		values[] = {1,0};
		texts[] = {"启用","禁用"};
		default = 1;
	};
	class SectorRadius{
		title = "一个战区的规模（半径）";
		values[] = {0,300,400,500,600,700,800,900,1000,1200,1500};
		texts[] = {"禁用",300,400,500,600,700,800,900,1000,1200,1500};
		default = 0;
	};
	class DayDuration {
		title = "日间时长（倍数，数值越大，游戏中时间越短）";
		values[] = { 0.25, 0.5, 1, 1.5, 2, 2.5, 3, 5, 10, 20, 30, 60 };
		texts[] = { "0.25", "0.5", "1", "1.5", "2", "2.5", "3", "5", "10", "20", "30", "60" };
		default = 1;
	};
	class NightDuration {
		title = "夜间时长（倍数，数值越大，游戏中时间越短）";
		values[] = { 0.25, 0.5, 1, 1.5, 2, 2.5, 3, 5, 10, 20, 30, 60 };
		texts[] = { "0.25", "0.5", "1", "1.5", "2", "2.5", "3", "5", "10", "20", "30", "60" };
		default = 1;
	};
	class Weather {
		title = "天气";
		values[] = { 1,2,3,4 };
		texts[] = { "总是晴天", "随机无雨", "随机多云", "随机" };
		default = 4;
	};
	class ResourcesMultiplier {
		title = "资源倍数";
		values[] = { 0.25, 0.5, 0.75, 1, 1.25, 1.5, 2, 3, 5, 10, 20, 50 };
		texts[] = { "x0.25", "x0.5", "x0.75", "x1", "x1.25","x1.5","x2","x3","x5","x10","x20","x50" };
		default = 1;
	};
	class Space2 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Fatigue {
		title = "体力";
		values[] = { 0, 1 };
		texts[] = { "禁用", "启用" };
		default = 0;
	};
	class Revive {
		title = "PAR复活模式";
		values[] = { 3, 2, 1, 0 };
		texts[] = { "启用——每个人都可以随意复活", "启用——每个人都可以使用医疗包或急救包进行复活", "启用 - 只有医生才能复活他人", "禁用" };
		default = 3;
	};
	class TK_mode {
		title = "TK友伤模式";
		values[] = { 0, 1, 2 };
		texts[] = { "严厉 - 警告 + 自动ban", "放松 - 由玩家决定", "禁用" };
		default = 1;
	};
	class TK_count {
		title = "可以容忍的TK次数";
		values[] = { 3, 4, 5, 6, 7, 8, 9, 10 };
		texts[] = { 3, 4, 5, 6, 7, 8, 9, 10 };
		default = 4;
	};
	class SquadSize{
		title = "开始时每个小队的AI";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,1,2,3,4,5,6,7,8,9,10};
		default = 3;
	};
	class MaxSquadSize{
		title = "每个小队AI招募上限";
		values[] = {0,1,2,3,4,5,6,7,8,9,10};
		texts[] = {0,1,2,3,4,5,6,7,8,9,10};
		default = 7;
	};
	class MaxSpawnPoint{
		title = "最大个人重生点数量";
		values[] = {1,2,3,4};
		texts[] = {1,2,3,4};
		default = 2;
	};	
	class Permissions{
		title = "权限管理";
		values[] = {1,0};
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class EnableLock {
		title = "车辆所有权";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class Space7 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Civilians{
		title = "平民活动";
		values[] = {0,0.5,1,2};
		texts[] = {"无","稀少","正常","繁华"};
		default = 1;
	};
	class WildLife{
		title = "野生动物管理";
		values[] = {1,0};
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class AmmoBounties{
		title = "弹药奖励";
		values[] = {1,0};
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class CivPenalties{
		title = "屠杀平民的惩罚";
		values[] = {1,0};
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class HaloJump{
		title = "高空跳伞";
		values[] = {1,5,10,15,20,30,0};
		texts[] = { "启用 - 无冷却时间", "启用 - 5分钟冷却间隔", "启用 - 10分钟冷却间隔", "启用 - 15分钟冷却间隔", "启用 - 20分钟冷却间隔", "启用 - 30分钟冷却间隔", "禁用" };
		default = 1;
	};
	class BluforDefenders{
		title = "BLUFOR所属地区的防守步兵";
		values[] = {1,0};
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class Space3 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class TechnicalOptions{
		title = "== 难度选项 ==";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class AdminMenu {
		title = "启用管理菜单";
		values[] = { 1, 0 };
		texts[] = { "是", "否"};
		default = 1;
	};
	class CleanupVehicles {
		title = "清理FOB以外的被遗弃车辆";
		values[] = { 0,900,1800,3600,7200,14400 };
		texts[] = { "禁用", "15分钟间隔", "30分钟间隔", "1小时间隔", "2小时间隔", "4小时间隔" };
		default = 900;
	};
	class AutoSave{
		title = "自动保存计时器";
		values[] = {0,300,900,1800,3600,7200};
		texts[] = { "禁用", "5分钟", "15分钟", "30分钟", "1小时", "2小时" };
		default = 3600;
	};
	class Whitelist {
		title = "使用指挥官白名单";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 1;
	};
	class Exclusive {
		title = "使用准入白名单";
		values[] = { 1, 0 };
		texts[] = { "启用", "禁用" };
		default = 0;
	};
	class Space4 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class WipeSave1{
		title = "清除存档";
		values[] = {0,1};
		texts[] =  { "否", "！！游戏存档将被抹去，没有恢复的可能性！！"};
		default = 0;
	};
	class WipeSave2{
		title = "确认: 清除存档";
		values[] = {0,1};
		texts[] = { "否", "！！游戏存档将被抹去，没有恢复的可能性！！"};
		default = 0;
	};
	class KeepScore{
		title = "保存玩家数据";
		values[] = {0,1};
		texts[] = { "否", "是" };
		default = 0;
	};
	class ForceLoading{
		title = "强制保存游戏加载";
		values[] = {0,1};
		texts[] = { "否","是"};
		default = 0;
	};
	class Space99 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
};
