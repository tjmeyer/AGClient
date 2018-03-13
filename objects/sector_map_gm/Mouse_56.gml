/// @description Selection for sectors (obj_sector)

if(instance_exists(obj_sector))
{
	var sector = instance_nearest(mouse_x, mouse_y, obj_sector);
	if(mouse_x > sector.x - sector.sprite_width/2 &&
		mouse_x < sector.x + sector.sprite_width/2 &&
		mouse_y > sector.y - sector.sprite_height/2 &&
		mouse_y < sector.y + sector.sprite_height/2)
	{
		// move to room and set sector to global for game's global location
		global.current_sector_db_id = sector.db_id;
		room_goto(rm_system_map);
	}
}