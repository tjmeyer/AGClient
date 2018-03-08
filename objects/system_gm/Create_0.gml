/// @description Insert description here
// You can write your code in this editor

// START -- UI buttons data set
var buttonNum = 5;
// create a bottom layer of buttons
var buttonWidth = display_get_gui_width() / buttonNum;
var buttonHeight = display_get_gui_height() / 15;

buttons = array_create(buttonNum, array_create(4)); // 4: left, top, right, bottom
for(var i = 0; i < buttonNum; i++)
{
	buttons[i, 0] = buttonWidth * i; // left
	buttons[i, 1] = display_get_gui_height() - buttonHeight; // top
	buttons[i, 2] = buttonWidth * (i + 1); // right
	buttons[i, 3] = display_get_gui_height(); // bottom
}
// END -- UI buttons

