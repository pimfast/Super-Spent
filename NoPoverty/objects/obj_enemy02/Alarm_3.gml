/// @desc shoot projectile

if (caninput) {
	var _proj = instance_create_layer(x,y,"Instances",obj_enemy02_proj);
	_proj.hsp = (1.5 * dir);
	_proj.dir = dir;
	_proj.image_xscale = image_xscale;
	_proj.image_yscale = image_yscale;
}

alarm[3] = (firingrate * game_get_speed(gamespeed_fps));