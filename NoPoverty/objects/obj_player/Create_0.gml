/// @desc

//player stats
if (room == rm_level1) {
	maxhp = 10; hp = maxhp; //health
	dmg = 1; //damage multiplier
	grv = 0.34; //lower is lighter higher is heavier
	defwalksp = 2.3; walksp = defwalksp; //how fast you go
	jumpsp = -6.0; //less is more
	maxskid = 1; //how far you slide
	
	global.maxhp = maxhp; //health
	global.dmg = dmg; //damage multiplier
	global.grv = grv; //lower is lighter higher is heavier
	global.defwalksp = defwalksp; //how fast you go
	global.jumpsp = jumpsp; //less is more
	global.maxskid = maxskid; //how far you slide
} else {
	maxhp = global.maxhp; hp = maxhp; //health
	dmg = global.dmg; //damage multiplier
	grv = global.grv; //lower is lighter higher is heavier
	defwalksp = global.defwalksp; walksp = defwalksp; //how fast you go
	jumpsp = global.jumpsp; //less is more
	maxskid = global.maxskid; //how far you slide
}

//necessary code (do not / cannot change)
hsp = 0;
vsp = 0;
canattack = true;
canjump = true;
skidh = 0;
prevhsp = 0;
dir = 1;
bonushsp = 0;
invincible = false;
caninput = true;
combopart = 0;
myhitbox = noone;