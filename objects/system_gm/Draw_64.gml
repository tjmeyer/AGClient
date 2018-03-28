/// @description map gui elements
if(selected_instance > 0)
{	
	draw_set_color(c_black);
	draw_set_alpha(.6);
	draw_rectangle(gui_info_window_left, 
					gui_info_window_top, 
					gui_info_window_right, 
					gui_info_window_bottom, 
					false);
	draw_line_width(gui_info_window_left, gui_info_window_top,
					gui_info_window_right, gui_info_window_top, 3);
	
	switch(selected_instance.object_index)
	{
		case obj_planet:
			// draw planet picture
			var x_to_y_ratio = selected_instance.sprite_width / selected_instance.sprite_height;
			var pic_width = 100;
			var pic_height = 100;
			var spacer = 5;
			// draw_sprite_stretched_ext ignores the sprites origin and assumes 0, 0 (top left corner) as origin
			draw_sprite_stretched_ext(selected_instance.sprite_index, selected_instance.image_index, 
									gui_info_window_left + spacer + (pic_width / 2) - pic_width / 2,
									(gui_info_window_top + gui_info_window_bottom) / 2 - pic_height / 2,
									pic_width, pic_height,
									c_white, 1);
			var textLeft = pic_width + gui_info_window_left + spacer * 2;
			// write info to screen
			draw_set_color(c_white);
			draw_set_font(fnt_title_24);
			draw_set_valign(fa_top);
			draw_set_halign(fa_center);
			var textY = gui_info_window_top + spacer;
			// name of planet
			draw_text((gui_info_window_left + gui_info_window_right) / 2,
						textY, selected_instance.name);
			textY += string_height("X");
			// planet radius
			draw_set_font(fnt_calibri_12);
			draw_set_halign(fa_left);
			draw_text(textLeft, textY, "Radius: " + string(selected_instance.radius) + " miles");
			textY += string_height("X");
			// planet distance
			draw_text(textLeft, textY, "Orbit Distance: " + string(selected_instance.distance) + " AU");
			textY += string_height("X");
			// orbit time
			draw_text(textLeft, textY, "Orbit Period: " + string(selected_instance.orbit_speed / 395.25) + " earth years.");
			
			
		break;
		case obj_sun:
			var padding = 15;
			draw_set_color(c_white);
			draw_set_font(fnt_monospace_14);
			draw_set_valign(fa_top);
			draw_set_halign(fa_left);
			var textHeight = string_height("X");
			var title = "Class " + string(selected_instance.type) + " Star";			
			if(selected_instance.anomaly > 0)
			{
				title += " - Anomaly Detected";
			}
			
			var radius = "Radius: " + string(selected_instance.radius) + " miles";

			draw_text(gui_info_window_left + padding, 
						gui_info_window_top + padding, 
						title);
			draw_text(gui_info_window_left + padding,
						gui_info_window_top + padding * 2 + textHeight,
						radius);
		break;
	}
}