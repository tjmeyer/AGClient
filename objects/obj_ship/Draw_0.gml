
event_inherited();

draw_healthbar(x - sprite_width / 2, y + sprite_height / 2,  x + sprite_width / 2, y + sprite_height / 2 + 3,
				(shields / maxShields) * 100, c_black, c_aqua, c_blue, 0, true, true);
draw_healthbar(x - sprite_width / 2, y + sprite_height / 2 + 3, x + sprite_width / 2, y + sprite_height / 2 + 6,
				(hp / maxHp) * 100, c_black, c_red, c_green, 0, true, true);

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

// something hit us!
if(takeDamage != 0)
{
	shields -= takeDamage;
	var hit_x = random_range(bbox_left, bbox_right);
	var hit_y = random_range(bbox_top, bbox_bottom);
	draw_set_font(fnt_calibri_12);
	draw_set_alpha(1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	if(shields < 0)
	{
		// hull takes damage
		hp -= abs(shields);
		shields = 0;
		part_particles_create(ps, 
								hit_x,
								hit_y,
								part_armor_hit, 1);
		draw_set_color(c_red);
	}
	else
	{
		// shields absorbs damage
		part_particles_create(ps, 
								hit_x,
								hit_y,
								part_shield_hit, 1);
		draw_set_color(c_aqua);
		var alpha = random_range(0.01, .2);
		draw_set_alpha(alpha);
		draw_circle_color(x, y, bbox_right - bbox_left + 10, c_white, c_aqua, false);
		draw_set_alpha(1);
	}
	draw_text(hit_x, hit_y + 50, "-"+string(takeDamage));
	takeDamage = 0;
}
