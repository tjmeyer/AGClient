/// @description Clear all selected textboxes then select when pressed
for(var i = 0; i < instance_number(obj_textbox); i++)
{
	var textbox = instance_find(obj_textbox, i);
	if(textbox != id)
	{
		textbox.is_selected = false;
	}
}
if(!is_selected)
{
	is_selected = true;
	audio_play_sound(snd_select, 0, false);	
	keyboard_string = current_text;
}
else
{
	is_selected = false;
	audio_play_sound(snd_deselect, 0, false);	
}