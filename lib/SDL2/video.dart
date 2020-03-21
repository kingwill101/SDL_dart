import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'SDLWindow.dart';
import 'ffi.dart' show dlib;

enum SDL_BlendMode {
  SDL_ScaleModeNearest,
  SDL_ScaleModeLinear,
  SDL_ScaleModeBest
}

class SDL_SysWMinfo extends Struct {}

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

//void SDLCALL SDL_FreeSurface(SDL_Surface * surface);
typedef _SDL_FreeSurface_c = Void Function(Pointer<SDL_Surface>);
typedef _SDL_FreeSurface_Dart = void Function(Pointer<SDL_Surface> surface);

final SDL_FreeSurface =
    dlib.lookupFunction<_SDL_FreeSurface_c, _SDL_FreeSurface_Dart>(
        'SDL_FreeSurface');

//SDL_Texture* _SDL_CreateTexture(SDL_Renderer* renderer,Uint32 format,int access, int w,int h)
typedef _SDL_CreateTexture_c = Pointer<SDL_Texture> Function(
    Pointer<SDL_Renderer>, Uint32 format, Int32 access, Int32 w, Int32 h);
typedef _SDL_CreateTexture_Dart = Pointer<SDL_Texture> Function(
    Pointer<SDL_Renderer>, int format, int access, int w, int h);

final SDL_CreateTexture =
    dlib.lookupFunction<_SDL_CreateTexture_c, _SDL_CreateTexture_Dart>(
        '_SDL_CreateTexture');

//_SDL_CreateWindow(const char *title,int x, int y, int w, int h, Uint32 flags);
typedef _SDL_CreateWindow_c = Pointer<SDL_Window> Function(
    Pointer<Utf8> title, Int32 x, Int32 y, Int32 w, Int32 h, Uint32 flags);
typedef _SDL_CreateWindow_Dart = Pointer<SDL_Window> Function(
    Pointer<Utf8> title, int x, int y, int w, int h, int flags);

final SDL_CreateWindow =
    dlib.lookupFunction<_SDL_CreateWindow_c, _SDL_CreateWindow_Dart>(
        'SDL_CreateWindow');

//int _SDL_CreateWindowAndRenderer(int width, int height,Uint32 window_flags,SDL_Window** window, SDL_Renderer** renderer)
typedef _SDL_CreateWindowAndRenderer_c = Uint32 Function(Uint32, Uint32, Uint32,
    Pointer<Pointer<SDL_Window>>, Pointer<Pointer<SDL_Renderer>>);
typedef _SDL_CreateWindowAndRenderer_Dart = int Function(int, int, int,
    Pointer<Pointer<SDL_Window>>, Pointer<Pointer<SDL_Renderer>>);

final SDL_CreateWindowAndRenderer = dlib.lookupFunction<
    _SDL_CreateWindowAndRenderer_c,
    _SDL_CreateWindowAndRenderer_Dart>('SDL_CreateWindowAndRenderer');

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

final SDL_CreateWindowFrom =
    dlib.lookupFunction<_SDL_CreateWindowFrom_c, _SDL_CreateWindowFrom_Dart>(
        'SDL_CreateWindowFrom');

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
    _SDL_GetClosestDisplayMode_Dart>('SDL_GetClosestDisplayMode');

//int SDL_GetCurrentDisplayMode(int displayIndex, SDL_DisplayMode* mode)
typedef _SDL_GetCurrentDisplayMode_c = Int32 Function(
    Int32, Pointer<SDL_DisplayMode>);
typedef _SDL_GetCurrentDisplayMode_Dart = int Function(
    int, Pointer<SDL_DisplayMode>);

final SDL_GetCurrentDisplayMode = dlib.lookupFunction<
    _SDL_GetCurrentDisplayMode_c,
    _SDL_GetCurrentDisplayMode_Dart>('SDL_GetCurrentDisplayMode');

//const char* SDL_GetCurrentVideoDriver(void)
typedef _SDL_GetCurrentVideoDriver_c = Pointer<Utf8> Function();
typedef _SDL_GetCurrentVideoDriver_Dart = Pointer<Utf8> Function();

