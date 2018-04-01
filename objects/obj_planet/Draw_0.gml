/// @description Insert description here
// You can write your code in this editor
var interval = 3;
for(var i = 0; i < 360; i += (interval*2))
{
	// parametric circle
	
	// starting point
	var start_x = orbit_radius * cos(i * (pi/180)) + orbiting_object.x;
	var start_y = orbit_radius * sin(i * (pi/180)) + orbiting_object.y;
	
	var end_x = orbit_radius * cos((i + interval) * (pi/180)) + orbiting_object.x;;
	var end_y = orbit_radius * sin((i + interval) * (pi/180)) + orbiting_object.y;
	
	draw_set_color(c_white);
	draw_set_alpha(.5);
	draw_line_width(start_x, start_y, end_x, end_y, 1);
}

// set x and y based on update progress percentage.
x = orbit_radius * cos(progress * 2 * pi) + orbiting_object.x;
y = orbit_radius * sin(progress * 2 * pi) + orbiting_object.y;
image_angle = (progress * 360) - 90;
event_inherited();
draw_self();