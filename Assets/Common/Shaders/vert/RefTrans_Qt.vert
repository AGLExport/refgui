#version 440

layout(std140, binding = 0) uniform buf {
    mat4 mvp;
    vec3 u_rgbFactor;
    float u_alphaFactor;
};
layout(location = 0) in vec4 vertexPosition;
layout(location = 1) in vec2 vertexTexCoord;
layout(location = 0) out vec2 v_texCoord;

void main()
{
    v_texCoord = vertexTexCoord;
    gl_Position = mvp * vertexPosition;
}
