/// @description Check network connection to server at an interval
// Connection check failures return the user to login screen

if(global.connection_status >= 0)
{
	// send stay alive packet every pingInterval
	if(get_timer() - lastConnectionCheckTime > checkConnectionInterval)
	{
		var buffer = buffer_create(1024, buffer_grow, 1);
		buffer_seek(buffer, buffer_seek_start, 0);
		var buffer_map = ds_map_create();
		ds_map_add(buffer_map, "type", CONNECTION_CHECK);
		var send = json_encode(buffer_map);
		buffer_write(buffer, buffer_string, send);
		network_send_raw(client, buffer, buffer_tell(buffer));
	}
	
	// timeout occurs
	if(get_timer() - lastConnectionCheckTime > connectionTimeOut)
	{
		global.connection_status = -1;
	}
	
	if(global.connection_status < 0)
	{
		global.logged_in = false;
		loginMessage = "Connection Timeout";
		id.persistent = false;
		if(room == rm_login)
		{
			room_restart();
		}
		else
		{
			room_goto(rm_login);
		}
	}
}