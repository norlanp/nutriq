# System Architecture: Nutriq

## Overview
Nutriq is built using **Clean Architecture** and the **BLoC (Business Logic Component) pattern**. The goal is to separate concerns, ensuring that the business logic is independent of the UI, framework, and external data sources.

## Layered Architecture

### 1. Presentation Layer
The presentation layer is responsible for the UI and interacting with the user.
- **Widgets**: Lean components that render the UI based on state.
- **BLoCs**: Manage the state of a particular feature. They receive events from the UI and emit new states.
- **State**: Immutable objects (extending `Equatable`) that represent the current state of the UI.
- **Events**: Signal user actions or system triggers that the BLoC should handle.

### 2. Domain Layer
The core of the application, containing purely business logic and rules. It is independent of any other layer.
- **Entities**: Core business models (e.g., `ConfigEntity`, `UserEntity`, `WeightEntity`, `BodyMeasurementEntity`).
- **Use Cases**: Classes that orchestrate the flow of data to and from the repositories to perform a specific business action.
- **Repository Interfaces**: Abstract definitions of how the data layer should behave.

### 3. Data Layer
The implementation of data retrieval and persistence.
- **Repositories**: Implement the interfaces defined in the Domain layer. They decide whether to fetch data from a local source or a remote API.
- **Data Sources**: Low-level implementations for network calls (`http`, `supabase`) or local database operations (`drift`/SQLite).
- **DTOs/DBOs (Data Transfer/Database Objects)**: Specialized objects used for serialization/deserialization. These are converted to Entities before entering the Domain layer.

## Data Flow
`UI (Widget)` $\rightarrow$ `Event` $\rightarrow$ `BLoC` $\rightarrow$ `Use Case` $\rightarrow$ `Repository` $\rightarrow$ `Data Source` $\rightarrow$ `DB/API` $\rightarrow$ (Reverse flow for Response)

## Key Technical Choices
- **State Management**: `flutter_bloc` for predictable state transitions and separation of logic.
- **Dependency Injection**: `get_it` (via `locator.dart`) for decoupling components and improving testability.
- **Local Persistence**: `drift` (SQLite) for type-safe relational storage.
- **Localization**: `flutter_intl` for multi-language support (EN/DE/TR).
- **Networking**: `http` and `supabase_flutter` for remote data interaction.

## Project Structure
- `lib/core/`: Shared logic, utilities, styles, and common domain/data components.
- `lib/features/`: Feature-specific modules, each containing its own presentation, domain, and data layers.
- `test/`: Unit and widget tests to ensure reliability.

## Component Inventory

| Layer | Component | Count |
|:---|:---|:---|
| **Data** | Drift tables | 15 |
| **Data** | DAOs | 15 |
| **Data** | Data sources | 15 |
| **Data** | Repository implementations | 15 |
| **Domain** | Entities | 22 |
| **Domain** | Repository interfaces | 14 |
| **Domain** | Use cases | 48 |
| **Presentation** | Feature modules | 24 |
| **Presentation** | Core shared widgets | 28 |
| **Infrastructure** | DB schema version | 13 |
| **Infrastructure** | Languages (i18n) | 3 |
| **Infrastructure** | Platforms | 3 (iOS, Android, Web) |

## Feature Modules

```
lib/features/
├── activity_detail/       Activity detail bottom sheet
├── add_activity/          Exercise/activity logging
├── add_meal/              Food search, barcode, custom food
├── ai_food_scanner/       On-device TF Lite food classification
├── body_measurements/     Body metric logging + trends
├── data_sync/             Export/import, cloud backup
├── diary/                 4-slot food diary + calendar
├── edit_meal/             Edit existing food entries
├── fasting_tracker/       Intermittent fasting timer + history
├── health_sync/           HealthKit / Health Connect
├── home/                  Dashboard, macros, daily summary
├── meal_detail/           Food detail bottom sheet
├── meal_planning/         7-day planner + shopping list
├── meal_timing/           Meal timing pattern analysis
├── notifications/         Reminder settings
├── onboarding/            First-run setup flow
├── photo_progress/        Before/after photo comparison
├── profile/               User profile, BMR/BMI, goal setup
├── progress_charts/       Weekly/monthly trend charts
├── recipe_builder/        Multi-ingredient recipe builder
├── scanner/               Barcode scanner
├── settings/              App settings, calculations dialog
├── water_tracking/        Water tracker + goal ring
└── weight_tracking/       Weight log + trends + BMI
```

## Database Schema

| Table | Purpose |
|:---|:---|
| `config_entries` | App configuration, goals, TDEE method |
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
| `ai_model_metadata` | On-device ML model info |
| `meal_plans` | Meal plan entries |
| `photo_progress_entries` | Progress photo records |
| `body_measurements` | Body metric entries |

## See Also
- [Feature Comparison](features.md) — Nutriq vs OpenNutriTracker vs MyFitnessPal
- [Requirements](requirements.md) — Functional and non-functional requirements
- [Implementation Plan](IMPLEMENTATION_PLAN.md) — Phase-by-phase feature roadmap