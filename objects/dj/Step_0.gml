/// @description Insert description here
// You can write your code in this editor
if(room == rm_login && !audio_is_playing(introStream))
{
	audio_play_sound(introStream,0,true);
}
else if( room != rm_login && audio_is_playing(introStream))
{
	audio_stop_sound(introStream);	
}
