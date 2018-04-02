/// @description Draws selection indicator for selectable items.
if(isSelected)
{
	if(pulse_alpha > pulse_alpha_max)
	{
		// start going down
		pulse_up = false;
		pulse_alpha = pulse_alpha_max;
	}
	
	if(pulse_alpha < pulse_alpha_min)
	{
		// start going up
		pulse_up = true;
		pulse_alpha = pulse_alpha_min;
	}
	
	if(pulse_up)
	{
		pulse_alpha *= 1 + pulse_speed;	
	}
	else
	{
		pulse_alpha *= 1 - pulse_speed;	
	}
	var scale_amount = 3;
	var new_width = sprite_width * scale_amount;
	var new_height = sprite_height * scale_amount;
	var color = c_red;
	if(isOwned && isFriend)
	{
		color = c_yellow; // didn't want to add another boolean, so this is ownerless, neutral stuff you can claim
	}
	else if(isOwned)
	{
		color = c_green; // is your stuff, do what you want
	}
	else if(isFriend)
	{
		color = c_purple; // friend, cannot engage or claim
	}
	else
	{
		color = c_red;	// enemy, can engage
	}
	draw_sprite_stretched_ext(sprt_sun, 0, 
								x - new_width / 2, y - new_height / 2, // 2 to centerize under object
								new_width, new_height, 
								color, pulse_alpha);
}
