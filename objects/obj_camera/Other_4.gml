/// @desc

camerax = 0;
cameray = 0;
target = obj_player

camerawidth = 320;
cameraheight = 180;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0],camerawidth,cameraheight);

//display
displayscale = 4;
displaywidth = (camerawidth * displayscale);
displayheight = (cameraheight * displayscale);

window_set_size(displaywidth,displayheight);
surface_resize(application_surface,displaywidth,displayheight)

//gui
display_set_gui_size(camerawidth,cameraheight);

alarm[0] = 1;