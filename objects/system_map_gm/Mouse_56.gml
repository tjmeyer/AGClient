/// @description Selection interface for systems on the map of a sector

if(instance_exists(obj_system))
{
	var system = instance_nearest(mouse_x, mouse_y, obj_system);
	if(mouse_x > system.x - system.sprite_width/2 &&
		mouse_x < system.x + system.sprite_width/2 &&
		mouse_y > system.y - system.sprite_height/2 &&
		mouse_y < system.y + system.sprite_height/2)
	{
		global.current_system_db_id = system.db_id;
		room_goto(rm_system);
	}
}