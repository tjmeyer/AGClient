/// @description Insert description here
// You can write your code in this editor
if(visible)
{
	draw_set_font(text_font);
	draw_set_valign(text_valign);
	draw_set_halign(text_halign);

	has_mouse = false;
	if(device_mouse_x_to_gui(0) > gui_x &&
		device_mouse_y_to_gui(0) > gui_y &&
		device_mouse_x_to_gui(0) < gui_x + button_width &&
		device_mouse_y_to_gui(0) < gui_y + button_height)
	{
		has_mouse = true;
	}

	// bg
	draw_set_color(bg_color);
	if(has_mouse)
	{
		draw_set_alpha(mouse_over_alpha);
	}
	else
	{
		draw_set_alpha(alpha);
	}
	draw_rectangle(gui_x, gui_y, gui_x + button_width, gui_y + button_height, false);

	if(sprite_index > -1)
	{
		draw_sprite_stretched_ext(sprite_index, image_index, 
									gui_x - button_width / 2, gui_y - button_height / 2,
									button_width, button_height,
									image_blend, border_alpha);	
	}
	
	// border
	if(border_enabled)
	{
		draw_set_alpha(border_alpha);
		draw_set_color(border_color);
		draw_rectangle(gui_x, gui_y, gui_x + button_width, gui_y + button_height, true);
	}

	// text
	if(has_mouse)
	{
		draw_set_alpha(mouse_over_alpha);
	}
	else
	{
		draw_set_alpha(alpha);
	}
	draw_set_color(text_color);
	
	if(text_halign == fa_center)
	{
		draw_text((gui_x + gui_x + button_width) / 2, (gui_y + gui_y + button_height) / 2, text);
	}
	else
	{
		draw_text(gui_x + 3, (gui_y + gui_y + button_height) / 2, text);
	}
	
	// adjust button width as necessary to fit text
	if(string_width(text) > button_width)
	{
		button_width = 4 + string_width(text);
	}
}