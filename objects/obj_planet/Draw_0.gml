/// @description Insert description here
// You can write your code in this editor
var interval = 3;
for(var i = 0; i < 360; i += (interval*2))
{
	// parametric circle
	
	// starting point
	var start_x = orbit_radius * cos(i * (pi/180)) + room_width / 2;
	var start_y = orbit_radius * sin(i * (pi/180)) + room_height /2 ;
	
	var end_x = orbit_radius * cos((i + interval) * (pi/180)) + room_width / 2;
	var end_y = orbit_radius * sin((i + interval) * (pi/180)) + room_height / 2;
	
	draw_set_color(c_white);
	draw_set_alpha(.5);
	draw_line_width(start_x, start_y, end_x, end_y, 2);
}

draw_self();