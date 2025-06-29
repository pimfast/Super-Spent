/// @desc get game ready

audio_group_load(ag_mus);
audio_group_load(ag_sfx);

window_set_cursor(cr_none);

global.enablesound = true;
global.lang = [];

loadlanguage();

//stuff that should be set after pressing start game but i'm to lazy to make a continue button:
global.coinnum = 0;
global.points = 0;
global.level = 1;

global.debufflog = [];

global.playerdowngrades = [
0, //food 1, 2, 3.
0, //water 1, 2, 3.
0, //shelter 1, 2, 3.
0, //wash 1, 2, 3.
];

global.hiddencoins = [
0,
0,
0,
0,
];