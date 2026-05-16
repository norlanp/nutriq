// Barrel file — re-exports all providers for backward compatibility.
// Prefer importing from the specific sub-file when possible.

// Core — services
export 'service_providers.dart';

// Core — config
export 'config_providers.dart';

// Core — user
export 'user_providers.dart';

// Core — intake
export 'intake_providers.dart';

// Core — goals
export 'goal_providers.dart';

// Core — user activity
export 'user_activity_providers.dart';

// Core — tracked day
export 'tracked_day_providers.dart';

// Core — weight
export 'weight_providers.dart';

// Core — notification
export 'notification_providers.dart';

// Core — water
export 'water_providers.dart';

// Core — fasting
export 'fasting_providers.dart';

// Core — exercise
export 'exercise_providers.dart';

// Core — widget
export 'widget_providers.dart';

// Features
export '../../features/meal_plan/providers/meal_plan_providers.dart';
export '../../features/photo_progress/providers/photo_progress_providers.dart';
export '../../features/body_measurement/providers/body_measurement_providers.dart';
export '../../features/daily_note/providers/daily_note_providers.dart';
export '../../features/autopilot/providers/autopilot_providers.dart';
export '../../features/calorie_cycling/providers/calorie_cycling_providers.dart';
export '../../features/food_grade/providers/food_grade_providers.dart';
export '../../features/custom_tracker/providers/custom_tracker_providers.dart';
export '../../features/symptom/providers/symptom_providers.dart';
export '../../features/medication/providers/medication_providers.dart';
export '../../features/blood_glucose/providers/blood_glucose_providers.dart';
export '../../features/add_meal/providers/add_meal_providers.dart';
export '../../features/recipe_builder/providers/recipe_providers.dart';
export '../../features/ai_food_scanner/providers/ai_food_scanner_providers.dart';
export '../../features/voice_logging/providers/voice_logging_providers.dart';
export '../../features/menu_scan/providers/menu_scan_providers.dart';
export '../../features/health_sync/providers/health_sync_providers.dart';
export '../../features/data_sync/providers/data_sync_providers.dart';