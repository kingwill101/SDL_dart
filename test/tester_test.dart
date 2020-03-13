//import 'package:SDL_dart/SDL_dart.dart';
import 'dart:ffi';

import 'package:SDL_dart/sdl.dart';
import 'package:ffi/ffi.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() {
    SDL_Init(SDL_INIT_EVERYTHING);
  });

  test('SDL_GetCurrentVideoDriver', () {
    var _driver = SDL_GetCurrentVideoDriver();
    assert(_driver != nullptr);
  });

  test('SDL_GetCurrentVideoDriver', () {
    assert(SDL_GetDesktopDisplayMode(0, allocate<SDL_DisplayMode>()) == 0);
  });

  test('SDL_GetDisplayUsableBounds', () {
    assert(SDL_GetDisplayUsableBounds(0, allocate<SDL_Rect>()) == 0);
  });

  test('SDL_GetDisplayName', () {
    assert(SDL_GetDisplayName(0) != nullptr);
  });

  test('SDL_GetNumVideoDisplays', () {
    assert(SDL_GetNumVideoDisplays() >= 1);
  });

  test('SDL_GetNumDisplayModes', () {
    assert(SDL_GetNumDisplayModes(0) >= 1);
  });

  test('SDL_GetNumVideoDrivers', () {
    assert(SDL_GetNumVideoDrivers() >= 1);
  });

  test('SDL_GetGrabbedWindow', () {
    //TODO create window for test
//    assert(SDL_GetGrabbedWindow() != nullptr);
  });


  test('SDL_GetWindowBordersSize', () {
    //TODO create window for test
//    assert(SDL_GetWindowBordersSize() != 0);
  });




  test('SDL_GetDisplayDPI', () {
    assert(SDL_GetDisplayDPI(0, nullptr, nullptr, nullptr) == 0);
  });


  tearDownAll(() {
    SDL_Quit();
  });
}
