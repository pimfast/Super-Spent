/// @desc

if (dir = -1) {image_xscale = -1;} 
if (dir = 1) {image_xscale = 1;}

//move
vsp = (vsp + grv);

//vertical collision
if (place_meeting(x,y+vsp,obj_collision)) {	
	while (!place_meeting(x,y+sign(vsp),obj_collision)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y += vsp;