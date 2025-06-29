/// @desc

var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _left = keyboard_check_pressed(vk_left);
var _right = keyboard_check_pressed(vk_right);
var _confirm = keyboard_check_pressed(vk_space);
if (!_confirm) {
	_confirm = keyboard_check_pressed(vk_enter);
}

if (instance_exists(obj_transition)) {
	obj_transition.image_alpha += 0.05;
	if (obj_transition.image_alpha >= 1.5) {
		room_goto(asset_get_index("rm_level"+string(global.level)));
	}	
}

draw_set_font(fnt_01);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//draw debuff log
var _logarraylength = array_length(global.debufflog);
var _debufflogx = ((room_width/3)+(room_width/3));
var _debufflogy = 0;
var _olddebuffcolor = c_white;
var _newdebuffcolor = c_red;
var _canceldebuffcolor = c_gray;
if (selectedoption == 5) {
	var _olddebuffcolor = make_color_rgb(255,255,255);
	var _newdebuffcolor = make_color_rgb(255,50,50);
	var _canceldebuffcolor = make_color_rgb(178,178,178);
}
for (var i = 0; i < _logarraylength; i++) {
	if (global.debufflog[i] != global.downgradesFood[global.playerdowngrades[0]]) && (global.debufflog[i] != global.downgradesWater[global.playerdowngrades[1]]) && (global.debufflog[i] != global.downgradesShelter[global.playerdowngrades[2]]) && (global.debufflog[i] != global.downgradesWash[global.playerdowngrades[3]]){
		draw_set_color(_olddebuffcolor);
	} else {
		if ((global.debufflog[i] == global.downgradesFood[global.playerdowngrades[0]]) && food == true) || ((global.debufflog[i] == global.downgradesWater[global.playerdowngrades[1]]) && water == true) || ((global.debufflog[i] == global.downgradesShelter[global.playerdowngrades[2]]) && shelter == true) || ((global.debufflog[i] == global.downgradesWash[global.playerdowngrades[3]]) && wash == true) {
			draw_set_color(_canceldebuffcolor);
		} else {
			draw_set_color(_newdebuffcolor);
		}
	}
	draw_text_ext(_debufflogx,(logstarty + _debufflogy),global.debufflog[i],-1,100);
	//get the text height of the last output and add it to _debufflogy for the next one
	_debufflogy += string_height_ext(global.debufflog[i],-1,100);
}

draw_set_font(fnt_01);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw coins
//draw_text_transformed_color(view_wport[0]*0.05,view_hport[0]*0.10,global.coinnum,5,5,0,c_black,c_black,c_black,c_black,1);
var _coinsprite = spr_hudcoin;
var _startdistance = 10;
var _betweendistance = 10;
for(var i = global.coinnum; i > 0; i--) {
	draw_sprite_stretched(_coinsprite,0,(room_width/2)-8,_startdistance+10,sprite_get_width(_coinsprite),sprite_get_height(_coinsprite));
	_startdistance += (sprite_get_height(_coinsprite) + _betweendistance); 
}

//confirm button is hidden until all coins are used up
var _confirmalpha = 0;
if (global.coinnum == 0) {
	_confirmalpha = 1; //it would be nice to have it fade in but that's for future
}

//menu options
var _necessitiesx = (room_width * 0.20)
var _confirmy = (room_height * 0.65)
var _foody = (room_height * 0.20)
var _watery = (room_height * 0.40)
var _sheltery = (room_height * 0.60)
var _washy = (room_height * 0.80)

var _necessitiescoindistance = 30
if (food) {
	draw_sprite(spr_hudcoin,0,_necessitiesx + _necessitiescoindistance, _foody-8)
}
if (water) {
	draw_sprite(spr_hudcoin,0,_necessitiesx + _necessitiescoindistance, _watery-8)
}
if (shelter) {
	draw_sprite(spr_hudcoin,0,_necessitiesx + _necessitiescoindistance, _sheltery-8)
}
if (wash) {
	draw_sprite(spr_hudcoin,0,_necessitiesx + _necessitiescoindistance, _washy-8)
}

