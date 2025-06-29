/// @desc

if (instance_exists(target)) {
	camerax = (target.x - (camerawidth/2));
	cameray = (target.y - (cameraheight*0.8));
	
	camerax = clamp(camerax,0,room_width - camerawidth);
	cameray = clamp(cameray,0,room_height - cameraheight);
}

camera_set_view_pos(view_camera[0],camerax,cameray);