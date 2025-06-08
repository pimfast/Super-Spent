/// @desc

if (dir = -1) {image_xscale = -1;} 
if (dir = 1) {image_xscale = 1;}

//move
hsp = ((dir * walksp) * caninput);
hsp += bonushsp;
vsp = (vsp + grv);
if (bonushsp > 0) {bonushsp -= 0.5;}
if (bonushsp < 0) {bonushsp += 0.5;}

//horizontal collision
if (place_meeting(x+hsp,y,obj_collision)) || (place_meeting(x+hsp,y,obj_enemy)) {
	while (!place_meeting(x+sign(hsp),y,obj_collision)) && (!place_meeting(x+sign(hsp),y,obj_enemy)) {
		x = x + sign(hsp);
	}
	hsp = 0;
	dir *= -1; //issue: getting knocked into wall changes direction even if not facing wall
}
x += hsp;

//vertical collision
if (place_meeting(x,y+vsp,obj_collision)) || (place_meeting(x,y+vsp,obj_enemy)) {	
	while (!place_meeting(x,y+sign(vsp),obj_collision)) && (!place_meeting(x,y+sign(vsp),obj_enemy)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y += vsp;