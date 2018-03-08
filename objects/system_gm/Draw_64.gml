/// @description map gui elements

// draw first button
draw_set_font(fnt_monospace_14);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_alpha(1);
draw_set_color(c_blue);
draw_rectangle(buttons[0, 0], buttons[0, 1], buttons[0, 2], buttons[0, 3], true);


// highlight mouse-overs
if( device_mouse_x_to_gui(0) > buttons[0,0] &&
	device_mouse_x_to_gui(0) < buttons[0,2] &&
	device_mouse_y_to_gui(0) > buttons[0,1] &&
	device_mouse_y_to_gui(0) < buttons[0,3])
{
	// overlay occurs
	draw_set_alpha(.3);
	draw_rectangle(buttons[0, 0], buttons[0, 1], buttons[0, 2], buttons[0, 3], false);
	if(device_mouse_check_button_released(0, mb_left))
	{
		room_goto_previous();
	}
}
else
{
	draw_set_alpha(.3);
	draw_set_color(c_black);
	draw_rectangle(buttons[0, 0], buttons[0, 1], buttons[0, 2], buttons[0, 3], false);
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_text((buttons[0, 2] + buttons[0, 0]) / 2,
			(buttons[0, 3] + buttons[0, 1]) / 2,
			"<- Back");