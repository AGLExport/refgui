#version 440
layout(location = 0) out vec4 fragColor;
layout(binding = 1) uniform sampler2D src;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float angleBase;
    float angle;
};
layout(location = 0) in vec2 coord;
void main(){
    vec2 d=2.0*coord-vec2(1.0,1.0);
    float a=atan(d.x,-d.y);
    vec4 tex = texture(src, coord);
    fragColor = (angleBase<=a && a<=angle) ?  tex * qt_Opacity : tex * 0.0;
}
