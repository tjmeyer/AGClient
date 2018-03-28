/// @description Insert description here
// You can write your code in this editor
if(device_mouse_x_to_gui(0) > menu_left - drag_buffer &&
	device_mouse_y_to_gui(0) > menu_top &&
	device_mouse_x_to_gui(0) < menu_left + drag_buffer &&
	device_mouse_y_to_gui(0) < menu_bottom &&
	!lock_btn.isLocked)
{
	window_set_cursor(cr_size_we);
	if(mouse_check_button(mb_left))
	{
		var gm = instance_find(map_gm_parent, 0);
		gm.isDragging = false;
		menu_left = device_mouse_x_to_gui(0);
		ini_open("profile.ini");
		ini_write_real("Preferences","menu_width",menu_left);
		ini_close();
		drag_buffer = 100;
		if(menu_right - menu_left < menu_min)
		{
			menu_left = menu_right - menu_min;
		}
		
		if(menu_right - menu_left > menu_max)
		{
			menu_left = menu_right - menu_max;	
		}
	}
	else
	{
		drag_buffer = 3;
	}
}
else
{
	if(window_get_cursor() != cr_default)
	{
		window_set_cursor(cr_default);	
	}
}

// resize all buttons
for(var i = 0; i < instance_number(obj_generic_menu_button); i++)
{
	var btn = instance_find(obj_generic_menu_button, i);
	btn.gui_x = menu_left;
	if(btn.object_index != obj_menu_lock_button)
	{
		btn.button_width = menu_right - menu_left;
		btn.button_height = btn.button_width;
		btn.gui_y = menu_bottom - btn.button_height;
	}
}

