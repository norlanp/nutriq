# Calorie Tracker Implementation Plan

Fork of Nutriq with MyFitnessPal-inspired feature enhancements.

## Project Overview

Base: Nutriq (GPL-3.0)
Target: Privacy-first, fully-free calorie tracker with MFP-inspired features
Location: `/Users/norlan/code/mycal`

## Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Data Storage | Privacy-first, local-only | Matches ONT ethos, no cloud dependency |
| Platforms | iOS, Android, Web | Flutter multi-platform (Desktop removed) |
| License | GPL-3.0 | Required by ONT fork |
| Monetization | Fully free, open-source | No premium tier, no ads, no subscriptions |

## Feature Gap Analysis

| Feature | ONT | MFP | Target | Status |
|---------|-----|-----|--------|--------|
| Food diary | Basic diary | 4-slot diary (B/L/D/S) | 4-slot diary | ✅ |
| Barcode scanner | Yes | Yes | Yes (existing) | ✅ |
| Food database | 3 sources | 14M+ items | Keep 3 sources, improve UX | ✅ |
| Macro/micro tracking | Basic macros | Full macro + micronutrients | Full macro + micronutrients | ✅ |
| Saved meals/recipes | Custom meals only | My Meals + full recipes | Full recipes + meal presets | ✅ |
| Weight tracking | Not present | Full weight logging + graph | Weight log + trends | ✅ |
| Body measurements | Not present | Waist, neck, etc. | Optional measurements | ✅ |
| Water tracking | Not present | Hydration tracker | Daily water tracker | ✅ |
| Exercise calorie adjustment | Activity log | Net calories | Auto-adjust daily budget | ✅ |
| BMR/BMI calculator | Basic kcal goals | Mifflin-St Jeor | Enhanced calculator | ✅ |
| Reminders/notifications | Not present | Meal logging reminders | Local notifications | ✅ |
| Progress charts | Not present | Weekly/monthly trends | Trend charts | ✅ |
| Photo progress | Not present | Before/after photos | Local photo storage | ✅ |
| Intermittent fasting | Not present | Fasting timer (premium) | Fasting tracker (free) | ✅ |
| AI food recognition | Not present | Meal Scan (premium) | On-device ML (free) | ✅ |
| Meal planning | Not present | Weekly meal plans | Weekly planner + shopping list | ✅ |
| Health integrations | None | 35+ devices/apps | HealthKit, Health Connect | ✅ |


## Completed Work

### Project Setup & Architecture Fixes

- [x] Rename project from OpenNutriTracker to Nutriq (`bac3691`)
- [x] Migrate local storage from Hive to Drift/SQLite (`56f58a0`)
  - Drift tables, DAOs, and generated code for all existing entities
  - Removed all Hive DBOs, `.g.dart` adapters, `HiveDbProvider`, `SecureAppStorageProvider`
  - Data mappers layer (`lib/core/data/mapper/mappers.dart`)
  - Updated all 6 repositories to use Drift data sources
- [x] Add domain repository contracts (abstract interfaces) (`3bd6e90`)
  - `ConfigRepository`, `UserRepository`, `IntakeRepository`, `TrackedDayRepository`, `UserActivityRepository`, `PhysicalActivityRepository`
- [x] Add repository contract tests (`3bd6e90`)
- [x] Reorder DI registration to follow clean architecture layers: DataSources → Repositories → UseCases → BLoCs (`f498d47`)

### Phase 1.1: Meal Slot System ✅

Already implemented in upstream ONT. `IntakeTypeEntity` (B/L/D/S), `IntakeEntity.type`, Drift `type` column, `IntakeDao.getIntakesByDateAndType()`, `GetIntakeUsecase` per-type methods, `CalendarDayBloc` 4 separate lists, `DayInfoWidget` + `IntakeVerticalList` 4 sections with drag-and-drop.

### Phase 1.2: Saved Meals & Recipe Builder ✅

