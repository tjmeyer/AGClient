/// @description Glue weapon to mount (or ship)
// only includes tracking. Everything else but be created per weapon
if(instance_exists(mount))
{
	x = mount.x;
	y = mount.y;
	
	// move forward from where the weapon is facing
	light.x = cos(degtorad(direction)) * 50 + x;
	light.y = -sin(degtorad(direction)) * 50 + y;
	
	// has something to aim at
	if(target != -1)
	{
		var degToMove = point_direction(x, y, target.x, target.y);
		// pick shortest direction to turn
		// checks if turning past 0deg is faster or not
		var _dd = degToMove - direction; // delta direction
		if(_dd < 0)
		{
			_dd += 360;	
		}
		if(_dd > 180)
		{
			_dd -= 360;
		}
		direction += clamp(_dd, -trackSpeed, trackSpeed);
	}
	
	image_angle = direction - 90;
}