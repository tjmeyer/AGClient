if(instance_exists(argument0))
{
	var weapon = argument0;
	var range = auToPixel(weapon.range);
	draw_set_alpha(.15);
	draw_circle_color(weapon.x, weapon.y, range, c_green, c_red, false);
	switch (weapon.type)
	{
		case "projectile":
		draw_set_alpha(1);
			var mouse_angle = degtorad(point_direction(weapon.x, weapon.y, mouse_x, mouse_y));
			mouse_angle += pi/2;
			draw_line_width_color(weapon.x, weapon.y, sin(mouse_angle)*range + weapon.x, cos(mouse_angle)*range + weapon.y, 2, c_red, c_yellow);
		break;
	}
}
else
{
	show_debug_message("INVALID WEAPON QUEUE PROVIDED TO draw_weapon_queue()");	
}