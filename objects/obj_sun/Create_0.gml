/// @description particle generator and stuff
//
ps = part_system_create();
emit0 = part_emitter_create(ps);
part0 = part_type_create();
part_type_shape(part0, pt_shape_flare);
part_type_size(part0, 2, 2, 0, 0);
part_type_scale(part0, 1, 1);
part_type_color3(part0, 
				make_color_rgb(255, 255, 0), 
				make_color_rgb(255, 160, 64),
				make_color_rgb(255, 0, 0));
part_type_alpha2(part0, 1, 0);
part_type_speed(part0, 1, 5, 0, 0);
part_type_direction(part0, 0, 360, 0, 0);
part_type_gravity(part0, 0, 0);
part_type_orientation(part0, 0, 360, 0, 0, false);
part_type_blend(part0, 1);
part_type_life(part0, 1, 10);

part_system_position(ps, x, y);
part_emitter_stream(ps, emit0, part0, 5);