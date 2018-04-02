/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(fire)
{
	fire = false;
	speed = auToPixel(auPerSecond);
}

if(point_distance(x, y, source_x, source_y) > auToPixel(range))
{
	instance_destroy(id);
}

// parent object detected a collision with something
// not friendly
if(target_collision)
{
	// whatever we collided with is in target_collide_id
	// destroy this object when we collide
	instance_destroy(id);
	
	// deal damage
	if(target_collide_id != noone)
	{
		// check to see if what we hit has health
		// and is, therefore, valid to deal damage to
		if(variable_instance_exists(target_collide_id, "takeDamage"))
		{
			target_collide_id.takeDamage += damage;
		}
	}
}