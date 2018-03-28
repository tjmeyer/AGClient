/// @description Zoom out
var maxRes = argument0;
var scale = argument1;
var zoom_success = false;
var cam = view_get_camera(view_current);
if(camera_get_view_height(cam) < maxRes)
{
	// get center of screen
	var center_x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
	var center_y = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;

	// zoom out
	var xSize = camera_get_view_width(cam) * scale;
	var ySize = camera_get_view_height(cam) * scale
	if(xSize < room_width && ySize < room_height)
	{
		camera_set_view_size(cam, xSize, ySize); // 20% increase per mouse wheel movement

		// reset to original center
		camera_set_view_pos(cam, center_x - camera_get_view_width(cam) / 2, center_y - camera_get_view_height(cam) / 2);
	}

	//// move view to min/max locations
	//if(camera_get_view_x(cam) < 0)
	//{
	//	camera_set_view_pos(cam, 0, camera_get_view_y(cam));	
	//}

	//if(camera_get_view_y(cam) < 0)
	//{
	//	camera_set_view_pos(cam, camera_get_view_x(cam), 0);	
	//}
	zoom_success = true;
}

return zoom_success;
