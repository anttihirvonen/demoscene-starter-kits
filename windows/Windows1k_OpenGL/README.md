# Windows1k_OpenGL

This example shows you how to :
* Open a window using WinAPI
* Create an OpenGL context to the opened window
* Draw a single screen shader effect
* Compress the executable with [Crinkler](http://crinkler.net/)

## Instructions
You need Visual Studio 2013 to compile this project. You can download the fully functional [Express version][vs2013] for free.

1. Download the example VS2013 project and source files. 
2. [Download Crinkler][crinkler_download] and extract `crinkler.exe` to the solution directory, next to `1kogl.sln`
3. Rename `crinkler.exe` to `link.exe`

Now you can open and compile `1kogl.sln` with Visual Studio. 

### Compression
When compiling in Release-mode, the linker is invoked with the `/CRINKLER` command line parameter that enables the compression. With the default settings and Crinkler 1.4 the example should compile to a 816 byte executable.

### Compilation settings
The example project is tweaked to work reasonably well, but you should check the Crinkler manual for advanced size optimization tips.

### Credits
Original [isystem][isystem] code by iq. Modifications done by fazias and cce.

[vs2013]: http://www.visualstudio.com/downloads/download-visual-studio-vs#d-express-windows-desktop
[crinkler_download]: http://crinkler.net/crinkler14.zip
[isystem]: http://www.iquilezles.org/www/material/isystem1k4k/isystem1k4k.htm
