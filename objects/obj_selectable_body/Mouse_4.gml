/// @description Insert description here
// You can write your code in this editor
var gm = instance_find(system_gm, 0);
if(isSelected)
{
	isSelected = false;
	gm.selected_instance = -1;
}
else
{
	for(var i = 0; i < instance_number(obj_selectable_body); i++)
	{
		var inst = instance_find(obj_selectable_body, i);
		inst.isSelected = false;
	}
	isSelected = true;
	gm.selected_instance = id;
}