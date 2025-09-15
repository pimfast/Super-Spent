/// @desc

hsp = 0;
if (fall = false) {
	vsp = 0;
}

if (fall == true) {
	vsp += 0.34
	
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
			hsp++;
		}
		if (x+(sprite_width/2) > movetarget.x) {
			hsp--;
		}
		if (y+8 < movetarget.y) {
			vsp++;
		}
		if (y+8 > movetarget.y) {
			vsp--;
		}
		if (x+8 == movetarget.x) && (y+8 == movetarget.y) {
			movetarget = movetarget.nexttarget;
		}
		
		//i should really look up how to do collisions properly...
		if (place_meeting(x,y,obj_player)) {
			obj_player.y = y - 8;
		}
	}
}

x += hsp;
y += vsp;