/// @desc

x = ((owner.x + (owner.dir*attackdistance)) - (attacksize/2));
y = ((owner.y + attackheight) - (attacksize/2));

//instance_create_depth(x,y,0,obj_health)

//check for colliding hurtables and hurt
var _list = ds_list_create();
var _num = collision_rectangle_list(x,y,x+attacksize,y+attacksize,obj_hurtable,false,true,_list,false);
if (_num > 0) {
	for (var i = 0; i < _num; ++i;) {
		var _victim = _list[| i];
		if (_victim != owner.id) {
			if (_victim == obj_player.id) {
				if (!_victim.invincible) && (active == true) {
					//apply damage to player
					_victim.hp -= dmg;
					if (_victim.hp <= 0) {
						//kill
						obj_game.alarm[0] = (1 * game_get_speed(gamespeed_fps));
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
					}
				}
			} else {
				if (!array_contains(hitlist,_victim.id)) /*&& (active == true)*/ {
					//apply damage to enemy
				 	_victim.hp -= dmg;
					if (_victim.hp <= 0) {
						instance_create_depth(_victim.x,_victim.y,0,obj_health);
						instance_destroy(_victim.myhitbox);
						instance_destroy(_victim);
					} else {
						//apply knockback and stun
						_victim.bonushsp += hknockback;
						_victim.vsp = vknockback;
						_victim.alarm[0] = (stundur * game_get_speed(gamespeed_fps));
						_victim.image_blend = make_colour_rgb(50, 50, 50);
						_victim.caninput = false;
						_victim.myhitbox.active = false;
					
						array_push(hitlist,_victim.id);
					}
				}
			}
		}
	}
}
ds_list_destroy(_list);