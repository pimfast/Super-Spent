function debuffneccessities(food,water,shelter,wash){
	if (food == false) {
		switch (global.playerdowngrades[0]) {
			case 0:
				global.dmg *= 0.55;
				break;
			case 1:
				global.comboable[3] = false;
				break;
			case 2:
				global.stunpow = 0.1;
				break;
		}
		global.playerdowngrades[0] += 1;
	}
	if (water == false) {
		switch (global.playerdowngrades[1]) {
			case 0:
				global.jumpsp *= 0.85;
				break;
			case 1:
				// faceplant, no code needed here
				break;
			case 2:
				//global.grv *= 1.2;
				break;
		}
		global.playerdowngrades[1] += 1;
	}
	if (shelter == false) {
		switch (global.playerdowngrades[2]) {
			case 0:
				global.defwalksp *= 0.75;
				break;
			case 1:
				// jumping requires charge, no code here Moving while landing often makes you fall over
				break;
			case 2:
				global.defwalksp *= 0.70;
				break;
		}
		global.playerdowngrades[2] += 1;
	}
	if (wash == false) {
		switch (global.playerdowngrades[3]) {
			case 0:
				global.maxhp *= 0.6;
				break;
			case 1:
				global.healthrestore *= 0.5;
				break;
			case 2:
				global.maxhp = 1; //*0.9 = 5.4 L
				break;
		}
		global.playerdowngrades[3] += 1;
	}
}