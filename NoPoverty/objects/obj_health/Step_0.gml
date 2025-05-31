/// @desc

var _vsp = 0.34;

//vertical collision
if (place_meeting(x,y+_vsp,obj_collision)) {	
	while (!place_meeting(x,y+sign(_vsp),obj_collision)) {
		y = y + sign(_vsp);
	}
	_vsp = 0;
}
y += _vsp;