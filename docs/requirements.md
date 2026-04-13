# Nutriq Requirements

## Functional Requirements

### FR-1: Food Diary
- FR-1.1: Log food items to 4 meal slots (Breakfast, Lunch, Dinner, Snacks)
- FR-1.2: Display daily calorie and macro totals per slot and per day
- FR-1.3: Allow drag-and-drop between meal slots
- FR-1.4: Support day copy and day delete operations
- FR-1.5: Record food entry timestamps for meal timing analysis

### FR-2: Food Database & Search
- FR-2.1: Search across 3 food databases (Open Food Facts, USDA FDC, USDA FDC-SR)
- FR-2.2: Display shimmer loading states during search
- FR-2.3: Show error state with retry on search failure
- FR-2.4: Present recent and frequent foods as default search results
- FR-2.5: Allow custom food creation with manual nutrition entry

### FR-3: Barcode Scanner
- FR-3.1: Scan barcodes using device camera
- FR-3.2: Auto-fill food entry from Open Food Facts lookup

### FR-4: AI Food Recognition
- FR-4.1: Classify food from camera capture using on-device TensorFlow Lite
- FR-4.2: Show confidence percentage for classification results
- FR-4.3: Allow manual search fallback if classification is incorrect

### FR-5: Macro & Micro Tracking
- FR-5.1: Track macronutrients (protein, carbs, fat) with daily % targets
- FR-5.2: Track micronutrients with daily percentage progress bars
- FR-5.3: Display macro pie chart on dashboard
- FR-5.4: Provide daily and weekly nutrition summaries

### FR-6: Recipe Builder
- FR-6.1: Create multi-ingredient recipes with reordering
- FR-6.2: Support adjustable servings per recipe
- FR-6.3: Save and list recipes for quick-add to diary

### FR-7: Weight Tracking
- FR-7.1: Log weight entries with date picker
- FR-7.2: Display weight trend chart with moving average
- FR-7.3: Calculate and display BMI
- FR-7.4: Show weight goal progress visualization

### FR-8: Body Measurements
- FR-8.1: Log 7 body metrics (waist, neck, hip, chest, bicep, thigh) with notes
- FR-8.2: Display trend charts with toggleable metric filter chips
- FR-8.3: Show measurement history list sorted by date

### FR-9: Water Tracking
- FR-9.1: Quick-add water entries (250ml, 500ml, custom)
- FR-9.2: Display daily water goal with progress ring
- FR-9.3: Show water entry list and summary widget on home

### FR-10: Exercise & Net Calories
- FR-10.1: Log physical activities and exercises
- FR-10.2: Calculate net calories (intake - exercise)
- FR-10.3: Adjust remaining daily calorie budget based on exercise
- FR-10.4: Display net calorie row and exercise impact list in diary

### FR-11: BMR / TDEE Calculator
- FR-11.1: Calculate BMR using Mifflin-St Jeor formula
- FR-11.2: Support TDEE method selection (IOM 2005, Mifflin-St Jeor)
- FR-11.3: Persist selected TDEE method to config
- FR-11.4: Display BMR/TDEE breakdown in profile

### FR-12: Intermittent Fasting
- FR-12.1: Live fasting countdown timer
- FR-12.2: Provide presets (16:8, 18:6, 20:4, OMAD, custom)
- FR-12.3: Track fasting history and streaks
- FR-12.4: Send start/end fasting notifications

### FR-13: Reminders & Notifications
- FR-13.1: Configurable meal time reminders
- FR-13.2: Daily nutrition summary notification
- FR-13.3: Notification settings screen

### FR-14: Progress Charts
- FR-14.1: Weekly calorie chart (daily totals)
- FR-14.2: Monthly calorie chart (30-day view)
- FR-14.3: Macro trend stacked bar chart
- FR-14.4: Weight trend chart with moving average
- FR-14.5: Export charts as images

### FR-15: Photo Progress
- FR-15.1: Capture or select progress photos
- FR-15.2: Side-by-side before/after comparison
- FR-15.3: Photo timeline sorted by date

