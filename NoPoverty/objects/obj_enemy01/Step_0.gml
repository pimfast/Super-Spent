/// @desc

if (dir = -1) {image_xscale = -1;} 
if (dir = 1) {image_xscale = 1;}

//move
hsp = ((dir * walksp) * caninput);
hsp += bonushsp;
vsp = (vsp + grv);
if (bonushsp > 0) {bonushsp -= 0.5;}
if (bonushsp < 0) {bonushsp += 0.5;}

//damage received sprite change
if (caninput == false) {
	if (!place_meeting(x,y+vsp,obj_collision)) && (!place_meeting(x,y+vsp,obj_halfcollision)) {
		sprite_index = spr_cock_attacked;
	} else {
		sprite_index = spr_cock_stunned;
	}
}

//horizontal collision
if (place_meeting(x+hsp,y,obj_collision)) || (place_meeting(x+hsp,y,obj_enemy)) {
	while (!place_meeting(x+sign(hsp),y,obj_collision)) && (!place_meeting(x+sign(hsp),y,obj_enemy)) {
		x = x + sign(hsp);
	}
	hsp = 0;
	if (caninput == true) {
		dir *= -1;
	}
}
x += hsp;

//vertical collision
if (place_meeting(x,y+vsp,obj_collision)) || (place_meeting(x,y+vsp,obj_enemy)) {	
	while (!place_meeting(x,y+sign(vsp),obj_collision)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
if (sign(vsp) >= 0) && (place_meeting(x,y+vsp,obj_halfcollision)) {	
	while (!place_meeting(x,y+sign(vsp),obj_halfcollision)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y += vsp;