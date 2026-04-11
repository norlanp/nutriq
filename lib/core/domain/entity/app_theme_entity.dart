import 'package:flutter/material.dart';

enum AppThemeEntity {
  light,
  dark,
  system;

  ThemeMode toThemeMode() {
    ThemeMode mode;
    switch (this) {
      case AppThemeEntity.light:
        mode = ThemeMode.light;
        break;
      case AppThemeEntity.dark:
        mode = ThemeMode.dark;
        break;
      case AppThemeEntity.system:
        mode = ThemeMode.system;
        break;
    }
    return mode;
  }
}
