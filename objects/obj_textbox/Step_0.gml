/// @description Capture current text when selected
if(is_selected)
{
	if(keyboard_lastkey != -1)
	{
		current_text = keyboard_string;
	}
}