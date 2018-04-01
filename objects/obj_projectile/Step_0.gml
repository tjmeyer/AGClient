/// @description Insert description here
// You can write your code in this editor
if(fire)
{
	fire = false;
	speed = auToPixel(auPerSecond);
}

if(point_distance(x, y, source_x, source_y) > auToPixel(range))
{
	instance_destroy(id);
}