/// @description Insert description here
// You can write your code in this editor

if(isSelected)
{
	// if targeting AND selected
	if(isTargeting)
	{
		// start targeting mode
		cursor_sprite = sprt_cursor_targeting;
		window_set_cursor(cr_none);
	}
	else if(isMoveSelecting)
	{
		window_set_cursor(cr_uparrow);
	}
	else
	{
		cursor_sprite = -1;
		window_set_cursor(cr_default);
	}
}
else
{
	// can't be targeting if not selected
	isTargeting = false;
	isMoveSelecting = false;
}

// auto fire when in range
if(target != -1)
{
	// whatever the ship is targeting, so will the mounted weapon
	offense.target = target;
	if(point_distance(x, y, target.x, target.y) < auToPixel(offense.range))
	{
		offense.firing = true;
	}
	else
	{
		offense.firing = false;
	}
}


// ship should be moving
if(dest_x != x && dest_y != y)
{
	// align while moving, this does not go to the server,
	// only x, y, dest_x, and dest_y
	var degToMove = point_direction(x, y, dest_x, dest_y);
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
	direction += clamp(_dd, -turnSpeed, turnSpeed);
	if(offense != -1)
	{
		offense.direction += clamp(_dd, -turnSpeed, turnSpeed);
	}
	image_angle = direction - 90;
	
	// speed must be measured by real time, not frame rates
	// ship speed is AU per minute
	var _dt = get_timer() - lastUpdateTime; // delta time
	// calulate distance based on AU / minute
	timeToArrival = sqrt(sqr(dest_x - x) + sqr(dest_y - y)) / auToPixel(shipSpeed); // seconds
	var distanceMoved = auToPixel(shipSpeed) * (_dt / (60000000)); // 1,000,000 = one second in game timers
	x += cos(degtorad(degToMove)) * distanceMoved;
	y -= sin(degtorad(degToMove)) * distanceMoved;
	lastUpdateTime = get_timer();
	if(timeToArrival < 0.001)
	{
		x = dest_x;
		y = dest_y;
	}
}