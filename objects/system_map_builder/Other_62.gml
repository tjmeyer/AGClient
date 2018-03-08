/// @description Insert description here
// You can write your code in this editor
var response = "null";

var key = async_load[? "id"];

// check post id for this object to make sure we're getting the correct call-back
if(key == postid)
{
	// successful http request made, this means it has a response to use
	if(async_load[? "status"] == 0)
	{
		loadingText = "Data Retrieval Successful";
		response = json_decode(async_load[? "result"]);
		system_list = ds_map_find_value(response, "default");
		if(system_list > -1)
		{
			loadingText = "Building Sector Map";
			for(var i = 0; i < ds_list_size(system_list); i++)
			{
				var object_map = system_list[| i];
				var system = instance_create_layer(int64(object_map[? "x"]),
													int64(object_map[? "y"]),
													"Instances",
													obj_system);
				if(!is_undefined(ds_map_find_value(object_map, "name")))
				{
					system.name = string(object_map[? "name"]);
				}
			}
			isLoading = false;
		}
	}
	else
	{
		loadingText = "Failed to retrieve system data";
		if(ds_map_exists(async_load, "http_status"))
		{
			loadingText += ": HTTP ERROR " + string(async_load[? "http_status"]);
		}
	}
}