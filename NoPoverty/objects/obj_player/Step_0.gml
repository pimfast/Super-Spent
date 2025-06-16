/// @desc

//keyboard inputs
var _left = 0;
var _right = 0;
var _up = 0;
var _down = 0;
var _jump = 0;
var _attack = 0;
var _strafe = 0;
if (caninput) {
	_left = keyboard_check(vk_left);
	_right = keyboard_check(vk_right);
	_up = keyboard_check(vk_up);
	_down = keyboard_check(vk_down);
	_jump = keyboard_check_pressed(vk_space);
	_attack = keyboard_check_pressed(ord("A"));
	_strafe = keyboard_check(ord("S"));
}

//attack (1: punch, 2: kick that sends you up, 3: big punch, 3+UP: uppercut, 3+DOWN: backflip)
if (_attack) && (canattack) {
	canattack = false;
	combopart++
	alarm[2] = (0.60 * game_get_speed(gamespeed_fps));
	var _attacksize;
	var _attackdistance;
	var _attackheight;
	var _attacko;
	switch (combopart) {
		case 1:
			_attacksize = 25;
			_attackdistance = 15;
			_attackheight = 0;
			
			_attacko = instance_create_depth((x+(dir*_attackdistance)) - (_attacksize/2),(y+_attackheight) - (_attacksize/2),0,obj_hitbox)
			_attacko.image_xscale = _attacksize;
			_attacko.image_yscale = _attacksize;
			_attacko.attacksize = _attacksize;
			_attacko.attackdistance = _attackdistance;
			_attacko.attackheight = _attackheight;
			_attacko.damagesEnemies = true;
			_attacko.owner = self;
			
			_attacko.alarm[0] = (0.15 * game_get_speed(gamespeed_fps));
			_attacko.dmg = (1 * dmg);
			_attacko.hknockback = 5;
			_attacko.vknockback = -2;
			_attacko.stundur = 0.25;
			
			//push player
			//if (!_strafe) {
			bonushsp += (2*dir);
			//vsp = 0;
			//}
			break;
		case 2:
			_attacksize = 25;
			_attackdistance = 20;
			_attackheight = 0;
	
			_attacko = instance_create_depth((x+(dir*_attackdistance)) - (_attacksize/2),(y+_attackheight) - (_attacksize/2),0,obj_hitbox)
			_attacko.image_xscale = _attacksize;
			_attacko.image_yscale = _attacksize;
			_attacko.attacksize = _attacksize;
			_attacko.attackdistance = _attackdistance;
			_attacko.attackheight = _attackheight;
			_attacko.damagesEnemies = true;
			_attacko.owner = self;
			
			_attacko.alarm[0] = (0.25 * game_get_speed(gamespeed_fps));
			_attacko.dmg = (2 * dmg);
			_attacko.hknockback = 5;
			_attacko.vknockback = -2;
			_attacko.stundur = 0.25;
			
			
			//push player
			//if (!_strafe) {
			bonushsp += (3*dir);
			vsp = -2;
			//}
			break;
		case 3:
			if (_up) {
				_attacksize = 35;
				_attackdistance = 10;
				_attackheight = -5;
				
				_attacko = instance_create_depth((x+(dir*_attackdistance)) - (_attacksize/2),(y+_attackheight) - (_attacksize/2),0,obj_hitbox)
				_attacko.image_xscale = _attacksize;
				_attacko.image_yscale = _attacksize;
				_attacko.attacksize = _attacksize;
				_attacko.attackdistance = _attackdistance;
				_attacko.attackheight = _attackheight;
				_attacko.damagesEnemies = true;
				_attacko.owner = self;
				
				_attacko.alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
				_attacko.dmg = (3 * dmg);
				_attacko.hknockback = 5;
				_attacko.vknockback = -7;
				_attacko.stundur = 0.75;
				
				//push player
				//if (!_strafe) {
				bonushsp += (0*dir);
				vsp = -7;
				//}
				
				caninput = false;
				alarm[0] = (0.35 * game_get_speed(gamespeed_fps));
				
				combopart = 0;
				alarm[2] = -1;
			} else {
				if (_down) {
					_attacksize = 30;
					_attackdistance = -3;
					_attackheight = -5;
					
					_attacko = instance_create_depth((x+(dir*_attackdistance)) - (_attacksize/2),(y+_attackheight) - (_attacksize/2),0,obj_hitbox)
					_attacko.image_xscale = _attacksize;
					_attacko.image_yscale = _attacksize;
					_attacko.attacksize = _attacksize;
					_attacko.attackdistance = _attackdistance;
					_attacko.attackheight = _attackheight;
					_attacko.damagesEnemies = true;
					_attacko.owner = self;
					
					_attacko.alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
					_attacko.dmg = (3 * dmg);
					_attacko.hknockback = -8;
					_attacko.vknockback = -4;
					_attacko.stundur = 0.75;
					
					//push player
					//if (!_strafe) {
					bonushsp += (-7.5*dir);
					vsp = -5.5;
					//}
					
					caninput = false;
					alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
					
					combopart = 0;
					alarm[2] = -1;
				} else {
					_attacksize = 35;
					_attackdistance = 10;
					_attackheight = 0;
				
					_attacko = instance_create_depth((x+(dir*_attackdistance)) - (_attacksize/2),(y+_attackheight) - (_attacksize/2),0,obj_hitbox)
					_attacko.image_xscale = _attacksize;
					_attacko.image_yscale = _attacksize;
					_attacko.attacksize = _attacksize;
					_attacko.attackdistance = _attackdistance;
					_attacko.attackheight = _attackheight;
					_attacko.damagesEnemies = true;
					_attacko.owner = self;
				
					_attacko.alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
					_attacko.dmg = (3 * dmg);
					_attacko.hknockback = 5;
					_attacko.vknockback = -2;
					_attacko.stundur = 0.75;
				
					//push player
					//if (!_strafe) {
					bonushsp += (5*dir);
					vsp = 2;
					//}
				
					caninput = false;
					alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
				
					combopart = 0;
					alarm[2] = -1;
				}
			break;
		}
	}
}

