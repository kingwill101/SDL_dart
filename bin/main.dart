import 'dart:ffi' as ffi;
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:SDL_dart/SDL2/SDLWindow.dart';
import 'package:SDL_dart/SDL2/event.dart';
import 'package:SDL_dart/SDL2/flags.dart';
import 'package:SDL_dart/SDL2/sdl.dart';
import 'package:SDL_dart/SDL2/version.dart';
import 'package:SDL_dart/SDL2/video.dart';
import 'package:SDL_dart/sdl.dart';
import 'package:SDL_dart/SDL2/event.dart';

void main(List<String> arguments) {
  ffi.Pointer<SDL_Window> win = ffi.nullptr;

  //The surface contained by the window
  ffi.Pointer<SDL_Surface> surface = ffi.nullptr;

  SDL_Init(SDL_INIT_AUDIO);
  win = SDL_CreateWindow(Utf8.toUtf8("Title"), 100, 100, 600, 400,
      SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
  if (win == ffi.nullptr) {
    print("Failed to open window");
  }

  surface = SDL_GetWindowSurface(win);

  if (surface == ffi.nullptr) {
    print("error creating surface");
  }

  Pointer<SDL_Event> _event = allocate();
  while (true) {
    SDL_PollEvent(_event);

    try {
      print(_event);
    } catch (err) {
      print(err);
    }

    if (_event.ref.type == SDL_QUIT) {
      print("quit");
      SDL_DestroyWindow(win);
      SDL_Quit();
    }

    SDL_FillRect(surface, ffi.nullptr,
        SDL_MapRGB(surface.ref.format, 0xAAA, 0xFF, 0xFF));
    SDL_UpdateWindowSurface(win);
  }
}
