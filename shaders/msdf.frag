#version 450
#extension GL_EXT_scalar_block_layout : enable

layout(location=0) in vec2 inUV;
layout(location=0) out vec4 outColor;

layout(set=0, binding=0) uniform sampler2D texFont;

layout(scalar, push_constant) uniform Push {
    mat4 mvp;
    vec4 color;
    float pxRange;
} push;

float median(vec3 v) { return max(min(v.r, v.g), min(max(v.r, v.g), v.b)); }

float screenPxRange() {
    vec2 unitRange = vec2(push.pxRange) / vec2(textureSize(texFont, 0));
    vec2 screenTexSize = vec2(1.0) / fwidth(inUV);
    return max(0.5 * dot(unitRange, screenTexSize), 1.0);
}

void main() {
    vec3 msdf = texture(texFont, inUV).rgb;
    float sd = median(msdf) - 0.5;
    float pxDist = screenPxRange() * sd;
    float opacity = clamp(pxDist + 0.5, 0.0, 1.0);
    outColor = vec4(push.color.rgb, push.color.a * opacity);
}
