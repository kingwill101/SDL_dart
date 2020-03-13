import 'dart:ffi';

import 'ffi.dart' show dlib;

const SDL_QUIT  = 0x100;

class SDL_CommonEvent extends Struct{}
class SDL_DisplayEvent extends Struct{}
class SDL_WindowEvent extends Struct{}
class SDL_KeyboardEvent extends Struct{}
class SDL_TextEditingEvent extends Struct{}
class SDL_TextInputEvent extends Struct{}
class SDL_MouseMotionEvent extends Struct{}
class SDL_MouseButtonEvent extends Struct{}
class SDL_MouseWheelEvent extends Struct{}
class SDL_JoyAxisEvent extends Struct{}
class SDL_JoyBallEvent extends Struct{}
class SDL_JoyHatEvent extends Struct{}
class SDL_JoyButtonEvent extends Struct{}
class SDL_JoyDeviceEvent extends Struct{}
class SDL_ControllerAxisEvent extends Struct{}
class SDL_ControllerButtonEvent extends Struct{}
class SDL_ControllerDeviceEvent extends Struct{}
class SDL_AudioDeviceEvent extends Struct{}
class SDL_SensorEvent extends Struct{}
class SDL_QuitEvent extends Struct{}
class SDL_UserEvent extends Struct{}
class SDL_SysWMEvent extends Struct{}
class SDL_TouchFingerEvent extends Struct{}
class SDL_MultiGestureEvent extends Struct{}
class SDL_DollarGestureEvent extends Struct{}
class SDL_DropEvent extends Struct{}

class SDL_Event extends Struct {
  @Uint32()
  int type;
  Pointer<SDL_CommonEvent> common;
  Pointer<SDL_DisplayEvent> display;
  Pointer<SDL_WindowEvent> window;
  Pointer<SDL_KeyboardEvent> key;
  Pointer<SDL_TextEditingEvent> edit;
  Pointer<SDL_TextInputEvent> text;
  Pointer<SDL_MouseMotionEvent> motion;
  Pointer<SDL_MouseButtonEvent> button;
  Pointer<SDL_MouseWheelEvent> wheel;
  Pointer<SDL_JoyAxisEvent> jaxis;
  Pointer<SDL_JoyBallEvent> jball;
  Pointer<SDL_JoyHatEvent> jhat;
  Pointer<SDL_JoyButtonEvent> jbutton;
  Pointer<SDL_JoyDeviceEvent> jdevice;
  Pointer<SDL_ControllerAxisEvent> caxis;
  Pointer<SDL_ControllerButtonEvent> cbutton;
  Pointer<SDL_ControllerDeviceEvent> cdevice;
  Pointer<SDL_AudioDeviceEvent> adevice;
  Pointer<SDL_SensorEvent> sensor;
  Pointer<SDL_QuitEvent> quit;
  Pointer<SDL_UserEvent> user;
  Pointer<SDL_SysWMEvent> syswm;
  Pointer<SDL_TouchFingerEvent> tfinger;
  Pointer<SDL_MultiGestureEvent> mgesture;
  Pointer<SDL_DollarGestureEvent> dgesture;
  Pointer<SDL_DropEvent> drop;
}

//int SDL_PollEvent(SDL_Event * event)
typedef SDL_PollEvent_c = Int32 Function(Pointer<SDL_Event>);
typedef SDL_PollEvent_Dart = int Function(Pointer<SDL_Event>);

final SDL_PollEvent = dlib.lookupFunction<SDL_PollEvent_c, SDL_PollEvent_Dart>(
    'SDL_PollEvent');