final SDL_GetCurrentVideoDriver = dlib.lookupFunction<
    _SDL_GetCurrentVideoDriver_c,
    _SDL_GetCurrentVideoDriver_Dart>('SDL_GetCurrentVideoDriver');

//int SDL_GetDesktopDisplayMode(int  displayIndex, SDL_DisplayMode* mode)
typedef _SDL_GetDesktopDisplayMode_c = Int32 Function(
    Int32 displayIndex, Pointer<SDL_DisplayMode> mode);
typedef _SDL_GetDesktopDisplayMode_dart = int Function(
    int displayIndex, Pointer<SDL_DisplayMode> mode);

final SDL_GetDesktopDisplayMode = dlib.lookupFunction<
    _SDL_GetDesktopDisplayMode_c,
    _SDL_GetDesktopDisplayMode_dart>('SDL_GetDesktopDisplayMode');

//int SDL_GetDisplayBounds(int  displayIndex, SDL_Rect* rect)
typedef _SDL_GetDisplayBounds_c = Int32 Function(
    Int32 displayIndex, Pointer<SDL_Rect> rect);
typedef _SDL_GetDisplayBounds_dart = int Function(
    int displayIndex, Pointer<SDL_Rect> rect);

final SDL_GetDisplayBounds =
dlib.lookupFunction<_SDL_GetDisplayBounds_c, _SDL_GetDisplayBounds_dart>(
    'SDL_GetDisplayBounds');
//int SDLCALL SDL_GetDisplayMode(int displayIndex, int modeIndex,SDL_DisplayMode * mode);
typedef _SDL_GetDispslayMode_c = Int32 Function(
    Int32 displayIndex, Int32 modeIndex, Pointer<SDL_DisplayMode> mode);
typedef _SDL_GetDispslayMode_dart = int Function(
    int displayIndex, int modeIndex, Pointer<SDL_DisplayMode> mode);

final SDL_GetDisplayMode =
dlib.lookupFunction<_SDL_GetDispslayMode_c, _SDL_GetDispslayMode_dart>(
    'SDL_GetDisplayMode');

//const char* SDL_GetDisplayName(int displayIndex)
typedef _SDL_GetDisplayName_c = Pointer<Utf8> Function(Int32);
typedef _SDL_GetDisplayName_dart = Pointer<Utf8> Function(int);

final SDL_GetDisplayName =
dlib.lookupFunction<_SDL_GetDisplayName_c, _SDL_GetDisplayName_dart>(
    'SDL_GetDisplayName');

//int SDLCALL SDL_GetDisplayUsableBounds(int displayIndex, SDL_Rect * rect);

typedef _SDL_GetDisplayUsableBounds_c = Int32 Function(
    Int32 displayIndex, Pointer<SDL_Rect> rect);
typedef _SDL_GetDisplayUsableBounds_dart = int Function(
    int displayIndex, Pointer<SDL_Rect> rect);

final SDL_GetDisplayUsableBounds = dlib.lookupFunction<
    _SDL_GetDisplayUsableBounds_c,
    _SDL_GetDisplayUsableBounds_dart>('SDL_GetDisplayUsableBounds');

//SDL_Window* SDL_GetGrabbedWindow(void)

typedef _SDL_GetGrabbedWindow_c = Pointer<SDL_Window> Function();
typedef _SDL_GetGrabbedWindow_dart = Pointer<SDL_Window> Function();

final SDL_GetGrabbedWindow =
dlib.lookupFunction<_SDL_GetGrabbedWindow_c, _SDL_GetGrabbedWindow_dart>(
    'SDL_GetGrabbedWindow');

//int SDL_GetNumVideoDisplays(void)
typedef _SDL_GetNumVideoDisplays_c = Int32 Function();
typedef _SDL_GetNumVideoDisplays_dart = int Function();

final SDL_GetNumVideoDisplays = dlib.lookupFunction<_SDL_GetNumVideoDisplays_c,
    _SDL_GetNumVideoDisplays_dart>('SDL_GetNumVideoDisplays');

//int SDL_GetNumDisplayModes(int displayIndex)
typedef _SDL_GetNumDisplayModes_c = Int32 Function(Int32 displayIndex);
typedef _SDL_GetNumDisplayModes_dart = int Function(int displayIndex);

