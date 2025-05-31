/// @desc

selectedoption = 0;

//get game ready
global.coinnum = 0;
global.level = 1;
global.downgradesFood = [
"Weak: less health",
"Famished: deal less damage",
"Starving: can't kick"
];
global.downgradesWater = [
"Dry: slower move speed",
"Dehydrated: strafing requires stamina",
"Husk: moving requires stamina"
];
global.downgradesShelter = [
"Tired: jump less high",
"Drained: jumping requires charge",
"Exhausted: increased gravity"
];
global.downgradesWash = [
"Smelly: enemies fight you",
"Gross: enemies are armed",
"Sick (in a bad way): people are enemies"
];
global.playerdowngrades = [
0, //food 1, 2, 3.
0, //water 1, 2, 3.
0, //shelter 1, 2, 3.
0, //wash 1, 2, 3.
];