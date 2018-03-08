/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fnt_calibri_12);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
if(is_selected)
{
	draw_rectangle_color(x - sprite_width / 2,
						y - sprite_height / 2,
						x + sprite_width / 2, 
						y + sprite_height / 2,
						c_black,
						c_red,
						c_black,
						c_maroon, 
						true);						
	draw_set_color(c_red);
}
else
{
	draw_set_color(c_white);	
}

draw_text(x, y, button_text);