final SDL_GetNumDisplayModes = dlib.lookupFunction<_SDL_GetNumDisplayModes_c,
    _SDL_GetNumDisplayModes_dart>('SDL_GetNumDisplayModes');

//int SDL_GetDisplayDPI(int displayIndex,float* ddpi,float* hdpi,float* vdpi)
typedef _SDL_GetDisplayDPI_c = Int32 Function(Int32 displayIndex,
    Pointer<Float> ddpi, Pointer<Float> hdpi, Pointer<Float> vdpi);
typedef _SDL_GetDisplayDPI_dart = int Function(int displayIndex,
    Pointer<Float> ddpi, Pointer<Float> hdpi, Pointer<Float> vdpi);

final SDL_GetDisplayDPI =
dlib.lookupFunction<_SDL_GetDisplayDPI_c, _SDL_GetDisplayDPI_dart>(
    'SDL_GetDisplayDPI');

//int SDL_GetNumVideoDrivers(void)
typedef _SDL_GetNumVideoDrivers_c = Int32 Function();
typedef _SDL_GetNumVideoDrivers_dart = int Function();

final SDL_GetNumVideoDrivers = dlib.lookupFunction<_SDL_GetNumVideoDrivers_c,
    _SDL_GetNumVideoDrivers_dart>('SDL_GetNumVideoDrivers');

//const char* SDL_GetVideoDriver(int index)
typedef _SDL_GetVideoDriver_c = Pointer<Utf8> Function(Int32 index);
typedef _SDL_GetVideoDriver_dart = Pointer<Utf8> Function(int index);

final SDL_GetVideoDriver =
dlib.lookupFunction<_SDL_GetVideoDriver_c, _SDL_GetVideoDriver_dart>(
    'SDL_GetVideoDriver');

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
    _SDL_GetWindowBordersSize_dart>('SDL_GetWindowBordersSize');

//float SDL_GetWindowBrightness(SDL_Window* window)
typedef _SDL_GetWindowBrightness_c = Float Function(Pointer<SDL_Window> window);
typedef _SDL_GetWindowBrightness_dart = double Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowBrightness = dlib.lookupFunction<_SDL_GetWindowBrightness_c,
    _SDL_GetWindowBrightness_dart>('SDL_GetWindowBrightness');

//void * SDL_GetWindowData(SDL_Window * window, const char *name);
typedef _SDL_GetWindowData_c = Pointer<Void> Function(
    Pointer<SDL_Window> window, Pointer<Utf8> name);
typedef _SDL_GetWindowData_dart = Pointer<Void> Function(
    Pointer<SDL_Window> window, Pointer<Utf8> name);

final SDL_GetWindowData =
dlib.lookupFunction<_SDL_GetWindowData_c, _SDL_GetWindowData_dart>(
    'SDL_GetWindowData');

//int SDL_GetWindowDisplayIndex(SDL_Window* window)
typedef _SDL_GetWindowDisplayIndex_c = Int32 Function(
    Pointer<SDL_Window> window);
typedef _SDL_GetWindowDisplayIndex_dart = int Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowDisplayIndex = dlib.lookupFunction<
    _SDL_GetWindowDisplayIndex_c,
    _SDL_GetWindowDisplayIndex_dart>('SDL_GetWindowDisplayIndex');

//int SDLCALL SDL_SetWindowFullscreen(SDL_Window * window, Uint32 flags);
typedef _SDL_SetWindowFullscreen_c = Int32 Function(
    Pointer<SDL_Window> window, Uint32 flags);
typedef _SDL_SetWindowFullscreen_dart = int Function(
    Pointer<SDL_Window> window, int flags);

final SDL_SetWindowFullscreen = dlib.lookupFunction<_SDL_SetWindowFullscreen_c,
    _SDL_SetWindowFullscreen_dart>('SDL_SetWindowFullscreen');

//int SDLCALL SDL_GetWindowDisplayMode(SDL_Window * window, SDL_DisplayMode * mode);
typedef _SDL_GetWindowDisplayMode_c = Int32 Function(
    Pointer<SDL_Window> win, Pointer<SDL_DisplayMode> mode);
typedef _SDL_GetWindowDisplayMode_dart = int Function(
    Pointer<SDL_Window> win, Pointer<SDL_DisplayMode> mode);

