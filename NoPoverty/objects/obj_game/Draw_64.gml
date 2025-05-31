/// @desc

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