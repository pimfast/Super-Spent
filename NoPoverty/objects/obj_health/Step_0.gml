/// @desc

//move
hsp = bonushsp;
vsp = (vsp + grv);
if (sign(vsp) == 1) {
	vsp = grv;
}
if (bonushsp > 0) {bonushsp -= 0.5;}
if (bonushsp < 0) {bonushsp += 0.5;}

if (alarm[0] != -1) {
	if (visible) {
		visible = false;
	} else {
		visible = true;
	}
}

//horizontal collision
if (place_meeting(x+hsp,y,obj_collision)) {
	while (!place_meeting(x+sign(hsp),y,obj_collision)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//vertical collision
if (place_meeting(x,y+vsp,obj_collision)) {	
	while (!place_meeting(x,y+sign(vsp),obj_collision)) {
		y = y + sign(vsp);
	}
	vsp = 0;
	if (alarm[0] == -1) && (alarm[1] = -1) {
		alarm[1] = (3 * game_get_speed(gamespeed_fps));
	}
}
if (sign(vsp) >= 0) && (place_meeting(x,y+vsp,obj_halfcollision)) {	
	while (!place_meeting(x,y+sign(vsp),obj_halfcollision)) {
		y = y + sign(vsp);
	}
	vsp = 0;
	if (alarm[0] == -1) && (alarm[1] = -1) {
		alarm[1] = (3 * game_get_speed(gamespeed_fps));
	}
}
y += vsp;