final SDL_GetWindowDisplayMode = dlib.lookupFunction<
    _SDL_GetWindowDisplayMode_c,
    _SDL_GetWindowDisplayMode_dart>('SDL_GetWindowDisplayMode');

//Uint32 SDL_GetWindowFlags(SDL_Window* window)
typedef _GetWindowFlags_c = Uint32 Function(Pointer<SDL_Window>);
typedef _GetWindowFlags_dart = int Function(Pointer<SDL_Window>);

final SDL_GetWindowFlags =
dlib.lookupFunction<_GetWindowFlags_c, _GetWindowFlags_dart>(
    'SDL_GetWindowFlags');

//SDL_Window* SDL_GetWindowFromID(Uint32 id)
typedef _SDL_GetWindowFromID_c = Pointer<SDL_Window> Function(Uint32);
typedef _SDL_GetWindowFromID_dart = Pointer<SDL_Window> Function(int);

final SDL_GetWindowFromID =
dlib.lookupFunction<_SDL_GetWindowFromID_c, _SDL_GetWindowFromID_dart>(
    'SDL_GetWindowFromID');

//int  SDL_GetWindowGammaRamp(SDL_Window * window, Uint16 * red, Uint16 * green, Uint16 * blue);
typedef _SDL_GetWindowGammaRamp_c = Int32 Function(Pointer<SDL_Window> win,
    Pointer<Uint16> r, Pointer<Uint16> g, Pointer<Uint16>);
typedef _SDL_GetWindowGammaRamp_dart = int Function(Pointer<SDL_Window> win,
    Pointer<Uint16> r, Pointer<Uint16> g, Pointer<Uint16>);

final SDL_GetWindowGammaRamp = dlib.lookupFunction<_SDL_GetWindowGammaRamp_c,
    _SDL_GetWindowGammaRamp_dart>('SDL_GetWindowGammaRamp');

//SDL_bool SDL_GetWindowGrab(SDL_Window* window)
typedef _SDL_GetWindowGrab_c = Int8 Function(Pointer<SDL_Window> window);
typedef _SDL_GetWindowGrab_dart = int Function(Pointer<SDL_Window> window);

final SDL_GetWindowGrab =
dlib.lookupFunction<_SDL_GetWindowGrab_c, _SDL_GetWindowGrab_dart>(
    'SDL_GetWindowGrab');

//Uint32 SDL_GetWindowID(SDL_Window* window)
typedef _SDL_GetWindowID_c = Uint32 Function(Pointer<SDL_Window> window);
typedef _SDL_GetWindowID_dart = int Function(Pointer<SDL_Window> window);

final SDL_GetWindowID =
dlib.lookupFunction<_SDL_GetWindowID_c, _SDL_GetWindowID_dart>(
    'SDL_GetWindowID');

//void SDL_GetWindowMaximumSize(SDL_Window* window, int* w, int* h)
typedef _SDL_GetWindowMaximumSize_c = Void Function(
    Pointer<SDL_Window> window, Pointer<Int32> w, Pointer<Int32> h);
typedef _SDL_GetWindowMaximumSize_dart = void Function(
    Pointer<SDL_Window> window, Pointer<Int32> w, Pointer<Int32> h);

final SDL_GetWindowMaximumSize = dlib.lookupFunction<
    _SDL_GetWindowMaximumSize_c,
    _SDL_GetWindowMaximumSize_dart>('SDL_GetWindowMaximumSize');

//void SDL_GetWindowMinimumSize(SDL_Window* window, int* w, int* h)
typedef _SDL_GetWindowMinimumSize_c = Void Function(
    Pointer<SDL_Window> window, Pointer<Int32> w, Pointer<Int32> h);
typedef _SDL_GetWindowMinimumSize_dart = void Function(
    Pointer<SDL_Window> window, Pointer<Int32> w, Pointer<Int32> h);

final SDL_GetWindowMinimumSize = dlib.lookupFunction<
    _SDL_GetWindowMinimumSize_c,
    _SDL_GetWindowMinimumSize_dart>('SDL_GetWindowMinimumSize');

//void SDL_GetWindowOpacity(SDL_Window* window, float* opacity)
typedef _SDL_GetWindowOpacity_c = Void Function(
    Pointer<SDL_Window> window, Pointer<Float> opacity);
