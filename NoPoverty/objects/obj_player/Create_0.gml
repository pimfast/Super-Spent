/// @desc

//player stats
if (room == rm_level1) {
	maxhp = 10; hp = maxhp; //health
	dmg = 1; //damage multiplier
	grv = 0.34; //lower is lighter higher is heavier
	defwalksp = 2.3; walksp = defwalksp; //how fast you go
	jumpsp = -6.0; //less is more
	healthrestore = 1; //how much dropped health heals you
	comboable = [true,true,true,true];
	stunpow = 1;
	
	global.maxhp = maxhp; //health
	global.dmg = dmg; //damage multiplier
	global.grv = grv; //lower is lighter higher is heavier
	global.defwalksp = defwalksp; //how fast you go
	global.jumpsp = jumpsp; //less is more
	global.healthrestore = healthrestore; //how much dropped health heals you
	global.comboable = comboable;
	global.stunpow = stunpow;
} else {
	maxhp = global.maxhp; hp = maxhp; //health
	dmg = global.dmg; //damage multiplier
	grv = global.grv; //lower is lighter higher is heavier
	defwalksp = global.defwalksp; walksp = defwalksp; //how fast you go
	jumpsp = global.jumpsp; //less is more
	healthrestore = global.healthrestore; //how much dropped health heals you
	comboable = global.comboable;
	stunpow = global.stunpow;
}

//necessary code (do not / cannot change)
hsp = 0;
vsp = 0;
canattack = true;
canjump = true;
skidh = 0;
prevhsp = 0;
maxskid = 1;
dir = 1;
bonushsp = 0;
invincible = false;
caninput = false;
combopart = 0;
myhitbox = noone;