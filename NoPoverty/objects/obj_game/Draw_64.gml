/// @desc

//draw_set_font(fnt_01);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);

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
	
	//draw coins
	//draw_text_transformed_color(view_wport[0]*0.05,view_hport[0]*0.10,global.coinnum,5,5,0,c_black,c_black,c_black,c_black,1);
	_hudsprite = spr_hudcoin;
	_startdistance = 10;
	_betweendistance = 5;
	for(var i = global.coinnum; i > 0; i--) {
		draw_sprite_stretched(_hudsprite,0,30,_startdistance,sprite_get_width(_hudsprite),sprite_get_height(_hudsprite));
		_startdistance += (sprite_get_height(_hudsprite) + _betweendistance); 
	}
	
	//draw coin outlines and coins
	for(var i = (roomcoins - global.coinnum); i > 0; i--) {
		draw_sprite_stretched(_hudsprite,1,30,_startdistance,sprite_get_width(_hudsprite),sprite_get_height(_hudsprite));
		_startdistance += (sprite_get_height(_hudsprite) + _betweendistance); 
	}
	
	//draw tutorial
	draw_set_font(fnt_01);
	var _tutcolor = make_color_rgb(247,142,214);
	if (room == rm_level1) {
		var _tuttext = "";
		if (obj_player.x > 128) && (obj_player.x < 256) {
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
			_tuttext = global.lang[30];
			if (tutpitpart2 == true) {
				_tuttext = global.lang[31];
			}
		}
		if (obj_player.x > 2688) && (obj_player.x < 2720) && (obj_player.y > 64) {
			alarm[2] = (2 * game_get_speed(gamespeed_fps));
		}
		draw_text_transformed_color(obj_camera.camerawidth/2,obj_camera.cameraheight*0.90,_tuttext,1,1,0,_tutcolor,_tutcolor,_tutcolor,_tutcolor,1);
	}
}