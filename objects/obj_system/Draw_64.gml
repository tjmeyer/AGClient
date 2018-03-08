/// @description Insert description here
// You can write your code in this editor
if(isMouseOver)
{
	draw_set_font(fnt_title_24);
	draw_set_valign(fa_top);
	draw_set_halign(fa_middle);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(display_get_gui_width()/2, 5, name);
}