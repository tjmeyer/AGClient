/// @description Performs the select interface
var gm = instance_find(system_gm, 0);

// check to make sure mouse clicks do not pass through gui layer
if((gm.selected_instance > -1 && 
	device_mouse_x_to_gui(0) > gm.gui_info_window_left &&
	device_mouse_y_to_gui(0) > gm.gui_info_window_top &&
	device_mouse_x_to_gui(0) < gm.gui_info_window_right &&
	device_mouse_y_to_gui(0) < gm.gui_info_window_bottom)
	)
{
	// ignore that click, meant for gui layer
}
else
{
	// remove selection is already selected
	if(isSelected)
	{
		isSelected = false;
		gm.selected_instance = -1;
	}
	else
	{
		// remove all others' selected status before selecting
		for(var i = 0; i < instance_number(obj_selectable_body); i++)
		{
			var inst = instance_find(obj_selectable_body, i);
			inst.isSelected = false;
		}
		isSelected = true;
		gm.selected_instance = id;
	}	
}