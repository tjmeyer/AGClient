varying vec2 v_texcoord;
varying vec4 v_color;
varying vec4 v_pos;



uniform sampler2D s_normalmap;
uniform float angle;

uniform float light_num;
uniform vec3 light_pos1;
uniform vec3 light_dif1;
uniform vec3 light_pos2;
uniform vec3 light_dif2;
uniform vec3 light_pos3;
uniform vec3 light_dif3;
uniform vec3 light_pos4;
uniform vec3 light_dif4;

void main()
{
//This is the Setup Section ----------------------------------------------------
//setup variables
vec2 pos = v_pos.xy;
vec2 resolution = vec2(512.0,512.0);
vec3 attenuation = vec3(0.5,5.0,20.0);
vec3 ambient_color = vec3(0.2,0.2,0.2);
vec3 sun_color = vec3(0.8, 0.8, 0.8);

//Per light variables
vec3 light = light_pos1;
vec3 light_color = light_dif1;

//sample the textures
vec4 t_color = texture2D(gm_BaseTexture,v_texcoord.xy);
vec3 n_color = texture2D(s_normalmap,v_texcoord.xy).xyz;
//Convert normals to correct range
vec3 normal = normalize(n_color * 2.0 - 1.0);

//THIS IS THE SUN SECTION-------------------------------------------------------

//Find the light vector
vec2 to_transform = vec2(100.0,100.0);
//Transform the light vector with the angle (cc and ss are cos/sin of the object and used repetedly)
float cc = cos(angle);
float ss = sin(angle);
to_transform = vec2(to_transform.x*cc-to_transform.y*ss,to_transform.x*ss+to_transform.y*cc);
//Normalize, take dot product
vec3 delta_pos = vec3(to_transform.xy,20.0);
vec3 light_dir = normalize(delta_pos);
float lambert = clamp(dot(normal,light_dir), 0.0, 1.0);
//Attenuation is unused in sun lighting but it initialises the variables
float d = sqrt(dot(delta_pos,delta_pos))/resolution.x;
float att = 1.0 / (attenuation.x+(attenuation.y*d)+(attenuation.z*d*d));
//Set the result
vec3 result = ambient_color + (sun_color.rgb * lambert);

//THIS IS THE LIGHT1 SECTION----------------------------------------------------

if (light_num >= 1.0)
{
//Easily visable light variables go here
light = light_pos1;
light_color = light_dif1;
//Find the light vector
to_transform = vec2(pos.xy-light.xy);
//Transform the light vector with the angle
to_transform = vec2(to_transform.x*cc-to_transform.y*ss,to_transform.x*ss+to_transform.y*cc);
//Normalize, take dot product
delta_pos = vec3(to_transform.xy, light.z);
light_dir = normalize(delta_pos);
lambert = clamp(dot(normal,light_dir), 0.0, 1.0);
//Attenuation from lights position
d = sqrt(dot(delta_pos,delta_pos))/resolution.x;
att = 1.0 / (attenuation.x+(attenuation.y*d)+(attenuation.z*d*d));
//Add the result to the sun light
result = result + (light_color.rgb * lambert * att);
}

//THIS IS THE LIGHT2 SECTION----------------------------------------------------

if (light_num >= 2.0)
{
//Easily visable light variables go here
light = light_pos2;
light_color = light_dif2;
//Find the light vector
to_transform = vec2(pos.xy-light.xy);
//Transform the light vector with the angle
to_transform = vec2(to_transform.x*cc-to_transform.y*ss,to_transform.x*ss+to_transform.y*cc);
//Normalize, take dot product
delta_pos = vec3(to_transform.xy, light.z);
light_dir = normalize(delta_pos);
lambert = clamp(dot(normal,light_dir), 0.0, 1.0);
//Attenuation from lights position
d = sqrt(dot(delta_pos,delta_pos))/resolution.x;
att = 1.0 / (attenuation.x+(attenuation.y*d)+(attenuation.z*d*d));
//Add the result to the sun light
result = result + (light_color.rgb * lambert * att);
}

//THIS IS THE LIGHT3 SECTION----------------------------------------------------

if (light_num >= 3.0)
{
//Easily visable light variables go here
light = light_pos3;
light_color = light_dif3;
//Find the light vector
to_transform = vec2(pos.xy-light.xy);
//Transform the light vector with the angle
to_transform = vec2(to_transform.x*cc-to_transform.y*ss,to_transform.x*ss+to_transform.y*cc);
//Normalize, take dot product
delta_pos = vec3(to_transform.xy, light.z);
light_dir = normalize(delta_pos);
lambert = clamp(dot(normal,light_dir), 0.0, 1.0);
//Attenuation from lights position
d = sqrt(dot(delta_pos,delta_pos))/resolution.x;
att = 1.0 / (attenuation.x+(attenuation.y*d)+(attenuation.z*d*d));
//Add the result to the sun light
result = result + (light_color.rgb * lambert * att);
}

//THIS IS THE LIGHT4 SECTION----------------------------------------------------

if (light_num >= 4.0)
{
//Easily visable light variables go here
light = light_pos4;
light_color = light_dif4;
//Find the light vector
to_transform = vec2(pos.xy-light.xy);
//Transform the light vector with the angle
to_transform = vec2(to_transform.x*cc-to_transform.y*ss,to_transform.x*ss+to_transform.y*cc);
//Normalize, take dot product
delta_pos = vec3(to_transform.xy, light.z);
light_dir = normalize(delta_pos);
lambert = clamp(dot(normal,light_dir), 0.0, 1.0);
//Attenuation from lights position
d = sqrt(dot(delta_pos,delta_pos))/resolution.x;
att = 1.0 / (attenuation.x+(attenuation.y*d)+(attenuation.z*d*d));
//Add the result to the sun light
result = result + (light_color.rgb * lambert * att);
}

//THIS IS THE FINAL ADDITION----------------------------------------------------

//Final color
result = result * t_color.rgb;
//Output
gl_FragColor = v_color * vec4(result,t_color.a);
}