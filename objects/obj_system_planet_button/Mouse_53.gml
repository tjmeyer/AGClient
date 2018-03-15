/// @description Insert description here
// You can write your code in this editor

if(has_mouse)
{
	while(zoom_in(40, 1.2)){}
	var cam = view_get_camera(view_current);
	camera_set_view_pos(cam, 
					planet_ref.x - camera_get_view_width(cam) / 2, 
					planet_ref.y - camera_get_view_height(cam) / 2);
}