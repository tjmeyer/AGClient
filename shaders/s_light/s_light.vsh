//
// Simple passthrough vertex shader
//
attribute vec3 in_Position; // (x,y,z)
attribute vec4 in_Colour; // (r,g,b,a)
attribute vec2 in_TextureCoord; // (u,v)



varying vec2 v_texcoord;
varying vec4 v_color;
varying vec4 v_pos;

uniform sampler2D s_normalmap;

void main()
{
vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

//pass colour, texture coords and fragment position in the world
v_color = in_Colour;
v_texcoord = in_TextureCoord;
v_pos = gm_Matrices[MATRIX_WORLD] * object_space_pos;
}