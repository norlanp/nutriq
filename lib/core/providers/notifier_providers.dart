import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return AppThemeEntity.system.toThemeMode();
  }

  void setTheme(AppThemeEntity appTheme) {
    state = appTheme.toThemeMode();
  }

  void initFromSaved(AppThemeEntity appTheme) {
    state = appTheme.toThemeMode();
  }
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);