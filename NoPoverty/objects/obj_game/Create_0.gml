/// @desc

roomcoins = instance_number(obj_coin);

audio_group_stop_all(ag_mus);

switch (room) {
	case rm_level1:
		audio_play_sound(mus_level1temp_plusdotdotplus,0,1);
		break;
	case rm_level2:
		audio_play_sound(mus_level2temp_thesetrees,0,1);
		break;
	case rm_level3:
		audio_play_sound(mus_level3temp_thethethechilloutbro,0,1);
		break;
	case rm_level4:
		audio_play_sound(mus_level4temp_jellypudding,0,1);
		break;
}