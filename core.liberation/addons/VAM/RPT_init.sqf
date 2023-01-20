// Vehicle Paint v1.10 merged with VAM
// by pSiKO

RPT_color = "#(rgb,1,1,1)color";
RPT_texDir = "addons\VAM\textures\";

RPT_colorList = [
	["黑色", RPT_color + "(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
	["灰色", RPT_color + "(0.15,0.151,0.152,1)"], // #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
	["白色", RPT_color + "(0.75,0.75,0.75,1)"], // #(argb,8,8,3)color(1,1,1,0.5)
	["深蓝色", RPT_color + "(0,0.05,0.15,1)"], // #(argb,8,8,3)color(0,0.3,0.6,0.05)
	["蓝色", RPT_color + "(0,0.03,0.5,1)"], // #(argb,8,8,3)color(0,0.2,1,0.75)
	//["Teal", RPT_color + "(0,0.3,0.3,1)"], // #(argb,8,8,3)color(0,1,1,0.15)
	["绿色", RPT_color + "(0,0.5,0,1)"], // #(argb,8,8,3)color(0,1,0,0.15)
	["黄色", RPT_color + "(0.5,0.4,0,1)"], // #(argb,8,8,3)color(1,0.8,0,0.4)
	["橘色", RPT_color + "(0.4,0.09,0,1)"], // #(argb,8,8,3)color(1,0.5,0,0.4)
	["红色", RPT_color + "(0.45,0.005,0,1)"], // #(argb,8,8,3)color(1,0.1,0,0.3)
	["粉色", RPT_color + "(0.5,0.03,0.3,1)"], // #(argb,8,8,3)color(1,0.06,0.6,0.5)
	//["Purple", RPT_color + "(0.1,0,0.3,1)"], // #(argb,8,8,3)color(0.8,0,1,0.1)
	["ARPA 海军", RPT_texDir + "arpa_navy.paa"],
	["ARPA 林地", RPT_texDir + "arpa_woodland.paa"],
	["抽象红色", RPT_texDir + "abstraitrouge.paa"],
	["抽象绿色", RPT_texDir + "abstraitvert.paa"],
	["抽象现代", RPT_texDir + "abstraitmoderne.paa"],
	["迷彩绿 1", RPT_texDir + "camovert1.paa"],
	["迷彩绿 2", RPT_texDir + "camovert2.paa"],
	["数码迷彩", RPT_texDir + "digi.paa"],
	["数码迷彩 黑", RPT_texDir + "digi_black.paa"],
	["数码迷彩 沙漠 1", RPT_texDir + "digi_desert.paa"],
	["数码迷彩 沙漠 2", RPT_texDir + "digi_desert2.paa"],
	["数码迷彩 林地", RPT_texDir + "digi_wood.paa"],
	["数码迷彩 乌克兰土地", RPT_texDir + "DigitalUALand.paa"],
	["森林 1", RPT_texDir + "foret1.paa"],
	["森林 2", RPT_texDir + "raven.paa"],
	["热带丛林", RPT_texDir + "jungle.paa"],
	["装甲灰", RPT_texDir + "panzergris.paa"],
	["城市", RPT_texDir + "urban.paa"],
	["林地", RPT_texDir + "woodland.paa"],
	["林地虎", RPT_texDir + "woodtiger.paa"]
];

[] call compileFinal preprocessFileLineNumbers "addons\VAM\RPT_vip_textures.sqf";
