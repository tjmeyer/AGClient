/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(.7);
draw_set_color(c_white);
draw_set_font(fnt_calibri_12);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

var message = "";
if(global.connection_status < 0)
{
	message = "Not Connected to Ares Gate Server";
}
else
{
	message = "Successfully connected to Ares Gate Server";
}

if(!os_is_network_connected())
{
	message += "\nIt appears you are not connected to the internet.";	
}

draw_text(0, room_height, message);

draw_set_halign(fa_right);
draw_text(room_width, room_height, global.NETWORK.loginMessage);