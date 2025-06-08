/// @desc

selectedoption = 0;

//get game ready
global.coinnum = 0;
global.level = 1;

global.debufflog = [];
global.downgradesFood = [
"Hungry: Removed 3rd hit of combo",
"Famished: removed 2nd hit of combo",
"Starving: punching makes you fall over"
];
global.downgradesWater = [
"Dry: -35% move speed",
"Dehydrated: strafing requires stamina",
"Husk: moving requires stamina"
];
global.downgradesShelter = [
"Tired: -15% jump height",
"Exhausted: jumping requires charge",
"Drained: 20% increased gravity"
];
global.downgradesWash = [
"Smelly: -40% max health",
"Gross: half health from pickups",
"Sick (in a bad way): enemies don't drop health"
];
global.playerdowngrades = [
0, //food 1, 2, 3.
0, //water 1, 2, 3.
0, //shelter 1, 2, 3.
0, //wash 1, 2, 3.
];