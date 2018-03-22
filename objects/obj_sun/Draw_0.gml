/// @description Insert description here
// You can write your code in this editor
if(first_draw)
{
	class = string_char_at(type, 1);
	first_draw = false;
	switch (class)
	{
		case "M":
			part_type_color_rgb(part0, 240, 255, 0, 150, 0, 10);
			image_blend = c_red;
		break;
		case "K":
			part_type_color_rgb(part0, 240, 255, 100, 200, 0, 10);
			image_blend = c_orange;
		break;
		case "G":
			part_type_color_rgb(part0, 100, 200, 150, 255, 0, 50);
			image_blend = c_yellow;
		break;
		case "F":
			part_type_color_rgb(part0, 200, 255, 200, 255, 200, 255);
			image_blend = c_white;
		break;
		case "A":
			part_type_color_rgb(part0, 50, 255, 50, 255, 150, 255);
			image_blend = c_aqua;
		break;
		case "B":
			part_type_color_rgb(part0, 0, 100, 100, 255, 200, 255);
			image_blend = c_blue;
		break;
		case "O":
			part_type_color_rgb(part0, 0, 50, 150, 255, 230, 255);
			part_type_life(part0, 5, 10);
			emission_number = 30;
			image_blend = c_white;
		break;
	}
	part_system_update(ps);
}
var flicker = random_range(.85, 1);
draw_sprite_ext(sprt_anomaly, anomaly, room_width / 2, room_height / 2, 1, 1, 0, image_blend, flicker);
part_emitter_burst(ps, emit0, part0, emission_number);
image_xscale = 1.5;
image_yscale = 1.5;
draw_self();
event_inherited();