/// @desc

audio_group_stop_all(ag_mus);
audio_play_sound(mus_budgettemp_mama,0,1)

selectedoption = 1;
lastselected = 0;
food = false;
water = false;
shelter = false;
wash = false;
logstarty = 10;

//add next downgrades to debufflog
array_push(global.debufflog,
global.downgradesFood[global.playerdowngrades[0]],
global.downgradesWater[global.playerdowngrades[1]],
global.downgradesShelter[global.playerdowngrades[2]],
global.downgradesWash[global.playerdowngrades[3]]);