import 'dart:ffi';

import 'package:SDL_dart/sdl.dart';
import 'package:ffi/ffi.dart';

Pointer<SDL_Window> create_win(
  String title,
  int x,
  int y,
  int w,
  int h,
  int flags,
) {
  return SDL_CreateWindow(Utf8.toUtf8(title), x, y, w, h, flags);
}
