/// @description handles all log-in associated requests with the server

// no other network event should be occuring on the client
if (async_load[? "type"] == network_type_data) 
{
	var buffer = async_load[? "buffer"];
	var json = buffer_read(buffer, buffer_string);
	var data = json_decode(json);
	var event = ds_map_find_value(data, "type");
	switch (event)
	{
	case LOGIN_REQUEST:
		loginMessage = ds_map_find_value(data, "message");
		if(loginMessage == "Login Successful")
		{
			global.logged_in = true;
		}
	break;
	case CONNECTION_CHECK:
		lastConnectionCheckTime = get_timer();
	break;
	}
}