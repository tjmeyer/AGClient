/// @description Insert description here
// You can write your code in this editor

if(has_mouse)
{
	isLocked = !isLocked;
	ini_open("profile.ini");
	ini_write_real("Preferences","drag_lock",isLocked);
	ini_close();
}