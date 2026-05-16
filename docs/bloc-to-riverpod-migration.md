# BLoC to Riverpod Migration Summary

## Status: In Progress - Infrastructure Complete, Screen Migration Remaining

### Files Created (40 notifier files)

1. `lib/core/providers/notifier_providers.dart` - Central provider definitions for all 39 notifiers
2. `lib/core/utils/theme_mode_provider.dart` - Converted from ChangeNotifier to Riverpod StateNotifier
3. 39 feature-level notifier files in `lib/features/*/presentation/providers/`:

| Feature | Notifier File |
|---------|---------------|
| home | `providers/home_notifier.dart` (NEEDS RECREATION) |
| diary | `providers/diary_notifier.dart` |
| calendar_day | `providers/calendar_day_notifier.dart` |
| profile | `providers/profile_notifier.dart` |
| settings | `providers/settings_notifier.dart` |
| export_import | `providers/export_import_notifier.dart` |
| onboarding | `providers/onboarding_notifier.dart` |
| activities | `providers/activities_notifier.dart` |
| recent_activities | `providers/recent_activities_notifier.dart` |
| activity_detail | `providers/activity_detail_notifier.dart` |
| meal_detail | `providers/meal_detail_notifier.dart` |
| scanner | `providers/scanner_notifier.dart` |
| edit_meal | `providers/edit_meal_notifier.dart` |
| add_meal | `providers/add_meal_notifier.dart` |
| products | `providers/products_notifier.dart` |
| food | `providers/food_notifier.dart` |
| recent_meal | `providers/recent_meal_notifier.dart` |
| recipe | `providers/recipe_notifier.dart` |
| weight | `providers/weight_notifier.dart` |
| notification | `providers/notification_notifier.dart` |
| water | `providers/water_notifier.dart` |
| progress_charts | `providers/progress_charts_notifier.dart` |
| fasting | `providers/fasting_notifier.dart` |
| meal_plan | `providers/meal_plan_notifier.dart` |
| photo_progress | `providers/photo_progress_notifier.dart` |
| body_measurement | `providers/body_measurement_notifier.dart` |
| food_grade | `providers/food_grade_notifier.dart` |
| daily_note | `providers/daily_note_notifier.dart` |
| autopilot | `providers/autopilot_notifier.dart` |
| calorie_cycling | `providers/calorie_cycling_notifier.dart` |
| custom_tracker | `providers/custom_tracker_notifier.dart` |
| symptom | `providers/symptom_notifier.dart` |
| medication | `providers/medication_notifier.dart` |
| blood_glucose | `providers/blood_glucose_notifier.dart` |
| health_sync | `providers/health_sync_notifier.dart` |
| ai_scanner | `providers/ai_scanner_notifier.dart` |
| menu_scan | `providers/menu_scan_notifier.dart` |
| recipe_import | `providers/recipe_import_notifier.dart` |
| recipe_catalog | `providers/recipe_catalog_notifier.dart` |
| voice_logging | `providers/voice_logging_notifier.dart` |
| grocery_check | `providers/grocery_check_notifier.dart` |
| meal_timing | `providers/meal_timing_notifier.dart` |
| step_bonus | `providers/step_bonus_notifier.dart` |
| data_sync | `providers/data_sync_notifier.dart` |

### Files Modified

- `lib/main.dart` - Replaced `ChangeNotifierProvider` with Riverpod's `themeModeProvider`, removed `provider` package import, converted `NutriqApp` to `ConsumerWidget`
- `lib/core/utils/theme_mode_provider.dart` - Converted from `ChangeNotifier` to `StateNotifier<ThemeModeState>`
- `lib/pubspec.yaml` - Removed `flutter_bloc` and `provider` direct dependencies
- 98 files - Auto-updated imports from `bloc_providers.dart` to `notifier_providers.dart` and provider name mappings

### Files Deleted

- `lib/core/providers/bloc_providers.dart` - Replaced by `notifier_providers.dart`

### Remaining Work (Screen File Conversions)

The following pattern needs to be applied to each screen file:

**Before (BLoC pattern):**
```dart
final bloc = ref.read(xxxBlocProvider);
bloc.add(LoadEvent());
return BlocBuilder<XxxBloc, XxxState>(
  bloc: bloc,
  builder: (context, state) {
    if (state is XxxLoaded) { return ...; }
    return ...;
  },
);
```

