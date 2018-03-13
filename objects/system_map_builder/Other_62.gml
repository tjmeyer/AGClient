/// @description Retrieves data from Web Service to draw system locations. 
// Saves critical information like db ids for the systems in each object for when they're clicked later.
var response = "null";

var key = async_load[? "id"];

if(key == postbg)
{
	if(async_load[? "status"] == 0)
	{
		loadingText = "Retrieving Background Information";
		response = json_decode(async_load[? "result"]);
		var tempList = response[? "default"]; // get single item list
		if(tempList > -1) // valid list
		{
			var image_map = tempList[| 0];
			layer_background_index(layer_background_get_id("Background"), int64(image_map[? "image_index"]));
			isBgLoading = false;
		}
	}
}

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
				system.db_id = object_map[? "id"];
				system.bg_index = object_map[? "image_index"];
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