typedef _SDL_GetWindowOpacity_dart = void Function(
    Pointer<SDL_Window> window, Pointer<Float> opacity);

final SDL_GetWindowOpacity =
dlib.lookupFunction<_SDL_GetWindowOpacity_c, _SDL_GetWindowOpacity_dart>(
    'SDL_GetWindowOpacity');

//void SDL_GetWindowPixelFormat(SDL_Window* window)
typedef _SDL_GetWindowPixelFormat_c = Void Function(Pointer<SDL_Window> window);
typedef _SDL_GetWindowPixelFormat_dart = void Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowPixelFormat = dlib.lookupFunction<
    _SDL_GetWindowPixelFormat_c,
    _SDL_GetWindowPixelFormat_dart>('SDL_GetWindowPixelFormat');

//void SDL_GetWindowPosition(SDL_Window* window, int* x, int* y)
typedef _SDL_GetWindowPosition_c = Void Function(
    Pointer<SDL_Window> window, Pointer<Int32> x, Pointer<Int32> y);
typedef _SDL_GetWindowPosition_dart = void Function(
    Pointer<SDL_Window> window, Pointer<Int32> x, Pointer<Int32> y);

final SDL_GetWindowPosition =
dlib.lookupFunction<_SDL_GetWindowPosition_c, _SDL_GetWindowPosition_dart>(
    'SDL_GetWindowPosition');

//void SDL_GetWindowSize(SDL_Window* window, int* x, int* y)
typedef _SDL_GetWindowSize_c = Void Function(
    Pointer<SDL_Window> window, Pointer<Int32> x, Pointer<Int32> y);
typedef _SDL_GetWindowSize_dart = void Function(
    Pointer<SDL_Window> window, Pointer<Int32> x, Pointer<Int32> y);

final SDL_GetWindowSize =
dlib.lookupFunction<_SDL_GetWindowSize_c, _SDL_GetWindowSize_dart>(
    'SDL_GetWindowSize');

//SDL_Surface * SDL_GetWindowSurface(SDL_Window * window);
typedef _SDL_GetWindowSurface_c = Pointer<SDL_Surface> Function(
    Pointer<SDL_Window>);
typedef _SDL_GetWindowSurface_Dart = Pointer<SDL_Surface> Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowSurface =
dlib.lookupFunction<_SDL_GetWindowSurface_c, _SDL_GetWindowSurface_Dart>(
    'SDL_GetWindowSurface');

//const char* SDL_GetWindowTitle(SDL_Window* window)
typedef _SDL_GetWindowTitle_c = Pointer<Utf8> Function(Pointer<SDL_Window>);
typedef _SDL_GetWindowTitle_Dart = Pointer<Utf8> Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowTitle =
dlib.lookupFunction<_SDL_GetWindowTitle_c, _SDL_GetWindowTitle_Dart>(
    'SDL_GetWindowTitle');

//SDL_bool SDL_GetWindowWMInfo(SDL_Window* window,SDL_SysWMinfo* info)
typedef _SDL_GetWindowWMInfo_c = Int8 Function(
    Pointer<SDL_Window>, Pointer<SDL_SysWMinfo> info);
typedef _SDL_GetWindowWMInfo_Dart = int Function(
    Pointer<SDL_Window> window, Pointer<SDL_SysWMinfo> info);

final SDL_GetWindowWMInfo =
dlib.lookupFunction<_SDL_GetWindowWMInfo_c, _SDL_GetWindowWMInfo_Dart>(
    'SDL_GetWindowWMInfo');

//void SDL_HideWindow(SDL_Window* window)
typedef _SDL_HideWindow_c = Void Function(Pointer<SDL_Window>);
typedef _SDL_HideWindow_Dart = void Function(Pointer<SDL_Window> window);

final SDL_HideWindow = dlib
    .lookupFunction<_SDL_HideWindow_c, _SDL_HideWindow_Dart>('SDL_HideWindow');

//SDL_bool SDL_IsScreenSaverEnabled(void)
typedef _SDL_IsScreenSaverEnabled_c = Int8 Function();
typedef _SDL_IsScreenSaverEnabled_Dart = int Function();

