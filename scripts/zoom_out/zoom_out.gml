/// @description Zoom out
var maxRes = argument0;
var scale = argument1;

var cam = view_get_camera(view_current);
if(camera_get_view_height(cam) < maxRes)
{
	// get center of screen
	var center_x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
	var center_y = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;

	// zoom out
	camera_set_view_size(cam, camera_get_view_width(cam) * scale, camera_get_view_height(cam) * scale); // 20% increase per mouse wheel movement

	// reset to original center
	camera_set_view_pos(cam, center_x - camera_get_view_width(cam) / 2, center_y - camera_get_view_height(cam) / 2);
}