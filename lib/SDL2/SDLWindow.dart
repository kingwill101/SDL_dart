import 'dart:ffi';
import 'package:ffi/ffi.dart';

enum SDL_BOOL { SDL_TRUE, SDL_FALSE }

class SDL_blit extends Struct {}

class SDL_BlitInfo extends Struct {}

class SDL_BlitMap extends Struct {
  Pointer<SDL_Surface> dst;
  @Int32()
  int identity;
  Pointer<SDL_blit> blit;
  Pointer<Void> data;
  Pointer<SDL_BlitInfo> info;
  @Uint32()
  int dst_palette_version;
  @Uint32()
  int src_palette_version;
}

class SDL_Color extends Struct {
  @Uint8()
  int r;
  @Uint8()
  int g;
  @Uint8()
  int b;
  @Uint8()
  int a;
}

class SDL_Palette extends Struct {
  @Int64()
  int ncolors;
  Pointer<SDL_Color> colors;
  @Uint32()
  int version;
  @Int32()
  int refcount;
}

class SDL_PixelFormat extends Struct {
  @Uint32()
  int format;

  Pointer<SDL_Palette> palette;
  @Uint8()
  int BitsPerPixel;
  @Uint8()
  int BytesPerPixel;

//  int padding[2];
  @Uint8()
  int padding;
  @Uint32()
  int Rmask;
  @Uint32()
  int Gmask;
  @Uint32()
  int Bmask;
  @Uint32()
  int Amask;
  @Uint8()
  int Rloss;
  @Uint8()
  int Gloss;
  @Uint8()
  int Bloss;
  @Uint8()
  int Aloss;
  @Uint8()
  int Rshift;
  @Uint8()
  int Gshift;
  @Uint8()
  int Bshift;
  @Uint8()
  int Ashift;
  @Int32()
  int refcount;
  Pointer<SDL_PixelFormat> next;
}

class SDL_Surface extends Struct {
  @Uint32()
  int flags;
  Pointer<SDL_PixelFormat> format;
  @Int32()
  int w;
  @Int32()
  int h;
  @Int32()
  int pitch;
  Pointer<Void> pixels;
  Pointer<Void> userdata;

  @Int32()
  int locked;
  Pointer<Void> lock_data;

  Pointer<SDL_Rect> clip_rect;

//  struct SDL_BlitMap *map;    /**< Private */

  @Int32()
  int refcount;
/**< Read-mostly */
}

class SDL_HitTest extends Struct {}

class SDL_Rect extends Struct {
  @Int32()
  int x;
  @Int32()
  int y;
  @Int32()
  int w;
  @Int32()
  int h;
}

class SDL_WindowShaper extends Struct {}

class SDL_WindowUserData extends Struct {}

class SDL_DisplayMode extends Struct {
  @Int32()
  int w;
  @Int32()
  int h;
  @Int32()
  int refresh_rate;
  Pointer driverdata;
}

class SDL_Window extends Struct {
  Pointer<Void> magic;
  @Int32()
  int id;
  Pointer<Utf8> title;
  Pointer<SDL_Surface> icon;
  @Int32()
  int x;
  @Int32()
  int y;
  @Int32()
  int w;
  @Int32()
  int h;
  @Int32()
  int min_x;
  @Int32()
  int min_y;
  @Int32()
  int min_w;
  @Int32()
  int min_h;
  @Uint32()
  int flags;
  @Uint32()
  int last_fullscreen_flags;
  Pointer<SDL_Rect> windowed;
  Pointer<SDL_DisplayMode> fullscreen_mode;
  @Double()
  double brighness;
  Pointer<Uint16> gamma;
  Pointer<Uint16> saved_gamma;
  Pointer<SDL_Surface> surface;
  @Int32()
  int surface_valid;
  @Int32()
  int is_hiding;
  @Int32()
  int is_destroying;
  Pointer<SDL_WindowShaper> shaper;
  Pointer<SDL_HitTest> hit_test;
  Pointer<Void> hit_test_data;
  Pointer<SDL_WindowUserData> data;
  Pointer<Void> driverdata;
  Pointer<SDL_Window> prev;
  Pointer<SDL_Window> next;
}
