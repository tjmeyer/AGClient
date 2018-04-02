/// @description Insert description here
// You can write your code in this editor
Light=1;
Lights=4;
image_xscale = .1;
image_yscale = .1;
offense = instance_create_layer(x,y,"Instances",obj_projectile_weapon);
offense.mount = id; // attaches the item to the ship

// lighting colors when firing weapon
offense.onR = 1.5;
offense.onG = .75;
offense.onB = .05;

ps = part_system_create();
part_shield_hit = part_type_create();
part_armor_hit = part_type_create();
part_type_blend(part_shield_hit, true);
part_type_blend(part_armor_hit, true);
part_type_color3(part_shield_hit, c_white, make_color_rgb(128, 255, 255), make_color_rgb(128,128, 255));
part_type_scale(part_shield_hit, .01, .01);
part_type_size(part_shield_hit, 1, 5, 0.5, .1);
part_type_shape(part_shield_hit, pt_shape_ring);
part_type_life(part_shield_hit,5,5);

part_type_color3(part_armor_hit, make_color_rgb(255, 255, 128), make_color_rgb(255, 128, 64), make_color_rgb(255, 0, 0));
part_type_scale(part_armor_hit, .01, .01);
part_type_size(part_armor_hit, 1, 5, .5, .2);
part_type_shape(part_armor_hit, pt_shape_flare);
part_type_life(part_armor_hit, 5, 5);