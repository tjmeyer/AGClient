/// @description Insert description here
// You can write your code in this editor
postid = http_post_string("http://ares.gearhostpreview.com/sectors.php", "x="+string(x)+"&y="+string(y));
if(instance_exists(system_map_gm))
{
	var gm = instance_find(system_map_gm, 0);
}
else
{
	var gm = instance_create_layer(0,0, "Instances", system_map_gm);
}
sector_name = global.current_sector_name;
gm.sector_name = sector_name;
global.current_sector_name = "";