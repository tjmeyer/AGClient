/// @description handles all log-in associated requests with the server

// no other network event should be occuring on the client
if (async_load[? "type"] == network_type_data) 
{
	var buffer = async_load[? "buffer"];
	buffer_seek(buffer, buffer_seek_start, 0);
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
			global.user_id = data[? "user_id"];
			
			// request authenticated user's home system id
			// once we have the system's id, we can set it
			// to global and safely move to rm_system
			buffer = buffer_create(256, buffer_grow, 1);
			buffer_seek(buffer, buffer_seek_start, 0);
			data = ds_map_create();
			ds_map_add(data, "type", GET_USER_SYSTEM_ID);
			ds_map_add(data, "user_id", string(global.user_id));
			buffer_write(buffer, buffer_string, json_encode(data));
			network_send_raw(client, buffer, buffer_tell(buffer));
		}
		break;
	case CONNECTION_CHECK:
		lastConnectionCheckTime = get_timer();
		break;
	case REGISTRATION_REQUEST:
		var success = data[? "username"];
		if(success)
		{
			loginMessage = "Registration Successful.\nLogin to continue.";
			global.logged_in = true;
			global.user_id = data[? "user_id"];
			global.user_system_id = data[? "system_id"];
			global.user_sector_id = data[? "sector_id"];
			login();
		}
		else
		{
			loginMessage = "That username is already taken.";
		}
		break;
	case GET_USER_SYSTEM_ID:
		if(ds_map_exists(data, "system_id") &&
			ds_map_exists(data, "sector_id"))
		{
			global.user_system_id = data[? "system_id"];
			global.user_sector_id = data[? "sector_id"];
			to_home_system();
		}
		break;
	}
}