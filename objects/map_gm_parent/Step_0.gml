/// @description Insert description here
// You can write your code in this editor

// START -- drag to move functions
if(isDragging)
{
	var cam = view_get_camera(view_current);
	// check x difference
	var xDiff = x_dragger - display_mouse_get_x();
	var yDiff = y_dragger - display_mouse_get_y();
	
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
	x_dragger = display_mouse_get_x();
	y_dragger = display_mouse_get_y();
}

if(mouse_check_button_released(mb_left))
{
	isDragging = false;	
}
// END -- drag to move functions

// START -- 2D Parallax Scrolling

// END -- 2D Parallax Scrolling