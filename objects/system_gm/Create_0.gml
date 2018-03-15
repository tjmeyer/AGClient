/// @description Insert description here
// You can write your code in this editor

// START -- UI buttons data set
buttonNum = 5;

// configure buttons
buttonMap = ds_list_create();
for(var i = 0; i < buttonNum; i++)
{
	ds_list_add(buttonMap, ds_map_create());
}
ds_map_add(buttonMap[| 0], "name", "Map");
ds_map_add(buttonMap[| 0], "action", script_get_name(to_sector_map));
ds_map_add(buttonMap[| 4], "name", "Logout");
ds_map_add(buttonMap[| 4], "action", script_get_name(logout));


// create a bottom layer of buttons
var buttonWidth = display_get_gui_width() / buttonNum;
var buttonHeight = display_get_gui_height() / 15;

buttons = array_create(buttonNum, array_create(4)); // 4: left, top, right, bottom
for(var i = 0; i < buttonNum; i++)
{
	buttons[i, 0] = buttonWidth * i; // left
	buttons[i, 1] = display_get_gui_height() - buttonHeight; // top
	buttons[i, 2] = buttonWidth * (i + 1); // right
	buttons[i, 3] = display_get_gui_height(); // bottom
}
// END -- UI buttons

// Move to center of system
var cam = view_get_camera(view_current);
camera_set_view_pos(cam, 
					room_width / 2  - camera_get_view_width(cam) / 2,
					room_height / 2 - camera_get_view_height(cam) / 2);


// Get initial bg ratio for step process
// these are basicall conversion units to know how to resize the bg as the view port changes size
// during zoom-in and zoom-out events. This is only necessary here because parallax scrolling is enabled.
var bg_layer_id = layer_background_get_id("Background");
ratio_bg_to_cam_x = (layer_background_get_xscale(bg_layer_id) * sprite_get_width(layer_background_get_sprite(bg_layer_id))) / camera_get_view_width(cam);
ratio_bg_to_cam_y = (layer_background_get_yscale(bg_layer_id) * sprite_get_height(layer_background_get_sprite(bg_layer_id))) / camera_get_view_height(cam);
show_debug_message("system_gm created");

// Find all planets and create planet buttons for each
var button_height_sum = 0;
for(var i = 0; i < instance_number(obj_planet); i++)
{
	var planet_button = instance_create_layer(0, 0, "UI", obj_system_planet_button);
	var planet = instance_find(obj_planet, i);
	planet_button.planet_ref = planet;
	planet_button.gui_x = 0;
	planet_button.gui_y = (gui_planet_button_height * i) + (gui_planet_button_spacer * i);
	planet_button.button_width = gui_planet_button_width;
	planet_button.button_height = gui_planet_button_height;
	planet_button.bg_color = c_black;
	planet_button.text_color = c_white;
	planet_button.border_color = c_black;
	planet_button.border_enabled = true;
	planet_button.border_alpha = 1;
	planet_button.alpha = .6;
	planet_button.mouse_over_alpha = 1;
	planet_button.text = planet.name;
	planet_button.text_valign = fa_center;
	planet_button.text_halign = fa_left;
	button_height_sum += gui_planet_button_height + gui_planet_button_spacer;
}

// planet buttons collapser
var collapse_button = instance_create_layer(0,0, "UI", obj_system_planet_button_collapse);

var plusOrMinusText;
if(gui_display_planet_buttons)
{
	plusOrMinusText = "-";
}
else
{
	plusOrMinusText = "+";
}
collapse_button.gui_x = 0
collapse_button.gui_y = button_height_sum + gui_planet_button_spacer;
collapse_button.gui_open_x = collapse_button.gui_x;
collapse_button.gui_open_y = collapse_button.gui_y;
collapse_button.gui_collapse_y = gui_planet_button_spacer;
collapse_button.gui_collapse_x = 0;
collapse_button.button_width = 15;
collapse_button.button_height = 15;
collapse_button.bg_color = c_black;
collapse_button.text_color = c_white;
collapse_button.border_color = c_black;
collapse_button.border_enabled = true;
collapse_button.border_alpha = 1;
collapse_button.alpha = .6;
collapse_button.mouse_over_alpha = 1;
collapse_button.text = plusOrMinusText;
collapse_button.text_valign = fa_center;
collapse_button.text_halign = fa_center;
