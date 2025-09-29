/// @desc

draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_yellow);

if (global.debug == true) {
	draw_text(x+20,y,"debug enabled");
}