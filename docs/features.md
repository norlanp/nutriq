# Nutriq Features

> Privacy-first, open-source nutrition tracker. No ads. No subscriptions. No cloud lock-in.
> All data stays on your device --- _you_ own it.

---

## Feature Overview

```
 +-------------------------------------------------------------------+
 |                        NUTRIQ AT A GLANCE                         |
 +-------------------------------------------------------------------+
 |                                                                   |
 |  [ Food Diary ]   [ Barcode Scan ]   [ AI Scanner ]              |
 |       |               |                  |                       |
 |       v               v                  v                       |
 |  +--------+    +-----------+     +-------------+                  |
 |  |  Log   |--->|  Scan     |---->|  Classify   |                  |
 |  | Meals  |    |  Barcode |     |  with AI    |                   |
 |  +--------+    +-----------+     +-------------+                  |
 |       |                                                           |
 |       v                                                           |
 |  +------------------------------------------+                    |
 |  |           DAILY DASHBOARD                |                    |
 |  |  Calories | Macros | Micros | Water      |                    |
 |  |  Fasting  | Exercise | Net Cals          |                    |
 |  +------------------------------------------+                    |
 |       |            |            |            |                    |
 |       v            v            v            v                    |
 |  +--------+  +--------+  +---------+  +---------+               |
 |  | Weight |  | Body   |  | Photo   |  | Progress|               |
 |  | Track  |  | Meas.  |  | Progress|  | Charts |                |
 |  +--------+  +--------+  +---------+  +---------+               |
 |       |            |            |                                  |
 |       v            v            v                                  |
 |  +---------------------------------------------------+           |
 |  |           INSIGHTS & TRENDS                        |           |
 |  |  BMR/TDEE  |  BMI  |  Weekly/Monthly Charts        |           |
 |  |  Goal Progress  |  Meal Timing Patterns            |           |
 |  +---------------------------------------------------+           |
 |                                                                   |
 |  [ Meal Planning ]  [ Recipes ]  [ Health Sync ]  [ Reminders ]  |
 |  [ Data Export ]   [ i18n ]     [ Onboarding ]  [ Web Support ] |
 +-------------------------------------------------------------------+
```

---

## Feature Comparison Matrix

| Feature | Nutriq | OpenNutriTracker | MyFitnessPal |
|:---|:---:|:---:|:---:|
| **Food Diary (B/L/D/S)** | **Yes** | Yes | Yes |
| **Barcode Scanner** | **Yes** | Yes | Yes |
| **Food Database** | 3 sources + custom foods | 3 sources | 14M+ items |
| **AI Food Recognition** | **Yes** (on-device, free) | -- | Premium, cloud |
| **Custom Food Creation** | **Yes** | -- | Yes |
| **Macro Tracking** | **Yes** (+ weekly summary) | Basic | Yes |
| **Micronutrient Tracking** | **Yes** (with % targets) | -- | Premium |
| **Saved Meals / Recipes** | **Yes** (full recipe builder) | Custom meals only | Yes |
| **Weight Tracking** | **Yes** (trends + BMI) | -- | Yes |
| **Body Measurements** | **Yes** (7 metrics + charts) | -- | Yes |
| **Water Tracking** | **Yes** (goal ring + quick-add) | -- | Yes |
| **Exercise / Net Calories** | **Yes** (adjusts daily budget) | Activity log only | Yes |
| **BMR Calculator** | **Yes** (Mifflin-St Jeor + selector) | Basic | Mifflin-St Jeor |
| **BMI Calculator** | **Yes** | -- | Yes |
| **Intermittent Fasting** | **Yes** (presets + streaks) | -- | Premium |
| **Meal Reminders** | **Yes** (local notifications) | -- | Premium |
| **Progress Charts** | **Yes** (weekly/monthly/macro/weight) | -- | Premium |
| **Photo Progress** | **Yes** (before/after + timeline) | -- | Premium |
| **Meal Planning** | **Yes** (7-day + shopping list) | -- | Premium |
| **Health Kit / Health Connect** | **Yes** (bidirectional sync) | -- | 35+ devices |
| **Data Export / Import** | **Yes** (JSON/CSV + encrypted backup) | -- | Premium |
| **Food Timestamps** | **Yes** (meal timing patterns) | -- | Yes |
| **Onboarding Flow** | **Yes** (profile + goal setup) | Basic | Yes |
| **Internationalization** | 3 languages (EN/DE/TR) | 3 languages | 20+ |
| **Web Support** | **Yes** (iOS + Android + Web) | Mobile only | Web + Mobile |
| **Ad-Free** | **Yes** (always) | Yes | No (freemium) |
| **No Subscription** | **Yes** (all features free) | Yes | Premium required |
| **Open Source** | **Yes** (GPL-3.0) | Yes (GPL-3.0) | No |
| **Privacy / Local-First** | **Yes** (all data on-device) | Yes | Cloud-synced |

