#version 450
#extension GL_EXT_scalar_block_layout : enable

layout(location=0) in vec2 inPos;
layout(location=1) in vec2 inUV;
layout(location=0) out vec2 outUV;

layout(scalar, push_constant) uniform Push {
    mat4 mvp;
    vec4 color;
    float pxRange;
} push;

void main() {
    gl_Position = push.mvp * vec4(inPos, 0.0, 1.0);
    outUV = inUV;
}
