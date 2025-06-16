/// @desc

roomcoins = instance_number(obj_coin);

alarm[1] = (0.5 * game_get_speed(gamespeed_fps));

audio_group_stop_all(ag_mus);
switch (room) {
	case rm_level1:
		audio_play_sound(mus_level1temp_plusdotdotplus,1,1);
		tutpitpart2 = false;
		break;
	case rm_level2:
		audio_play_sound(mus_level2temp_thesetrees,1,1);
		audio_play_sound(sfx_glassbreak,0,0);
		break;
	case rm_level3:
		audio_play_sound(mus_level3temp_thethethechilloutbro,1,1);
		break;
	case rm_level4:
		audio_play_sound(mus_level4temp_jellypudding,1,1);
		break;
}