/// @description Selection for sectors (obj_sector)

if(instance_exists(obj_sector))
{
	var sector = instance_nearest(mouse_x, mouse_y, obj_sector);
	if(mouse_x > sector.x - sector.sprite_width/2 &&
		mouse_x < sector.x + sector.sprite_width/2 &&
		mouse_y > sector.y - sector.sprite_height/2 &&
		mouse_y < sector.y + sector.sprite_height/2)
	{
		// send http request
		var system_factory = room_instance_add(rm_system_map, sector.x, sector.y, system_map_builder);
		global.current_sector_name = sector.name;
		room_goto(rm_system_map);
	}
}