### Legend

```
  Yes  =  Fully available, no paywall
   --  =  Not available
  Premium  =  Requires paid subscription (MFP)
```

---

## Feature Details

### Food & Nutrition

```
 Food Entry Flow
 ===============

  [ Search ] ---or--> [ Scan Barcode ] ---or--> [ AI Camera ]
      |                     |                         |
      v                     v                         v
  +---------+        +----------+            +-------------+
  | Shimmer  |        | OFF/FDC  |            | TensorFlow  |
  | Loading  |        | Lookup   |            | Lite Classify|
  +---------+        +----------+            +-------------+
      |                     |                         |
      v                     v                         v
  [ Select Result ]  [ Auto-fill Entry ]     [ Confirm + Edit ]
      |                     |                         |
      +---------------------+-------------------------+
                            |
                            v
                  [ Add to Diary (B/L/D/S) ]
                            |
                            v
                  [ Macros + Micros Tracked ]
```

- **3 food databases**: Open Food Facts, USDA FDC, USDA FDC-SR
- **Custom food creation**: manual entry for all nutrition fields
- **Shimmer loading** states + **error with retry** on search
- **Recent / frequent foods** shown by default
- **Barcode scan** auto-fills food entry from OFF

### Diary & Tracking

```
 Daily View
 ==========

  +-----------------------------------------+
  |  Mon Apr 12    < Calendar Picker >       |
  +-----------------------------------------+
  |                                         |
  |  Breakfast  ................... 420 kcal |
  |  Lunch      ................... 650 kcal |
  |  Dinner     ................... 580 kcal |
  |  Snacks     ................... 180 kcal |
  |  -------------------------------------- |
  |  Exercise   ................... -220 kcal |
  |  ====================================== |
  |  Remaining  ................... 530 kcal |
  |                                         |
  |  [ Protein ] [ Carbs ] [ Fat ]          |
  |    120g       200g      65g             |
  |  [ Water ]   [ Fasting Timer ]          |
  |    1.5L / 2.5L  14h / 16h              |
  +-----------------------------------------+
```

- **4-slot diary**: Breakfast, Lunch, Dinner, Snacks
- **Drag-and-drop** between meal slots
- **Net calories**: exercise adjusts remaining budget in real time
- **Macro pie chart** + micronutrient progress bars
- **Day copy/delete** from popup menu

### Weight & Body

```
  Weight          Body Measurements        Photo Progress
  =======         =================        ==============

  80 |  *         Waist  ---*---           [ Before ]  [ After ]
  78 |    *       Neck   ---*---            |           |
  76 |      *     Hip    ---*---            v           v
  74 |        *   Chest  ---*---          Side-by-side
  72 |          * Bicep  ---*---          comparison
     --------     Thigh  ---*---          + timeline
     Apr  May     Toggle filter chips      by date
```

- **Weight logging** with date picker + trend line chart
- **BMI display** + weight goal progress ring
- **7 body metrics**: waist, neck, hip, chest, bicep, thigh (+ notes)
- **Trend charts** with toggleable metric filter chips
- **Photo progress**: capture, before/after comparison, date timeline

### BMR / TDEE / Goals

```
  TDEE Calculation
  ================

  BMR (Mifflin-St Jeor)
  │
  │  Men:   10 x weight(kg) + 6.25 x height(cm) - 5 x age - 5
  │  Women: 10 x weight(kg) + 6.25 x height(cm) - 5 x age + 161
  │
  v
  x  Activity Multiplier (TDEE Method)
  │
  │  IOM 2005 (default)  │  Mifflin-St Jeor
  │  Sedentary: 1.00     │  Sedentary: 1.20
  │  Low Active: 1.11    │  Light: 1.375
  │  Active: 1.25        │  Moderate: 1.55
  │  Very Active: 1.48   │  Very Active: 1.725
  │
  v
  Daily Kcal Goal
  │
  +-- Deficit / Surplus based on weight goal
```

- **Mifflin-St Jeor** formula (most accurate for general population)
- **TDEE method selector**: IOM 2005 or Mifflin-St Jeor
- **Method persisted** to config, adjustable from profile + calculations dialog
- **BMR / TDEE breakdown** shown in profile (BmrOverview widget)

### Fasting Timer

```
  +----------------------------+
  |  16 : 8  Intermittent     |
  |                            |
  |       14:23:05            |
  |     ============          |
  |    /            \         |
  |   |  87% complete |      |
  |    \            /         |
  |     ============          |
  |                            |
  |  [ Start ]  [ End ]       |
  |  Presets: 16:8 | 18:6     |
  |           20:4 | OMAD      |
  |  Streak: 5 days           |
  +----------------------------+
```

