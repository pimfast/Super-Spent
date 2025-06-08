 /// @desc next level

debuffneccessities(food,water,shelter,wash);

//remove stuff from debufflog without the player seeing cuz its on the same frame as the level change (good)
var _logarraylength = array_length(global.debufflog);
if (food) {
	//look through global.debufflog for the unapplied debuff and remove it
	for (var i = 0; i < _logarraylength; i++) {
		if (global.debufflog[i] == global.downgradesFood[global.playerdowngrades[0]]) {
			array_delete(global.debufflog,i,1) //test now to see if it deletes the food line if you pay for it
			break;
		}
	}
}
if (water) {
	//look through global.debufflog for the unapplied debuff and remove it
	for (var i = 0; i < _logarraylength; i++) {
		if (global.debufflog[i] == global.downgradesWater[global.playerdowngrades[1]]) {
			array_delete(global.debufflog,i,1) //test now to see if it deletes the food line if you pay for it
			break;
		}
	}
}
if (shelter) {
	//look through global.debufflog for the unapplied debuff and remove it
	for (var i = 0; i < _logarraylength; i++) {
		if (global.debufflog[i] == global.downgradesShelter[global.playerdowngrades[2]]) {
			array_delete(global.debufflog,i,1) //test now to see if it deletes the food line if you pay for it
			break;
		}
	}
}
if (wash) {
	//look through global.debufflog for the unapplied debuff and remove it
	for (var i = 0; i < _logarraylength; i++) {
		if (global.debufflog[i] == global.downgradesWash[global.playerdowngrades[3]]) {
			array_delete(global.debufflog,i,1) //test now to see if it deletes the food line if you pay for it
			break;
		}
	}
}

//next level
room_goto(asset_get_index("rm_level"+string(global.level)));