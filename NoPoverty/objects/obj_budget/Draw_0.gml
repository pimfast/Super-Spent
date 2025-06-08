/// @desc

var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _left = keyboard_check_pressed(vk_left);
var _right = keyboard_check_pressed(vk_right);
var _confirm = keyboard_check_pressed(vk_space);
if (!_confirm) {
	_confirm = keyboard_check_pressed(vk_enter);
}
var _mouseup = mouse_wheel_up();
var _mousedown = mouse_wheel_down();

//wait why are we doing mouse controls now? idk do something about this later
if (_mouseup) {
	if (logstarty < 10) {
		logstarty += 10;
	}
}
if (_mousedown) {
	logstarty -= 10;
}

if (global.coinnum != 0) {
	_left = 0;
	_right = 0;
}

draw_set_font(fnt_01);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//draw_text_ext(room_width*0.75,10,global.debufflog,3,50);
//AND NOW FOR MY GREATEST FEAT OF PROGRAMMING:
var _logarraylength = array_length(global.debufflog);
var _debufflogx = ((room_width/3)+(room_width/3));
var _debufflogy = 0;
var _olddebuffcolor = c_white;
var _newdebuffcolor = c_purple;
var _canceldebuffcolor = c_gray;
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

switch (selectedoption) {
	case 0:
		//confirm
		draw_text_color(_necessitiesx,_foody,"Food",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_purple,c_purple,c_purple,c_purple,1);
		if ((alarm_get(0) <= 0)) {
			draw_text_color(room_width/2,_confirmy,"Confirm",c_white,c_white,c_white,c_white,1);
			if (_confirm) {
				alarm[0] = (1 * game_get_speed(gamespeed_fps));
			}
			if (_left) || (_right) {
				selectedoption = lastselected;
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
		break;
	case 2:
		//water
		draw_text_color(room_width/2,_confirmy,"Confirm",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_foody,"Food",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_white,c_white,c_white,c_white,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_purple,c_purple,c_purple,c_purple,1);
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
		break;
	case 3:
		//shelter
		draw_text_color(room_width/2,_confirmy,"Confirm",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_foody,"Food",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_white,c_white,c_white,c_white,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_purple,c_purple,c_purple,c_purple,1);
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
		break;
	case 4:
		//wash
		draw_text_color(room_width/2,_confirmy,"Confirm",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_foody,"Food",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_watery,"Water",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_sheltery,"Shelter",c_purple,c_purple,c_purple,c_purple,1);
		draw_text_color(_necessitiesx,_washy,"Wash",c_white,c_white,c_white,c_white,1);
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
		break;
}