**Data Layer:**
- Drift tables: `Recipes` (id, name, servings, createdAt, updatedAt), `RecipeItems` (id, recipeId→Recipes, mealId, amount, unit)
- `RecipeDao` with CRUD, join queries (`getRecipeItemsWithMeals`), `RecipeItemWithMeal` helper class
- `RecipeDataSource` wrapping DAO
- DB schema bumped to v2 with `onUpgrade` migration
- Mappers added to `mappers.dart`: `mapRecipeEntityToCompanion`, `mapRecipeItemEntityToCompanion`, `mapRecipeToEntity`, `mapRecipeItemToEntity`

**Domain Layer:**
- `RecipeEntity` (id, name, servings, items, computed totals: totalKcal/Carbs/Fats/Proteins)
- `RecipeItemEntity` (id, recipeId, meal, amount, unit, computed totals)
- `RecipeRepository` abstract contract
- `GetRecipesUsecase`, `AddRecipeUsecase`, `DeleteRecipeUsecase`

**Presentation Layer:**
- `RecipeBloc` (LoadRecipesEvent, AddRecipeEvent, DeleteRecipeEvent → RecipesLoaded state)
- `RecipeListScreen` ("My Meals") — list all recipes with kcal + delete
- `RecipeBuilderScreen` — name/servings fields, reorderable ingredient list, add ingredient via AddMealScreen, save
- Routes: `recipeListRoute`, `recipeBuilderRoute` in `NavigationOptions` + `main.dart`
- "My Meals" entry added to `AddItemBottomSheet`

**DI:** `RecipeDao`, `RecipeDataSource`, `RecipeRepository`, 3 use cases, `RecipeBloc` registered in `locator.dart`

**l10n:** 8 new strings added to en/de/tr ARB files (myMealsLabel, noRecipesLabel, ingredientsLabel, recipeNameLabel, recipeServingsLabel, addIngredientLabel, saveRecipeLabel, recipeBuilderLabel)

## Implementation Phases

### Phase 1: Core Tracker Enhancements (Foundation)

**Goal:** Strengthen basic tracking capabilities to match MFP core functionality.

1. **Meal Slot System** ✅ *Already implemented in upstream ONT*
   - Restructure diary into Breakfast/Lunch/Dinner/Snacks slots
   - Modify `IntakeEntity` and `IntakeDataSource` to include meal type
   - Update diary UI to show meal grouping

2. **Saved Meals & Recipe Builder** ✅ *Implemented*
   - Add `RecipeEntity` and `SavedMealEntity` to domain
   - Create recipe builder UI (combine multiple foods into single recipe)
   - "My Meals" quick-add feature for frequent combinations

3. **Enhanced Macro/Micro Dashboard** ✅ *Implemented*
   - Extend `MealNutrimentsEntity` to include micronutrients
   - Add vitamin/mineral tracking with daily % targets
   - Macro pie charts using `fl_chart`
   - Daily/weekly nutrition summary view

4. **Weight & Progress Tracking** ✅ *Implemented*
   - New `WeightEntity`, Drift table, DAO, and `WeightDataSource`
   - Weight logging screen with date picker
   - Weight trend graph (line chart)
   - BMI calculator and display
   - Goal progress visualization

**New Packages:**
- `fl_chart: ^0.68.0` - Charts and graphs

**New Drift Tables:**
- `weight` - Weight entries
- `recipe` - User-created recipes
- `saved_meal` - Quick-add meal combinations

### Phase 2: Daily Habits & Engagement

**Goal:** Build habit-forming features and daily tracking completeness.

5. **Local Notifications/Reminders** ✅ *Implemented*
   - `flutter_local_notifications` setup
   - Configurable reminder times for meals
   - Daily summary notification

6. **Water Intake Tracker** ✅ *Implemented*
   - New `WaterEntity` and `WaterDataSource`
   - Quick-add water buttons (250ml, 500ml, custom)
   - Daily water goal with progress visualization

7. **Progress Charts** ✅ *Implemented*
   - Weekly/monthly calorie averages
   - Macro trend charts (stacked bar)
   - Weight trend with moving average
   - Export charts as images