var _selectedcolor = c_white;
var _unselectedcolor = make_color_rgb(247,142,214);
switch (selectedoption) {
	case 0:
		//confirm
		draw_text_color(_necessitiesx,_foody,global.lang[21],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_watery,global.lang[22],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_sheltery,global.lang[23],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_washy,global.lang[24],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if ((alarm_get(0) <= 0)) {
			draw_text_color(room_width/2,_confirmy,global.lang[25],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,_confirmalpha);
			if (_confirm) {
				audio_play_sound(sfx_select,0,0);
				alarm[0] = (1 * game_get_speed(gamespeed_fps));
			}
			if (_left) {
				selectedoption = lastselected;
			}
			if (_right) {
				selectedoption = 5;
			}
		} else {
			draw_text_color(room_width/2,_confirmy,global.lang[25],c_gray,c_gray,c_gray,c_gray,1);
		}
		break;
	case 1:
		//food
		draw_text_color(room_width/2,_confirmy,global.lang[25],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,_confirmalpha);
		draw_text_color(_necessitiesx,_foody,global.lang[21],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		draw_text_color(_necessitiesx,_watery,global.lang[22],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_sheltery,global.lang[23],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_washy,global.lang[24],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (_confirm) {
			audio_play_sound(sfx_select,0,0);
			if (food == false) {
				if (global.coinnum > 0) {
					food = true;
					global.coinnum--;
				}
			} else {
				food = false;
				global.coinnum++;
			}
		}
		if (_up) {
			selectedoption = 4;
		}
		if (_down) {
			selectedoption = 2;
		}
		if (_left) {
			lastselected = selectedoption;
			selectedoption = 5;
		}
		if (_right) {
			if (global.coinnum == 0) {
				lastselected = selectedoption;
				selectedoption = 0;
			} else {
				lastselected = selectedoption;
				selectedoption = 5;
			}
		}
		break;
	case 2:
		//water
		draw_text_color(room_width/2,_confirmy,global.lang[25],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,_confirmalpha);
		draw_text_color(_necessitiesx,_foody,global.lang[21],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_watery,global.lang[22],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		draw_text_color(_necessitiesx,_sheltery,global.lang[23],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_washy,global.lang[24],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (_confirm) {
			audio_play_sound(sfx_select,0,0);
			if (water == false) {
				if (global.coinnum > 0) {
					water = true;
					global.coinnum--;
				}
			} else {
				water = false;
				global.coinnum++;
			}
		}
		if (_up) {
			selectedoption = 1;
		}
		if (_down) {
			selectedoption = 3;
		}
		if (_left) {
			lastselected = selectedoption;
			selectedoption = 5;
		}
		if (_right) {
			if (global.coinnum == 0) {
				lastselected = selectedoption;
				selectedoption = 0;
			} else {
				lastselected = selectedoption;
				selectedoption = 5;
			}
		}
		break;
	case 3:
		//shelter
		draw_text_color(room_width/2,_confirmy,global.lang[25],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,_confirmalpha);
		draw_text_color(_necessitiesx,_foody,global.lang[21],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_watery,global.lang[22],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_sheltery,global.lang[23],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		draw_text_color(_necessitiesx,_washy,global.lang[24],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (_confirm) {
			audio_play_sound(sfx_select,0,0);
			if (shelter == false) {
				if (global.coinnum > 0) {
					shelter = true;
					global.coinnum--;
				}
			} else {
				shelter = false;
				global.coinnum++;
			}
		}
		if (_up) {
			selectedoption = 2;
		}
		if (_down) {
			selectedoption = 4;
		}
		if (_left) {
			lastselected = selectedoption;
			selectedoption = 5;
		}
		if (_right) {
			if (global.coinnum == 0) {
				lastselected = selectedoption;
				selectedoption = 0;
			} else {
				lastselected = selectedoption;
				selectedoption = 5;
			}
		}
		break;
	case 4:
		//wash
		draw_text_color(room_width/2,_confirmy,global.lang[25],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,_confirmalpha);
		draw_text_color(_necessitiesx,_foody,global.lang[21],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_watery,global.lang[22],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_sheltery,global.lang[23],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_washy,global.lang[24],_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		if (_confirm) {
			audio_play_sound(sfx_select,0,0);
			if (wash == false) {
				if (global.coinnum > 0) {
					wash = true;
					global.coinnum--;
				}
			} else {
				wash = false;
				global.coinnum++;
			}
		}
		if (_up) {
			selectedoption = 3;
		}
		if (_down) {
			selectedoption = 1;
		}
		if (_left) {
			lastselected = selectedoption;
			selectedoption = 5;
		}
		if (_right) {
			if (global.coinnum == 0) {
				lastselected = selectedoption;
				selectedoption = 0;
			} else {
				lastselected = selectedoption;
				selectedoption = 5;
			}
		}
		break;
	case 5:
		//log
		_up = keyboard_check(vk_up);
		_down = keyboard_check(vk_down);
		draw_text_color(room_width/2,_confirmy,global.lang[25],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,_confirmalpha);
		draw_text_color(_necessitiesx,_foody,global.lang[21],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_watery,global.lang[22],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_sheltery,global.lang[23],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_necessitiesx,_washy,global.lang[24],_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		if (_confirm) {
			//audio_play_sound(sfx_select,0,0);
		}
		if (_up) {
			if (logstarty < 10) {
				logstarty += 2; //10
			}
		}
		if (_down) {
			logstarty -= 2;
		}
		if (_left) {
			if (global.coinnum == 0) {
				selectedoption = 0;
			} else {
				selectedoption = lastselected;
			}
		}
		if (_right) {
			selectedoption = lastselected;
		}
		break;
}