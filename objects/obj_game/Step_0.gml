/// @desc

if (keyboard_check_pressed(vk_escape)) {
	room_goto(rm_menu);
}

if (keyboard_check_pressed(ord("N"))) {
	room_goto_next();
}