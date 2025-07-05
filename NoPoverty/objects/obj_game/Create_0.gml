/// @desc

roomcoins = instance_number(obj_coin);
pointsheight = 15;
leveltime = 0;
transition = instance_create_layer(x,y,"Instances_1",obj_transition);
transitionx = x;
transitionchange = false;

//level intro
alarm[1] = (0.5 * game_get_speed(gamespeed_fps));
obj_player.alarm[4] = (0.5 * game_get_speed(gamespeed_fps));
obj_player.busy = true;
if (room != rm_level3b) {
	obj_player.sprite_index = spr_player_run;
} else {
	obj_player.sprite_index = spr_player_airborne
}

audio_group_stop_all(ag_mus);
switch (room) {
	case rm_level1:
		audio_play_sound(mus_level1temp_plusdotdotplus,1,1);
		tutpitpart2 = false;
		break;
	case rm_level2:
		audio_play_sound(mus_level2temp_toadfrownattoadtown,1,1);
		//audio_play_sound(sfx_glassbreak,0,0);
		break;
	case rm_level3b:
		audio_play_sound(mus_level3temp_thethethechilloutbro,1,1);
		break;
	case rm_level4:
		audio_play_sound(mus_level4temp_afterboattankapparitions,1,1);
		break;
}