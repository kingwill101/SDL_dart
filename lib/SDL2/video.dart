import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'SDLWindow.dart';
import 'ffi.dart' show dlib;

enum SDL_BlendMode {
  SDL_ScaleModeNearest,
  SDL_ScaleModeLinear,
  SDL_ScaleModeBest
}

class SDL_DisplayMode extends Struct {
  @Uint32()
  int format;
  @Int32()
  int w;
  @Int32()
  int h;
  @Int32()
  int refresh_rate;
  Pointer<Void> driverdata;
}

class SDL_MessageBoxButtonData extends Struct {
  @Uint32()
  int flags;
  @Int32()
  int buttonid;
  Pointer<Utf8> text;
}

class SDL_MessageBoxColor extends Struct {
  @Uint8()
  int r;
  @Uint8()
  int g;
  @Uint8()
  int b;
}

class SDL_MessageBoxColorScheme extends Struct {
  Pointer<SDL_MessageBoxColor> colors;
}

class SDL_MessageBoxData extends Struct {
  @Uint32()
  int flags;
  Pointer<SDL_Window> window;
  Pointer<Utf8> title;
  Pointer<Utf8> message;
  @Int32()
  int numbuttons;
  Pointer<SDL_MessageBoxButtonData> buttons;
  Pointer<SDL_MessageBoxColorScheme> colorScheme;
}

class SDL_Renderer extends Struct {}

class SDL_Texture extends Struct {
  Pointer<Void> magic;

  @Uint32()
  int format;

  @Int32()
  int access;

  @Int32()
  int w;

  @Int32()
  int h;

  @Int32()
  int modMode;
  @Int32()
  int blendMode;
  @Int32()
  int scaleMode;
}

//SDL_Surface * SDL_GetWindowSurface(SDL_Window * window);
typedef _SDL_GetWindowSurface_c = Pointer<SDL_Surface> Function(
    Pointer<SDL_Window>);
typedef _SDL_GetWindowSurface_Dart = Pointer<SDL_Surface> Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowSurface =
    dlib.lookupFunction<_SDL_GetWindowSurface_c, _SDL_GetWindowSurface_Dart>(
        'SDL_GetWindowSurface');

//void SDLCALL SDL_FreeSurface(SDL_Surface * surface);
typedef _SDL_FreeSurface_c = Void Function(Pointer<SDL_Surface>);
typedef _SDL_FreeSurface_Dart = void Function(Pointer<SDL_Surface> surface);

final SDL_FreeSurface =
    dlib.lookupFunction<_SDL_FreeSurface_c, _SDL_FreeSurface_Dart>(
        'SDL_FreeSurface');

//int SDL_UpdateWindowSurface(SDL_Window * window);
typedef _SDL_UpdateWindowSurface_c = Uint32 Function(Pointer<SDL_Window>);
typedef _SDL_UpdateWindowSurface_Dart = int Function(
    Pointer<SDL_Window> window);

final SDL_UpdateWindowSurface = dlib.lookupFunction<_SDL_UpdateWindowSurface_c,
    _SDL_UpdateWindowSurface_Dart>('SDL_UpdateWindowSurface');

//SDL_Texture* _SDL_CreateTexture(SDL_Renderer* renderer,Uint32 format,int access, int w,int h)
typedef _SDL_CreateTexture_c = Pointer<SDL_Texture> Function(
    Pointer<SDL_Renderer>, Uint32 format, Int32 access, Int32 w, Int32 h);
typedef _SDL_CreateTexture_Dart = Pointer<SDL_Texture> Function(
    Pointer<SDL_Renderer>, int format, int access, int w, int h);

final _SDL_CreateTexture =
    dlib.lookupFunction<_SDL_CreateTexture_c, _SDL_CreateTexture_Dart>(
        '_SDL_CreateTexture');

//_SDL_CreateWindow(const char *title,int x, int y, int w, int h, Uint32 flags);
typedef _SDL_CreateWindow_c = Pointer<SDL_Window> Function(
    Pointer<Utf8> title, Int32 x, Int32 y, Int32 w, Int32 h, Uint32 flags);
