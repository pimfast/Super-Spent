/// @desc

if (keyboard_check_pressed(vk_escape)) {
	global.coinnum = 0;
	room_goto(rm_menu);
}

if (keyboard_check_pressed(ord("N"))) && (room != rm_level4) {
	global.level++;
	room_goto(rm_budget);
}

if (alarm[1] != -1) {
	obj_player.x += obj_player.walksp;
}