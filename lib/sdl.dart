import 'package:SDL_dart/SDL2/functions.dart';

import 'SDL2/ffi.dart' show dlib;


final SDL_FillRect =
    dlib.lookupFunction<SDL_FillRect_c, SDL_FillRect_Dart>("SDL_FillRect");
final SDL_MapRGB =
    dlib.lookupFunction<SDL_MapRGB_c, SDL_MapRGB_Dart>("SDL_MapRGB");
final SDL_Delay = dlib.lookupFunction<SDL_Delay_c, SDL_Delay_Dart>("SDL_Delay");
