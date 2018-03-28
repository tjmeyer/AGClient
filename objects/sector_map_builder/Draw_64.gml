/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(.8);

if(isLoading)
{
	// background shade out of focus
	draw_rectangle(0, 0, 
					display_get_gui_width(), 
					display_get_gui_height(), 
					false);
	
	// draw loading sprite
	sprite_set_speed(sprt_loading, 2, spritespeed_framespergameframe);
	draw_sprite(sprt_loading, -1, 
				display_get_gui_width() / 2, 
				display_get_gui_height() / 2);
	
	// draw loading text
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_monospace_14);
	draw_text(display_get_gui_width() / 2, 
				display_get_gui_height() / 2 + sprite_get_height(sprt_loading) / 2, 
				loadingText);
}