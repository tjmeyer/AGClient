/// @description Insert description here
// You can write your code in this editor

if(has_mouse)
{
	if(instance_exists(system_gm))
	{
		var gm = instance_find(system_gm, 0);

		for(var i = 0; i < instance_number(obj_system_planet_button); i++)
		{
			var inst = instance_find(obj_system_planet_button, i);
			inst.visible = !inst.visible;
			if(inst.visible)
			{
				text = "-";
				gui_x = gui_open_x;
				gui_y = gui_open_y;
			}
			else
			{
				text = "+";
				gui_x = gui_collapse_x;
				gui_y = gui_collapse_y;
			}
		}
	}
}