 /// @desc next level

debuffneccessities(food,water,shelter,wash);

//remove stuff from debufflog without the player seeing cuz its on the same frame as the level change (good)
var _logarraylength = array_length(global.debufflog);
if (food) {
	//look through global.debufflog for the unapplied debuff and remove it
	for (var i = 0; i < _logarraylength; i++) {
		if (global.debufflog[i] == global.downgradesFood[global.playerdowngrades[0]]) {
			array_delete(global.debufflog,i,1)
			break;
		}
	}
}
if (water) {
	//look through global.debufflog for the unapplied debuff and remove it
	for (var i = 0; i < _logarraylength; i++) {
		if (global.debufflog[i] == global.downgradesWater[global.playerdowngrades[1]]) {
			array_delete(global.debufflog,i,1)
			break;
		}
	}
}
if (shelter) {
	//look through global.debufflog for the unapplied debuff and remove it
	for (var i = 0; i < _logarraylength; i++) {
		if (global.debufflog[i] == global.downgradesShelter[global.playerdowngrades[2]]) {
			array_delete(global.debufflog,i,1)
			break;
		}
	}
}
if (wash) {
	//look through global.debufflog for the unapplied debuff and remove it
	for (var i = 0; i < _logarraylength; i++) {
		if (global.debufflog[i] == global.downgradesWash[global.playerdowngrades[3]]) {
			array_delete(global.debufflog,i,1)
			break;
		}
	}
}

//next level
var _transition = instance_create_depth(0,0,-100,obj_transition)
_transition.image_alpha = 0;