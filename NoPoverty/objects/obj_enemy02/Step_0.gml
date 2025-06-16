/// @desc

if (dir = -1) {image_xscale = -1;} 
if (dir = 1) {image_xscale = 1;}

//move
vsp = (vsp + grv);

//damage received sprite change
if (caninput == false) {
	sprite_index = spr_shroom_attacked;
}

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