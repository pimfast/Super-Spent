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
	if (!_strafe) {
		_strafe = keyboard_check(vk_shift);
	}
}

//animations
if (busy == false) {
	if (caninput) {
		sprite_index = spr_player_idle;
		image_speed = 1;
		if (_left) || (_right) {
			sprite_index = spr_player_run;
		}
		if (!place_meeting(x,y+sign(grv),obj_collision)) && (!place_meeting(x,y+sign(grv),obj_halfcollision)) {
			sprite_index = spr_player_airborne;
		}
	} else {
		if (image_index >= image_number - 1) {
			image_speed = 0;
		}
		//if (combopart == 0) { 
		//	sprite_index = spr_player_hurt;
		//}
		if (alarm[3] != -1) {
			sprite_index = spr_player_jumpwindup;
		}
	}
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
			audio_play_sound(sfx_combo,0,0);
			sprite_index = spr_player_combo1;
			image_index = 0;
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
			_attacko.stundur = 0.25 * stunpow;
			
			//push player
			bonushsp += (2*dir);
			
			busy = true;
			alarm[4] = (0.10 * game_get_speed(gamespeed_fps));
			break;
		case 2:
			audio_play_sound(sfx_combo,0,0);
			sprite_index = spr_player_combo2;
			image_index = 0;
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
			_attacko.stundur = 0.25 * stunpow;
			
			//push player
			bonushsp += (3*dir);
			vsp = -2;
			
			if (comboable[3] == false) {
				combopart = 0;
				alarm[2] = -1;
			}
			
			busy = true;
			alarm[4] = (0.05 * game_get_speed(gamespeed_fps));
			break;
		case 3:
			if (_up) {
				audio_play_sound(sfx_combofinish,0,0);
				sprite_index = spr_player_combo3up;
				image_index = 0;
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
				_attacko.stundur = 0.75 * stunpow;
				
				//push player
				bonushsp += (0*dir);
				vsp = -7;
				
				caninput = false;
				alarm[0] = (0.35 * game_get_speed(gamespeed_fps));
				
				//combopart = 0;
				alarm[2] = -1;
			} else {
				if (_down) {
					audio_play_sound(sfx_combofinishs,0,0);
					sprite_index = spr_player_combo3down;
					image_index = 0;
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
					_attacko.stundur = 0.75 * stunpow;
					
					//push player
					bonushsp += (-7.5*dir);
					vsp = -5.5;
					
					caninput = false;
					alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
					
					//combopart = 0;
					alarm[2] = -1;
				} else {
					audio_play_sound(sfx_combofinish,0,0);
					sprite_index = spr_player_combo3;
					image_index = 0;
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
					_attacko.stundur = 0.75 * stunpow;
					
					//push player
					bonushsp += (5*dir);
					vsp = 2;
					
					caninput = false;
					alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
					
					//combopart = 0;
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
	if (global.playerdowngrades[1] >= 2) {
		caninput = false;
		alarm[3] = (0.5 * game_get_speed(gamespeed_fps));
	} else {
		vsp = jumpsp*sign(grv);
		canjump = false; //isn't this redundant? whatever
	}
}

//moving and skidding and falling
var move = ((_left*-1) + _right);
prevhsp = hsp;

hsp = ((move * walksp) + bonushsp);
vsp = (vsp + grv);
if (vsp > 200) {vsp = 200} //terminal velocity?
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
var _fallplat = instance_place(x,y+vsp,obj_movingplatform);
if (_fallplat) && (_fallplat.fallingplatform) && (_fallplat.alarm[0] == -1) && (sign(vsp) >= 0) {
	_fallplat.alarm[0] = (0.75 * game_get_speed(gamespeed_fps));
	_fallplat.y += 1;
}

//coin
var _lootget = instance_place(x,y,obj_coin);
if (_lootget) {
	audio_play_sound(sfx_combo,0,0);
	//addpoints(100);
	global.coinnum++;
	
	if (_lootget.secret == true) {
		global.hiddencoins[global.level-1] = 1;
	}
	
	instance_destroy(_lootget); 
}

//health
_lootget = instance_place(x,y,obj_health);
if (_lootget) {
	audio_play_sound(sfx_hurt,0,0);
	
	//effect
	repeat (40) {
		var _hfx = instance_create_layer(_lootget.x,_lootget.y,"Instances",obj_healtheffect);
		_hfx.hsp = irandom_range(-3,3);
		_hfx.vsp = irandom_range(-3,3);
	}
	
	addhealth(self,2 * healthrestore);
	
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
		//v only occurs sometimes. :(
		if (global.playerdowngrades[2] >= 2) && ((_left) || (_right)) {
			audio_play_sound(sfx_hurt,0,0);
			sprite_index = spr_player_faceplant;
			caninput = false;
			alarm[0] = (0.35 * game_get_speed(gamespeed_fps));
		}
		//^ only occurs sometimes. :(
	}
	vsp = 0;
}
if (sign(vsp) > 0) && (place_meeting(x,y+vsp,obj_halfcollision)) {
	while (!place_meeting(x,y+sign(vsp),obj_halfcollision)) /*idk i found a crash*/ && (sign(vsp) != 0) {
		y = y + sign(vsp);
		//v causes crashes, also only occurs sometimes. and occurs other times multiple times :(
		if (global.playerdowngrades[2] >= 2) && ((_left) || (_right)) {
			audio_play_sound(sfx_hurt,0,0);
			sprite_index = spr_player_faceplant;
			caninput = false;
			alarm[0] = (0.35 * game_get_speed(gamespeed_fps));
		}
		//^ causes crashes, also only occurs sometimes. and occurs other times multiple times :(
	}
	vsp = 0;
}
y += vsp;