import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/providers/notifier_providers.dart';

void main() {
  group('ThemeModeNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is system theme mode', () {
      final themeMode = container.read(themeModeProvider);
      expect(themeMode, ThemeMode.system);
    });

    test('setTheme updates state to light', () {
      container.read(themeModeProvider.notifier).setTheme(AppThemeEntity.light);
      expect(container.read(themeModeProvider), ThemeMode.light);
    });

    test('setTheme updates state to dark', () {
      container.read(themeModeProvider.notifier).setTheme(AppThemeEntity.dark);
      expect(container.read(themeModeProvider), ThemeMode.dark);
    });

    test('setTheme updates state to system', () {
      container
          .read(themeModeProvider.notifier)
          .setTheme(AppThemeEntity.system);
      expect(container.read(themeModeProvider), ThemeMode.system);
    });

    test('initFromSaved restores saved theme', () {
      container
          .read(themeModeProvider.notifier)
          .initFromSaved(AppThemeEntity.dark);
      expect(container.read(themeModeProvider), ThemeMode.dark);
    });

    test('setTheme overrides previous theme', () {
      container
          .read(themeModeProvider.notifier)
          .setTheme(AppThemeEntity.dark);
      container
          .read(themeModeProvider.notifier)
          .setTheme(AppThemeEntity.light);
      expect(container.read(themeModeProvider), ThemeMode.light);
    });
  });
}