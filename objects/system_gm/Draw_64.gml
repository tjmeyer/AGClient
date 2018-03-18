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
			
			// write info to screen
			draw_set_color(c_white);
			draw_set_font(fnt_title_24);
			draw_set_valign(fa_top);
			draw_set_halign(fa_center);
			draw_text((gui_info_window_left + gui_info_window_right) / 2,
						gui_info_window_top + spacer,
						selected_instance.name);
		break;
		case obj_sun:
		
		break;
	}
}