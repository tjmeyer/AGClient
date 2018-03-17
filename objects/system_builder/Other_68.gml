/// @description Handles the server response to build the requested system

// special "type" to reference a GML item
if (async_load[? "type"] == network_type_data) 
{
	var buffer = async_load[? "buffer"];
	buffer_seek(buffer, buffer_seek_start, 0);
	var json = buffer_read(buffer, buffer_string);
	var data_map = json_decode(json);
	var event = ds_map_find_value(data_map, "type");
	if(event == global.NETWORK.SYSTEM_REQUEST)
	{
		if(ds_map_exists(data_map, "message") &&
			data_map[? "message"] == "success")
		{
			// set background
			if(ds_map_exists(data_map, "image_index"))
			{
				layer_background_index(layer_background_get_id("Background"), int64(data_map[? "image_index"]));
			}
			
			// get star and build it
			if(ds_map_exists(data_map, "obj_star"))
			{
				show_debug_message("Building star:");
				var star = data_map[? "obj_star"];
				var star_inst = instance_create_layer(room_width / 2,
														room_height / 2,
														"Instances",
														obj_sun);
				star_inst.anomaly = int64(star[? "anomaly"]);
				show_debug_message("\tAnomaly: " + string(star_inst.anomaly));
				star_inst.radius = real(star[? "radius"]);
				show_debug_message("\tRadius: " + string(star_inst.radius));
				if(ds_map_exists(star, "id"))
				{
					star_inst.db_id = int64(star[? "id"]);
					show_debug_message("\tDB_ID: " + string(star_inst.db_id));
				}
				else
				{
					show_debug_message("ERROR: No db_id found for star!!!");
				}
				if(ds_map_exists(star, "type"))
				{
					star_inst.type = string(star[? "type"]);
					show_debug_message("\tType: " + string(star_inst.type));
				}
				else
				{
					show_debug_message("ERROR: No type found for star!!!");
				}
			}
			
			// build planets
			if(ds_map_exists(data_map, "array_planet"))
			{
				var planetArray = data_map[? "array_planet"];
				for(var i = 0; i < ds_list_size(planetArray); i++)
				{
					var planetObj = planetArray[| i];
					var planet_inst = instance_create_layer(0,0, "Instances", obj_planet);
					planet_inst.progress = real(planetObj[? "progress"]);
					planet_inst.name = planetObj[? "name"];
					planet_inst.db_id = int64(planetObj[? "id"]);
					planet_inst.level = int64(planetObj[? "level"]);
					planet_inst.distance = real(planetObj[? "distance"]);
					planet_inst.radius = real(planetObj[? "radius"]);
					planet_inst.orbit_speed = real(planetObj[? "speed"]);
					var type = planetObj[? "type"];
					
					// set x any y coordinates based on parametric equation of a circle: x = r cos(t), y = r sin(t)
					planet_inst.orbit_radius = planet_inst.distance * 300; // 300 pixels / 1 AU ?
					var angle = planet_inst.progress * 2 * pi;
					planet_inst.x = planet_inst.orbit_radius * cos(angle) + room_width / 2;
					planet_inst.y = planet_inst.orbit_radius * sin(angle) + room_height / 2;
					
					// To Do: make the type actually work correctly
					if(string_length(type) > 0) // at least one char
					{
						var char1 = int64(string_char_at(type, 1)); // this function starts at 1, not 0
						switch (char1)
						{
							// gas planet
							case 1:
								planet_inst.sprite_index = sprt_planets_gas_1000x1000;
							break;
							// barren planet
							case 2:
								planet_inst.sprite_index = sprt_planets_rock_1000x1000;
							break;
							// temperate planet
							case 3:
								planet_inst.sprite_index = sprt_planets_temperate_1000x1000;
							break;
							default:
								planet_inst.sprite_index = sprt_planets_rock_1000x1000;
							break;
						}
						planet_inst.image_index = planetObj[? "image_index"];
						// 0.04 of 1000px = 40px size base. why not! 3959 miles is earth's radius. Using that as a ratio
						// assuming earth would be 40x40px in the game
						planet_inst.image_xscale = 0.04 * (planet_inst.radius / 3959);
						planet_inst.image_yscale = 0.04 * (planet_inst.radius / 3959);
						planet_inst.image_angle = angle * (180/pi) + 90;
					}
				}
			}
		}
		isLoading = false;
		if(instance_exists(system_gm))
		{
			// clear our all system_gm's if they exists. They
			// should not runt their create event until 
			// the builder has finished loading.
			for(var i = 0; i < instance_number(system_gm); i++)
			{
				instance_destroy(instance_find(system_gm, i));	
			}
		}
		instance_create_layer(0,0, "Instances", system_gm);	
	}
}