/// @desc

hsp = 0;
vsp = 0;
dir = 0;
alarm[0] = (0.75 * game_get_speed(gamespeed_fps));
disappear = false;

//hitbox
var _attacksize = 16;
var _attackdistance = 0;
var _attackheight = 0;
			
myhitbox = instance_create_depth(x,y,0,obj_hitbox);
myhitbox.image_xscale = (_attacksize * image_xscale);
myhitbox.image_yscale = (_attacksize * image_yscale);
myhitbox.attacksize = _attacksize;
myhitbox.attackdistance = _attackdistance;
myhitbox.attackheight = _attackheight;
myhitbox.damagesEnemies = false;
myhitbox.damagesPlayer = true;
myhitbox.owner = self;
			
myhitbox.dmg = 2;
myhitbox.hknockback = 6;
myhitbox.vknockback = -3;
myhitbox.stundur = 0.5;