//change directions
if (!_strafe) {
	if (_left > 0) {dir = -1; image_xscale = -1;} 
	if (_right > 0) {dir = 1; image_xscale = 1;}
}

//restore jumps
if (place_meeting(x,y+sign(grv),obj_collision)) || (place_meeting(x,y+sign(grv),obj_halfcollision)) {
	canjump = true;
	walksp = defwalksp;
} else {
	canjump = false;
	if (_strafe) {
		walksp = (defwalksp + 1);
	} else {
		walksp = defwalksp;
	}
}

//jump
if (_jump) && (canjump == true) {
	vsp = jumpsp*sign(grv);
	canjump = false; //isn't this redundant? dah whatever
}

//moving and skidding and falling
var move = ((_left*-1) + _right);
prevhsp = hsp;

hsp = ((move * walksp) + bonushsp);
vsp = (vsp + grv);
if (vsp > 1800) {vsp = 1800} //terminal velocity?
if (bonushsp > 0) {bonushsp -= 0.5;}
if (bonushsp < 0) {bonushsp += 0.5;}

if (hsp == 0) {
	if (prevhsp > 0) {hsp += skidh;}
	if (prevhsp < 0) {hsp -= skidh;}
}
if (move != 0 && (skidh+1 <= maxskid)) {skidh += 1;}  //if player object is moving, increase skid
skidh -= 0.1;  // decrease skid amount - only matters if player has stopped moving
if (skidh < 0) {skidh = 0;} //set the minimum back to 0

////jumppad
//if (place_meeting(x,y+vsp,obj_jumppad)) {
//	vsp = -14;
//}

//falling platform
var _fallplat = instance_place(x,y+vsp,obj_fallingplatform);
if (_fallplat) && (_fallplat.alarm[0] == -1) && (sign(vsp) >= 0){
	_fallplat.alarm[0] = (0.75 * game_get_speed(gamespeed_fps));
	_fallplat.y += 1;
}

//mud
if (place_meeting(x,y+vsp,obj_mud)) {
	muddy = true;
}

//coin
var _lootget = instance_place(x,y,obj_coin);
if (_lootget) {
	global.coinnum++;
	instance_destroy(_lootget); 
}

//health
_lootget = instance_place(x,y,obj_health);
if (_lootget) {
	hp += (2 * healthrestore);
	if (hp > maxhp) {
		hp = maxhp;
	}
	instance_destroy(_lootget); 
}

if (invincible) {
	if (visible != false) {
		visible = false;
	} else {
		visible = true;
	}
} else {
	visible = true;
}

//horizontal collision
if (place_meeting(x+hsp,y,obj_collision)) {
	while (!place_meeting(x+sign(hsp),y,obj_collision)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//vertical collision
if (place_meeting(x,y+vsp,obj_collision)) {
	while (!place_meeting(x,y+sign(vsp),obj_collision)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
if (sign(vsp) > 0) && (place_meeting(x,y+vsp,obj_halfcollision)) {
	while (!place_meeting(x,y+sign(vsp),obj_halfcollision)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y += vsp;