/// @description Insert description here
// You can write your code in this editor
loginButton = instance_create_layer(0,0,"UI", obj_gui_login_button);
with(loginButton)
{
	bg_color = c_black;
	text_color = c_white;
	alpha = .7;
	mouse_over_alpha = 1;
	border_enabled = true;
	border_color = c_black;
	border_alpha = .7;
	button_width = 200;
	button_height = 40;
	text = "Login";
	text_valign = fa_center;
	text_halign = fa_center;
	text_font = fnt_monospace_14;
	gui_x = display_get_gui_width() / 2 - button_width - 10;
	gui_y = display_get_gui_height() / 3 * 2;
}

registerButton = instance_create_layer(0,0, "UI", obj_gui_register_button);
with(registerButton)
{
	bg_color = c_black;
	text_color = c_white;
	alpha = .7;
	mouse_over_alpha = 1;
	border_enabled = true;
	border_color = c_black;
	border_alpha = .7;
	button_width = 200;
	button_height = 40;
	text = "Register";
	text_valign = fa_center;
	text_halign = fa_center;
	text_font = fnt_monospace_14;
	gui_x = display_get_gui_width() / 2 + 10;
	gui_y = display_get_gui_height() / 3 * 2;
}

quitButton = instance_create_layer(0,0, "UI", obj_gui_quit_button);
with(quitButton)
{
	bg_color = c_black;
	text_color = c_white;
	alpha = .5;
	mouse_over_alpha = 1;
	border_enabled = true;
	border_color = c_black;
	border_alpha = .7;
	button_width = 150;
	button_height = 40;
	text = "Quit";
	text_valign = fa_center;
	text_halign = fa_center;
	text_font = fnt_monospace_14;
	gui_x = 5;
	gui_y = 5;
}