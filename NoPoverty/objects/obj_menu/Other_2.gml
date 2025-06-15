/// @desc get game ready

audio_group_load(ag_mus)
audio_group_load(ag_sfx)

global.lang = [];

loadlanguage();

global.coinnum = 0;
global.level = 1;

global.debufflog = [];

global.playerdowngrades = [
0, //food 1, 2, 3.
0, //water 1, 2, 3.
0, //shelter 1, 2, 3.
0, //wash 1, 2, 3.
];

window_set_cursor(cr_none);