typedef _SDL_CreateWindow_Dart = Pointer<SDL_Window> Function(
    Pointer<Utf8> title, int x, int y, int w, int h, int flags);

final _SDL_CreateWindow =
    dlib.lookupFunction<_SDL_CreateWindow_c, _SDL_CreateWindow_Dart>(
        '_SDL_CreateWindow');

//int _SDL_CreateWindowAndRenderer(int width, int height,Uint32 window_flags,SDL_Window** window, SDL_Renderer** renderer)
typedef _SDL_CreateWindowAndRenderer_c = Uint32 Function(Uint32, Uint32, Uint32,
    Pointer<Pointer<SDL_Window>>, Pointer<Pointer<SDL_Renderer>>);
typedef _SDL_CreateWindowAndRenderer_Dart = int Function(int, int, int,
    Pointer<Pointer<SDL_Window>>, Pointer<Pointer<SDL_Renderer>>);

final _SDL_CreateWindowAndRenderer = dlib.lookupFunction<
    _SDL_CreateWindowAndRenderer_c,
    _SDL_CreateWindowAndRenderer_Dart>('_SDL_CreateWindowAndRenderer');

//int SDL_UpdateWindowSurface(SDL_Window * window);
typedef _SDL_DestroyWindow_c = Void Function(Pointer<SDL_Window>);
typedef _SDL_DestroyWindow_Dart = void Function(Pointer<SDL_Window> window);

final SDL_DestroyWindow =
    dlib.lookupFunction<_SDL_DestroyWindow_c, _SDL_DestroyWindow_Dart>(
        'SDL_DestroyWindow');

//SDL_Window* _SDL_CreateWindowFrom(const void* data)
typedef _SDL_CreateWindowFrom_c = Pointer<SDL_Window> Function(Pointer<Utf8>);
typedef _SDL_CreateWindowFrom_Dart = Pointer<SDL_Window> Function(
    Pointer<Utf8>);

final _SDL_CreateWindowFrom =
    dlib.lookupFunction<_SDL_CreateWindowFrom_c, _SDL_CreateWindowFrom_Dart>(
        '_SDL_CreateWindowFrom');

//void SDL_DisableScreenSaver(void)
typedef _SDL_DisableScreenSaver_c = Void Function();
typedef _SDL_DisableScreenSaver_Dart = void Function();

final SDL_DisableScreenSaver = dlib.lookupFunction<_SDL_DisableScreenSaver_c,
    _SDL_DisableScreenSaver_Dart>('SDL_DisableScreenSaver');

//void SDL_EnableScreenSaver(void)
typedef _SDL_EnableScreenSaver_c = Void Function();
typedef _SDL_EnableScreenSaver_Dart = void Function();

final SDL_EnableScreenSaver = dlib.lookupFunction<_SDL_DisableScreenSaver_c,
    _SDL_DisableScreenSaver_Dart>('SDL_EnableScreenSaver');

//SDL_DisplayMode* SDL_GetClosestDisplayMode(int displayIndex, const SDL_DisplayMode* mode, SDL_DisplayMode*  closest)
typedef _SDL_GetClosestDisplayMode_c = Pointer<SDL_DisplayMode> Function(
    Int32 displayIndex,
    Pointer<SDL_DisplayMode> mode,
    Pointer<SDL_DisplayMode> closest);
typedef _SDL_GetClosestDisplayMode_Dart = Pointer<SDL_DisplayMode> Function(
    int displayIndex,
    Pointer<SDL_DisplayMode> mode,
    Pointer<SDL_DisplayMode> closest);

final SDL_GetClosestDisplayMode = dlib.lookupFunction<
    _SDL_GetClosestDisplayMode_c,
    _SDL_GetClosestDisplayMode_Dart>("SDL_GetClosestDisplayMode");

