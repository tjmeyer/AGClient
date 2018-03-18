/// @description Insert description here
// You can write your code in this editor
if(first_draw)
{
	class = string_char_at(type, 1);
	first_draw = false;
	switch (class)
	{
		case "O":
			part_type_color3(part0, 
							make_color_rgb(0,0,255),
							make_color_rgb(0,255,255),
							make_color_rgb(0,64,138));
			image_blend = make_color_rgb(255,255,255);
		break;
	}
	part_system_update(ps);
}
part_emitter_burst(ps, emit0, part0, 5);
image_xscale = 1.5;
image_yscale = 1.5;
draw_self();
event_inherited();