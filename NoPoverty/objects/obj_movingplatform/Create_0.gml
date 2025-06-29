/// @desc

vsp = 0;
fall = false;

if (fallingplatform == true) {
	sprite_index = spr_fallingplatform;
	dir = -1;
	starty = y;
	
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

	myhitbox.dmg = 10;
	myhitbox.hknockback = 0;
	myhitbox.vknockback = 3;
	myhitbox.stundur = 1;

	myhitbox.active = false;
}

//can't put it in the create event soz wait yes i can
if (handle == true) {
	image_index = 0;
} else {
	image_index = 1;
}