8. **Exercise Calorie Adjustment** ✅ *Implemented*
   - Connect `UserActivityEntity` to daily calorie budget
   - Net calories calculation (consumed - burned)
   - Show remaining budget after exercise
   - Activity calorie impact on diary view

**New Packages:**
- `flutter_local_notifications: ^17.2.1+2` - Local notifications
- `permission_handler: ^11.3.1` - Notification permissions
- `screenshot: ^3.0.0` - Chart export

**New Drift Tables:**
- `water` - Water intake entries
- `notification_settings` - Reminder preferences

### Phase 3: Priority Advanced Features

**Goal:** Implement high-priority advanced features (user-selected).

9. **Health Platform Integrations** ✅ *Implemented*
   - Apple HealthKit integration (iOS)
   - Google Health Connect integration (Android)
   - Sync steps, workouts, weight
   - Bidirectional sync where supported

10. **AI Food Recognition (On-Device)** ✅ *Implemented*
     - TensorFlow Lite model for food classification
     - Camera capture and image preprocessing
     - Local inference (no cloud)
     - Fallback to manual search if low confidence

11. **Meal Planning** ✅ *Implemented*
     - Weekly meal planner UI
     - Drag-and-drop meals to days
     - Shopping list generation from meal plan
     - Nutrition preview for planned meals

12. **Intermittent Fasting Tracker** ✅ *Implemented*
     - Fasting window timer
     - Presets: 16:8, 18:6, 20:4, OMAD, custom
     - Fasting history and streaks
     - Notifications for fast start/end

**New Packages:**
- `health: ^10.2.0` - HealthKit/Health Connect
- `tflite_flutter: ^0.10.4` - TensorFlow Lite
- `image_picker: ^1.1.2` - Camera capture

**New Drift Tables:**
- `meal_plan` - Weekly meal plans
- `fasting` - Fasting session history
- `ai_model_metadata` - Model versioning

### Phase 4: Platform Expansion & Polish

**Goal:** Extend to web/desktop and add finishing touches.

13. **Web + Desktop Support** ✅ *Implemented* (iOS, Android, Web only; macOS removed)
     - Responsive layout adaptations
     - Platform-specific UI (Material for mobile, adaptive for desktop)
     - Keyboard shortcuts for desktop
     - Web-specific optimizations

14. **Food Timestamps** ✅ *Implemented*
     - Add time field to `IntakeEntity`
     - Time picker in food entry
     - Chronological meal display
     - Pattern analysis (meal timing trends)

15. **Data Sync (Optional)** ✅ *Implemented*
     - Local file-based export/import (JSON/CSV)
     - Optional encrypted backup sync via user's cloud storage (iCloud, Google Drive)
     - Keeps privacy-first approach

16. **Photo Progress** ✅ *Implemented*
     - Before/after photo storage
     - Side-by-side comparison view
     - Progress photo timeline

**New Packages:**
- `file_selector: ^1.0.3` - Desktop file picking
- `path_provider: ^2.1.5` - Cross-platform paths (existing, extend usage)
- `share_plus: ^9.0.0` - Share exports

### Phase 5: Remaining Feature Gaps

**Goal:** Close remaining feature gaps from the original MFP comparison.

17. **Body Measurements** ✅ *Implemented*
    - New `BodyMeasurementEntity`, Drift table, DAO, and `BodyMeasurementDataSource`
    - Measurement logging screen with date picker (waist, neck, hip, chest, bicep, thigh)
    - Measurement trend charts with toggleable metric filter chips
    - Measurement history list
    - Body measurements entry in bottom sheet navigation

18. **Food Database UX Improvements** ✅ *Implemented*
    - Shimmer loading states on search results
    - Error results widget with retry button
    - Recent/frequent foods section in default search state
    - Barcode scan → auto-fill food entry flow (verified existing)
    - Custom food creation screen with manual nutrition entry