### FR-16: Meal Planning
- FR-16.1: 7-day meal planner with B/L/D/S slots
- FR-16.2: Drag-and-drop meals between planner slots
- FR-16.3: Auto-generate shopping list from planned meals
- FR-16.4: Show nutrition preview for planned day/week

### FR-17: Health Integrations
- FR-17.1: Apple HealthKit bidirectional sync (weight, steps, workouts) on iOS
- FR-17.2: Google Health Connect bidirectional sync on Android
- FR-17.3: Platform auto-detection with sync status screen

### FR-18: Data Export / Import
- FR-18.1: Export user data as JSON or CSV
- FR-18.2: Import user data from JSON or CSV
- FR-18.3: AES-encrypted backup creation
- FR-18.4: Optional cloud backup (iCloud / Google Drive)

### FR-19: Onboarding
- FR-19.1: Introduction screens (4 pages + overview)
- FR-19.2: User profile setup (gender, height, weight, goal, PAL)
- FR-19.3: BMR/TDEE configuration during setup

### FR-20: Internationalization
- FR-20.1: Support English, German, Turkish
- FR-20.2: Never hardcode strings in UI; use generated `intl` classes

### FR-21: Daily Notes
- FR-21.1: Create, edit, and delete daily text notes
- FR-21.2: Associate notes with tracked days
- FR-21.3: Display notes on diary screen

### FR-22: Autopilot
- FR-22.1: AI-assisted daily logging suggestions based on history
- FR-22.2: Suggest foods based on patterns and time of day
- FR-22.3: Allow dismissal or acceptance of suggestions

### FR-23: Custom Trackers
- FR-23.1: Create user-defined trackers with custom names and units
- FR-23.2: Log entries against custom trackers with date and value
- FR-23.3: Display trend charts for custom tracker entries

### FR-24: Blood Glucose
- FR-24.1: Log blood glucose readings with timestamp and context (fasting, before meal, after meal, bedtime)
- FR-24.2: Display blood glucose trend chart over time
- FR-24.3: Show blood glucose history list

### FR-25: Medication
- FR-25.1: Create medications with name, dosage, and frequency
- FR-25.2: Log medication doses with date and time
- FR-25.3: Display medication list and dose history

### FR-26: Symptom Tracking
- FR-26.1: Log symptoms with type, severity (1-10), and optional notes
- FR-26.2: Display symptom trend chart over time
- FR-26.3: Show symptom history list

### FR-27: Calorie Cycling
- FR-27.1: Configure calorie cycling schedule (zigzag diet pattern)
- FR-27.2: Set different calorie targets per day of the week
- FR-27.3: Persist cycling configuration to app config

### FR-28: Food Grade
- FR-28.1: Display nutritional quality grade (Nutri-Score style) on food entries
- FR-28.2: Calculate grade from macro/micro profile
- FR-28.3: Show grade badge in diary and food detail

### FR-29: Allergens
- FR-29.1: Configure personal allergen list in settings
- FR-29.2: Flag foods containing user allergens with visual warning
- FR-29.3: Source allergen data from Open Food Facts

### FR-30: Recipe Import
- FR-30.1: Import recipes from URLs via web scraping
- FR-30.2: Parse ingredients, servings, and nutrition from recipe pages
- FR-30.3: Add imported recipe to recipe builder for editing

---

## Non-Functional Requirements

### NFR-1: Privacy
- NFR-1.1: All data stored locally on-device (Drift/SQLite)
- NFR-1.2: No mandatory cloud account or sync
- NFR-1.3: No telemetry, analytics, or tracking
- NFR-1.4: No data shared with third parties

### NFR-2: Performance
- NFR-2.1: Food search results appear within 2 seconds
- NFR-2.2: Diary screen renders within 500ms
- NFR-2.3: AI food classification completes within 3 seconds on-device

### NFR-3: Reliability
- NFR-3.1: Local data survives app updates (schema migration)
- NFR-3.2: Database migration must not lose existing data
- NFR-3.3: Export/import must produce byte-identical data round-trip

