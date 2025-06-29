/// @desc

if (sign(dir) != sign(image_xscale)) {image_xscale *= -1;}
if (instance_exists(obj_player)) && (sign(obj_player.x - x) != sign(dir)) {
	sprite_index = spr_shroom_idleb;
} else {
	sprite_index = spr_shroom_idle;
}

//turn to player if airborne
if (!place_meeting(x,y+sign(grv),obj_collision)) && (!place_meeting(x,y+sign(grv),obj_halfcollision)) && (!place_meeting(x,y+sign(grv),obj_enemy)) {
	if (instance_exists(obj_player)) {
		dir = sign(obj_player.x - x);
	}
}

//move
vsp = (vsp + grv);

//damage received sprite change
if (caninput == false) {
	sprite_index = spr_shroom_attacked;
}

//vertical collision
if (place_meeting(x,y+vsp,obj_collision)) || (place_meeting(x,y+vsp,obj_enemy)) {
	while (!place_meeting(x,y+sign(vsp),obj_collision)) && (!place_meeting(x+sign(vsp),y,obj_enemy)) {
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