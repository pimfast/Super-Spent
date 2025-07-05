/// @desc end level intro

obj_player.caninput = true;
if (room == rm_level3b) {
	audio_play_sound(sfx_hurt,0,0);
	obj_player.sprite_index = spr_player_faceplant;
	obj_player.alarm[4] = (0.5 * game_get_speed(gamespeed_fps));
	obj_player.busy = true;
	
	obj_player.caninput = false;
	obj_player.alarm[0] = (0.5 * game_get_speed(gamespeed_fps));
}