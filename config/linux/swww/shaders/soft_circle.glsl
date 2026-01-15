#version 330 core
in vec2 fragCoord;
out vec4 color;

uniform sampler2D from;
uniform sampler2D to;
uniform float progress;
uniform vec2 resolution;
uniform vec2 center;

void main() {
    vec2 uv = fragCoord / resolution;
    float dist = distance(uv, center);

    float radius = mix(-0.2, 1.2, progress);
    float edge = smoothstep(radius - 0.25, radius + 0.25, dist);

    vec4 fromCol = texture(from, uv);
    vec4 toCol = texture(to, uv);
    color = mix(toCol, fromCol, edge);
}
