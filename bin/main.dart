import 'dart:ffi' as ffi;
import 'dart:ffi';

import 'package:SDL_dart/helpers.dart';
import 'package:SDL_dart/sdl.dart';
import 'package:ffi/ffi.dart';

void main(List<String> arguments) {
  ffi.Pointer<SDL_Window> win = ffi.nullptr;

  //The surface contained by the window
  ffi.Pointer<SDL_Surface> surface = ffi.nullptr;

  SDL_Init(SDL_INIT_AUDIO);
  win = create_win("Some Title", 100, 100, 600, 400,
      SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
  if (win == ffi.nullptr) {
    print('Failed to open window');
  }

  surface = SDL_GetWindowSurface(win);

  if (surface == ffi.nullptr) {
    print('error creating surface');
  }

  Pointer<SDL_Event> _event;
  _event = allocate();
  while (SDL_PollEvent(_event) != null) {
    if (_event.ref.type == SDL_QUIT) {
      SDL_DestroyWindow(win);
      SDL_Quit();
    }

    SDL_FillRect(
        surface, ffi.nullptr, SDL_MapRGB(surface.ref.format, 100, 30, 100));
    SDL_UpdateWindowSurface(win);
  }
}
