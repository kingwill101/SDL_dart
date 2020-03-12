import 'dart:core';
import 'dart:ffi';

import 'package:ffi/ffi.dart';

enum SDL_AssertState {
  SDL_ASSERTION_RETRY,
  SDL_ASSERTION_BREAK,
  SDL_ASSERTION_ABORT,
  SDL_ASSERTION_IGNORE,
  SDL_ASSERTION_ALWAYS_IGNORE
}

class AssertData extends Struct {
  @Uint32()
  int always_ignore;
  @Uint32()
  int trigger_count;
  Pointer<Utf8> condition;
  Pointer<Utf8> filename;
  @Uint32()
  int linenum;
  Pointer<Utf8> function;
  Pointer<AssertData> next;
}

//SDL_AssertionHandler SDL_GetAssertionHandler(void** puserdata)
//const SDL_AssertData* SDL_GetAssertionReport(void)
//SDL_AssertionHandler SDL_GetDefaultAssertionHandler(void)
//void SDL_ResetAssertionReport(void)
//void SDL_SetAssertionHandler(SDL_AssertionHandler handler,void*  userdata)
//void SDL_TriggerBreakpoint(void)
//void SDL_assert(condition)
//void SDL_assert_paranoid(condition)
//void SDL_assert_release(condition)