final SDL_IsScreenSaverEnabled = dlib.lookupFunction<
    _SDL_IsScreenSaverEnabled_c,
    _SDL_IsScreenSaverEnabled_Dart>('SDL_IsScreenSaverEnabled');

//void SDL_MaximizeWindow(SDL_Window* window)
typedef _SDL_MaximizeWindow_c = Void Function(Pointer<SDL_Window>);
typedef _SDL_MaximizeWindow_Dart = void Function(Pointer<SDL_Window> window);

final SDL_MaximizeWindow =
dlib.lookupFunction<_SDL_MaximizeWindow_c, _SDL_MaximizeWindow_Dart>(
    'SDL_MaximizeWindow');

//void SDL_RaiseWindow(SDL_Window* window)
typedef _SDL_RaiseWindow_c = Void Function(Pointer<SDL_Window>);
typedef _SDL_RaiseWindow_Dart = void Function(Pointer<SDL_Window> window);

final SDL_RaiseWindow =
dlib.lookupFunction<_SDL_RaiseWindow_c, _SDL_RaiseWindow_Dart>(
    'SDL_RaiseWindow');

//void SDL_RestoreWindow(SDL_Window* window)
typedef _SDL_RestoreWindow_c = Void Function(Pointer<SDL_Window>);
typedef _SDL_RestoreWindow_Dart = void Function(Pointer<SDL_Window> window);

final SDL_RestoreWindow =
dlib.lookupFunction<_SDL_RestoreWindow_c, _SDL_RestoreWindow_Dart>(
    'SDL_RestoreWindow');

//void SDL_SetWindowBordered(SDL_Window* window, SDL_bool    bordered)
typedef _SDL_SetWindowBordered_c = Void Function(Pointer<SDL_Window>);
typedef _SDL_SetWindowBordered_Dart = void Function(Pointer<SDL_Window> window);

final SDL_SetWindowBordered =
dlib.lookupFunction<_SDL_SetWindowBordered_c, _SDL_SetWindowBordered_Dart>(
    'SDL_SetWindowBordered');

//int SDL_SetWindowGammaRamp(SDL_Window*   window,const Uint16* red,const Uint16* green,const Uint16* blue)
typedef _SDL_SetWindowGammaRamp_c = Int32 Function(Pointer<SDL_Window> window,
    Pointer<Uint16> red, Pointer<Uint16> green, Pointer<Uint16> blue);
typedef _SDL_SetWindowGammaRamp_dart = int Function(Pointer<SDL_Window> window,
    Pointer<Uint16> red, Pointer<Uint16> green, Pointer<Uint16> blue);

final SDL_SetWindowGammaRamp = dlib.lookupFunction<_SDL_SetWindowGammaRamp_c,
    _SDL_SetWindowGammaRamp_dart>("SDL_SetWindowGammaRamp");

//void SDL_SetWindowBordered(SDL_Window* window, SDL_bool    bordered)
typedef _SDL_SetWindowGrab_c = Void Function(Pointer<SDL_Window>, Int8);
typedef _SDL_SetWindowGrab_dart = void Function(
    Pointer<SDL_Window> window, int);

final SDL_SetWindowGrab =
dlib.lookupFunction<_SDL_SetWindowGrab_c, _SDL_SetWindowGrab_dart>(
    'SDL_SetWindowBordered');

//TODO figure out how to handle void* callback_data
//int SDL_SetWindowHitTest(SDL_Window* window,SDL_HitTest callback,void* callback_data)
typedef _SDL_SetWindowHitTest_c = Void Function(
    Pointer<SDL_Window>, Pointer<SDL_HitTest>, Pointer<Void> callback);
typedef _SDL_SetWindowHitTest_dart = void Function(
    Pointer<SDL_Window> window, Pointer<SDL_HitTest>, Pointer<Void> callback);

final SDL_SetWindowHitTest =
dlib.lookupFunction<_SDL_SetWindowHitTest_c, _SDL_SetWindowHitTest_dart>(
    'SDL_SetWindowHitTest');

//void SDL_SetWindowIcon(SDL_Window*  window,SDL_Surface* icon)
typedef _SDL_SetWindowIcon_c = Void Function(
    Pointer<SDL_Window>, Pointer<SDL_Surface>);
