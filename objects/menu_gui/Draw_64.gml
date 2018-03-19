/// @description Primary function of the menu

if(instance_exists(system_gm))
{
	var gm = instance_find(system_gm, 0);
	if(gm.selected_instance > -1)
	{
		menu_bottom = gm.gui_info_window_top;	
	}
	else
	{
		menu_bottom = display_get_gui_height();
	}
}

// draw bg
draw_set_color(bg_color);
draw_set_alpha(bg_alpha);
draw_rectangle(menu_left, menu_top,
				menu_right, menu_bottom, false);

// draw lock
var padding = 10;
lock_btn.gui_y = menu_bottom - lock_btn.button_height - padding;

var spacing = 0;
for(var i = 0; i < ds_list_size(button_list); i++)
{
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