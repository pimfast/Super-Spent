/// @desc

//stats
hp = 5; //health
dmg = 1; //damage
grv = 0.34; //lower is lighter higher is heavier
walksp = 0.5; //how fast it goes
firingrate = 1.5; //how often it fires

//hitbox
var _attacksize = 12;
var _attackdistance = 0;
var _attackheight = 1;

myhitbox = instance_create_depth((x+(dir*_attackdistance)) - (_attacksize/2),(y+_attackheight) - (_attacksize/2),0,obj_hitbox);
myhitbox.image_xscale = _attacksize;
myhitbox.image_yscale = _attacksize;
myhitbox.attacksize = _attacksize;
myhitbox.attackdistance = _attackdistance;
myhitbox.attackheight = _attackheight;
myhitbox.damagesPlayer = true;
myhitbox.owner = self;

myhitbox.dmg = 2;
myhitbox.hknockback = 6;
myhitbox.vknockback = -3;
myhitbox.stundur = 0.5;

//necessary code (do not / cannot change)
hsp = 0;
vsp = 0;
//dir is set in variable definitions
bonushsp = 0;
caninput = true;
alarm[3] = (firingrate * game_get_speed(gamespeed_fps));