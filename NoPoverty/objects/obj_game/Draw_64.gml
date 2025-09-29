/// @desc

draw_set_font(fnt_01);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//level transitions
var _transitionspeed = 20; //10
if (transitionchange == false) {
	if (obj_transition.x > (obj_camera.camerax - obj_transition.sprite_width)) {
		transitionx -= _transitionspeed;
		obj_transition.x = (obj_camera.camerax + transitionx);
	}
}
if (transitionchange == true) {
	if (obj_game.transitionx <= 0) {
		if (room != rm_level4) {
			if (obj_changeroom.desiredroom == noone) {
				global.level++;
				room_goto(rm_budget);
			} else {
				room_goto(obj_changeroom.desiredroom);
			}
		} else {
			//idk you win
			var _wincolor = make_color_rgb(247,142,214);
			draw_sprite_stretched(spr_player_victory,0,obj_camera.camerawidth/2-14,32,30,30);
			//draw_line(obj_camera.camerawidth/2,0,obj_camera.camerawidth/2,obj_camera.cameraheight)
			draw_text_color(obj_camera.camerawidth/2,obj_camera.cameraheight/2,global.lang[32],_wincolor,_wincolor,_wincolor,_wincolor,1);
			
			if (global.coinnum >= 4) && (global.playerdowngrades[0] <= 0) && (global.playerdowngrades[1] <= 0) && (global.playerdowngrades[2] <= 0) && (global.playerdowngrades[3] <= 0) {
				draw_text_color(obj_camera.camerawidth/2,obj_camera.cameraheight*0.8,global.lang[33],_wincolor,_wincolor,_wincolor,_wincolor,1);
			}
			if (global.coinnum <= 0) && (global.playerdowngrades[0] >= 3) && (global.playerdowngrades[1] >= 3) && (global.playerdowngrades[2] >= 3) && (global.playerdowngrades[3] >= 3) {
				draw_text_color(obj_camera.camerawidth/2,obj_camera.cameraheight*0.8,global.lang[34],_wincolor,_wincolor,_wincolor,_wincolor,1);
			}
			audio_stop_sound(mus_level4temp_afterboattankapparitions);
		}
	}
	if (transitionx - _transitionspeed <= 0) {
		transitionx = 0;
	} else {
		transitionx -= _transitionspeed;
	}
	obj_transition.x = (obj_camera.camerax + transitionx);
}

//draw hud
if (instance_exists(obj_player)) {
	var _hudsprite;
	var _startdistance;
	var _betweendistance;
	
	//draw hp
	_hudsprite = spr_hudhealth;
	_startdistance = 10;
	_betweendistance = 2.5;
	for(var i = obj_player.hp; i > 0; i--) {
		draw_sprite_stretched(_hudsprite,0,10,_startdistance,sprite_get_width(_hudsprite),sprite_get_height(_hudsprite));
		_startdistance += (sprite_get_height(_hudsprite) + _betweendistance); 
	}
	for(var i = (obj_player.maxhp - obj_player.hp); i > 0; i--) {
		draw_sprite_stretched(_hudsprite,2,10,_startdistance,sprite_get_width(_hudsprite),sprite_get_height(_hudsprite));
		_startdistance += (sprite_get_height(_hudsprite) + _betweendistance); 
	}
	
	//draw coins
	//draw_text_transformed_color(view_wport[0]*0.05,view_hport[0]*0.10,global.coinnum,5,5,0,c_black,c_black,c_black,c_black,1);
	_hudsprite = spr_hudcoin;
	_startdistance = 10;
	_betweendistance = 5;
	for(var i = global.coinnum; i > 0; i--) {
		draw_sprite_stretched(_hudsprite,0,30,_startdistance,sprite_get_width(_hudsprite),sprite_get_height(_hudsprite));
		_startdistance += (sprite_get_height(_hudsprite) + _betweendistance); 
	}
	
	//draw coin outlines
	for(var i = (roomcoins - global.coinnum); i > 0; i--) {
		draw_sprite_stretched(_hudsprite,1,30,_startdistance,sprite_get_width(_hudsprite),sprite_get_height(_hudsprite));
		_startdistance += (sprite_get_height(_hudsprite) + _betweendistance); 
	}
	
	//draw points
	draw_set_halign(fa_right);
	draw_set_font(fnt_02);
	var _pointscolor;
	var _maxpointsheight = 5;
	var _normalpointsheight = 15;
	if (obj_game.pointsheight < _maxpointsheight) {
		obj_game.pointsheight = _maxpointsheight
	}
	if (pointsheight < _normalpointsheight) {
		_pointscolor = make_color_rgb(247,142,214);
		pointsheight += 0.5;
	} else {
		_pointscolor = c_white;
	}
	if (global.points > 0) {
		//draw_text_color(obj_camera.camerawidth-_normalpointsheight,pointsheight,string(global.points),_pointscolor,_pointscolor,_pointscolor,_pointscolor,1);
	}
	
	//draw tutorial
	draw_set_font(fnt_01);
	draw_set_halign(fa_center);
	var _tutcolor = make_color_rgb(247,142,214);
	if (room == rm_level1) {
		var _tuttext = "";
		if (obj_player.x > 128) && (obj_player.x < 224) {
			_tuttext = global.lang[26];
		}
		if (obj_player.x > 256) && (obj_player.x < 496) {
			_tuttext = global.lang[27];
		}
		if (obj_player.x > 1360) && (obj_player.x < 1792) {
			_tuttext = global.lang[28];
		}
		if (obj_player.x > 1792) && (obj_player.x < 2288) {
			_tuttext = global.lang[29];
		}
		if (obj_player.x > 2336) && (obj_player.x < 2720) && (obj_player.y > 48) {
			if (tutpitpart2 == true) {
				_tuttext = global.lang[31];
			} else {
				_tuttext = global.lang[30];
			}
		}
		if (obj_player.x > 2688) && (obj_player.x < 2720) && (obj_player.y > 64) {
			alarm[2] = (2 * game_get_speed(gamespeed_fps));
		}
		draw_text_transformed_color(obj_camera.camerawidth/2,obj_camera.cameraheight*0.90,_tuttext,1,1,0,_tutcolor,_tutcolor,_tutcolor,_tutcolor,1);
	}
}

if (global.debug == true) {
	var _cw = obj_camera.camerawidth;
	var _ch = obj_camera.cameraheight;
	draw_set_halign(fa_right);
	draw_set_color(c_yellow);
	draw_text(_cw-8,_ch/3,"left alt\nnext level");
	draw_text(_cw-8,_ch/3+_ch/3,"right alt\ngain coin");
	if (keyboard_check_pressed(vk_lalt)) {
		if (room != rm_level4) {
			global.level++;
			room_goto(rm_budget);
		} else {
			if (instance_exists(obj_player)) {
				obj_player.x = 3135;
				obj_player.y = 123;
			}
		}
	}
	if (keyboard_check_pressed(vk_ralt)) {
		if (global.coinnum < 4) {
			audio_play_sound(sfx_combo,0,0);
			global.coinnum++;
		}
	}
}