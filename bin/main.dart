import 'dart:ffi' as ffi;
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:tester/SDL2/SDLWindow.dart';
import 'package:tester/SDL2/event.dart';
import 'package:tester/SDL2/flags.dart';
import 'package:tester/SDL2/sdl.dart';
import 'package:tester/SDL2/version.dart';
import 'package:tester/SDL2/video.dart';
import 'package:tester/sdl.dart';

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
    try {
      int _val = SDL_PollEvent(_event);
    } catch (er) {
      print(er);
    }

    try {
      //       if (_event.ref.type == SDL_QUIT) {
//         print("quit");
////         SDL_DestroyWindow(win);
////         SDL_Quit();
//       }
    } catch (er) {
      print(er);
    }

    SDL_FillRect(surface, ffi.nullptr,
        SDL_MapRGB(surface.ref.format, 0xAAA, 0xFF, 0xFF));
    SDL_UpdateWindowSurface(win);
  }
}
