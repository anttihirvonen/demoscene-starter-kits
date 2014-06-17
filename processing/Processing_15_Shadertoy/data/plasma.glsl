// All Shadertoy uniforms you use must be defined
// here.
uniform float iGlobalTime;
uniform vec2 iResolution;

// You can also use custom uniforms
// to pass any data to shader, 
// eg. values from Rocket.
uniform float grid_rotation;
uniform float grid_resolution;

vec2 rotate(vec2 v, float a) {
    return vec2(v.x*cos(a) + v.y*sin(a), -v.x*sin(a) + v.y*cos(a));
}

void main(void) {
    // Use iResolution to convert gl_FragCoord
    // to resolution-independent coordinates
    float aspect_ratio = iResolution.x / iResolution.y;

    // coord.x: -aspect_ratio ... aspect_ratio
    // coord.y: -1 ... 1
    vec2 coord = (2.* gl_FragCoord.xy / iResolution - 1.) * vec2(aspect_ratio, 1.);

    coord *= grid_resolution;
    coord = rotate(coord, grid_rotation);

    float grid_factor = sin(coord.x*10.) * cos(coord.y*10.);

    vec3 color = mix(vec3(1., 0.6, 0.7), vec3(.2, 0.1, 0.1), (1.+grid_factor)*0.5);

    gl_FragColor = vec4(color, 1.0);
}
