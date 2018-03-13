/// @description Insert description here
// You can write your code in this editor
global.connection_status = -1;
global.logged_in = false;
network_destroy(client);
room_goto(rm_login);