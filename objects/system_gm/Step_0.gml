/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var cam = view_get_camera(view_current);
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

// START -- Parallax Scrolling

// move bg layer to match camera, referrences from the top left.
var cam_percent_x = cam_x / (room_width - cam_width); // distance in percentage
var cam_percent_y = cam_y / (room_height - cam_height);
var bg_layer_id = layer_background_get_id("Background");
var bg_width = layer_background_get_xscale(bg_layer_id) * sprite_get_width(layer_background_get_sprite(bg_layer_id));
var bg_height = layer_background_get_yscale(bg_layer_id) * sprite_get_height(layer_background_get_sprite(bg_layer_id));


if(ratio_bg_to_cam_x != cam_width / bg_width)
{
	// resize if zoomed
	var x_scale = (cam_width * ratio_bg_to_cam_x) / sprite_get_width(layer_background_get_sprite(bg_layer_id));
	var y_scale = (cam_height * ratio_bg_to_cam_y) / sprite_get_height(layer_background_get_sprite(bg_layer_id));
	layer_background_xscale(bg_layer_id, x_scale);
	layer_background_yscale(bg_layer_id, y_scale);
	bg_width = layer_background_get_xscale(bg_layer_id) * sprite_get_width(layer_background_get_sprite(bg_layer_id));
	bg_height = layer_background_get_yscale(bg_layer_id) * sprite_get_height(layer_background_get_sprite(bg_layer_id));
}


var bg_moveable_x = room_width - bg_width;
var bg_moveable_y = room_height - bg_height;
layer_x("Background", bg_moveable_x * cam_percent_x);
layer_y("Background", bg_moveable_y * cam_percent_y);
// END -- Parallax Scrolling

// START -- Background resize check (when zooming in and out, maintain aspect ratio with camera)

// check current ratio against previously recorded one


// END -- Background resize check