var minRes = argument0; // maximum resolution in pixels
var scale  = argument1; // how much to scale the zoom each step in percentage
// NOTE: the scale is a percentage and is the perfect inverse of zooming out.
// So a scale of 1.2 (20%) when zooming in will actually be 1/1.2 or about .83.

var cam = view_get_camera(view_current);
if(camera_get_view_height(cam) > minRes)
{
	// get center of screen
	var center_x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
	var center_y = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;

	// zoom out
	camera_set_view_size(cam, 
					camera_get_view_width(cam) * (1 / scale), 
					camera_get_view_height(cam) * (1 / scale));

	// reset to original center
	camera_set_view_pos(cam, center_x - camera_get_view_width(cam) / 2, center_y - camera_get_view_height(cam) / 2);
}