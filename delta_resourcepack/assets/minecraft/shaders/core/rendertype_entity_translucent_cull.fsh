#version 150

#moj_import <fog.glsl>
#moj_import <emissive_utils.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 origVertexColor;
in vec4 lightColor;
in vec4 maxLightColor;
in vec2 texCoord0;
in vec2 texCoord1;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * ColorModulator;
    float alpha = textureLod(Sampler0, texCoord0, 0.0).a * 255.0;
    // discards minecraft lighting with desired opacity
    if (!check_alpha(alpha, 250.0)) {
        color *= vertexColor;
    } else {
        color *= origVertexColor;
    }
    // color *= vertexColor;
    color = make_emissive(color, lightColor, maxLightColor, vertexDistance, alpha);
    color.a = remap_alpha(alpha) / 255.0;
    if (color.a < 0.1) {
        discard;
    }
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}