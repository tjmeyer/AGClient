/// @description fade to red when selected
draw_self();
if(is_selected)
{
	if(select_fade_index <= 100)
	{
		select_fade_index += 4;
	}
	
	var colorPicker = random(100);
	
	if(colorPicker < select_fade_index)
	{
		draw_set_color(c_red);
	}
	else
	{
		draw_set_color(c_white);
	}
}
else
{
	select_fade_index = 0;
	draw_set_color(c_white);
}

draw_set_font(fnt_calibri_12);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(string_length(current_text) > 0)
{
	draw_set_alpha(1);
	draw_text(x, y, current_text);
}
else
{
	draw_set_alpha(.4);
	draw_text(x, y, placeholder_text);
}