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
	if (movetarget != noone) {
		if (x+(sprite_width/2) < movetarget.x) {
			x++;
		}
		if (x+(sprite_width/2) > movetarget.x) {
			x--;
		}
		if (y+8 < movetarget.y) {
			y++;
		}
		if (y+8 > movetarget.y) {
			y--;
		}
		if (x+8 == movetarget.x) && (y+8 == movetarget.y) {
			movetarget = movetarget.nexttarget;
		}
		
		//someone tell me how to do collisions properly...
		if (place_meeting(x,y,obj_player)) {
			obj_player.y = y - 8;
		}
	}
}