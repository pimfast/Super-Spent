/// @desc

var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _left = keyboard_check_pressed(vk_left);
var _right = keyboard_check_pressed(vk_right);
var _confirm = keyboard_check_pressed(vk_space);
if (!_confirm) {
	_confirm = keyboard_check_pressed(vk_enter);
}

draw_set_font(fnt_01);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed_color(room_width/2,room_height*0.25,"Super  Spent",2,2,0,c_purple,c_purple,c_purple,c_purple,1);

switch (selectedoption) {
	case 0:
		//start game
		draw_text_color(room_width/2,room_height*0.65,global.lang[13],c_white,c_white,c_white,c_white,1);
		draw_text_color(room_width/2,room_height*0.75,global.lang[14],c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(room_width/2,room_height*0.85,global.lang[15],c_purple,c_purple,c_purple,c_purple,1);
		if (_up) {
			selectedoption = 2;
		}
		if (_down) {
			selectedoption = 1;
		}
		if (_confirm) {
			room_goto(asset_get_index("rm_level"+string(global.level)));
		}
		break;
	case 1:
		//settings
		draw_text_color(room_width/2,room_height*0.65,global.lang[13],c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(room_width/2,room_height*0.75,global.lang[14],c_white,c_white,c_white,c_white,1);
		draw_text_color(room_width/2,room_height*0.85,global.lang[15],c_purple,c_purple,c_purple,c_purple,1);
		if (_up) {
			selectedoption = 0;
		}
		if (_down) {
			selectedoption = 2;
		}
		if (_confirm) {
			selectedoption = 3;
		}
		break;
	case 2:
		//quit game
		draw_text_color(room_width/2,room_height*0.65,global.lang[13],c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(room_width/2,room_height*0.75,global.lang[14],c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(room_width/2,room_height*0.85,global.lang[15],c_white,c_white,c_white,c_white,1);
		if (_up) {
			selectedoption = 1;
		}
		if (_down) {
			selectedoption = 0;
		}
		if (_confirm) {
			game_end();
		}
		break;
	case 3:
		//back, settings menu
		if (window_get_fullscreen()) {
			draw_text_color(room_width/3,room_height*0.75,global.lang[17],c_purple,c_purple,c_purple,c_purple,1);
		} else {
			draw_text_color(room_width/3,room_height*0.75,global.lang[18],c_purple,c_purple,c_purple,c_purple,1);
		}
		draw_text_color(room_width/2,room_height*0.75,global.lang[16],c_white,c_white,c_white,c_white,1);
		if (audio_group_get_gain(ag_sfx)) {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[19],c_purple,c_purple,c_purple,c_purple,1);
		} else {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[20],c_purple,c_purple,c_purple,c_purple,1);
		}
		draw_text_color(room_width/2,room_height*0.875,global.lang[0],c_purple,c_purple,c_purple,c_purple,1);
		if (_left) {
			selectedoption = 4;
		}
		if (_right) {
			selectedoption = 5;
		}
		if (_up) || (_down) {
			selectedoption = 6;
		}
		if (_confirm) {
			selectedoption = 1;
		}
		break;
	case 4:
		//enable/disable fullscreen, settings menu
		if (window_get_fullscreen()) {
			draw_text_color(room_width/3,room_height*0.75,global.lang[17],c_white,c_white,c_white,c_white,1);
		} else {
			draw_text_color(room_width/3,room_height*0.75,global.lang[18],c_white,c_white,c_white,c_white,1);
		}
		draw_text_color(room_width/2,room_height*0.75,global.lang[16],c_purple,c_purple,c_purple,c_purple,1);
		if (audio_group_get_gain(ag_sfx)) {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[19],c_purple,c_purple,c_purple,c_purple,1);
		} else {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[20],c_purple,c_purple,c_purple,c_purple,1);
		}
		draw_text_color(room_width/2,room_height*0.875,global.lang[0],c_purple,c_purple,c_purple,c_purple,1);
		if (_left) {
			selectedoption = 5;
		}
		if (_right) {
			selectedoption = 3;
		}
		if (_confirm) {
			if (window_get_fullscreen()) {
				window_set_fullscreen(false);
			} else {
				window_set_fullscreen(true);
			}
		}
		break;
	case 5:
		//enable/disable volume, settings menu
		if (window_get_fullscreen()) {
			draw_text_color(room_width/3,room_height*0.75,global.lang[17],c_purple,c_purple,c_purple,c_purple,1);
		} else {
			draw_text_color(room_width/3,room_height*0.75,global.lang[18],c_purple,c_purple,c_purple,c_purple,1);
		}
		draw_text_color(room_width/2,room_height*0.75,global.lang[16],c_purple,c_purple,c_purple,c_purple,1);
		if (audio_group_get_gain(ag_sfx)) {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[19],c_white,c_white,c_white,c_white,1);
		} else {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[20],c_white,c_white,c_white,c_white,1);
		}
		draw_text_color(room_width/2,room_height*0.875,global.lang[0],c_purple,c_purple,c_purple,c_purple,1);
		if (_left) {
			selectedoption = 3;
		}
		if (_right) {
			selectedoption = 4;
		}
		if (_confirm) {
			if (audio_group_get_gain(ag_sfx)) {
				audio_group_set_gain(ag_mus,0,0);
				audio_group_set_gain(ag_sfx,0,0);
			} else {
				audio_group_set_gain(ag_mus,1,0);
				audio_group_set_gain(ag_sfx,1,0);
			}
		}
		break;
	case 6:
		//toggle language, settings menu
		if (window_get_fullscreen()) {
			draw_text_color(room_width/3,room_height*0.75,global.lang[17],c_purple,c_purple,c_purple,c_purple,1);
		} else {
			draw_text_color(room_width/3,room_height*0.75,global.lang[18],c_purple,c_purple,c_purple,c_purple,1);
		}
		draw_text_color(room_width/2,room_height*0.75,global.lang[16],c_purple,c_purple,c_purple,c_purple,1);
		if (audio_group_get_gain(ag_sfx)) {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[19],c_purple,c_purple,c_purple,c_purple,1);
		} else {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[20],c_purple,c_purple,c_purple,c_purple,1);
		}
		draw_text_color(room_width/2,room_height*0.875,global.lang[0],c_white,c_white,c_white,c_white,1);
		if (_up) || (_down) {
			selectedoption = 3;
		}
		if (_confirm) {
			loadlanguage();
		}
		break;
}

if (keyboard_check_pressed(vk_escape)) {
	if (selectedoption >= 3) {
		selectedoption = 1;
	} else {
		if (selectedoption <= 1) {
			selectedoption = 2;
		} else {
			game_end();
		}
	}
}