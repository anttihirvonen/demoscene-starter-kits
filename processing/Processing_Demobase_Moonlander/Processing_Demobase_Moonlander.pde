/* 
 * Code for starting a demo project that
 * uses GNU Rocket and Moonlander for
 * syncing.
 *
 * You must install Moonlander as a library
 * into Processing before starting development.
 */
import moonlander.library.*;

// Minim is needed for the music playback
// (even when using Moonlander)
import ddf.minim.*;

// These control how big the opened window is.
// Before you release your demo, set these to 
// full HD resolution (1920x1080).
int CANVAS_WIDTH = 480;
int CANVAS_HEIGHT = 360;

// Our public Moonlander instance
Moonlander moonlander;

/*
 * settings() must be used when calling size with variable height and width
 * New in processing 3
 */
void settings() {
  // Set up the drawing area size and renderer (P2D / P3D).
  size(CANVAS_WIDTH, CANVAS_HEIGHT, P2D);
}

/*
 * Processing's setup method.
 *
 * Do all your one-time setup routines in here.
 */
void setup() {
  frameRate(60);

  // Parameters: 
  // - PApplet
  // - soundtrack filename (relative to sketch's folder)
  // - beats per minute in the song
  // - how many rows in Rocket correspond to one beat
  moonlander = Moonlander.initWithSoundtrack(this, "../common/tekno_127bpm.mp3", 127, 8);

  // Last thing in setup; start Moonlander. This either
  // connects to Rocket (development mode) or loads data 
  // from 'syncdata.rocket' (player mode).
  // Also, in player mode the music playback starts immediately.
  moonlander.start();
}


/*
 * Processing's drawing method
 */
void draw() {
  // Draw something
  // Get values from Rocket using 
  // moonlander.getValue("track_name") or
  // moonlander.getIntValue("track_name")
}

/*
 * No playback controls as in Processing_Demobase;
 * Rocket controls playing
 */