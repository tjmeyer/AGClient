/// @description !!!MUST HAVE AN INSTANCE ASSIGNED AFTER CREATION!!!
if(instance_exists(selected_instance))
{
	if(selected_instance.isTargeting)
	{
		bg_color = while_on_bg_color;
		alpha = while_on_alpha;	
	}
	else
	{
		bg_color = original_bg_color;
		alpha = original_alpha;
	}
	
	if(!selected_instance.isSelected)
	{
		instance_destroy(id);
	}
}