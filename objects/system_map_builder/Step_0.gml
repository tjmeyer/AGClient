/// @description Insert description here
// You can write your code in this editor
if(!isLoading && !isBgLoading)
{
	if(instance_exists(system_map_gm))
	{
		for(var i = 0; i < instance_number(system_map_gm); i++)
		{
			var gm_inst = instance_find(system_map_gm, i);
			instance_destroy(gm_inst);
		}
	}
	instance_create_layer(0,0, "Instances", system_map_gm);
	instance_destroy(id);
}