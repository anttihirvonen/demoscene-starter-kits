/*
 * An example of how to use
 * Processing's 3D features.
 *
 * Features:
 * - Setting up a 3D viewport
 * - Drawing plane and sphere primitives
 * - 3D-transformations
 */
 
int CANVAS_WIDTH = 480;
int CANVAS_HEIGHT = 360;

void settings() {
  // The P3D parameter enables accelerated 3D rendering.
  size(CANVAS_WIDTH, CANVAS_HEIGHT, P3D);
}

void setup() {
  rectMode(CENTER);
}

void draw() {
  background(64, 64, 80);
  
  float secs = millis() / 1000.0;

  // Center the view
  translate(width/2, height/2, 0);
  // Move up and backwards - away from the origin
  translate(0, 200, -400);
  // Rotate the viewport a bit with mouse
  rotateY((mouseX - width/2) * 0.001);
  rotateX((mouseY - height/2) * -0.001);
  
  
  fill(255);
  
  
  // Draw the ground plane
  
  pushMatrix();
  // Rotate the plane by 90 degrees so it's laying on the ground 
  // instead of facing the camera. Try to use `secs` instead and 
  // see what happens :)
  rotateX(PI/2);
  scale(6.0);
  // Draw the plane
  rect(0, 0, 100, 100);
  popMatrix();


  fill(255, 255, 0);
  
  
  // Draw the bouncing ball
  
  pushMatrix();
  // Calculate the sphere trajectory
  float sphereY = abs(sin(secs*2.0)) * -400.0;
  float sphereRadius = 100;
  
  // Move the sphere up so it doesn't intersect with the plane
  translate(0, -sphereRadius);
  // Apply the bouncing motion trajectory
  translate(0, sphereY, 0);
  
  // Note that this rotation should be considered happening *before* the
  // translations specified above. The transformations are written in the reverse
  // order they are actually applied to the rendered object. Yes, it's confusing.
  rotateY(secs);
  
  // Draw the sphere
  sphere(sphereRadius);
  popMatrix();
}