typedef _SDL_SetWindowIcon_dart = void Function(
    Pointer<SDL_Window> window, Pointer<SDL_Surface>);

final SDL_SetWindowIcon =
dlib.lookupFunction<_SDL_SetWindowIcon_c, _SDL_SetWindowIcon_dart>(
    'SDL_SetWindowIcon');

//int SDL_SetWindowInputFocus(SDL_Window* window)
typedef _SDL_SetWindowInputFocus_c = Void Function(Pointer<SDL_Window>);
typedef _SDL_SetWindowInputFocus_dart = void Function(
    Pointer<SDL_Window> window);

final SDL_SetWindowInputFocus = dlib.lookupFunction<_SDL_SetWindowInputFocus_c,
    _SDL_SetWindowInputFocus_dart>('SDL_SetWindowInputFocus');

//void SDL_SetWindowMaximumSize(SDL_Window* window,int max_w,int max_h)
typedef _SDL_SetWindowMaximumSize_c = Void Function(
    Pointer<SDL_Window>, Int32 w, Int32 h);
typedef _SDL_SetWindowMaximumSize_dart = void Function(
    Pointer<SDL_Window> window, int w, int h);

final SDL_SetWindowMaximumSize = dlib.lookupFunction<
    _SDL_SetWindowMaximumSize_c,
    _SDL_SetWindowMaximumSize_dart>('SDL_SetWindowMaximumSize');

//void SDL_SetWindowMinimumSize(SDL_Window* window,int max_w,int max_h)
typedef _SDL_SetWindowMinimumSize_c = Void Function(
    Pointer<SDL_Window>, Int32 w, Int32 h);
typedef _SDL_SetWindowMinimumSize_dart = void Function(
    Pointer<SDL_Window> window, int w, int h);

final SDL_SetWindowMinimumSize = dlib.lookupFunction<
    _SDL_SetWindowMinimumSize_c,
    _SDL_SetWindowMinimumSize_dart>('SDL_SetWindowMinimumSize');

//int SDL_SetWindowModalFor(SDL_Window* modal_window,SDL_Window* parent_window)
typedef _SDL_SetWindowModalFor_c = Int32 Function(
    Pointer<SDL_Window>, Pointer<SDL_Window> parent);
typedef _SDL_SetWindowModalFor_dart = int Function(
    Pointer<SDL_Window> window, Pointer<SDL_Window> parent);

final SDL_SetWindowModalFor =
dlib.lookupFunction<_SDL_SetWindowModalFor_c, _SDL_SetWindowModalFor_dart>(
    'SDL_SetWindowModalFor');

//int SDL_SetWindowOpacity(SDL_Window* window,float  opacity)
typedef _SDL_SetWindowOpacity_c = Int32 Function(
    Pointer<SDL_Window>, Float opacity);
typedef _SDL_SetWindowOpacity_dart = int Function(
    Pointer<SDL_Window> window, double opacty);

final SDL_SetWindowOpacity =
dlib.lookupFunction<_SDL_SetWindowOpacity_c, _SDL_SetWindowOpacity_dart>(
    'SDL_SetWindowOpacity');

//void SDL_SetWindowPosition(SDL_Window* window,int x, int y)
typedef _SDL_SetWindowPosition_c = Void Function(
    Pointer<SDL_Window>, Int32 x, Int32 y);
typedef _SDL_SetWindowPosition_dart = void Function(
    Pointer<SDL_Window> window, int x, int y);

final SDL_SetWindowPosition =
dlib.lookupFunction<_SDL_SetWindowPosition_c, _SDL_SetWindowPosition_dart>(
    'SDL_SetWindowPosition');

//void SDL_SetWindowResizable(SDL_Window* window,SDL_bool    resizable)
typedef _SDL_SetWindowResizable_c = Void Function(
    Pointer<SDL_Window>, Int8 resizable);
typedef _SDL_SetWindowResizable_dart = void Function(
    Pointer<SDL_Window> window, int resizable);

final SDL_SetWindowResizable = dlib.lookupFunction<_SDL_SetWindowResizable_c,
    _SDL_SetWindowResizable_dart>('SDL_SetWindowResizable');

//void SDL_SetWindowSize(SDL_Window* window,int         w,int         h)
typedef _SDL_SetWindowSize_c = Void Function(
    Pointer<SDL_Window>, Int32 w, Int32 h);
