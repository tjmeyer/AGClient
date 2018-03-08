/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_set_font(fnt_monospace_14);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var space = 2;
for(var i = 0; i < string_length(message); i++)
{	
	// draw a box for each one
	draw_rectangle(i * string_width("T") + i * space, 
					y - string_height("T") / 2,
					i * string_width("T") + string_width("T") + i * space,
					y + string_height("T") / 2,
					true);
	// draw random text first
	if(get_timer() - textTimer < (i + 1) * interval)
	{
		// pick letter
		var ascii = floor(random_range(32, 128));
		draw_text(i * string_width("T") + i * space, y, chr(ascii));
	}
	else
	{
		draw_text(i * string_width("T") + i * space, y, string_char_at(message, i + 1));
	}
}