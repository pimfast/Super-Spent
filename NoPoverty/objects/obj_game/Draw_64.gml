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
}