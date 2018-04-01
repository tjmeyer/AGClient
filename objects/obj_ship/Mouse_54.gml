/// @description Insert description here
// You can write your code in this editor
if(isSelected)
{
	if(isTargeting)
	{
		var aimAt = collision_point(mouse_x, mouse_y, obj_selectable_body, false, true);
		if(instance_exists(aimAt))
		{
			target = aimAt;
		}
		else
		{
			target = -1;
		}
		isTargeting = false;
	}
	else if(isMoveSelecting)
	{
		var station = collision_point(mouse_x, mouse_y, obj_sun, false, true);
		var colony = collision_point(mouse_x, mouse_y, obj_planet, false, true);
		if(instance_exists(colony))
		{
			dest_x = colony.x;
			dest_y = colony.y;	
		}
		else if(instance_exists(station))
		{
			dest_x = station.x;
			dest_y = station.y;
		}
		else
		{
			dest_x = mouse_x;
			dest_y = mouse_y;
		}
		lastUpdateTime = get_timer();
		isMoveSelecting = false;
	}
}