/// @desc

if (fall == true) {
	vsp += 0.34
	y += vsp;
	
	if (y > room_height*15) {
		if (respawn == true) {
			myhitbox.active = false;
			fall = false;
			vsp = 0;
			y = starty;
		} else {
			instance_destroy();
		}
	}
} else {
	if (movetarget != 0) {
		if (x != movetarget.x) {
			
		}
		if (y != movetarget.y) {
			
		}
	}
}