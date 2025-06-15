/// @desc

starty = y;
fall = false;
vsp = 0;

dir = -1;

//hitbox
var _attacksize = 16;
var _attackdistance = -8;
var _attackheight = 9;
			
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
myhitbox.vknockback = 3;
myhitbox.stundur = 0.5;

myhitbox.active = false;