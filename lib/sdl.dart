import 'package:SDL_dart/SDL2/functions.dart';

import 'SDL2/ffi.dart' show dlib;
export  'package:SDL_dart/SDL2/SDLWindow.dart';
export  'package:SDL_dart/SDL2/event.dart';
export  'package:SDL_dart/SDL2/flags.dart';
export  'package:SDL_dart/SDL2/sdl.dart';
export  'package:SDL_dart/SDL2/version.dart';
export  'package:SDL_dart/SDL2/video.dart';

final SDL_FillRect =
    dlib.lookupFunction<SDL_FillRect_c, SDL_FillRect_Dart>('SDL_FillRect');
final SDL_MapRGB =
    dlib.lookupFunction<SDL_MapRGB_c, SDL_MapRGB_Dart>('SDL_MapRGB');
final SDL_Delay = dlib.lookupFunction<SDL_Delay_c, SDL_Delay_Dart>('SDL_Delay');
