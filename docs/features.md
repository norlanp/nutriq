# Nutriq Features

> Privacy-first, open-source nutrition tracker. No ads. No subscriptions. No cloud lock-in.
> All data stays on your device --- _you_ own it.

---

## Feature Overview

```text
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
 |  [ Autopilot ]  [ Food Grade ]  [ Allergens ]  [ Symptom Log ] |
 |  [ Daily Notes ] [ Blood Glucose ] [ Meds ] [ Custom Trackers ] |
 |  [ Calorie Cycling ]          [ Recipe Import ]                  |
 +-------------------------------------------------------------------+
```

---

## Feature Comparison Matrix

| Feature | Nutriq | MyFitnessPal |
|:---|:---:|:---:|
| **Food Diary (B/L/D/S)** | **Yes** | Yes |
| **Barcode Scanner** | **Yes** | Yes |
| **Food Database** | 3 sources + custom foods | 14M+ items |
| **AI Food Recognition** | **Yes** (on-device, free) | Premium, cloud |
| **Custom Food Creation** | **Yes** | Yes |
| **Macro Tracking** | **Yes** (+ weekly summary) | Yes |
| **Micronutrient Tracking** | **Yes** (with % targets) | Premium |
| **Saved Meals / Recipes** | **Yes** (full recipe builder) | Yes |
| **Weight Tracking** | **Yes** (trends + BMI) | Yes |
| **Body Measurements** | **Yes** (7 metrics + charts) | Yes |
| **Water Tracking** | **Yes** (goal ring + quick-add) | Yes |
| **Exercise / Net Calories** | **Yes** (adjusts daily budget) | Yes |
| **BMR Calculator** | **Yes** (Mifflin-St Jeor + selector) | Mifflin-St Jeor |
| **BMI Calculator** | **Yes** | Yes |
| **Intermittent Fasting** | **Yes** (presets + streaks) | Premium |
| **Meal Reminders** | **Yes** (local notifications) | Premium |
| **Progress Charts** | **Yes** (weekly/monthly/macro/weight) | Premium |
| **Photo Progress** | **Yes** (before/after + timeline) | Premium |
| **Meal Planning** | **Yes** (7-day + shopping list) | Premium |
| **Health Kit / Health Connect** | **Yes** (bidirectional sync) | 35+ devices |
| **Data Export / Import** | **Yes** (JSON/CSV + encrypted backup) | Premium |
| **Food Timestamps** | **Yes** (meal timing patterns) | Yes |
| **Onboarding Flow** | **Yes** (profile + goal setup) | Yes |
| **Food Grade** | **Yes** (Nutri-Score style) | -- |
| **Allergen Warnings** | **Yes** (configurable, OFF data) | -- |
| **Recipe Import** | **Yes** (URL scraping) | -- |
| **Blood Glucose** | **Yes** (trends + context tags) | -- |
| **Medication Tracking** | **Yes** (dose logging + frequency) | -- |
| **Symptom Tracking** | **Yes** (severity + trends) | -- |
| **Daily Notes** | **Yes** (journal per day) | -- |
| **Calorie Cycling** | **Yes** (zigzag schedule) | -- |
| **Custom Trackers** | **Yes** (user-defined metrics) | -- |
| **Autopilot** | **Yes** (AI suggestions from history) | -- |
| **Internationalization** | 3 languages (EN/DE/TR) | 20+ |
| **Web Support** | **Yes** (iOS + Android + Web) | Mobile only | Web + Mobile |
| **Ad-Free** | **Yes** (always) | Yes | No (freemium) |
| **No Subscription** | **Yes** (all features free) | Yes | Premium required |
| **Open Source** | **Yes** (GPL-3.0) | Yes (GPL-3.0) | No |
| **Privacy / Local-First** | **Yes** (all data on-device) | Yes | Cloud-synced |

### Legend

```text
  Yes  =  Fully available, no paywall
   --  =  Not available
  Premium  =  Requires paid subscription (MFP)
```

---

## Feature Details

### Food & Nutrition

```text
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

```text
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

```text
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

```text
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

```text
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

```text
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

```text
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

```text
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

```text
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

### Health Monitoring

```text
  Blood Glucose          Medications             Symptoms
  ==============         ============            =========

  110 | * fasting       Name: Metformin         Severity: 7/10
  100 |   * before      Dose: 500mg             Type: Headache
   90 |     * after      Freq: 2x daily          Notes: After lunch
      --------          Log: 8:00 AM, 8:00 PM    Trend: ▼ improving
      Mon Tue Wed
```

- **Blood glucose tracking**: log readings with context tags (fasting, before/after meal, bedtime)
- **Blood glucose trends**: chart over time with context filtering
- **Medication logging**: name, dosage, frequency, notes
- **Medication history**: dose log with timestamps
- **Symptom tracking**: log type, severity (1-10), notes
- **Symptom trends**: chart severity over time

### Smart Features

- **Autopilot**: AI-assisted daily logging suggestions based on eating patterns and time of day
- **Food grade**: Nutri-Score-style quality rating on food entries derived from macro/micro profile
- **Recipe import**: paste a URL, scrape ingredients and nutrition, add to recipe builder

### Customization

- **Custom trackers**: user-defined metrics with custom names and units
- **Calorie cycling**: zigzag diet scheduling with per-day-of-week calorie targets
- **Allergen warnings**: configure personal allergen list; foods flagged from OFF data
- **Daily notes**: journal entries attached to tracked days

---

## Technical Summary

| | Detail |
|:---|:---|
| **Framework** | Flutter / Dart |
| **State Management** | flutter_bloc |
| **Local DB** | Drift (SQLite) |
| **Schema Version** | 22 (23 tables) |
| **DI** | GetIt |
| **i18n** | flutter_intl (EN / DE / TR) |
| **Platforms** | iOS, Android, Web |
| **Food DBs** | Open Food Facts, USDA FDC, USDA FDC-SR |
| **AI Model** | TensorFlow Lite (on-device) |
| **Health APIs** | HealthKit, Health Connect |
| **License** | GPL-3.0 |
| **Use Cases** | 75 |
| **Feature Modules** | 33 |

---

## Nutriq vs MyFitnessPal: Quick Verdict

```text
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
  + Blood glucose tracking (MFP = not available)
  + Medication tracking (MFP = not available)
  + Symptom tracking (MFP = not available)
  + Custom trackers (MFP = not available)
  + Calorie cycling (MFP = not available)
  + Food quality grading (MFP = not available)
  + Allergen warnings (MFP = not available)
  + Daily notes (MFP = not available)
  + Recipe import from URLs (MFP = not available)
  + Autopilot smart suggestions (MFP = not available)
  + Ad-free (always)

  What you trade off:
  ===================
  - Smaller food database (3 sources vs 14M+)
  - 3 languages vs 20+
  - No social / community features
  - No wearable direct-sync (uses HealthKit/Health Connect as bridge)
```