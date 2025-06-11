/// @desc

selectedoption = 0;

//get game ready
global.coinnum = 0;
global.level = 1;

global.debufflog = [];
global.downgradesFood = [
"Hungry: Removes 3rd hit of combo",
"Famished: Removes 2nd hit of combo",
"Starving: Punching makes you fall over"
];
global.downgradesWater = [
"Dry: -15% jump height",
"Dehydrated: Jumping requires charge",
"Husk: 20% increased gravity"
];
global.downgradesShelter = [
"Tired: -25% move speed",
"Drained: Strafing requires stamina",
"Exhausted: Moving requires stamina"
];
global.downgradesWash = [
"Smelly: -40% max health",
"Gross: Half health from pickups",
"Sick (in a bad way): Enemies don't drop health"
];
global.playerdowngrades = [
0, //food 1, 2, 3.
0, //water 1, 2, 3.
0, //shelter 1, 2, 3.
0, //wash 1, 2, 3.
];