/// @description Insert description here
// You can write your code in this editor
draw_self();

// check for mouse-over
if(mouse_x > x - sprite_width / 2 &&
	mouse_x < x + sprite_width / 2 &&
	mouse_y > y - sprite_height / 2 &&
	mouse_y < y + sprite_height / 2)
{
	var left = x - sprite_width / 2;
	var right = x + sprite_width / 2;
	var top = y - sprite_height / 2;
	var bottom = y + sprite_height / 2;
	if(!isMouseOver)
	{
		revealTimer = get_timer();
	}
	var percentReveal = (get_timer() - revealTimer) / revealTime;
	if(percentReveal > 1)
	{
		percentReveal = 1;	
	}
	isMouseOver = true;
	draw_set_color(c_red);
	draw_set_alpha(1);
	draw_set_font(fnt_title_24);
	// top line
	draw_line(left - 5,
				top - 5,
				(left - 5) * (1 - percentReveal) + (right + 5) * percentReveal,
				top - 5);
	// bottom line
	draw_line(left - 5,
				bottom + 5,
				(left - 5) * (1 - percentReveal) + (right + 5) * percentReveal,
				bottom + 5);
				
	var cam = view_get_camera(view_current);
	// connecting line
	draw_line_color(x, y, 
				x * (1 - percentReveal) + (camera_get_view_x(cam) + camera_get_view_width(cam)/2) * percentReveal, 
				y * (1 - percentReveal) + (camera_get_view_y(cam) + string_height("X") + 5) * percentReveal,
				c_red, c_blue);
}
else
{
	isMouseOver = false;	
}