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
		case obj_ship:
			// draw planet picture
			var x_to_y_ratio = selected_instance.sprite_width / selected_instance.sprite_height;
			var pic_width = 150;
			var pic_height = 150;
			var spacer = 5;
			// draw_sprite_stretched_ext ignores the sprites origin and assumes 0, 0 (top left corner) as origin
			draw_sprite_stretched_ext(selected_instance.sprite_index, 0, 
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
						textY, "Ship name");
			textY += string_height("X");
			// planet radius
			draw_set_font(fnt_calibri_12);
			draw_set_halign(fa_left);
			var time = selected_instance.timeToArrival * 60;
			var h = floor(time / (60 * 60));
			time -= h * (60*60);
			if(h >= 10) { h = string(h) } else { h = "0" + string(h) }
			var m = floor(time / 60);
			time -= m * 60;
			if(m >= 10) { m = string(m) } else { m = "0" + string(m) }
			var s = floor(time);
			if(s >= 10) { s = string(s) } else { s = "0" + string(s) }
			draw_text(textLeft, textY, "Time to arrival: " + h + ":" + m + ":" + s);
			textY += string_height("X");
			// planet distance
			if(instance_exists(selected_instance.target))
			{
				draw_text(textLeft, textY, "Targeting: " + string(selected_instance.target.id) + " id");
				textY += string_height("X");
			}
			// orbit time
			if(instance_exists(selected_instance.offense))
			{
				draw_text(textLeft, textY, "Weapon type: " + string(selected_instance.offense.type));
				textY += string_height("X");
			}
			
			//attack button
			if(instance_number(obj_menu_ship_target_button) < 1)
			{
				var attackButton = instance_create_layer(0,0,"UI",obj_menu_ship_target_button);
				attackButton.selected_instance = selected_instance;
				with(attackButton)
				{
					gui_x = textLeft;
					gui_y = textY;
					bg_alpha = .5;
					bg_color = c_black;
					original_bg_color = c_black;
					original_alpha = .5;
					mouse_over_alpha = 1;
					button_width = 200;
					button_height = 50;
					text = "Select Target";
					while_on_alpha = .5;
					while_on_bg_color = c_red;
					border_alpha = 1;
					border_enabled = true;
				}
			}
			
			
			
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