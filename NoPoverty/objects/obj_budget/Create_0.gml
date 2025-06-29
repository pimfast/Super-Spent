/// @desc

audio_group_stop_all(ag_mus);
audio_play_sound(mus_budgettemp_whitefire,1,1)

if (global.coinnum == 0) {
	selectedoption = 0;
} else {
	selectedoption = 1;
}
lastselected = 1;
food = false;
water = false;
shelter = false;
wash = false;

//add next downgrades to debufflog
array_push(global.debufflog,
global.downgradesFood[global.playerdowngrades[0]],
global.downgradesWater[global.playerdowngrades[1]],
global.downgradesShelter[global.playerdowngrades[2]],
global.downgradesWash[global.playerdowngrades[3]]
);

//scroll the debuff log to the important bit
var _totallogheight = 0;
var _logarraylength = array_length(global.debufflog);
for (var i = 0; i < _logarraylength; i++) {
	_totallogheight += string_height_ext(global.debufflog[i],-1,100);
}

logstarty = -_totallogheight + obj_camera.cameraheight - 10;
if (_totallogheight < obj_camera.cameraheight) {
	logstarty = 10;
}