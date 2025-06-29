/// @desc joomp

caninput = true;

vsp = jumpsp*sign(grv);
canjump = false;

if (global.playerdowngrades[1] >= 3) {
	//apply damage to player
	audio_play_sound(sfx_hurt,0,0);
	hp -= 1;
	if (hp <= 0) {
		////kill
		//obj_game.alarm[0] = (1 * game_get_speed(gamespeed_fps));
		//instance_destroy();
		hp = 1;
	}
}