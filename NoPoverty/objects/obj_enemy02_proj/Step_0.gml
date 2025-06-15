/// @desc

x += hsp;
y += vsp;

if (image_alpha <= 0) {
	instance_destroy();
}

if (disappear == true) {
	image_alpha -= 0.05;
}