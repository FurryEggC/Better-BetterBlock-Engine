attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

void main() {
    vec4 object_space_pos = vec4(in_Position.xyz, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPosition = vec2(in_Position.xy);
}


//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec4 v_vColour;
varying vec2 v_vPosition;
varying vec2 v_vTexcoord;

uniform float u_time;

vec3 hsv2rgb(float h, float st, float v) {
    const vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 pt = abs(fract(vec3(h) + K.xyz) * 6.0 - K.www);
    return v * mix(K.xxx, clamp(pt - K.xxx, 0.0, 1.0), st);
}

void main() {
    float hue = 0.0;
    hue = mod((v_vPosition.x + v_vPosition.y)/3.0 + u_time, 256.0);

    vec3 hsv_color = hsv2rgb(hue / 255.0, 0.6, 1.0);
    gl_FragColor = vec4(hsv_color, texture2D(gm_BaseTexture, v_vTexcoord).a) * v_vColour;
}


