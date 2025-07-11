/// @desc

var _up = 0;
var _down = 0;
var _left = 0;
var _right = 0;
var _confirm = 0;
if (caninput) {
	var _up = keyboard_check_pressed(vk_up);
	var _down = keyboard_check_pressed(vk_down);
	var _left = keyboard_check_pressed(vk_left);
	var _right = keyboard_check_pressed(vk_right);
	var _confirm = keyboard_check_pressed(vk_space);
	if (!_confirm) {
		_confirm = keyboard_check_pressed(vk_enter);
	}
}

if (_confirm) {
	audio_play_sound(sfx_select,0,0);
}

if (instance_exists(obj_transition)) {
	obj_transition.image_alpha += 0.05;
}

draw_set_font(fnt_01);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _unselectedcolor = make_color_rgb(247,142,214);
var _selectedcolor;
if (caninput == true) {
	_selectedcolor = c_white;
} else {
	_selectedcolor = c_gray;
}

draw_text_transformed_color(room_width/2,room_height*0.25,"Super  Spent",2,2,0,_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);

switch (selectedoption) {
	case 0:
		//start game
		draw_text_color(room_width/2,room_height*0.65,global.lang[13],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		draw_text_color(room_width/2,room_height*0.75,global.lang[14],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(room_width/2,room_height*0.85,global.lang[15],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (_up) {
			selectedoption = 2;
		}
		if (_down) {
			selectedoption = 1;
		}
		if (_confirm) {
			caninput = false;
			audio_play_sound(sfx_confirm,0,0);
			audio_group_set_gain(ag_mus,0,500);
			alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
			var _transition = instance_create_depth(0,0,-100,obj_transition);
			_transition.image_alpha = 0;
		}
		break;
	case 1:
		//settings
		draw_text_color(room_width/2,room_height*0.65,global.lang[13],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(room_width/2,room_height*0.75,global.lang[14],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		draw_text_color(room_width/2,room_height*0.85,global.lang[15],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
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
		draw_text_color(room_width/2,room_height*0.65,global.lang[13],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(room_width/2,room_height*0.75,global.lang[14],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(room_width/2,room_height*0.85,global.lang[15],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
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
			draw_text_color(room_width/3,room_height*0.75,global.lang[17],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		} else {
			draw_text_color(room_width/3,room_height*0.75,global.lang[18],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		}
		draw_text_color(room_width/2,room_height*0.75,global.lang[16],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		if (global.enablesound) {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[19],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		} else {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[20],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		}
		draw_text_color(room_width/2,room_height*0.875,global.lang[0],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
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
			draw_text_color(room_width/3,room_height*0.75,global.lang[17],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		} else {
			draw_text_color(room_width/3,room_height*0.75,global.lang[18],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		}
		draw_text_color(room_width/2,room_height*0.75,global.lang[16],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (global.enablesound) {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[19],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		} else {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[20],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		}
		draw_text_color(room_width/2,room_height*0.875,global.lang[0],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
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
			draw_text_color(room_width/3,room_height*0.75,global.lang[17],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		} else {
			draw_text_color(room_width/3,room_height*0.75,global.lang[18],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		}
		draw_text_color(room_width/2,room_height*0.75,global.lang[16],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (global.enablesound) {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[19],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		} else {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[20],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		}
		draw_text_color(room_width/2,room_height*0.875,global.lang[0],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (_left) {
			selectedoption = 3;
		}
		if (_right) {
			selectedoption = 4;
		}
		if (_confirm) {
			if (global.enablesound) {
				global.enablesound = false;
				audio_group_set_gain(ag_mus,0,0);
				audio_group_set_gain(ag_sfx,0,0);
			} else {
				global.enablesound = true;
				audio_group_set_gain(ag_mus,1,0);
				audio_group_set_gain(ag_sfx,1,0);
			}
		}
		break;
	case 6:
		//toggle language, settings menu
		if (window_get_fullscreen()) {
			draw_text_color(room_width/3,room_height*0.75,global.lang[17],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		} else {
			draw_text_color(room_width/3,room_height*0.75,global.lang[18],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		}
		draw_text_color(room_width/2,room_height*0.75,global.lang[16],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (global.enablesound) {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[19],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		} else {
			draw_text_color((room_width/3)+(room_width/3),room_height*0.75,global.lang[20],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		}
		draw_text_color(room_width/2,room_height*0.875,global.lang[0],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
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