/// @description Insert description here
// You can write your code in this editor

audio_emitter_falloff(weapon_audio_emitter, 50, 1000, 1);
light = instance_create_layer(x, y, "Instances", obj_sun_light_emitter);
with(light)
{
	lz = 20;
	R = 0.0;
	G = 0.0;
	B = 0.0;
}