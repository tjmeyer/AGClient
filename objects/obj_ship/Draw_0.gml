
event_inherited();

if(isTargeting)
{
	draw_weapon_queue(offense);
}

if(isSelected)
{
	draw_set_alpha(1);
}
else
{
	draw_set_alpha(.2);	
}

draw_line_width_color(x, y, dest_x, dest_y, 1, c_blue, c_aqua);
draw_circle_color(dest_x, dest_y, 1.5, c_blue, c_aqua, false);

if(instance_exists(target))
{
	// draw intention
	if(isSelected)
	{
		draw_set_alpha(1);
	}
	else
	{
		draw_set_alpha(.2);	
	}
	draw_line_width_color(x, y, target.x, target.y, 1, c_red, c_orange);
	draw_circle_color(target.x, target.y, 1.5, c_red, c_orange, false);
}

draw_lighting(sprite_index, sprite_index, image_angle, image_xscale, image_yscale);


