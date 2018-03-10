/// @description Insert description here
// You can write your code in this editor

// check for mouse being within sprite collision box
draw_self();

// draw hexagon around it for highlighting
var rad = 25;
var height = sqrt(abs(sqr(rad/2) - sqr(rad)));
draw_set_color(c_red);
draw_set_alpha(1);
var hexagonVertex = array_create(6, array_create(2)); // 6 points, x and y each one
hexagonVertex[0, 0] = x - rad;
hexagonVertex[0, 1] = y;
hexagonVertex[1, 0] = x - rad / 2;
hexagonVertex[1, 1] = y - height;
hexagonVertex[2, 0] = x + rad / 2;
hexagonVertex[2, 1] = y - height;
hexagonVertex[3, 0] = x + rad;
hexagonVertex[3, 1] = y;
hexagonVertex[4, 0] = x + rad / 2;
hexagonVertex[4, 1] = y + height;
hexagonVertex[5, 0] = x - rad / 2;
hexagonVertex[5, 1] = y + height;

var weight = 2;
for(var i = 0; i < 5; i ++)
{
	draw_line_width(hexagonVertex[i, 0],
				hexagonVertex[i, 1],
				hexagonVertex[i + 1, 0],
				hexagonVertex[i + 1, 1], weight);
}
draw_line_width(hexagonVertex[5, 0], 
			hexagonVertex[5,1],
			hexagonVertex[0,0],
			hexagonVertex[0,1], weight);

if(mouse_x > x - sprite_width / 2 &&
	mouse_x < x + sprite_width / 2 &&
	mouse_y > y - sprite_height / 2 &&
	mouse_y < y + sprite_height / 2)
{
	// draw hexagon highlight
	hasMouseOver = true;
	draw_set_color(c_red);
	draw_set_alpha(.3);
	for(var i = 0; i < 6; i++)
	{
		var next = i + 1;
		if(next >= 6)
		{
			next = 0;	
		}
		draw_triangle(hexagonVertex[i,0], hexagonVertex[i,1],
						hexagonVertex[next,0], hexagonVertex[next,1],
						x, y, false);
	}
}
else
{
	hasMouseOver = false;	
}