### NFR-4: Usability
- NFR-4.1: Responsive layout with adaptive navigation (drawer on desktop/tablet, bottom nav on mobile)
- NFR-4.2: Support iOS, Android, and Web platforms
- NFR-4.3: Accessible to screen readers (semantics on interactive elements)

### NFR-5: Maintainability
- NFR-5.1: Clean Architecture layer separation (Presentation / Domain / Data)
- NFR-5.2: BLoC pattern for all state management
- NFR-5.3: Dependency injection via GetIt
- NFR-5.4: Zero lint warnings (`flutter analyze`)

### NFR-6: Licensing
- NFR-6.1: GPL-3.0
- NFR-6.2: All code open-source, no proprietary dependencies

---

## Traceability

| Feature Area | Requirements | Architecture Doc | Implementation |
|:---|:---|:---|:---|
| Food Diary | FR-1 | [architecture.md](architecture.md) | `lib/features/diary/` |
| Food Search | FR-2 | [architecture.md](architecture.md) | `lib/features/add_meal/` |
| Barcode | FR-3 | [architecture.md](architecture.md) | `lib/features/scanner/` |
| AI Scanner | FR-4 | [architecture.md](architecture.md) | `lib/features/ai_food_scanner/` |
| Macros/Micros | FR-5 | [architecture.md](architecture.md) | `lib/features/home/` |
| Recipes | FR-6 | [architecture.md](architecture.md) | `lib/features/recipe_builder/` |
| Weight | FR-7 | [architecture.md](architecture.md) | `lib/features/weight_tracking/` |
| Body Measurements | FR-8 | [architecture.md](architecture.md) | `lib/features/body_measurements/` |
| Water | FR-9 | [architecture.md](architecture.md) | `lib/features/water_tracking/` |
| Exercise | FR-10 | [architecture.md](architecture.md) | `lib/features/add_activity/` |
| BMR/TDEE | FR-11 | [architecture.md](architecture.md) | `lib/features/profile/` |
| Fasting | FR-12 | [architecture.md](architecture.md) | `lib/features/fasting_tracker/` |
| Notifications | FR-13 | [architecture.md](architecture.md) | `lib/features/notifications/` |
| Charts | FR-14 | [architecture.md](architecture.md) | `lib/features/progress_charts/` |
| Photos | FR-15 | [architecture.md](architecture.md) | `lib/features/photo_progress/` |
| Meal Planning | FR-16 | [architecture.md](architecture.md) | `lib/features/meal_planning/` |
| Health Sync | FR-17 | [architecture.md](architecture.md) | `lib/features/health_sync/` |
| Data Sync | FR-18 | [architecture.md](architecture.md) | `lib/features/data_sync/` |
| Onboarding | FR-19 | [architecture.md](architecture.md) | `lib/features/onboarding/` |
| i18n | FR-20 | [architecture.md](architecture.md) | `lib/l10n/`, `lib/generated/` |
| Daily Notes | FR-21 | [architecture.md](architecture.md) | `lib/features/daily_notes/` |
| Autopilot | FR-22 | [architecture.md](architecture.md) | `lib/features/autopilot/` |
| Custom Trackers | FR-23 | [architecture.md](architecture.md) | `lib/features/custom_trackers/` |
| Blood Glucose | FR-24 | [architecture.md](architecture.md) | `lib/features/blood_glucose/` |
| Medication | FR-25 | [architecture.md](architecture.md) | `lib/features/medication/` |
| Symptom Tracking | FR-26 | [architecture.md](architecture.md) | `lib/features/symptom_tracking/` |
| Calorie Cycling | FR-27 | [architecture.md](architecture.md) | `lib/features/calorie_cycling/` |
| Food Grade | FR-28 | [architecture.md](architecture.md) | `lib/features/food_grade/` |
| Allergens | FR-29 | [architecture.md](architecture.md) | `lib/features/allergens/` |
| Recipe Import | FR-30 | [architecture.md](architecture.md) | `lib/features/recipe_import/` |