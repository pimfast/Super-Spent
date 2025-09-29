/// @desc

if (keyboard_check_pressed(vk_alt)) {
	switch (global.debug) {
		case true:
			audio_play_sound(sfx_select,0,0,1,0,0.5);
			global.debug = false;
			break;
		case false:
			audio_play_sound(sfx_select,0,0);
			global.debug = true;
			break;
	}
}