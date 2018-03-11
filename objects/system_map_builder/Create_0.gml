/// @description Creates the http_post request and sets the background image
postid = http_post_string("http://ares.gearhostpreview.com/sectors.php", "id="+global.current_sector_db_id);
layer_background_index(layer_background_get_id("Background"), int64(global.current_sector_bg_index));

if(instance_exists(system_map_gm))
{
	var gm = instance_find(system_map_gm, 0);
}
else
{
	var gm = instance_create_layer(0,0, "Instances", system_map_gm);
}