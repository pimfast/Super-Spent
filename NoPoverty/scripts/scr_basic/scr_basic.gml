// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addpoints(points) {
	obj_game.pointsheight -= 4;
	global.points += points;
}

//function changesprite(object,sprite) {
//	if (object.sprite_index != sprite) {
//		object.sprite_index = sprite;
//		object.image_index = 0;
//	}
//}

function addhealth(target,amount) {
	target.hp += (amount);
	if (target.hp > target.maxhp) {
		//addpoints((hp - maxhp) * 5);
		target.hp = maxhp;
	}
	
	if (target == obj_player) {
		//healthbar effect here
	}
}