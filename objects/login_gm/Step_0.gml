/// @description Insert description here
// You can write your code in this editor


// run the background fade and rotating script
if(get_timer() - background_change_timer > 12000000) // current run time - last time it was changed > 12 sec
{
	var back_id = layer_background_get_id("Background");
	var fade_id = layer_background_get_id("FadeAway");
	layer_background_index(fade_id, layer_background_get_index(back_id));
	layer_background_alpha(fade_id, 1);
	layer_background_index(back_id, floor(random(sprite_get_number(sprt_backgrounds))));
	background_change_timer = get_timer();	
}
else
{
	var fade_id = layer_background_get_id("FadeAway");
	layer_background_alpha(fade_id, layer_background_get_alpha(fade_id) - .015);
}