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

//draw coins
//draw_text_transformed_color(view_wport[0]*0.05,view_hport[0]*0.10,global.coinnum,5,5,0,c_black,c_black,c_black,c_black,1);
var _coinsprite = spr_temp; //replace with spr_hudcoins
var _startdistance = 20;
var _betweendistance = 10;
for(var i = global.coinnum; i > 0; i--) {
	draw_sprite_stretched(_coinsprite,0,20,_startdistance,sprite_get_width(_coinsprite),sprite_get_height(_coinsprite));
	_startdistance += (sprite_get_height(_coinsprite) + _betweendistance); 
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
	draw_sprite(spr_temp,0,_necessitiesx + _necessitiescoindistance, _foody)
}
if (water) {
	draw_sprite(spr_temp,0,_necessitiesx + _necessitiescoindistance, _watery)
}
if (shelter) {
	draw_sprite(spr_temp,0,_necessitiesx + _necessitiescoindistance, _sheltery)
}
if (wash) {
	draw_sprite(spr_temp,0,_necessitiesx + _necessitiescoindistance, _washy)
}

switch (selectedoption) {
	case 0:
		//confirm
		draw_text_color(_necessitiesx,_foody,"Food",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_purple,c_purple,c_purple,c_purple,1);
		if ((alarm_get(0) <= 0)) {
			draw_text_color(room_width/2,_confirmy,"Confirm",c_white,c_white,c_white,c_white,1);
			if (_left) || (_right) {
				selectedoption = lastselected;
			}
			if (_confirm) {
				if (food == false) {
					global.playerdowngrades[0] += 1;
				}
				if (water == false) {
					global.playerdowngrades[1] += 1;
				}
				if (shelter == false) {
					global.playerdowngrades[2] += 1;
				}
				if (wash == false) {
					global.playerdowngrades[3] += 1;
				}
				alarm[0] = (1 * game_get_speed(gamespeed_fps));
			}
		} else {
			draw_text_color(room_width/2,_confirmy,"Confirm",c_gray,c_gray,c_gray,c_gray,1);
		}
		break;
	case 1:
		//food
		draw_text_color(room_width/2,_confirmy,"Confirm",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_foody,"Food",c_white,c_white,c_white,c_white,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_purple,c_purple,c_purple,c_purple,1);
		if (_up) {
			selectedoption = 4;
		}
		if (_down) {
			selectedoption = 2;
		}
		if (_left) || (_right) {
			lastselected = selectedoption;
			selectedoption = 0;
		}
		if (_confirm) {
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
		break;
	case 2:
		//water
		draw_text_color(room_width/2,_confirmy,"Confirm",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_foody,"Food",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_white,c_white,c_white,c_white,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_purple,c_purple,c_purple,c_purple,1);
		if (_up) {
			selectedoption = 1;
		}
		if (_down) {
			selectedoption = 3;
		}
		if (_left) || (_right) {
			lastselected = selectedoption;
			selectedoption = 0;
		}
		if (_confirm) {
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
		break;
	case 3:
		//shelter
		draw_text_color(room_width/2,_confirmy,"Confirm",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_foody,"Food",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_white,c_white,c_white,c_white,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_purple,c_purple,c_purple,c_purple,1);
		if (_up) {
			selectedoption = 2;
		}
		if (_down) {
			selectedoption = 4;
		}
		if (_left) || (_right) {
			lastselected = selectedoption;
			selectedoption = 0;
		}
		if (_confirm) {
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
		break;
	case 4:
		//wash
		draw_text_color(room_width/2,_confirmy,"Confirm",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_foody,"Food",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_white,c_white,c_white,c_white,1);
		if (_up) {
			selectedoption = 3;
		}
		if (_down) {
			selectedoption = 1;
		}
		if (_left) || (_right) {
			lastselected = selectedoption;
			selectedoption = 0;
		}
		if (_confirm) {
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
		break;
}