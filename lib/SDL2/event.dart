import 'dart:ffi';

import 'ffi.dart' show dlib;

const SDL_QUIT  = 0x100;

class SDL_Event extends Struct {
  @Uint32()
  int type;
}
//int
//SDL_PollEvent(SDL_Event * event)
//{
//return SDL_WaitEventTimeout(event, 0);
//}
typedef SDL_PollEvent_c = Int32 Function(Pointer<SDL_Event>);
typedef SDL_PollEvent_Dart = int Function(Pointer<SDL_Event>);

final SDL_PollEvent = dlib.lookupFunction<SDL_PollEvent_c, SDL_PollEvent_Dart>(
    "SDL_PollEvent");

