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