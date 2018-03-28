/// @description Insert description here
// You can write your code in this editor

// START -- UI buttons data set
if(!instance_exists(menu_gm))
{
	menu_ref = instance_create_layer(0,0,"UI",menu_gm);
}
else
{
	menu_ref = instance_find(menu_gm, 0);
}
// END -- UI buttons

