/// @desc

if (place_meeting(x,y,obj_player)) {
	instance_destroy(obj_player);
	obj_game.transitionx = obj_transition.sprite_width;
	obj_transition.x = obj_camera.x + obj_transition.sprite_width;
	obj_game.transitionchange = true;
}