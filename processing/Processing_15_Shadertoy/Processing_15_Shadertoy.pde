/*
 * Example of how to use Shadertoy
 * shaders in Processing.
 */
 
// Syncing with Rocket
import moonlander.library.*;

import ddf.minim.*;

// These control how big the opened window is.
// Before you release your demo, set these to 
// full HD resolution (1920x1080).
int CANVAS_WIDTH = 480;
int CANVAS_HEIGHT = 360;

Moonlander moonlander;

PShader shader;


void setup() {
  // Set up the drawing area size and renderer (P2D / P3D).
  size(CANVAS_WIDTH, CANVAS_HEIGHT, P2D);
  frameRate(60);

  // Load pixel shader from given file under data/
  shader = loadShader("plasma.glsl");
  // Set shadertoy uniforms
  shader.set("iResolution", (float)CANVAS_WIDTH, (float)CANVAS_HEIGHT);
  
  // If you use any of the other Shadertoy uniforms in your code
  // (except iGlobalTime, which is set in draw()),
  // you must set them here. Most useful are probably the texture
  // samplers (use like this):
  // shader.set("iChannel0", texture);
  
  // Init & start moonlander
  moonlander = Moonlander.initWithSoundtrack(this, "../common/tekno_127bpm.mp3", 127, 8);
  moonlander.start();
}


/*
 * Processing's drawing method
 */
void draw() {
  moonlander.update();
  
  shader(shader);
  
  // Update current time to shader
  // (and any custom uniforms)
  shader.set("iGlobalTime", (float)moonlander.getCurrentTime());
  shader.set("grid_rotation", (float)moonlander.getValue("grid_rotate"));
  shader.set("grid_resolution", (float)moonlander.getValue("grid_resolution"));
  shader.set("grid_distort", (float)moonlander.getValue("grid_distort"));

  // Draw full-screen effect
  rect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);
}
