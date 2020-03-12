import 'dart:ffi';

DynamicLibrary _open() {
  var _path = 'SDL2.dll';
  return DynamicLibrary.open(_path);
}

final dlib  = _open();