#define WIN32_LEAN_AND_MEAN
#define WIN32_EXTRA_LEAN
#include <windows.h>
#include <GL/gl.h>
#include "glext.h"

// Run in windowed mode in debug but maximized in release.
#ifdef _DEBUG
#define XRES    1280
#define YRES    720
#define WINDOWFLAGS (WS_VISIBLE | WS_POPUP)
#else
#define XRES    0
#define YRES    0
#define WINDOWFLAGS (WS_VISIBLE | WS_POPUP | WS_MAXIMIZE)
#endif

const static char *fragmentShader = \
//"varying vec4 v;"
"void main()"
"{"
"vec2 v=-1.+gl_FragCoord.xy/vec2(640.,360.);"
// tunnel
"float r=pow(pow(abs(v.x),18.)+pow(abs(v.y),10.),1.8/28.);"
"vec2 t=vec2(gl_Color.x*64.+1./r,atan(v.x,v.y));"
// texture
"t=fract(2*t)-.5;"
"vec4 col=(1-pow(dot(t.xy,t.xy),.3))*vec4(2,1.8,1.6,0)+vec4(.3,.2,.1,0)+.12*vec4(v,0,0);"
// final color
"gl_FragColor=col/(2.*r);"
"}";

const static PIXELFORMATDESCRIPTOR pfd = { 0, 0, PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

static DEVMODE screenSettings = {
#if _MSC_VER < 1400
    { 0 }, 0, 0, 148, 0, 0x001c0000, { 0 }, 0, 0, 0, 0, 0, 0, 0, 0, 0, { 0 }, 0, 32, XRES, YRES, 0, 0,      // Visual C++ 6.0
#else
    { 0 }, 0, 0, 156, 0, 0x001c0000, { 0 }, 0, 0, 0, 0, 0, { 0 }, 0, 32, XRES, YRES, { 0 }, 0,           // Visual Studio 2005
#endif
#if(WINVER >= 0x0400)
    0, 0, 0, 0, 0, 0,
#if (WINVER >= 0x0500) || (_WIN32_WINNT >= 0x0400)
    0, 0
#endif
#endif
};

int entrypoint(void)
{
  //if (ChangeDisplaySettings(&screenSettings, CDS_FULLSCREEN) != DISP_CHANGE_SUCCESSFUL) return -1;
  ShowCursor(0);
  HDC hDC = GetDC(CreateWindowExA(WS_EX_APPWINDOW, "static", 0, WINDOWFLAGS, 0, 0, XRES, YRES, 0, 0, 0, 0));
  SetPixelFormat(hDC, ChoosePixelFormat(hDC, &pfd), &pfd);
  wglMakeCurrent(hDC, wglCreateContext(hDC));

  const int t = ((PFNGLCREATESHADERPROGRAMEXTPROC)wglGetProcAddress("glCreateShaderProgramEXT"))(GL_FRAGMENT_SHADER, fragmentShader);
  ((PFNGLUSEPROGRAMPROC)wglGetProcAddress("glUseProgram"))(t);
  do
  {
    static MSG dummyMessage;
    PeekMessageA(&dummyMessage, 0, 0, 0, 1); // Remove all Windows messages to prevent "Program not responding" dialog.
    glColor3us((unsigned short)GetTickCount(), 0, 0);
    glRects(-1, -1, 1, 1);
    SwapBuffers(hDC); //wglSwapLayerBuffers( hDC, WGL_SWAP_MAIN_PLANE );
  } while (!GetAsyncKeyState(VK_ESCAPE));
  ExitProcess(0);
  return 1;
}
