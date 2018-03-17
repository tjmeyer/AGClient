/// @description Insert description here
// You can write your code in this editor
if(first_draw)
{
	class = string_char_at(type, 1);
	first_draw = false;
	if(class == "O")
	{
		part_type_color3(part0, 
						make_color_rgb(0,0,255),
						make_color_rgb(0,255,255),
						make_color_rgb(0,64,138));
	}
	part_system_update(ps);
}
part_emitter_burst(ps, emit0, part0, 5);
//part_emitter_stream(ps, emit0, part0, 5);
draw_self();
event_inherited();