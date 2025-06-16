/// @desc shoot projectile

if (caninput) {
	var _proj = instance_create_depth(x,y,0,obj_enemy02_proj);
	_proj.hsp = (1.5 * dir);
	_proj.dir = dir;
}

alarm[3] = (firingrate * game_get_speed(gamespeed_fps));