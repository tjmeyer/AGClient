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
		sector_list = ds_map_find_value(response, "default");
		if(sector_list > -1)
		{
			loadingText = "Building Sector Map";
			for(var i = 0; i < ds_list_size(sector_list); i++)
			{
				var coordinate_map = sector_list[| i];
				instance_create_layer(int64(coordinate_map[? "x"]),
										int64(coordinate_map[? "y"]),
										"Instances",
										obj_sector);
				
			}
			isLoading = false;
		}
	}
	else
	{
		loadingText = "Failed to retrieve sector data";
		if(ds_map_exists(async_load, "http_status"))
		{
			loadingText += ": HTTP ERROR " + string(async_load[? "http_status"]);
		}
	}
}