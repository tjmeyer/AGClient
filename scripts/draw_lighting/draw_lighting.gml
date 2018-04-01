if(Light=1)
{
//draw_dynamic_light(Diffuse_Texture,Normal_Texture,Angle_of_Sprite)
//Get Variables from the Shader
//Get Variables for the object to be drawn
sampler = shader_get_sampler_index(s_light, "s_normalmap")
bg = sprite_get_texture(argument0,1);
var hold = argument1;
angle = shader_get_uniform(s_light,"angle");
//Get Variables for the lights
light_num = shader_get_uniform(s_light,"light_num");
light_pos1 = shader_get_uniform(s_light,"light_pos1");
light_dif1 = shader_get_uniform(s_light,"light_dif1");
light_pos2 = shader_get_uniform(s_light,"light_pos2");
light_dif2 = shader_get_uniform(s_light,"light_dif2");
light_pos3 = shader_get_uniform(s_light,"light_pos3");
light_dif3 = shader_get_uniform(s_light,"light_dif3");
light_pos4 = shader_get_uniform(s_light,"light_pos4");
light_dif4 = shader_get_uniform(s_light,"light_dif4");

//Set which shader to use
shader_set(s_light);
//Set object variables
texture_set_stage(sampler,bg);
shader_set_uniform_f(angle,degtorad(argument2));
//Number of lights
shader_set_uniform_f(light_num,light_number);
//Light 1
if (light_number >= 1)
{
shader_set_uniform_f(light_pos1,ID1.x,ID1.y,ID1.lz);
shader_set_uniform_f(light_dif1,ID1.R,ID1.G,ID1.B);
}
//Light 2
if (light_number >= 2)
{
shader_set_uniform_f(light_pos2,ID2.x,ID2.y,ID2.lz);
shader_set_uniform_f(light_dif2,ID2.R,ID2.G,ID2.B);
}
//Light 3
if (light_number >= 3)
{
shader_set_uniform_f(light_pos3,ID3.x,ID3.y,ID3.lz);
shader_set_uniform_f(light_dif3,ID3.R,ID3.G,ID3.B);
}
//Light 4
if (light_number >= 4)
{
shader_set_uniform_f(light_pos4,ID4.x,ID4.y,ID4.lz);
shader_set_uniform_f(light_dif4,ID4.R,ID4.G,ID4.B);
}
//Draw the sprite
draw_sprite_ext(argument0,0,x,y,argument3,argument4,image_angle,image_blend,image_alpha)
shader_reset();
}
else
{
draw_sprite_ext(argument0,0,x,y,argument3,argument4,image_angle,image_blend,image_alpha)
}