- **Live countdown** timer
- **Presets**: 16:8, 18:6, 20:4, OMAD, custom
- **Fasting history** + streak display
- **Start/end notifications**

### Progress Charts

```
  Weekly Calories         Monthly Macro Trend     Weight Trend
  ================        ====================    ============

  2200 |  _              C | ██████████           85 |  *
  2000 |_|_|_             a | ██ ██ ██ ██             |    *
  1800 |     |_           r | ██████ ██████       80 |      *
  1600 |       |          b | ████ ████ ████         |        *
       --------           s | ████████████        75 |          *
       M T W T F          +-------------------------------
```

- **Weekly calorie chart**: daily totals across week
- **Monthly calorie chart**: 30-day view
- **Macro trend**: stacked bar (protein / carbs / fat)
- **Weight trend** with moving average line
- **Chart export** as image (screenshot + share)

### Planning & Recipes

```
  Meal Plan (7-day grid)

       Mon    Tue    Wed    Thu    Fri    Sat    Sun
  B  [ oat ] [ egg ] [  -  ] [  -  ] [  -  ] [  -  ] [  -  ]
  L  [ sal ] [  -  ] [  -  ] [  -  ] [  -  ] [  -  ] [  -  ]
  D  [  -  ] [  -  ] [  -  ] [  -  ] [  -  ] [  -  ] [  -  ]
  S  [  -  ] [  -  ] [  -  ] [  -  ] [  -  ] [  -  ] [  -  ]

  [ Generate Shopping List ]    [ Nutrition Preview ]
```

- **7-day meal planner** with B/L/D/S slots
- **Drag-and-drop** meals between slots
- **Shopping list** auto-generated from planned meals
- **Nutrition preview** for planned day/week
- **Recipe builder**: multi-ingredient, reordering, servings

### Health Integrations

```
  +--------------------+       +--------------------+
  |   Apple HealthKit  |<----->|                    |
  |   (iOS)            |       |     Nutriq         |
  +--------------------+       |                    |
                               |  - Weight sync     |
  +--------------------+       |  - Steps sync      |
  |  Google Health      |<---->|  - Workouts sync   |
  |  Connect (Android) |       |                    |
  +--------------------+       +--------------------+
```

- **Apple HealthKit** (iOS): bidirectional weight, steps, workouts
- **Google Health Connect** (Android): same data types
- **Platform factory** pattern: auto-selects correct service
- **Sync status screen** + configurable permissions

### Data & Privacy

```
  Data Ownership
  ==============

  +----------+     +----------+     +-----------+
  | Local DB |---->| Export   |---->| JSON/CSV  |
  | (Drift/  |     | Screen  |     | File      |
  |  SQLite) |     +----------+     +-----------+
  +----------+            |
                          v
                   +-----------+     +-----------+
                   | Encrypted  |---->| Cloud     |
                   | AES Backup |    | (Optional)|
                   +-----------+     +-----------+

  No telemetry. No analytics. No cloud required.
```

- **All data on-device** in Drift/SQLite
- **JSON/CSV export/import** 
- **AES-encrypted backup** for cloud storage
- **Optional**: iCloud / Google Drive backup
- **No telemetry. No analytics. No account required.**

---

## Technical Summary

| | Detail |
|:---|:---|
| **Framework** | Flutter / Dart |
| **State Management** | flutter_bloc |
| **Local DB** | Drift (SQLite) |
| **Schema Version** | 13 (15 tables) |
| **DI** | GetIt |
| **i18n** | flutter_intl (EN / DE / TR) |
| **Platforms** | iOS, Android, Web |
| **Food DBs** | Open Food Facts, USDA FDC, USDA FDC-SR |
| **AI Model** | TensorFlow Lite (on-device) |
| **Health APIs** | HealthKit, Health Connect |
| **License** | GPL-3.0 |
| **Upstream** | [OpenNutriTracker](https://github.com/simonoppowa/OpenNutriTracker) |
| **Use Cases** | 48 |
| **Feature Modules** | 24 |

---

## Nutriq vs MyFitnessPal: Quick Verdict

```
  What you gain with Nutriq:
  ==========================
  + All features free (no premium paywall)
  + Privacy-first (no cloud, no data harvesting)
  + Open source (audit, contribute, fork)
  + AI food scanner (on-device, no cloud)
  + Intermittent fasting (free, MFP = premium)
  + Photo progress (free, MFP = premium)
  + Meal planning (free, MFP = premium)
  + Full data export (free, MFP = premium)
  + Ad-free (always)

  What you trade off:
  ===================
  - Smaller food database (3 sources vs 14M+)
  - 3 languages vs 20+
  - No social / community features
  - No wearable direct-sync (uses HealthKit/Health Connect as bridge)
```