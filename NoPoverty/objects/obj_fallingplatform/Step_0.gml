/// @desc

if (fall == true) {
	vsp += 0.34
	y += vsp;
	
	if (y > room_height*15) {
		fall = false;
		vsp = 0;
		y = starty;
	}
}