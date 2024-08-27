#version 440

layout(std140, binding = 0) uniform buf {
    mat4 mvp;
    vec3 u_rgbFactor;
    float u_alphaFactor;
};
layout(binding = 1) uniform sampler2D u_Texture;

layout(location = 0) in vec2 v_texCoord;
layout(location = 0) out vec4 fragColor;

void main()
{
    fragColor = texture(u_Texture, v_texCoord) * vec4(u_rgbFactor, u_alphaFactor);
}
