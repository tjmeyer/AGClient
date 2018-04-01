/// @description Insert description here
// You can write your code in this editor
if(isTargeting)
{
	draw_set_alpha(1);
	draw_set_color(c_red);
	draw_set_font(fnt_calibri_12);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text(device_mouse_x_to_gui(0),
				device_mouse_y_to_gui(0) + 50,
				"R-CLICK TO SELECT TARGET");
}

if(isMoveSelecting)
{
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(fnt_calibri_12);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text(device_mouse_x_to_gui(0),
				device_mouse_y_to_gui(0) + 50,
				"R-CLICK TO SELECT LOCATION");
}