/// @description Insert description here
// You can write your code in this editor
var u = instance_find(obj_username_field, 0).current_text;
var p = instance_find(obj_password_field, 0).password
ini_open("profile.ini");
ini_write_string("User", "0", u);
ini_write_string("User", "1", p);
ini_close();
global.username = u;

// attempt to connect to server if it isn't already
if(instance_exists(client_network) && os_is_network_connected())
{
	var network = global.NETWORK;
	
	// reset network if a disconnect occured.
	if(global.connection_status < 0)
	{
		logout();
		global.NETWORK = instance_create_depth(0, 0 ,0, client_network);
		network = global.NETWORK;
	}
	
	if(global.connection_status >= 0)
	{
		// create username and password buffer and send to server.
		send_buffer = buffer_create(256, buffer_grow, 1);
		buffer_seek(send_buffer, buffer_seek_start, 0);
		var buffer_map = ds_map_create();
		ds_map_add(buffer_map, "type", network.LOGIN_REQUEST);
		ds_map_add(buffer_map, "username", u);
		ds_map_add(buffer_map, "password", p);
		buffer_write(send_buffer, buffer_string, json_encode(buffer_map));
		network_send_raw(network.client, send_buffer, buffer_tell(send_buffer));
	}
}