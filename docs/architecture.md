# System Architecture: Nutriq

## Overview
Nutriq is built using **Clean Architecture** and the **Riverpod Notifier pattern**. The goal is to separate concerns, ensuring that the business logic is independent of the UI, framework, and external data sources.

## Layered Architecture

### 1. Presentation Layer
The presentation layer is responsible for the UI and interacting with the user.
- **Widgets**: Lean components that render the UI based on state.
- **Notifiers**: Manage the state of a particular feature using Riverpod `Notifier` and `AsyncNotifier`. They expose methods that update state immutably.
- **State**: Immutable objects (extending `Equatable` or using `freezed`) that represent the current state of the UI.

### 2. Domain Layer
The core of the application, containing purely business logic and rules. It is independent of any other layer.
- **Entities**: Core business models (e.g., `ConfigEntity`, `UserEntity`, `WeightEntity`, `BodyMeasurementEntity`).
- **Use Cases**: Classes that orchestrate the flow of data to and from the repositories to perform a specific business action.
- **Repository Interfaces**: Abstract definitions of how the data layer should behave.

### 3. Data Layer
The implementation of data retrieval and persistence.
- **Repositories**: Implement the interfaces defined in the Domain layer. They decide whether to fetch data from a local source or a remote API.
- **Data Sources**: Low-level implementations for network calls (`dio`) or local database operations (`drift`/SQLite).
- **DTOs/DBOs (Data Transfer/Database Objects)**: Specialized objects used for serialization/deserialization. These are converted to Entities before entering the Domain layer.

## Data Flow
`UI (Widget)` $\rightarrow$ `Notifier method call` $\rightarrow$ `Notifier` $\rightarrow$ `Use Case` $\rightarrow$ `Repository` $\rightarrow$ `Data Source` $\rightarrow$ `DB/API` $\rightarrow$ (Reverse flow for State)

## Key Technical Choices
- **State Management**: `flutter_riverpod` with `Notifier` and `AsyncNotifier` for predictable state transitions and separation of logic.
- **Dependency Injection**: `flutter_riverpod` for decoupling components and improving testability.
- **Local Persistence**: `drift` (SQLite) for type-safe relational storage.
- **Localization**: `flutter_intl` for multi-language support (EN/DE/TR).
- **Networking**: `dio` for remote data interaction.

> **Note**: Sentry reporting is disabled by default. It initializes only for release builds after the user opts in to anonymous data sharing.

## Project Structure
- `lib/core/`: Shared logic, utilities, styles, and common domain/data components.
- `lib/features/`: Feature-specific modules, each containing its own presentation, domain, and data layers.
- `test/`: Unit and widget tests to ensure reliability.

## Supported Platforms

Nutriq has Android and iOS platform projects. Web, desktop, and cloud synchronization are not currently supported.

## Feature Modules

```text
lib/features/
├── activity_detail/       Activity detail bottom sheet
├── add_activity/          Exercise/activity logging
├── add_meal/              Food search, barcode, custom food
├── ai_food_scanner/       On-device TF Lite food classification
├── allergens/             Allergen detection and settings
├── autopilot/             AI-assisted daily logging
├── blood_glucose/         Blood glucose tracking + trends
├── body_measurements/     Body metric logging + trends
├── calorie_cycling/       Calorie cycling (zigzag diet)
├── custom_trackers/       User-defined metric trackers
├── daily_notes/           Daily journal/notes
├── data_sync/             Export/import and local encrypted backup UI
├── diary/                 4-slot food diary + calendar
├── edit_meal/             Edit existing food entries
├── fasting_tracker/       Intermittent fasting timer + history
├── food_grade/            Food quality grading (Nutri-Score)
├── health_sync/           HealthKit / Health Connect
├── home/                  Dashboard, macros, daily summary
├── meal_detail/           Food detail bottom sheet
├── meal_planning/         7-day planner + shopping list
├── meal_timing/           Meal timing pattern analysis
├── medication/             Medication tracking + logging
├── notifications/         Reminder settings
├── onboarding/            First-run setup flow
├── photo_progress/        Before/after photo comparison
├── profile/               User profile, BMR/BMI, goal setup
├── progress_charts/       Weekly/monthly trend charts
├── recipe_builder/        Multi-ingredient recipe builder
├── recipe_import/         Import recipes from URLs
├── scanner/               Barcode scanner
├── settings/              App settings, calculations dialog
├── symptom_tracking/      Symptom logging + trend charts
├── water_tracking/        Water tracker + goal ring
└── weight_tracking/       Weight log + trends + BMI
```

## Database Schema

| Table | Purpose |
|:---|:---|
| `config_entries` | App configuration, goals, TDEE method, calorie cycling, exercise mode |
| `users` | User profile (gender, height, weight, PAL) |
| `meals` | Food entries with nutrition data |
| `intakes` | Meal-to-slot assignments (B/L/D/S) |
| `tracked_days` | Daily tracking records |
| `user_activities` | Logged exercises and activities |
| `weights` | Weight entries |
| `recipes` | Saved recipe headers |
| `recipe_items` | Recipe ingredient lines |
| `notification_settings` | Reminder configuration |
| `water_entries` | Water intake records |
| `fasts` | Fasting session records |
| `ai_model_metadata_entries` | On-device ML model info |
| `meal_plans` | Meal plan entries |
| `photo_progress_entries` | Progress photo records |
| `body_measurements` | Body metric entries |
| `daily_notes` | Daily journal entries |
| `symptoms` | Symptom tracking entries |
| `medications` | Medication definitions |
| `medication_logs` | Medication dose records |
| `blood_glucose_entries` | Blood glucose readings |
| `custom_trackers` | User-defined tracker definitions |
| `custom_tracker_entries` | User-defined tracker values |
| `autopilot_entries` | AI-assisted daily log suggestions |

## See Also
- [Feature Comparison](features.md) — Nutriq vs MyFitnessPal
- [Requirements](requirements.md) — Functional and non-functional requirements
- [Features](features.md) — Full feature breakdown and comparison