//int SDL_GetCurrentDisplayMode(int displayIndex, SDL_DisplayMode* mode)
typedef _SDL_GetCurrentDisplayMode_c = Int32 Function(
    Int32, Pointer<SDL_DisplayMode>);
typedef _SDL_GetCurrentDisplayMode_Dart = int Function(
    int, Pointer<SDL_DisplayMode>);

final SDL_GetCurrentDisplayMode = dlib.lookupFunction<
    _SDL_GetCurrentDisplayMode_c,
    _SDL_GetCurrentDisplayMode_Dart>("SDL_GetCurrentDisplayMode");

//const char* SDL_GetCurrentVideoDriver(void)
typedef _SDL_GetCurrentVideoDriver_c = Pointer<Utf8> Function();
typedef _SDL_GetCurrentVideoDriver_Dart = Pointer<Utf8> Function();

final SDL_GetCurrentVideoDriver = dlib.lookupFunction<
    _SDL_GetCurrentVideoDriver_c,
    _SDL_GetCurrentVideoDriver_Dart>("SDL_GetCurrentVideoDriver");

//int SDL_GetDesktopDisplayMode(int  displayIndex, SDL_DisplayMode* mode)
typedef _SDL_GetDesktopDisplayMode_c = Int32 Function(
    Int32 displayIndex, Pointer<SDL_DisplayMode> mode);
typedef _SDL_GetDesktopDisplayMode_dart = int Function(
    int displayIndex, Pointer<SDL_DisplayMode> mode);

final SDL_GetDesktopDisplayMode = dlib.lookupFunction<
    _SDL_GetDesktopDisplayMode_c,
    _SDL_GetDesktopDisplayMode_dart>("SDL_GetDesktopDisplayMode");

//int SDL_GetDisplayBounds(int  displayIndex, SDL_Rect* rect)
typedef _SDL_GetDisplayBounds_c = Int32 Function(
    Int32 displayIndex, Pointer<SDL_Rect> rect);
typedef _SDL_GetDisplayBounds_dart = int Function(
    int displayIndex, Pointer<SDL_Rect> rect);

final SDL_GetDisplayBounds =
    dlib.lookupFunction<_SDL_GetDisplayBounds_c, _SDL_GetDisplayBounds_dart>(
        "SDL_GetDisplayBounds");
//int SDLCALL SDL_GetDisplayMode(int displayIndex, int modeIndex,SDL_DisplayMode * mode);
typedef _SDL_GetDispslayMode_c = Int32 Function(
    Int32 displayIndex, Int32 modeIndex, Pointer<SDL_DisplayMode> mode);
typedef _SDL_GetDispslayMode_dart = int Function(
    int displayIndex, int modeIndex, Pointer<SDL_DisplayMode> mode);

final SDL_GetDisplayMode =
    dlib.lookupFunction<_SDL_GetDispslayMode_c, _SDL_GetDispslayMode_dart>(
        "SDL_GetDisplayMode");

//const char* SDL_GetDisplayName(int displayIndex)
typedef _SDL_GetDisplayName_c = Pointer<Utf8> Function(Int32);
typedef _SDL_GetDisplayName_dart = Pointer<Utf8> Function(int);

final SDL_GetDisplayName =
    dlib.lookupFunction<_SDL_GetDisplayName_c, _SDL_GetDisplayName_dart>(
        "SDL_GetDisplayName");

//int SDLCALL SDL_GetDisplayUsableBounds(int displayIndex, SDL_Rect * rect);

typedef _SDL_GetDisplayUsableBounds_c = Int32 Function(
    Int32 displayIndex, Pointer<SDL_Rect> rect);
typedef _SDL_GetDisplayUsableBounds_dart = int Function(
    int displayIndex, Pointer<SDL_Rect> rect);

final SDL_GetDisplayUsableBounds = dlib.lookupFunction<
    _SDL_GetDisplayUsableBounds_c,
    _SDL_GetDisplayUsableBounds_dart>("SDL_GetDisplayUsableBounds");

//SDL_Window* SDL_GetGrabbedWindow(void)

