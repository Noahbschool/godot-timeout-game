shader_type canvas_item;

void fragment() {
    float t = UV.y; // 0 at top, 1 at bottom

    vec4 top_color = vec4(0.4, 1.0, 0.8, 1.0);    // cyan/green
    vec4 middle_color = vec4(0.6, 0.4, 1.0, 1.0); // purple
    vec4 bottom_color = vec4(1.0, 0.0, 0.0, 1.0); // red

    vec4 color;

    if (t < 0.3) {
        // top → middle
        float local_t = t / 0.3; // remap 0–0.3 to 0–1
        color = mix(top_color, middle_color, local_t);
    } else {
        // middle → bottom
        float local_t = (t - 0.3) / (1.0 - 0.3); // remap 0.3–1 to 0–1
        color = mix(middle_color, bottom_color, local_t);
    }

    COLOR = color;
}
