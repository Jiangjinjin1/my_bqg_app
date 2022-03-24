import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show window;

class Screen {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
  static double get width {
    return Screen.mediaQuery.size.width;
  }

  static double get height {
    return Screen.mediaQuery.size.height;
  }

  static double get scale {
    return Screen.mediaQuery.devicePixelRatio;
  }

  static double get textScaleFactor {
    return Screen.mediaQuery.textScaleFactor;
  }

  static double get navigationBarHeight {
    return Screen.mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    return Screen.mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    return Screen.mediaQuery.padding.bottom;
  }

  static updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
