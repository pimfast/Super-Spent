/// @desc

if (dir = -1) {image_xscale = -1;} 
if (dir = 1) {image_xscale = 1;}

//if touching hitbox, take damage and mark that hitbox as null for this enemy
var _ouch = instance_place(x,y,obj_hitbox);
if (_ouch) && (!array_contains(hitlist,_ouch)) {
	//apply damage
 	hp -= _ouch.dmg;
	if (hp <= 0) {
		instance_create_depth(x,y,0,obj_health);
		instance_destroy();
	}
	//apply knockback and stun
	bonushsp += (_ouch.hknockback);
	vsp = _ouch.vknockback;
	alarm[0] = (_ouch.stundur * game_get_speed(gamespeed_fps));
	
	image_blend = make_colour_rgb(50, 50, 50);
	caninput = false;
	
	array_push(hitlist,_ouch); //for my purposes, we probably don't need to empty this ever
} else {
	image_blend = make_colour_rgb(255, 255, 255);
}
//if you feel like optimizing, you can move the above to obj_hitbox.
//the main thing is you make it so the hitbox counts how many obj_enemy's it's touching

//move
hsp = ((dir * walksp) * caninput);
hsp += bonushsp;
vsp = (vsp + grv);
if (bonushsp > 0) {bonushsp -= 0.5;}
if (bonushsp < 0) {bonushsp += 0.5;}

//horizontal collision
if (place_meeting(x+hsp,y,obj_collision)) {
	while (!place_meeting(x+sign(hsp),y,obj_collision)) {
		x = x + sign(hsp);
	}
	hsp = 0;
	dir *= -1; //issue: getting knocked into wall changes direction even if not facing wall
}
x += hsp;

//vertical collision
if (place_meeting(x,y+vsp,obj_collision)) {	
	while (!place_meeting(x,y+sign(vsp),obj_collision)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y += vsp;