<p align="center">
  <img alt="Logo" src="assets/icon/ont_logo_square.png" width="128" />
  <h1 align="center">Nutriq</h1>
</p>

<p align="center">
  <a href="https://opensource.org/licenses/MIT" alt="License">
        <img src="https://img.shields.io/badge/license-GPLv3-blue" /></a>
  <a href="https://github.com/norlanp/nutriq/stargazers" alt="GitHub Stars">
        <img src="https://img.shields.io/github/stars/norlanp/nutriq.svg" /></a>
  <a href="https://github.com/norlanp/nutriq/issues" alt="GitHub Issues">
        <img src="https://img.shields.io/github/issues/norlanp/nutriq.svg" /></a>
  <a href="https://github.com/norlanp/nutriq/pulls" alt="GitHub Pull Requests">
        <img src="https://img.shields.io/github/issues-pr/norlanp/nutriq.svg" /></a>
</p>

## Description

Nutriq is a privacy-first, open-source nutrition tracker with all features free — no ads, no subscriptions, no cloud lock-in. All data stays on your device.

Originally forked from [OpenNutriTracker](https://github.com/simonoppowa/OpenNutriTracker), Nutriq adds MyFitnessPal-inspired features while keeping your data local and private.

[Website](https://simonoppowa.github.io/Nutriq-Website/)

## Screenshots
<p align="center">
  <img alt="Logo" src="fastlane/metadata/android/en-US/images/phoneScreenshots/1_en-US.png" width="20%" />
  &nbsp;&nbsp;
  <img alt="Logo" src="fastlane/metadata/android/en-US/images/phoneScreenshots/2_en-US.png" width="20%" />
  &nbsp;&nbsp;
  <img alt="Logo" src="fastlane/metadata/android/en-US/images/phoneScreenshots/3_en-US.png" width="20%" />
  &nbsp;&nbsp;
  <img alt="Logo" src="fastlane/metadata/android/en-US/images/phoneScreenshots/4_en-US.png" width="20%" />
</p>

## Install
[<img src="fastlane/metadata/android/en-US/images/appstore_banner.png" width="30%">](https://apps.apple.com/us/app/opennutritracker/id6451490901)
[<img src="fastlane/metadata/android/en-US/images/playstore_banner.png" width="30%">](https://play.google.com/store/apps/details?id=com.opennutritracker.ont.opennutritracker)

## Key Features

### Food & Nutrition
- **Food Diary** — 4-slot diary (Breakfast/Lunch/Dinner/Snacks) with drag-and-drop
- **Barcode Scanner** — Instant nutrition lookup from Open Food Facts
- **AI Food Recognition** — On-device TensorFlow Lite classifier (no cloud)
- **Custom Food Creation** — Manual entry for any food not in the database
- **3 Food Databases** — Open Food Facts, USDA FDC, USDA FDC-SR
- **Macro + Micro Tracking** — Full macronutrients and micronutrients with daily % targets
- **Recipe Builder** — Multi-ingredient recipes with servings and reordering
- **Food Timestamps** — Time-of-day logging with meal timing pattern analysis

### Health & Body
- **Weight Tracking** — Logging, trend charts, BMI display, goal progress
- **Body Measurements** — 7 metrics (waist, neck, hip, chest, bicep, thigh) + trend charts
- **Water Tracking** — Daily goal with progress ring and quick-add buttons
- **BMR/TDEE Calculator** — Mifflin-St Jeor formula, selectable TDEE method
- **Exercise Calories** — Net calorie adjustment, exercise adjusts daily budget

### Planning & Insights
- **Meal Planning** — 7-day planner with shopping list generation
- **Intermittent Fasting** — Timer with presets (16:8, 18:6, 20:4, OMAD) + streaks
- **Progress Charts** — Weekly/monthly calories, macro trends, weight trends
- **Photo Progress** — Before/after comparison + date timeline

### Platform & Data
- **Health Integrations** — Apple HealthKit (iOS), Google Health Connect (Android)
- **Data Export/Import** — JSON/CSV + AES-encrypted backup
- **Reminders** — Configurable meal time and daily summary notifications
- **Multi-Platform** — iOS, Android, and Web
- **3 Languages** — English, German, Turkish
- **Privacy-First** — All data stored locally in SQLite, no cloud required, no telemetry

See [docs/features.md](docs/features.md) for a full feature comparison against MyFitnessPal.

## Privacy
See [Data Protection](https://www.iubenda.com/privacy-policy/53501884)
- **Data Encryption**: All user data is encrypted and stored locally on your device
- **Minimal Data Collection**: Nutriq does not collect or share any personal data. No accounts, no telemetry, no analytics.
- **Open-Source**: Nutriq is an open-source application (GPL-3.0)

## TODOs
- ~~Add serving sizes to meals~~
- ~~Add Imperial unit support~~
- Add support for Material You themes

## Contribution
Contributions to Nutriq are welcome! If you find any issues or have suggestions for new features, please open an issue or submit a pull request. Make sure to follow the project's code style and guidelines.

## Getting Started
See the [Getting Started](GettingStarted.md) file for more information.

## Architecture
See [docs/architecture.md](docs/architecture.md) for the system architecture and [docs/IMPLEMENTATION_PLAN.md](docs/IMPLEMENTATION_PLAN.md) for the implementation roadmap.

## Disclaimer
Nutriq is not a medical application. All data provided is not validated and should be used with caution. Please maintain a healthy lifestyle and consult a professional if you have any problems. Use during illness, pregnancy or lactation is not recommended.

## Acknowledgments
Nutriq is a fork of [OpenNutriTracker](https://github.com/simonoppowa/OpenNutriTracker) by Simon Oppowa.
The food database is powered by [Open Food Facts](https://world.openfoodfacts.org/) and [Food Data Central](https://fdc.nal.usda.gov/).

## License
This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for more information.