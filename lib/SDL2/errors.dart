import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'ffi.dart';

//void SDL_ClearError(void)
typedef SDL_ClearError_c = Void Function();
typedef SDL_ClearError_Dart = void Function();

final SDL_ClearError = dlib
    .lookupFunction<SDL_ClearError_c, SDL_ClearError_Dart>("SDL_ClearError");

//const char* SDL_GetError(void)
typedef SDL_GetError_C = Pointer<Utf8> Function();
typedef SDL_GetError_Dart = Pointer<Utf8> Function();

final SDL_GetError =
    dlib.lookupFunction<SDL_GetError_C, SDL_GetError_Dart>("SDL_GetError");

//int SDL_SetError(const char* fmt, ...)
typedef SDL_SetError_c = Uint32 Function(
    Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>);
typedef SDL_SetError_Dart = int Function(
    Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>);

final SDL_SetError =
    dlib.lookupFunction<SDL_SetError_c, SDL_SetError_Dart>("SDL_SetError");
