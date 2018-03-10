/// @description Insert description here
// You can write your code in this editor
if(hasMouseOver) // check variables for this boolean. Set in the draw event
{
	
	// draw infomational overlay
	if(mouse_check_button(mb_left))
	{
		draw_set_color(c_red);
	}
	else
	{
		draw_set_color(c_blue);
	}
	draw_set_alpha(1);
	
	// start at mouse location on GUI layer
	var xStart = device_mouse_x_to_gui(0);
	var yStart = device_mouse_y_to_gui(0);
	var distance = 20;
	// end at a 45 degree angle about 30 pixels away
	draw_line_width(xStart,
					yStart,
					xStart + distance,
					yStart - distance,
					2);
	
	// draw the underline starting where previous line ended
	draw_line_width(xStart + distance,
					yStart - distance,
					xStart + distance + 50, // length of underline
					yStart - distance,
					2);
					
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_font(fnt_monospace_14);
	// draw text above line
	draw_text(xStart + distance + 2,
				yStart - distance - 2,
				name);
}