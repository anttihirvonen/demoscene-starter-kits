# Processing_01_Basics

This example teaches you how to:

- Draw resolution-independent 2D-graphics in Processing
- Play music with Minim
- Sync your visuals to music in code
- Implement simple controls for controlling your demo during development

Default keys:
- `spacebar` play/pause
- `left arrow` seek backwards
- `right arrow` seek forwards
- `enter` output current time to console

## About the coordinate system

By default, Processing uses the following coordinate system for drawing:
- Origo is at the top left corner of the screen
- X-axis goes from 0 to total width of the screen in pixels (e.g. 0 ... 1920 for Full HD)
- Y axis goes from 0 to total height of the screen in pixels (e.g. 0 ... 1080 for Full HD)

This coordinates system depends on the resolution, which causes problems. Therefore, in this example, the coordinate system is transformed so that it doesn't depend on the screen resolution – only aspect ratio matters.

`aspect ratio = screen width / screen height`

- Origo is at the center of the screen
- X-axis goes from `-aspect ratio` to `+aspect ratio`
- Y-axis goes always from -1 to 1, -1 being at the bottom 

(TODO: better documentation)
