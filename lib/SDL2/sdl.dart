import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'ffi.dart';

typedef SDL_Quit_c = Void Function();
typedef SDL_Quit_Dart = void Function();

final SDL_Quit = dlib.lookupFunction<SDL_Quit_c, SDL_Quit_Dart>("SDL_Quit");

typedef SDL_Init_c = Uint8 Function(Uint32 flags);
typedef SDL_Init_Dart = int Function(int flags);

final SDL_Init = dlib.lookupFunction<SDL_Init_c, SDL_Init_Dart>("SDL_Init");

//int SDL_InitSubSystem(Uint32 flags)
typedef SDL_InitSubSystem_c = Uint8 Function(Uint32 flags);
typedef SDL_InitSubSystem_Dart = int Function(int flags);

final SDL_InitSubSystem =
    dlib.lookupFunction<SDL_InitSubSystem_c, SDL_InitSubSystem_Dart>(
        "SDL_InitSubSystem");

//Uint32 SDL_WasInit(Uint32 flags)
typedef SDL_WasInit_c = Uint32 Function(Uint32);
typedef SDL_WasInit_Dart = int Function(int);

final SDL_WasInit =
    dlib.lookupFunction<SDL_WasInit_c, SDL_WasInit_Dart>("SDL_WasInit");

//void SDL_SetMainReady(void)
typedef SDL_SetMainReady_c = Void Function();
typedef SDL_SetMainReady_Dart = void Function();

final SDL_SetMainReady =
    dlib.lookupFunction<SDL_SetMainReady_c, SDL_SetMainReady_Dart>(
        "SDL_SetMainReady");

//void SDL_QuitSubSystem(Uint32 flags)
typedef SDL_QuitSubSystem_c = Void Function(Uint32 flags);
typedef SDL_QuitSubSystem_Dart = void Function(int flags);

final SDL_QuitSubSystem =
    dlib.lookupFunction<SDL_QuitSubSystem_c, SDL_QuitSubSystem_Dart>(
        "SDL_QuitSubSystem");

//int SDL_WinRTRunApp(MainFunction mainFunction ,void*        reserved)
typedef SDL_WinRTRunApp_c = Function(Pointer, Pointer<Void>);
typedef SDL_WinRTRunApp_Dart = Function(Pointer, Pointer<Void>);