**After (Riverpod pattern):**
```dart
ref.read(xxxProvider.notifier).loadData();
return Consumer(
  builder: (context, ref, _) {
    final state = ref.watch(xxxProvider);
    if (state is XxxLoaded) { return ...; }
    return ...;
  },
);
```

#### Screen files needing conversion (~54 files):

All files under:
- `lib/features/home/` (home_page.dart, intake_vertical_list.dart, medication_summary_widget.dart)
- `lib/features/diary/` (diary_page.dart)
- `lib/features/profile/` (profile_page.dart)
- `lib/features/settings/` (settings_screen.dart, export_import_dialog.dart)
- `lib/features/add_meal/` (add_meal_screen.dart, default_results_widget.dart)
- `lib/features/add_activity/` (add_activity_screen.dart)
- `lib/features/onboarding/` (onboarding_screen.dart)
- `lib/features/scanner/` (scanner_screen.dart)
- `lib/features/meal_detail/` (meal_detail_screen.dart, meal_detail_bottom_sheet.dart)
- `lib/features/edit_meal/` (edit_meal_screen.dart)
- `lib/features/weight_tracking/` (weight_tracking_screen.dart)
- `lib/features/recipe_builder/` (recipe_list_screen.dart, recipe_builder_screen.dart)
- `lib/features/notifications/` (notification_settings_screen.dart)
- `lib/features/water_tracking/` (water_tracker_screen.dart, water_tracker_summary_widget.dart)
- `lib/features/progress_charts/` (progress_charts_screen.dart)
- `lib/features/fasting_tracker/` (fasting_timer_screen.dart, fasting_history_screen.dart)
- `lib/features/meal_planning/` (meal_plan_screen.dart, shopping_list_screen.dart, meal_slot_widget.dart)
- `lib/features/photo_progress/` (photo_capture_screen.dart, photo_timeline_screen.dart)
- `lib/features/health_sync/` (health_sync_screen.dart)
- `lib/features/ai_food_scanner/` (ai_scanner_screen.dart, classification_results_screen.dart)
- `lib/features/meal_timing/` (meal_timing_screen.dart)
- `lib/features/body_measurements/` (body_measurement_screen.dart)
- `lib/features/recipe_import/` (recipe_import_screen.dart)
- `lib/features/recipe_catalog/` (recipe_catalog_screen.dart, recipe_detail_screen.dart)
- `lib/features/menu_scan/` (menu_scan_screen.dart, menu_items_screen.dart)
- `lib/features/voice_logging/` (voice_logging_screen.dart)
- `lib/features/grocery_check/` (grocery_check_screen.dart)
- `lib/features/daily_notes/` (daily_note_screen.dart)
- `lib/features/autopilot/` (autopilot_screen.dart)
- `lib/features/calorie_cycling/` (calorie_cycling_screen.dart)
- `lib/features/custom_trackers/` (custom_tracker_screen.dart)
- `lib/features/symptom_tracking/` (symptom_screen.dart)
- `lib/features/blood_glucose/` (blood_glucose_screen.dart)
- `lib/features/medication/` (medication_screen.dart, medication_log_screen.dart)
- `lib/features/step_bonus/` (step_bonus_screen.dart)
- `lib/features/data_sync/` (export_screen.dart, import_screen.dart, cloud_backup_settings_screen.dart)
- `lib/features/food_grade/` (food_grade_info_screen.dart)

#### Old BLoC files to delete (after screens are migrated):

All files matching `lib/features/**/presentation/bloc/*_bloc.dart`
All files matching `lib/features/**/presentation/*_bloc.dart`
All files matching `lib/features/**/presentation/*_event.dart`
All files matching `lib/features/**/presentation/*_state.dart`

#### Known issues to fix:
1. `home_notifier.dart` needs to be recreated (was deleted)
2. `notifier_providers.dart` has constructor issue with `ExportImportNotifier` (expects 3 args, provider only passes ref)
3. `ThemeModeState` needs `import 'package:flutter/material.dart'`
4. Some notifier files reference provider names that might have circular dependency issues (HomeNotifier -> diaryProvider, calendarDayProvider all in same file) - this is OK as long as `ref.read()` is used, not `ref.watch()`