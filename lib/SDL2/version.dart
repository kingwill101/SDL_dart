import 'dart:ffi';
import 'ffi.dart';

class SDL_version extends Struct {
  @Uint8()
  int major;
  @Uint8()
  int minor;
  @Uint8()
  int patch;
}

//const char* SDL_GetRevision(void)
typedef SDL_GetRevision_c = Pointer<Uint8> Function();
typedef SDL_GetRevision_Dart = Pointer<Uint8> Function();

final SDL_GetRevision = dlib
    .lookupFunction<SDL_GetRevision_c, SDL_GetRevision_Dart>("SDL_GetRevision");

//int SDL_GetRevisionNumber(void)
typedef SDL_GetRevisionNumber_c = Uint32 Function();
typedef SDL_GetRevisionNumber_Dart = int Function();

final SDL_GetRevisionNumber =
    dlib.lookupFunction<SDL_GetRevisionNumber_c, SDL_GetRevisionNumber_Dart>(
        "SDL_GetRevisionNumber");

//void SDL_GetVersion(SDL_version* ver)
typedef SDL_GetVersion_c = Void Function(Pointer<SDL_version>);
typedef SDL_GetVersion_Dart = void Function(Pointer<SDL_version>);

final SDL_GetVersion = dlib
    .lookupFunction<SDL_GetVersion_c, SDL_GetVersion_Dart>("SDL_GetVersion");
