/// @description Primary function of the menu

// draw lock button
draw_set_color(bg_color);
draw_set_alpha(bg_alpha);
draw_rectangle(menu_left, menu_top,
				menu_right, menu_bottom, false);

var spacing = 0;
for(var i = 0; i < ds_list_size(button_list); i++)
{
	var padding = 10;
	var btn = button_list[| i];
	// draw button to fill
	btn.button_width = menu_right - menu_left - padding * 2;
	btn.button_height = btn.button_width;
	btn.gui_x = menu_left + padding;
	btn.gui_y = menu_top + padding + (spacing);
	spacing = btn.gui_y + btn.button_height + padding;
	
	// draw line
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_line(menu_left + padding, spacing, menu_right - padding, spacing);
}