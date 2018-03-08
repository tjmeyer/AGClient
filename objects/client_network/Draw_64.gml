/// @description Insert description here
// You can write your code in this editor


if(get_timer() - lastConnectionCheckTime > connectionTimeOut - 4000000 &&
	global.connection_status >= 0)
{
	var countdown = 4000000 - ((get_timer() - lastConnectionCheckTime) - (connectionTimeOut - 4000000));
	draw_set_color(c_red);
	draw_set_alpha(1);
	draw_set_font(fnt_monospace_14);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(room_width / 2, room_height / 2, "Connection timeout in:\n" + string(countdown / 1000000) + " seconds");
}