typedef _SDL_SetWindowSize_dart = void Function(
    Pointer<SDL_Window> window, int w, int h);

final SDL_SetWindowSize =
dlib.lookupFunction<_SDL_SetWindowSize_c, _SDL_SetWindowSize_dart>(
    'SDL_SetWindowSize');

//void SDL_SetWindowTitle(SDL_Window* window,const char* title)
typedef _SDL_SetWindowTitle_c = Void Function(
    Pointer<SDL_Window>, Pointer<Utf8> title);
typedef _SDL_SetWindowTitle_dart = void Function(
    Pointer<SDL_Window> window, Pointer<Utf8> title);

final SDL_SetWindowTitle =
dlib.lookupFunction<_SDL_SetWindowTitle_c, _SDL_SetWindowTitle_dart>(
    'SDL_SetWindowTitle');

//void SDL_ShowWindow(SDL_Window* window)
typedef _SDL_ShowWindow_c = Void Function(Pointer<SDL_Window>);
typedef _SDL_ShowWindow_dart = void Function(Pointer<SDL_Window> window);

final SDL_ShowWindow = dlib
    .lookupFunction<_SDL_ShowWindow_c, _SDL_ShowWindow_dart>('SDL_ShowWindow');

//int SDL_ShowSimpleMessageBox(Uint32 flags,const char* title,const char* message,SDL_Window* window)
typedef _SDL_ShowSimpleMessageBox_c = Int32 Function(Uint32 flags,
    Pointer<Utf8> title, Pointer<Utf8> message, Pointer<SDL_Window>);
typedef _SDL_ShowSimpleMessageBox_dart = int Function(int flags,
    Pointer<Utf8> title, Pointer<Utf8> message, Pointer<SDL_Window> window);

final SDL_ShowSimpleMessageBox = dlib.lookupFunction<
    _SDL_ShowSimpleMessageBox_c,
    _SDL_ShowSimpleMessageBox_dart>('SDL_ShowSimpleMessageBox');

//int SDL_ShowMessageBox(const SDL_MessageBoxData* messageboxdata,int*   buttonid)

typedef _SDL_ShowMessageBox_c = Int32 Function(Pointer<
    SDL_MessageBoxData>messageboxdata, Pointer<Int32>);
typedef _SDL_ShowMessageBox_dart = int Function(Pointer<
    SDL_MessageBoxData>messageboxdata, Pointer<Int32>);

final SDL_ShowMessageBox = dlib.lookupFunction<
    _SDL_ShowMessageBox_c,
    _SDL_ShowMessageBox_dart>('SDL_ShowMessageBox');

//void SDL_VideoQuit(void)
typedef _SDL_VideoQuit_c = Int32 Function();
typedef _SDL_VideoQuit_dart = int Function();

final SDL_VideoQuit = dlib.lookupFunction<
    _SDL_VideoQuit_c,
    _SDL_VideoQuit_dart>('SDL_VideoQuit');

//int SDL_UpdateWindowSurface(SDL_Window * window);
typedef _SDL_UpdateWindowSurface_c = Uint32 Function(Pointer<SDL_Window>);
typedef _SDL_UpdateWindowSurface_Dart = int Function(
    Pointer<SDL_Window> window);

final SDL_UpdateWindowSurface = dlib.lookupFunction<_SDL_UpdateWindowSurface_c,
    _SDL_UpdateWindowSurface_Dart>('SDL_UpdateWindowSurface');

//int SDL_UpdateWindowSurfaceRectsRects(SDL_Window* window,const SDL_Rect*   rects,int   numrects
typedef _SDL_UpdateWindowSurfaceRects_c = Uint32 Function(Pointer<
    SDL_Window>, Pointer<SDL_Rect> rects, Int32 numrecets);
typedef _SDL_UpdateWindowSurfaceRects_Dart = int Function(
    Pointer<SDL_Window> window, Pointer<SDL_Rect> rects, int numrecets);

final SDL_UpdateWindowSurfaceRects = dlib.lookupFunction<
    _SDL_UpdateWindowSurfaceRects_c,
    _SDL_UpdateWindowSurfaceRects_Dart>('SDL_UpdateWindowSurfaceRects');