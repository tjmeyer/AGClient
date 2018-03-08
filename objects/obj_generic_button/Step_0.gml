/// @description Insert description here
// You can write your code in this editor
var cam = view_get_camera(view_current);

if(window_mouse_get_x() > x - sprite_width / 2 &&
	window_mouse_get_x() < x + sprite_width / 2 &&
	window_mouse_get_y() > y - sprite_height / 2 &&
	window_mouse_get_y() < y + sprite_height / 2 &&
	mouse_check_button(mb_left))
{
	is_selected = true;	
	
	if(mouse_check_button_released(mb_left))
	{
		event_perform(ev_mouse, ev_left_release);	
	}
}
else
{
	is_selected = false;	
}