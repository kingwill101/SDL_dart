import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:SDL_dart/SDL2/SDLWindow.dart';












//SDL_FillRect (SDL_Surface * dst, const SDL_Rect * rect, Uint32 color);
typedef SDL_FillRect_c = Void Function(
    Pointer<SDL_Surface>, Pointer<SDL_Rect>, Uint32);
typedef SDL_FillRect_Dart = void Function(
    Pointer<SDL_Surface> dst, Pointer<SDL_Rect> rect, int color);

//Uint32 SDLCALL SDL_MapRGB(const SDL_PixelFormat * format, Uint8 r, Uint8 g, Uint8 b);
typedef SDL_MapRGB_c = Uint32 Function(
    Pointer<SDL_PixelFormat>, Uint8 r, Uint8 g, Uint8 b);
typedef SDL_MapRGB_Dart = int Function(
    Pointer<SDL_PixelFormat>, int r, int g, int b);

//void SDLCALL SDL_Delay(Uint32 ms);
typedef SDL_Delay_c = Void Function(Uint32);
typedef SDL_Delay_Dart = void Function(int ms);
