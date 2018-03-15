/// @description Insert description here
// You can write your code in this editor

// update progress
var seconds = orbit_speed * 24 * 3600;
// get_timer() is in microseconds, but we're only accurate up to seconds
// therefore dividing by 1000000 to convert to seconds.
var secondsDiff = (get_timer() - update_time)/1000000; 
update_time = get_timer();

progress = progress + (secondsDiff / seconds);
while(progress > 1)
{
	progress -= 1;	
}