/// @description Insert description here
// You can write your code in this editor

// START -- drag to move functions
var cam = view_get_camera(view_current);
if(isDragging)
{
	// check x difference
	var ratio = camera_get_view_width(cam) / 1024;
	var xDiff = (x_dragger - device_mouse_x_to_gui(0))*ratio;
	var yDiff = (y_dragger - device_mouse_y_to_gui(0))*ratio;
	
	var newX = camera_get_view_x(cam) + xDiff;
	var newY = camera_get_view_y(cam) + yDiff;
	
	if(newX < 0)
	{
		newX = 0;
	}
	else if(newX + camera_get_view_width(cam) > room_width)
	{
		newX = room_width - camera_get_view_width(cam);	
	}
	
	if(newY < 0)
	{
		newY = 0;
	}
	else if(newY + camera_get_view_height(cam) > room_height)
	{
		newY = room_height - camera_get_view_height(cam);	
	}
	
	camera_set_view_pos(cam, newX, newY);
}

if(mouse_check_button(mb_left))
{
	isDragging = true;
	x_dragger = device_mouse_x_to_gui(0);
	y_dragger = device_mouse_y_to_gui(0);
}

if(mouse_check_button_released(mb_left))
{
	isDragging = false;	
}
// END -- drag to move functions

// START -- Remain view in room at all times

if(camera_get_view_width(cam) + camera_get_view_x(cam) > room_width)
{
	camera_set_view_pos(cam, room_width - camera_get_view_width(cam), camera_get_view_y(cam));
}

if(camera_get_view_height(cam) + camera_get_view_y(cam) > room_height)
{
	camera_set_view_pos(cam, camera_get_view_x(cam), room_height - camera_get_view_height(cam));
}

// END -- Kepp view in room at all times