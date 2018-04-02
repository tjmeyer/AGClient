/// @description Insert description here
// You can write your code in this editor
target_collide_id = collision_point(x, y, obj_selectable_body, false, true);
if(target_collide_id != noone)
{
	if(!target_collide_id.isFriend && !target_collide_id.isOwned)
	{
		// confirmed collision, destroy the round
		target_collision = true;
	}
}