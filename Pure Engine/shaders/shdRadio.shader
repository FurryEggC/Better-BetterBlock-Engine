//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~// Let's make some TV Noise

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float alpha;

float Noise21 (vec2 p, float ta, float tb) {
    return fract(sin(p.x*ta+p.y*tb)*5678.);
}

void main()
{
    vec2 uv = v_vTexcoord.xy;

    float t = time+123.; // tweak the start moment
    float ta = t*.654321;
    float tb = t*(ta*.123456);
    
    float c = Noise21(uv, ta, tb);
    vec3 col = vec3(c);

    gl_FragColor = vec4(col, alpha);
}

