import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:tester/SDL2/SDLWindow.dart';
import 'package:tester/SDL2/functions.dart';

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

class SDL_WindowEvent extends Struct {
  @Uint32()
  int type;
  @Uint32()
  int timestamp;
  @Uint32()
  int windowID;
  @Uint8()
  int event;
  @Uint8()
  int padding1;
  @Uint8()
  int padding2;
  @Uint8()
  int padding3;
  @Int32()
  int data1;
  @Int32()
  int data2;
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

//SDL_CreateWindow(const char *title,int x, int y, int w, int h, Uint32 flags);
typedef SDL_CreateWindow_c = Pointer<SDL_Window> Function(
    Pointer<Utf8> title, Int32 x, Int32 y, Int32 w, Int32 h, Uint32 flags);
typedef SDL_CreateWindow_Dart = Pointer<SDL_Window> Function(
    Pointer<Utf8> title, int x, int y, int w, int h, int flags);

final SDL_CreateWindow =
    dlib.lookupFunction<SDL_CreateWindow_c, SDL_CreateWindow_Dart>(
        "SDL_CreateWindow");

//int SDL_CreateWindowAndRenderer(int width, int height,Uint32 window_flags,SDL_Window** window, SDL_Renderer** renderer)
typedef SDL_CreateWindowAndRenderer_c = Uint32 Function(Uint32, Uint32, Uint32,
    Pointer<Pointer<SDL_Window>>, Pointer<Pointer<SDL_Renderer>>);
typedef SDL_CreateWindowAndRenderer_Dart = int Function(int, int, int,
    Pointer<Pointer<SDL_Window>>, Pointer<Pointer<SDL_Renderer>>);

final SDL_CreateWindowAndRenderer = dlib.lookupFunction<
    SDL_CreateWindowAndRenderer_c,
    SDL_CreateWindowAndRenderer_Dart>("SDL_CreateWindowAndRenderer");

//SDL_Surface * SDLCALL SDL_GetWindowSurface(SDL_Window * window);
typedef SDL_GetWindowSurface_c = Pointer<SDL_Surface> Function(
    Pointer<SDL_Window>);
typedef SDL_GetWindowSurface_Dart = Pointer<SDL_Surface> Function(
    Pointer<SDL_Window> window);

final SDL_GetWindowSurface =
    dlib.lookupFunction<SDL_GetWindowSurface_c, SDL_GetWindowSurface_Dart>(
        "SDL_GetWindowSurface");

//void SDLCALL SDL_FreeSurface(SDL_Surface * surface);
typedef SDL_FreeSurface_c = Void Function(Pointer<SDL_Surface>);
typedef SDL_FreeSurface_Dart = void Function(Pointer<SDL_Surface> surface);

final SDL_FreeSurface = dlib
    .lookupFunction<SDL_FreeSurface_c, SDL_FreeSurface_Dart>("SDL_FreeSurface");

//int SDL_UpdateWindowSurface(SDL_Window * window);
typedef SDL_UpdateWindowSurface_c = Uint32 Function(Pointer<SDL_Window>);
typedef SDL_UpdateWindowSurface_Dart = int Function(Pointer<SDL_Window> window);

final SDL_UpdateWindowSurface = dlib.lookupFunction<SDL_UpdateWindowSurface_c,
    SDL_UpdateWindowSurface_Dart>("SDL_UpdateWindowSurface");

//int SDL_UpdateWindowSurface(SDL_Window * window);
typedef SDL_DestroyWindow_c = Void Function(Pointer<SDL_Window>);
typedef SDL_DestroyWindow_Dart = void Function(Pointer<SDL_Window> window);

final SDL_DestroyWindow =
    dlib.lookupFunction<SDL_DestroyWindow_c, SDL_DestroyWindow_Dart>(
        "SDL_DestroyWindow");

//SDL_Texture* SDL_CreateTexture(SDL_Renderer* renderer,Uint32 format,int access, int w,int h)
typedef SDL_CreateTexture_c = Pointer<SDL_Texture> Function(
    Pointer<SDL_Renderer>, Uint32 format, Int32 access, Int32 w, Int32 h);
typedef SDL_CreateTexture_Dart = Pointer<SDL_Texture> Function(
    Pointer<SDL_Renderer>, int format, int access, int w, int h);
final SDL_CreateTexture = dlib.lookupFunction<SDL_CreateTexture_c, SDL_CreateTexture_Dart>("SDL_CreateTexture");