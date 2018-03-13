/// @description Find which button is pressed and perform an action
for(var i = 0; i < ds_list_size(buttonMap); i++)
{
	var mapping = buttonMap[| i];
	if( device_mouse_x_to_gui(0) > buttons[i,0] &&
		device_mouse_x_to_gui(0) < buttons[i,2] &&
		device_mouse_y_to_gui(0) > buttons[i,1] &&
		device_mouse_y_to_gui(0) < buttons[i,3])
	{
		if(ds_map_exists(mapping, "action"))
		{
			show_debug_message("script: " + mapping[? "action"]);
			switch (mapping[? "action"])
			{
				case "logout":
					logout();
				break;
				case "to_sector_map":
					to_sector_map();
				break;
			}
		}
	}
}