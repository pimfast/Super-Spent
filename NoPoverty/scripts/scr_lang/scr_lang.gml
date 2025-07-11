function loadlanguage(){
english = [
"Nederlands",
//debuffs
"Hungry: -45% damage",
"Famished: Removes 3rd hit of combo",
"Starving: Attacks won't stun enemies",
"Thirsty: -15% jump height",
"Dehydrated: Jumping requires charge",
"Husk: Jumping costs health"/*"Husk: 20% increased gravity"*/,
"Tired: -25% move speed",
"Drained: Moving while landing often makes you fall over",
"Exhausted: -30% move speed" /*while i do wanna do something with strafing, i think lower acceleration is way more interesting*/,
"Smelly: -40% max health",
"Gross: Half health received from pickups", //definitely less bad in comparison to the other 2nd downgrades sad face
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
"Press the spacebar to jump", //26
"Press A to attack, beginning or continuing a combo",
"Hold S to strafe\nThis locks your direction, making attacking easier",
"Hold S to strafe\nThis also increases air speed",
"Attack 3 times quickly for a powerful blow!",
"Hold UP while performing a 3-hit-combo to uppercut and escape!",
//end
"You win! Press ESC to return to menu.", //32
"All coins too wow you're so handsome and/or beautiful.",
"No coins too wow I wanna kiss you."
];
dutch = [
"English",
//debuffs
"Hongerig: -45% kracht",
"Uitgehongerd: Neemt de 3e treffer van combo weg",
"Skelet: Aanvallen zou vijanden niet verbijsteren",
"Dorstig: -15% spronghoogte",
"Uitgedroogd: Springen is langzaam",
"Lijk: Springen kost HP"/*"Lijk: 20% meer zwaartekracht"*/,
"Moe: -25% bewegingssnelheid",
"Vermoeid: Bewegen tijdens het landen zorgt vaak ervoor dat je omvalt",
"Uitgeput: -30% bewegingssnelheid",
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
"Druk de spacebar om te gaan springen", //26
"Druk A om aan te vallen, dit begint jou combo of zet jou combo voort",
"Houd S ingedrukt om te straffen\nDit maakt je richting vastgelegd, waardoor aanvallen makkelijker wordt",
"Houd S ingedrukt om te straffen\nDit stijgt ook lucht snelheid",
"Aanval snel 3 keer voor een krachtige klap!",
"Houd de omhoogknop ingedrukt terwijl je een 3-hit-combo doet om een uppercut en ontsnappen te gaan doen!",
//end
"Je hebt gewonnen! Druk op Esc om naar het menu te gaan.", //32
"Alle muntjes ook goh je bent zo echt mooi.",
"Geen muntjes ook goh ik wil je kussen."
];

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
""
];
global.downgradesWater = [
global.lang[4],
global.lang[5],
global.lang[6],
""
];
global.downgradesShelter = [
global.lang[7],
global.lang[8],
global.lang[9],
""
];
global.downgradesWash = [
global.lang[10],
global.lang[11],
global.lang[12],
""
];

}