19. **BMR Enhancement (Mifflin-St Jeor)** ✅ *Implemented*
    - Mifflin-St Jeor formula as alternative BMR calculation
    - Show BMR/TDEE breakdown in profile (BMROverview widget)
    - TDEE method selector dropdown in profile and calculations dialog
    - Calculation method persisted to config

**New Drift Tables:**
- `body_measurement` - Body measurement entries

## Architecture Principles

### Extending ONT Foundation

- **State Management:** Continue `flutter_bloc` + GetIt DI pattern
- **Clean Architecture:** Feature-first modules under `lib/features/`
- **Data Layer:** Drift/SQLite with tables and DAOs (migrated from Hive)
- **Domain Layer:** Extend entities for new features; repository contracts as abstract classes
- **Presentation Layer:** BLoCs per feature, reusable widgets

### New Patterns

- **Responsive UI:** Use `LayoutBuilder` and breakpoints for web/desktop
- **On-Device ML:** TensorFlow Lite models in `assets/models/`
- **Platform Channels:** Minimal native code for HealthKit/Health Connect

## Package Dependencies Summary

### Phase 1
```yaml
fl_chart: ^0.68.0
```

### Phase 2
```yaml
flutter_local_notifications: ^17.2.1+2
permission_handler: ^11.3.1
screenshot: ^3.0.0
```

### Phase 3
```yaml
health: ^10.2.0
tflite_flutter: ^0.10.4
image_picker: ^1.1.2
```

### Phase 4
```yaml
file_selector: ^1.0.3
share_plus: ^9.0.0
```

## File Structure Additions

```
lib/
  features/
    weight_tracking/          # Phase 1
    recipe_builder/             # Phase 1
    meal_planning/              # Phase 3
    fasting_tracker/            # Phase 3
    ai_food_scanner/            # Phase 3
    notifications/              # Phase 2
    water_tracking/             # Phase 2
    progress_charts/            # Phase 2
    health_sync/                # Phase 3
    photo_progress/             # Phase 4
  core/
    data/
      data_source/
        weight_data_source.dart
        water_data_source.dart
        recipe_data_source.dart
        meal_plan_data_source.dart
        fasting_data_source.dart
      drift/
        dao/
          weight_dao.dart
          water_dao.dart
          recipe_dao.dart
          meal_plan_dao.dart
          fasting_dao.dart
        tables/
          weight_table.dart
          water_table.dart
          recipe_table.dart
          meal_plan_table.dart
          fasting_table.dart
      mapper/
        weight_mapper.dart
        water_mapper.dart
        recipe_mapper.dart
        meal_plan_mapper.dart
        fasting_mapper.dart
      repository/
        weight_repository.dart
        water_repository.dart
        recipe_repository.dart
        meal_plan_repository.dart
        fasting_repository.dart
    domain/
      entity/
        weight_entity.dart
        water_entity.dart
        recipe_entity.dart
        meal_plan_entity.dart
        fasting_entity.dart
      repository/
        weight_repository.dart
        water_repository.dart
        recipe_repository.dart
        meal_plan_repository.dart
        fasting_repository.dart
      usecase/
        weight/
        water/
        recipe/
        meal_plan/
        fasting/
assets/
  models/
    food_classifier.tflite      # Phase 3 AI model
lib/
  features/
    body_measurements/          # Phase 5
      presentation/
        body_measurement_bloc.dart
        body_measurement_screen.dart
        widgets/
          measurement_trend_chart.dart
          measurement_history_list.dart
```

## Implementation Order Recommendation

1. Start with Phase 1 features (strongest foundation)
2. Weight tracking is highest user-requested feature gap
3. Meal slots system affects core diary - implement early
4. Phase 3 health integrations and AI recognition are complex - schedule adequate time

## Notes

- Keep all AI inference on-device to maintain privacy
- All health data stays local unless user explicitly syncs to HealthKit/Health Connect
- Maintain ONT's clean architecture patterns throughout
- Test thoroughly on all target platforms

---

Created: 2026-04-09
Last Updated: 2026-04-12
Status: All Phases Complete. All features implemented.
