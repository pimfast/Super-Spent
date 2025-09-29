/// @desc

if (owner != self) {
	x = ((owner.x + (owner.dir*attackdistance)) - (attacksize/2));
	y = ((owner.y + attackheight) - (attacksize/2));
}

//instance_create_depth(x,y,0,obj_health)

//check for colliding hurtables and hurt
var _list = ds_list_create();
var _num;
if (owner != self) {
	_num = collision_rectangle_list(x,y,x+attacksize,y+attacksize,obj_hurtable,false,true,_list,false);
} else {
	_num = collision_rectangle_list(x,y,x+image_xscale,y+image_yscale,obj_hurtable,false,true,_list,false);
}
if (_num > 0) {
	for (var i = 0; i < _num; ++i;) {
		var _victim = _list[| i];
		if (_victim != owner.id) && (damagesPlayer == true) {
			if (instance_exists(obj_player)) && (_victim == obj_player.id) && (active == true) {
				//check for stuff. done this way to make sure pits always hurt.
				if (owner != self) && (_victim.invincible) {
					break;
				}
				//apply damage to player
				audio_play_sound(sfx_hurt,0,0);
				_victim.sprite_index = spr_player_hurt; 
				_victim.hp -= dmg;
				if (_victim.hp <= 0) {
					//kill
					obj_game.alarm[0] = (1 * game_get_speed(gamespeed_fps));
					//_victim.hp = 0;
					//_victim.caninput = false;
					audio_stop_sound(mus_level1temp_plusdotdotplus);
					audio_stop_sound(mus_level2temp_toadfrownattoadtown);
					audio_stop_sound(mus_level3temp_thethethechilloutbro);
					audio_stop_sound(mus_level4temp_afterboattankapparitions);
					instance_destroy(_victim);
				} else {
					//enable i frames
					_victim.invincible = true;
					_victim.alarm[1] = (1 * game_get_speed(gamespeed_fps));
					
					//apply knockback and stun
					_victim.bonushsp = (hknockback * -_victim.dir);
					_victim.vsp = vknockback;
					_victim.caninput = false;
					_victim.combopart = 0;
					_victim.alarm[0] = (stundur * game_get_speed(gamespeed_fps));
					
					//cancel joomp
					_victim.alarm[3] = -1;
				}
			}
		}
		if (_victim != owner.id) && (damagesEnemies == true) {
			if (instance_exists(obj_player)) && (_victim != obj_player.id) && (!array_contains(hitlist,_victim.id)) {
				//apply damage to enemy
				_victim.hp -= dmg;
				if (_victim.hp <= 0) {
					audio_play_sound(sfx_hurt,0,0);
					if (obj_player.healthrestore > 0) {
						var _health = instance_create_layer(_victim.x,_victim.y,"Pickups",obj_health);
						_health.bonushsp += (hknockback*owner.dir);
						_health.vsp = vknockback;
					}
						
					instance_destroy(_victim.myhitbox);
					instance_destroy(_victim);
				} else {
					//apply knockback and stun
					audio_play_sound(sfx_hit02,0,0);
					_victim.bonushsp += (hknockback*owner.dir);
					_victim.vsp = vknockback;
					_victim.alarm[0] = (stundur * game_get_speed(gamespeed_fps));
					_victim.image_blend = make_colour_rgb(50, 50, 50);
					_victim.caninput = false;
					_victim.myhitbox.active = false;
					
					if (owner != self) {
						array_push(hitlist,_victim.id);
					}
				}
			}
		}
	}
}
ds_list_destroy(_list);