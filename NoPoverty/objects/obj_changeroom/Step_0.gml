/// @desc

if (place_meeting(x,y,obj_player)) {
	if (room != rm_level4) {
		global.level++;
		room_goto(rm_budget);
	} else {
		//idk
	}
}