typedef _SDL_GetGrabbedWindow_c = Pointer<SDL_Window> Function();
typedef _SDL_GetGrabbedWindow_dart = Pointer<SDL_Window> Function();

final SDL_GetGrabbedWindow =
    dlib.lookupFunction<_SDL_GetGrabbedWindow_c, _SDL_GetGrabbedWindow_dart>(
        "SDL_GetGrabbedWindow");

//int SDL_GetNumVideoDisplays(void)
typedef _SDL_GetNumVideoDisplays_c = Int32 Function();
typedef _SDL_GetNumVideoDisplays_dart = int Function();

final SDL_GetNumVideoDisplays = dlib.lookupFunction<_SDL_GetNumVideoDisplays_c,
    _SDL_GetNumVideoDisplays_dart>("SDL_GetNumVideoDisplays");

//int SDL_GetNumDisplayModes(int displayIndex)
typedef _SDL_GetNumDisplayModes_c = Int32 Function(Int32 displayIndex);
typedef _SDL_GetNumDisplayModes_dart = int Function(int displayIndex);

final SDL_GetNumDisplayModes = dlib.lookupFunction<_SDL_GetNumDisplayModes_c,
    _SDL_GetNumDisplayModes_dart>("SDL_GetNumDisplayModes");

//int SDL_GetDisplayDPI(int displayIndex,float* ddpi,float* hdpi,float* vdpi)
typedef _SDL_GetDisplayDPI_c = Int32 Function(Int32 displayIndex,
    Pointer<Float> ddpi, Pointer<Float> hdpi, Pointer<Float> vdpi);
typedef _SDL_GetDisplayDPI_dart = int Function(int displayIndex,
    Pointer<Float> ddpi, Pointer<Float> hdpi, Pointer<Float> vdpi);

final SDL_GetDisplayDPI =
    dlib.lookupFunction<_SDL_GetDisplayDPI_c, _SDL_GetDisplayDPI_dart>(
        "SDL_GetDisplayDPI");

//int SDL_GetNumVideoDrivers(void)
typedef _SDL_GetNumVideoDrivers_c = Int32 Function();
typedef _SDL_GetNumVideoDrivers_dart = int Function();

final SDL_GetNumVideoDrivers = dlib.lookupFunction<_SDL_GetNumVideoDrivers_c,
    _SDL_GetNumVideoDrivers_dart>("SDL_GetNumVideoDrivers");

//const char* SDL_GetVideoDriver(int index)
typedef _SDL_GetVideoDriver_c = Pointer<Utf8> Function(Int32 index);
typedef _SDL_GetVideoDriver_dart = Pointer<Utf8> Function(int index);

final SDL_GetVideoDriver =
    dlib.lookupFunction<_SDL_GetVideoDriver_c, _SDL_GetVideoDriver_dart>(
        "SDL_GetVideoDriver");

//
//int SDL_GetWindowBordersSize(SDL_Window * window,  int *top, int *left,
//                                                     int *bottom, int *right);
typedef _SDL_GetWindowBordersSize_c = Int32 Function(
    Pointer<SDL_Window> win,
    Pointer<Int32> top,
    Pointer<Int32> left,
    Pointer<Int32> bottom,
    Pointer<Int32> right);
typedef _SDL_GetWindowBordersSize_dart = int Function(
    Pointer<SDL_Window> win,
    Pointer<Int32> top,
    Pointer<Int32> left,
    Pointer<Int32> bottom,
    Pointer<Int32> right);

final SDL_GetWindowBordersSize = dlib.lookupFunction<
    _SDL_GetWindowBordersSize_c,
    _SDL_GetWindowBordersSize_dart>("SDL_GetWindowBordersSize");

//float SDL_GetWindowBrightness(SDL_Window* window)
typedef _SDL_GetWindowBrightness_c = Float Function(Pointer<SDL_Window> window);
typedef _SDL_GetWindowBrightness_dart = double Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowBrightness = dlib.lookupFunction<_SDL_GetWindowBrightness_c,
    _SDL_GetWindowBrightness_dart>("SDL_GetWindowBrightness");

