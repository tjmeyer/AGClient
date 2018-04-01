/// @description Insert description here
// You can write your code in this editor

if(has_mouse)
{
	if(instance_exists(selected_instance))
	{
		show_debug_message("*CLICK*");
		with(selected_instance)
		{
			event_perform(ev_keypress, ord("A"));
		}
	}
}