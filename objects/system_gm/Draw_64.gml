/// @description map gui elements

// draw each button
for(var i = 0; i < ds_list_size(buttonMap); i++)
{
	draw_set_font(fnt_monospace_14);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_alpha(1);
	draw_set_color(c_blue);
	
	var mapping = buttonMap[| i];
	if(ds_map_exists(mapping, "name"))
	{
		draw_rectangle(buttons[i, 0], buttons[i, 1], buttons[i, 2], buttons[i, 3], true);
		
		
		draw_set_alpha(.3);
		// highlight mouse-overs
		if( device_mouse_x_to_gui(0) > buttons[i,0] &&
			device_mouse_x_to_gui(0) < buttons[i,2] &&
			device_mouse_y_to_gui(0) > buttons[i,1] &&
			device_mouse_y_to_gui(0) < buttons[i,3])
		{
			// overlay occurs
			draw_rectangle(buttons[i, 0], buttons[i, 1], buttons[i, 2], buttons[i, 3], false);
		}
		else
		{
			draw_set_color(c_black);
			draw_rectangle(buttons[i, 0], buttons[i, 1], buttons[i, 2], buttons[i, 3], false);
		}
		
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_text((buttons[i, 2] + buttons[i, 0]) / 2,
				(buttons[i, 3] + buttons[i, 1]) / 2,
				mapping[? "name"]);
	}
}

// draw collapse button for planet buttons