//void * SDL_GetWindowData(SDL_Window * window, const char *name);
typedef _SDL_GetWindowData_c = Pointer<Void> Function(
    Pointer<SDL_Window> window, Pointer<Utf8> name);
typedef _SDL_GetWindowData_dart = Pointer<Void> Function(
    Pointer<SDL_Window> window, Pointer<Utf8> name);

final SDL_GetWindowData =
    dlib.lookupFunction<_SDL_GetWindowData_c, _SDL_GetWindowData_dart>(
        "SDL_GetWindowData");

//int SDL_GetWindowDisplayIndex(SDL_Window* window)
typedef _SDL_GetWindowDisplayIndex_c = Int32 Function(
    Pointer<SDL_Window> window);
typedef _SDL_GetWindowDisplayIndex_dart = int Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowDisplayIndex = dlib.lookupFunction<
    _SDL_GetWindowDisplayIndex_c,
    _SDL_GetWindowDisplayIndex_dart>("SDL_GetWindowDisplayIndex");

//int SDLCALL SDL_SetWindowFullscreen(SDL_Window * window, Uint32 flags);
typedef _SDL_SetWindowFullscreen_c = Int32 Function(
    Pointer<SDL_Window> window, Uint32 flags);
typedef _SDL_SetWindowFullscreen_dart = int Function(
    Pointer<SDL_Window> window, int flags);

final SDL_SetWindowFullscreen = dlib.lookupFunction<_SDL_SetWindowFullscreen_c,
    _SDL_SetWindowFullscreen_dart>("SDL_SetWindowFullscreen");

//int SDLCALL SDL_GetWindowDisplayMode(SDL_Window * window, SDL_DisplayMode * mode);
typedef _SDL_GetWindowDisplayMode_c = Int32 Function(
    Pointer<SDL_Window> win, Pointer<SDL_DisplayMode> mode);
typedef _SDL_GetWindowDisplayMode_dart = int Function(
    Pointer<SDL_Window> win, Pointer<SDL_DisplayMode> mode);

final SDL_GetWindowDisplayMode = dlib.lookupFunction<
    _SDL_GetWindowDisplayMode_c,
    _SDL_GetWindowDisplayMode_dart>("SDL_GetWindowDisplayMode");

//Uint32 SDL_GetWindowFlags(SDL_Window* window)
typedef _GetWindowFlags_c = Uint32 Function(Pointer<SDL_Window>);
typedef _GetWindowFlags_dart = int Function(Pointer<SDL_Window>);

final SDL_GetWindowFlags =
    dlib.lookupFunction<_GetWindowFlags_c, _GetWindowFlags_dart>(
        "SDL_GetWindowFlags");

//SDL_Window* SDL_GetWindowFromID(Uint32 id)
typedef _SDL_GetWindowFromID_c = Pointer<SDL_Window> Function(Uint32);
typedef _SDL_GetWindowFromID_dart = Pointer<SDL_Window> Function(int);

final SDL_GetWindowFromID =
    dlib.lookupFunction<_SDL_GetWindowFromID_c, _SDL_GetWindowFromID_dart>(
        "SDL_GetWindowFromID");

//int  SDL_GetWindowGammaRamp(SDL_Window * window, Uint16 * red, Uint16 * green, Uint16 * blue);
typedef _SDL_GetWindowGammaRamp_c = Int32 Function(Pointer<SDL_Window> win,
    Pointer<Uint16> r, Pointer<Uint16> g, Pointer<Uint16>);
typedef _SDL_GetWindowGammaRamp_dart = int Function(Pointer<SDL_Window> win,
    Pointer<Uint16> r, Pointer<Uint16> g, Pointer<Uint16>);

final SDL_GetWindowGammaRamp = dlib.lookupFunction<_SDL_GetWindowGammaRamp_c,
    _SDL_GetWindowGammaRamp_dart>("SDL_GetWindowGammaRamp");
