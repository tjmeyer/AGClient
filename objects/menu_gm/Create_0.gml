/// @description Insert description here
// You can write your code in this editor

drag_is_locked = false;
lock_btn = instance_create_layer(0,0,"UI", obj_menu_lock_button);
lock_btn.sprite_index = sprt_lock;
lock_btn.image_blend = c_white;
lock_btn.button_width = 25;
lock_btn.button_height = 25;
lock_btn.gui_x = menu_left;
lock_btn.gui_y = menu_bottom - lock_btn.button_height;
lock_btn.alpha = 0;
lock_btn.mouse_over_alpha = .8;
lock_btn.border_alpha = .5;
lock_btn.border_enabled = false;	

button_list = ds_list_create();
// home system
var home_system_btn = instance_create_layer(0,0,"UI", obj_menu_to_home_system_button);
with(home_system_btn)
{
	alpha = 0;
	sprite_index = sprt_system;
	mouse_over_alpha = 1;
	border_alpha = .7;
	border_enabled = false;
}
ds_list_add(button_list, home_system_btn);

// home sector map button
var home_sector_map_btn = instance_create_layer(0,0, "UI", obj_menu_to_home_sector_map_button);
with(home_sector_map_btn)
{
	alpha = 0;
	sprite_index = sprt_system_map;
	mouse_over_alpha = 1;
	border_alpha = .7;
	border_enabled = false;
}
ds_list_add(button_list, home_sector_map_btn);

// map button
var map_btn = instance_create_layer(0,0,"UI", obj_menu_map_button);
with(map_btn)
{
	sprite_index = sprt_sector_map;
	alpha = 0;
	mouse_over_alpha = 1;
	border_alpha = .7;
	border_enabled = false;
}

ds_list_add(button_list, map_btn);

// research page button
var research_btn = instance_create_layer(0,0,"UI", obj_menu_research_button);
with(research_btn)
{
	alpha = 0;
	sprite_index = sprt_research;
	mouse_over_alpha = 1;
	border_alpha = .7;
	border_enabled = false;
}
ds_list_add(button_list, research_btn);


// logout button
var logout_btn = instance_create_layer(0,0,"UI", obj_menu_logout_button);
with(logout_btn)
{
	sprite_index = sprt_off;
	alpha = 0;
	mouse_over_alpha = 1;
	text_color = c_white;
	border_alpha = .7;
	border_enabled = false;	
}
ds_list_add(button_list, logout_btn);