attribute vec3 in_Position;    // 顶点坐标（自动传入）
attribute vec4 in_Colour;     // 顶点颜色（自动传入）
attribute vec2 in_TextureCoord; // 纹理坐标（自动传入）

varying vec2 v_vTexcoord;     // 传递给片段着色器的纹理坐标
varying vec4 v_vColour;       // 传递给片段着色器的颜色

void main() {
    // 坐标变换：使用组合矩阵（兼容 GMS1.4）
    vec4 pos = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position.xy, 0.0, 1.0);
    gl_Position = pos;
    
    // 传递参数给片段着色器
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~// shd_circle_effect.frag
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_texture_size;  // 视图尺寸
uniform vec2 u_playerpos;     // 玩家屏幕坐标（像素单位）
uniform float u_radius;       // 光圈半径
uniform float u_outside_alpha;// 外围透明度（0=全透明，1=不透明）

void main() {
    // 获取原始颜色（包括alpha通道）
    vec4 base_color = texture2D(gm_BaseTexture, v_vTexcoord);
    
    // 转换为像素坐标（兼容浮点数计算）
    vec2 frag_pos = v_vTexcoord * u_texture_size;
    
    // 计算到玩家的距离（兼容浮点坐标）
    float dist = distance(frag_pos, u_playerpos);
    
    // 计算alpha渐变：中心不透明，外围透明
    float inner_alpha = 1.0 - smoothstep(0.0, u_radius, dist);
    float final_alpha = mix(u_outside_alpha, 1.0, inner_alpha);
    
    // 组合最终颜色（保留原始RGB，仅修改Alpha）
    gl_FragColor = vec4(base_color.rgb, base_color.a * final_alpha);
}
