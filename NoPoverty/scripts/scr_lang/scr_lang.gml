function loadlanguage(){
english = [
"Nederlands",
//debuffs
"Hungry: Removes 3rd hit of combo",
"Famished: Attacks won't stun enemies",
"Starving: Enemies regenerate health",
"Thirsty: -15% jump height",
"Dehydrated: Jumping requires charge",
"Husk: 20% increased gravity",
"Tired: -25% move speed",
"Drained: Move speed is halved while not strafing",
"Exhausted: Sudden stops make you fall over",
"Smelly: -40% max health",
"Gross: Half health received from pickups",
"Sick (in a bad way): -10% max health, jump height, and move speed",
//menu
"Start Game", //13
"Settings",
"Quit",
//settings
"Back", //16
"Disable\nFullscreen",
"Enable\nFullscreen",
"Disable\nSound",
"Enable\nSound",
//necessities
"Food", //21
"Water",
"Shelter",
"Wash",
"Confirm",
//tutorial
"Use the arrow keys to move", //26
"Press the spacebar to jump",
"Press A to attack",
"Hold S to strafe",
"Attack 3 times quickly to perform a combo!",
"Hold up while performing a 3-hit-combo to uppercut and escape!"
]
dutch = [
"English",
//debuffs
"Hongerig: Neemt de 3e treffer van combo weg",
"Uitgehongerd: Aanvallen zou vijanden niet verbijsteren",
"Skelet: Vijanden regenereren HP",
"Dorstig: -15% spronghoogte",
"Uitgedroogd: Springen vereisen energie",
"Lijk: 20% meer zwaartekracht",
"Moe: -25% bewegingssnelheid",
"Vermoeid: Bewegingssnelheid wordt gehalveerd terwijl je niet strafe",
"Uitgeput: Plotselinge stops zorgt ervoor dat je omvalt",
"Stinkend: -40% max HP",
"Vies: Gehalveerd HP ontvangen van pickups",
"Ziek: -10% max HP, spronghoogte, en bewegingssnelheid",
//menu
"Spel Opstarten", //13
"Instellingen",
"Afsluiten",
//settings
"Terug", //16
"Fullscreen\nUitschakelen",
"Fullscreen\nInschakelen",
"Geluid\nUitschakelen",
"Geluid\nInschakelen",
//necessities
"Eten", //21
"Water",
"Onderdak",
"Wassen",
"Bevestigen",
//tutorial
"Gebruik de arrow keys om te bewegen", //26
"Druk the spacebar to jump",
"Druk A om te attack",
"Hold S om te strafe",
"Attack 3 times quickly om te perform a combo!",
"Hold op while performing a 3-hit-combo om te uppercut en escape!"
]

if (array_equals(global.lang,english)) {
	global.lang = dutch;
} else {
	global.lang = english;
}

//temp code delete this when next code is coded
global.level = 1;
global.debufflog = [];
global.playerdowngrades = [0,0,0,0];
//>insert code that changes debufflog here<
//it checks the whole global.debufflog array and for each one checks its
//to see if it matches english or dutch and changes it to the other language

global.downgradesFood = [
global.lang[1],
global.lang[2],
global.lang[3],
];
global.downgradesWater = [
global.lang[4],
global.lang[5],
global.lang[6],
];
global.downgradesShelter = [
global.lang[7],
global.lang[8],
global.lang[9],
];
global.downgradesWash = [
global.lang[10],
global.lang[11],
global.lang[12],
];

}