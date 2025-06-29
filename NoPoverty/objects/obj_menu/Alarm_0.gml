/// @desc move to game

if (global.enablesound) {
	audio_group_set_gain(ag_mus,1,0);
}
room_goto(asset_get_index("rm_level"+string(global.level)));