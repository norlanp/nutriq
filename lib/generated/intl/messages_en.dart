// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(pct) => "${pct}% confidence";

  static String m1(count) => "${count} allergens filtering active";

  static String m2(versionNumber) => "Version ${versionNumber}";

  static String m3(pctCarbs, pctFats, pctProteins) =>
      "${pctCarbs}% carbs, ${pctFats}% fats, ${pctProteins}% proteins";

  static String m4(timestamp) => "Last synced: ${timestamp}";

  static String m5(steps) => "${steps} steps synced";

  static String m6(taken, total) => "${taken} / ${total} doses taken";

  static String m7(count) => "Add ${count} to diary";

  static String m8(count) => "${count} item(s) added to diary";

  static String m9(count) => "${count} items found";

  static String m10(riskValue) => "Risk of comorbidities: ${riskValue}";

  static String m11(current, goal) => "${current} / ${goal} ml";

  static String m12(age) => "${age} years";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "activeFastLabel": MessageLookupByLibrary.simpleMessage("Active Fast"),
    "activityExample": MessageLookupByLibrary.simpleMessage(
      "e.g. running, biking, yoga ...",
    ),
    "activityLabel": MessageLookupByLibrary.simpleMessage("Activity"),
    "activityMultiplierLabel": MessageLookupByLibrary.simpleMessage(
      "Activity Multiplier",
    ),
    "addBloodGlucoseEntry": MessageLookupByLibrary.simpleMessage("Add Entry"),
    "addExerciseLabel": MessageLookupByLibrary.simpleMessage("Add Exercise"),
    "addIngredientLabel": MessageLookupByLibrary.simpleMessage(
      "Add ingredient",
    ),
    "addItemLabel": MessageLookupByLibrary.simpleMessage("Add new Item:"),
    "addLabel": MessageLookupByLibrary.simpleMessage("Add"),
    "addMeasurement": MessageLookupByLibrary.simpleMessage("Add Measurement"),
    "addMedication": MessageLookupByLibrary.simpleMessage("Add Medication"),
    "addSymptom": MessageLookupByLibrary.simpleMessage("Add Symptom"),
    "addWater": MessageLookupByLibrary.simpleMessage("Add Water"),
    "additionalInfoLabelCompendium2011": MessageLookupByLibrary.simpleMessage(
      "Information provided\n by the \n\'2011 Compendium\n of Physical Activities\'",
    ),
    "additionalInfoLabelCustom": MessageLookupByLibrary.simpleMessage(
      "Custom Meal Item",
    ),
    "additionalInfoLabelFDC": MessageLookupByLibrary.simpleMessage(
      "More Information at\nFoodData Central",
    ),
    "additionalInfoLabelOFF": MessageLookupByLibrary.simpleMessage(
      "More Information at\nOpenFoodFacts",
    ),
    "additionalInfoLabelUnknown": MessageLookupByLibrary.simpleMessage(
      "Unknown Meal Item",
    ),
    "adjustedCalories": MessageLookupByLibrary.simpleMessage(
      "Adjusted Calories",
    ),
    "afterLabel": MessageLookupByLibrary.simpleMessage("After"),
    "afterMeal": MessageLookupByLibrary.simpleMessage("After Meal"),
    "ageLabel": MessageLookupByLibrary.simpleMessage("Age"),
    "aiScannerCaptureButton": MessageLookupByLibrary.simpleMessage(
      "Take Photo",
    ),
    "aiScannerConfidence": m0,
    "aiScannerExample": MessageLookupByLibrary.simpleMessage(
      "Identify food with AI",
    ),
    "aiScannerGalleryButton": MessageLookupByLibrary.simpleMessage(
      "Pick from Gallery",
    ),
    "aiScannerLabel": MessageLookupByLibrary.simpleMessage("AI Food Scanner"),
    "aiScannerResultsTitle": MessageLookupByLibrary.simpleMessage(
      "Classification Results",
    ),
    "aiScannerSearchManually": MessageLookupByLibrary.simpleMessage(
      "Search manually",
    ),
    "aiScannerSubtitle": MessageLookupByLibrary.simpleMessage(
      "Take a photo or pick from gallery to identify food",
    ),
    "aiScannerTitle": MessageLookupByLibrary.simpleMessage("AI Food Scanner"),
    "allItemsLabel": MessageLookupByLibrary.simpleMessage("All"),
    "allergenCelery": MessageLookupByLibrary.simpleMessage("Celery"),
    "allergenCeleryDesc": MessageLookupByLibrary.simpleMessage(
      "Celery and celeriac",
    ),
    "allergenDairy": MessageLookupByLibrary.simpleMessage("Dairy"),
    "allergenDairyDesc": MessageLookupByLibrary.simpleMessage(
      "Milk, cheese, butter, yogurt and other dairy products",
    ),
    "allergenEggs": MessageLookupByLibrary.simpleMessage("Eggs"),
    "allergenEggsDesc": MessageLookupByLibrary.simpleMessage(
      "Eggs and egg-based products",
    ),
    "allergenFilterEnabled": m1,
    "allergenFish": MessageLookupByLibrary.simpleMessage("Fish"),
    "allergenFishDesc": MessageLookupByLibrary.simpleMessage(
      "Fish and fish-based products",
    ),
    "allergenGluten": MessageLookupByLibrary.simpleMessage("Gluten"),
    "allergenGlutenDesc": MessageLookupByLibrary.simpleMessage(
      "Wheat, barley, rye and other gluten-containing grains",
    ),
    "allergenLupin": MessageLookupByLibrary.simpleMessage("Lupin"),
    "allergenLupinDesc": MessageLookupByLibrary.simpleMessage(
      "Lupin seeds and lupin flour",
    ),
    "allergenMolluscs": MessageLookupByLibrary.simpleMessage("Molluscs"),
    "allergenMolluscsDesc": MessageLookupByLibrary.simpleMessage(
      "Mussels, oysters, squid and other molluscs",
    ),
    "allergenMustard": MessageLookupByLibrary.simpleMessage("Mustard"),
    "allergenMustardDesc": MessageLookupByLibrary.simpleMessage(
      "Mustard seeds and mustard-based products",
    ),
    "allergenNuts": MessageLookupByLibrary.simpleMessage("Nuts"),
    "allergenNutsDesc": MessageLookupByLibrary.simpleMessage(
      "Almonds, hazelnuts, walnuts and other tree nuts",
    ),
    "allergenPeanuts": MessageLookupByLibrary.simpleMessage("Peanuts"),
    "allergenPeanutsDesc": MessageLookupByLibrary.simpleMessage(
      "Peanuts and peanut-based products",
    ),
    "allergenSesame": MessageLookupByLibrary.simpleMessage("Sesame"),
    "allergenSesameDesc": MessageLookupByLibrary.simpleMessage(
      "Sesame seeds and sesame-based products",
    ),
    "allergenSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Select allergens to filter from search results. Foods containing selected allergens will be hidden.",
    ),
    "allergenSettingsLabel": MessageLookupByLibrary.simpleMessage("Allergens"),
    "allergenSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Allergen Settings",
    ),
    "allergenShellfish": MessageLookupByLibrary.simpleMessage("Shellfish"),
    "allergenShellfishDesc": MessageLookupByLibrary.simpleMessage(
      "Shrimp, crab, lobster and other shellfish",
    ),
    "allergenSoy": MessageLookupByLibrary.simpleMessage("Soy"),
    "allergenSoyDesc": MessageLookupByLibrary.simpleMessage(
      "Soybeans, tofu, soy sauce and other soy products",
    ),
    "allergenSulphurDioxide": MessageLookupByLibrary.simpleMessage(
      "Sulphur Dioxide",
    ),
    "allergenSulphurDioxideDesc": MessageLookupByLibrary.simpleMessage(
      "Sulphites, commonly found in wine and dried fruit",
    ),
    "allergenWarning": MessageLookupByLibrary.simpleMessage(
      "Contains allergen",
    ),
    "alphaVersionName": MessageLookupByLibrary.simpleMessage("[Alpha]"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Nutriq is a free and open-source calorie and nutrient tracker that respects your privacy.",
    ),
    "appLicenseLabel": MessageLookupByLibrary.simpleMessage("GPL-3.0 license"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Nutriq"),
    "appVersionName": m2,
    "asNeeded": MessageLookupByLibrary.simpleMessage("As Needed"),
    "autopilotDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically adjusts your daily calorie budget based on your weight trend. Losing too fast increases your budget; losing too slowly decreases it.",
    ),
    "autopilotDisabled": MessageLookupByLibrary.simpleMessage("Disabled"),
    "autopilotEnabled": MessageLookupByLibrary.simpleMessage("Enabled"),
    "autopilotLabel": MessageLookupByLibrary.simpleMessage("Autopilot"),
    "averageLabel": MessageLookupByLibrary.simpleMessage("Avg"),
    "baseQuantityLabel": MessageLookupByLibrary.simpleMessage(
      "Base quantity (g/ml)",
    ),
    "baselineCalories": MessageLookupByLibrary.simpleMessage(
      "Baseline Calories",
    ),
    "bedtime": MessageLookupByLibrary.simpleMessage("Bedtime"),
    "beforeLabel": MessageLookupByLibrary.simpleMessage("Before"),
    "beforeMeal": MessageLookupByLibrary.simpleMessage("Before Meal"),
    "betaVersionName": MessageLookupByLibrary.simpleMessage("[Beta]"),
    "bicepCm": MessageLookupByLibrary.simpleMessage("Bicep (cm)"),
    "bloodGlucoseAverage": MessageLookupByLibrary.simpleMessage("Average"),
    "bloodGlucoseLabel": MessageLookupByLibrary.simpleMessage("Label"),
    "bloodGlucoseMgdL": MessageLookupByLibrary.simpleMessage("mg/dL"),
    "bloodGlucoseReminder": MessageLookupByLibrary.simpleMessage(
      "Blood Glucose Reminder",
    ),
    "bloodGlucoseTimeline": MessageLookupByLibrary.simpleMessage("Timeline"),
    "bloodGlucoseTitle": MessageLookupByLibrary.simpleMessage("Blood Glucose"),
    "bloodGlucoseTrend": MessageLookupByLibrary.simpleMessage("Trend"),
    "bloodGlucoseValue": MessageLookupByLibrary.simpleMessage("Value"),
    "bmi": MessageLookupByLibrary.simpleMessage("BMI"),
    "bmiInfo": MessageLookupByLibrary.simpleMessage(
      "Body Mass Index (BMI) is a index to classify overweight and obesity in adults. It is defined as weight in kilograms divided by the square of height in meters (kg/m²).\n\nBMI does not differentiate between fat and muscle mass and can be misleading for some individuals.",
    ),
    "bmiLabel": MessageLookupByLibrary.simpleMessage("BMI"),
    "bmiNormal": MessageLookupByLibrary.simpleMessage("Normal"),
    "bmiObese": MessageLookupByLibrary.simpleMessage("Obese"),
    "bmiOverweight": MessageLookupByLibrary.simpleMessage("Overweight"),
    "bmiUnderweight": MessageLookupByLibrary.simpleMessage("Underweight"),
    "bmrKcal": MessageLookupByLibrary.simpleMessage("Basal Metabolic Rate"),
    "bmrLabel": MessageLookupByLibrary.simpleMessage("BMR"),
    "bodyMeasurementTitle": MessageLookupByLibrary.simpleMessage(
      "Body Measurements",
    ),
    "booleanType": MessageLookupByLibrary.simpleMessage("Boolean"),
    "breakfastExample": MessageLookupByLibrary.simpleMessage(
      "e.g. cereal, milk, coffee ...",
    ),
    "breakfastLabel": MessageLookupByLibrary.simpleMessage("Breakfast"),
    "burnedCaloriesLabel": MessageLookupByLibrary.simpleMessage("Burned"),
    "burnedLabel": MessageLookupByLibrary.simpleMessage("burned"),
    "buttonNextLabel": MessageLookupByLibrary.simpleMessage("NEXT"),
    "buttonResetLabel": MessageLookupByLibrary.simpleMessage("Reset"),
    "buttonSaveLabel": MessageLookupByLibrary.simpleMessage("Save"),
    "buttonStartLabel": MessageLookupByLibrary.simpleMessage("START"),
    "buttonYesLabel": MessageLookupByLibrary.simpleMessage("YES"),
    "calculationMethodLabel": MessageLookupByLibrary.simpleMessage(
      "Calculation Method",
    ),
    "calculationsMacronutrientsDistributionLabel":
        MessageLookupByLibrary.simpleMessage("Macros distribution"),
    "calculationsMacrosDistribution": m3,
    "calculationsRecommendedLabel": MessageLookupByLibrary.simpleMessage(
      "(recommended)",
    ),
    "calculationsTDEEIOM2006Label": MessageLookupByLibrary.simpleMessage(
      "Institute of Medicine Equation",
    ),
    "calculationsTDEELabel": MessageLookupByLibrary.simpleMessage(
      "TDEE equation",
    ),
    "calculationsTDEEMifflinStJeorLabel": MessageLookupByLibrary.simpleMessage(
      "Mifflin-St Jeor Equation",
    ),
    "calorieCyclingDescription": MessageLookupByLibrary.simpleMessage(
      "Set different calorie targets for each day of the week. This helps you eat more on active days and less on rest days while maintaining your weekly budget.",
    ),
    "calorieCyclingLabel": MessageLookupByLibrary.simpleMessage(
      "Calorie Cycling",
    ),
    "caloriesLabel": MessageLookupByLibrary.simpleMessage("Calories"),
    "caloriesTab": MessageLookupByLibrary.simpleMessage("Calories"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "carbohydrateLabel": MessageLookupByLibrary.simpleMessage("carbohydrate"),
    "carbsLabel": MessageLookupByLibrary.simpleMessage("carbs"),
    "chartExportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Failed to share chart",
    ),
    "chartExportedLabel": MessageLookupByLibrary.simpleMessage("Chart shared"),
    "chestCm": MessageLookupByLibrary.simpleMessage("Chest (cm)"),
    "chooseWeightGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Choose Weight Goal",
    ),
    "cmLabel": MessageLookupByLibrary.simpleMessage("cm"),
    "compareLabel": MessageLookupByLibrary.simpleMessage("Compare"),
    "confirmImport": MessageLookupByLibrary.simpleMessage("Confirm Import"),
    "consumedLabel": MessageLookupByLibrary.simpleMessage("Consumed"),
    "containsAllergen": MessageLookupByLibrary.simpleMessage("Contains"),
    "cookTimeLabel": MessageLookupByLibrary.simpleMessage("Cook time"),
    "copyDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Which meal type do you want to copy to?",
    ),
    "copyOrDeleteTimeDialogContent": MessageLookupByLibrary.simpleMessage(
      "With \"Copy to today\" you can copy the meal to today. With \"Delete\" you can delete the meal.",
    ),
    "copyOrDeleteTimeDialogTitle": MessageLookupByLibrary.simpleMessage(
      "What do you want to do?",
    ),
    "createCustomDialogContent": MessageLookupByLibrary.simpleMessage(
      "Do you want create a custom meal item?",
    ),
    "createCustomDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Create custom meal item?",
    ),
    "createCustomFoodLabel": MessageLookupByLibrary.simpleMessage(
      "Create custom food",
    ),
    "createTracker": MessageLookupByLibrary.simpleMessage("Create Tracker"),
    "currentWeight": MessageLookupByLibrary.simpleMessage("Current"),
    "custom": MessageLookupByLibrary.simpleMessage("Custom"),
    "customFoodEnergyLabel": MessageLookupByLibrary.simpleMessage(
      "Energy (kcal per 100 g/ml)",
    ),
    "customFoodNameRequired": MessageLookupByLibrary.simpleMessage(
      "Food name is required",
    ),
    "customTrackersLabel": MessageLookupByLibrary.simpleMessage(
      "Custom Trackers",
    ),
    "daily": MessageLookupByLibrary.simpleMessage("Daily"),
    "dailyGoalLabel": MessageLookupByLibrary.simpleMessage("Daily Goal"),
    "dailyKcalAdjustmentLabel": MessageLookupByLibrary.simpleMessage(
      "Daily Kcal adjustment:",
    ),
    "dailyNoteEmpty": MessageLookupByLibrary.simpleMessage("No note yet"),
    "dailyNoteHint": MessageLookupByLibrary.simpleMessage(
      "Write a note for today...",
    ),
    "dailyNoteLabel": MessageLookupByLibrary.simpleMessage("Daily Note"),
    "dailyNoteSaved": MessageLookupByLibrary.simpleMessage("Note saved"),
    "dailySummaryLabel": MessageLookupByLibrary.simpleMessage("Daily Summary"),
    "dailyTarget": MessageLookupByLibrary.simpleMessage("Daily Target"),
    "dailyWaterGoal": MessageLookupByLibrary.simpleMessage("Daily Water Goal"),
    "dataCollectionLabel": MessageLookupByLibrary.simpleMessage(
      "Support development by providing anonymous usage data",
    ),
    "dataSyncBackupCreated": MessageLookupByLibrary.simpleMessage(
      "Backup created successfully",
    ),
    "dataSyncBackupFilePath": MessageLookupByLibrary.simpleMessage(
      "Backup file path",
    ),
    "dataSyncCloudBackupTitle": MessageLookupByLibrary.simpleMessage(
      "Cloud Backup",
    ),
    "dataSyncCloudProvider": MessageLookupByLibrary.simpleMessage(
      "Cloud Provider",
    ),
    "dataSyncComingSoon": MessageLookupByLibrary.simpleMessage("Coming soon"),
    "dataSyncConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "dataSyncCreateEncryptedBackup": MessageLookupByLibrary.simpleMessage(
      "Create Encrypted Backup",
    ),
    "dataSyncEncryptBackup": MessageLookupByLibrary.simpleMessage(
      "Encrypted Backup",
    ),
    "dataSyncEncryptBackupDescription": MessageLookupByLibrary.simpleMessage(
      "Create an AES-256 encrypted backup of your data. The backup is stored locally on your device.",
    ),
    "dataSyncEncryptedRestore": MessageLookupByLibrary.simpleMessage(
      "Encrypted Restore",
    ),
    "dataSyncExportSuccess": MessageLookupByLibrary.simpleMessage(
      "Data exported successfully",
    ),
    "dataSyncExportTitle": MessageLookupByLibrary.simpleMessage("Export Data"),
    "dataSyncFormatJson": MessageLookupByLibrary.simpleMessage("JSON"),
    "dataSyncFormatZip": MessageLookupByLibrary.simpleMessage("ZIP"),
    "dataSyncImportDescription": MessageLookupByLibrary.simpleMessage(
      "Import data from a previously exported JSON or ZIP file. This will merge with existing data.",
    ),
    "dataSyncImportJson": MessageLookupByLibrary.simpleMessage(
      "Import from JSON",
    ),
    "dataSyncImportSuccess": MessageLookupByLibrary.simpleMessage(
      "Data imported successfully",
    ),
    "dataSyncImportTitle": MessageLookupByLibrary.simpleMessage("Import Data"),
    "dataSyncImportZip": MessageLookupByLibrary.simpleMessage(
      "Import from ZIP",
    ),
    "dataSyncLastBackup": MessageLookupByLibrary.simpleMessage("Last Backup"),
    "dataSyncLocalEncryption": MessageLookupByLibrary.simpleMessage(
      "Local Encryption",
    ),
    "dataSyncLocalEncryptionDescription": MessageLookupByLibrary.simpleMessage(
      "Encrypt and store your backup locally. You can transfer the encrypted file to cloud storage manually.",
    ),
    "dataSyncNoBackup": MessageLookupByLibrary.simpleMessage("No backup found"),
    "dataSyncPassword": MessageLookupByLibrary.simpleMessage("Password"),
    "dataSyncPasswordMismatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "dataSyncPreviewTitle": MessageLookupByLibrary.simpleMessage(
      "Import Preview",
    ),
    "dataSyncRecords": MessageLookupByLibrary.simpleMessage("records"),
    "dataSyncRestoreEncrypted": MessageLookupByLibrary.simpleMessage(
      "Restore from Encrypted Backup",
    ),
    "dataSyncRestoreFromBackup": MessageLookupByLibrary.simpleMessage(
      "Restore from Backup",
    ),
    "dataSyncSelectDataTypes": MessageLookupByLibrary.simpleMessage(
      "Select data types to export",
    ),
    "dataSyncSelectFormat": MessageLookupByLibrary.simpleMessage(
      "Export format",
    ),
    "dataSyncTypeActivities": MessageLookupByLibrary.simpleMessage(
      "Activities",
    ),
    "dataSyncTypeConfig": MessageLookupByLibrary.simpleMessage("Settings"),
    "dataSyncTypeFasts": MessageLookupByLibrary.simpleMessage(
      "Fasting Sessions",
    ),
    "dataSyncTypeIntakes": MessageLookupByLibrary.simpleMessage("Food Intakes"),
    "dataSyncTypeMealPlans": MessageLookupByLibrary.simpleMessage("Meal Plans"),
    "dataSyncTypeMeals": MessageLookupByLibrary.simpleMessage("Meals"),
    "dataSyncTypeNotificationSettings": MessageLookupByLibrary.simpleMessage(
      "Notification Settings",
    ),
    "dataSyncTypeRecipes": MessageLookupByLibrary.simpleMessage("Recipes"),
    "dataSyncTypeTrackedDays": MessageLookupByLibrary.simpleMessage(
      "Tracked Days",
    ),
    "dataSyncTypeUsers": MessageLookupByLibrary.simpleMessage("User Profile"),
    "dataSyncTypeWaterEntries": MessageLookupByLibrary.simpleMessage(
      "Water Entries",
    ),
    "dataSyncTypeWeights": MessageLookupByLibrary.simpleMessage("Weights"),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "deleteAllLabel": MessageLookupByLibrary.simpleMessage("Delete all"),
    "deleteBloodGlucoseEntry": MessageLookupByLibrary.simpleMessage(
      "Delete Entry",
    ),
    "deleteMedication": MessageLookupByLibrary.simpleMessage(
      "Delete Medication",
    ),
    "deletePhotoDialogContent": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this photo?",
    ),
    "deletePhotoLabel": MessageLookupByLibrary.simpleMessage("Delete Photo"),
    "deleteRecipeLabel": MessageLookupByLibrary.simpleMessage("Delete recipe"),
    "deleteSymptom": MessageLookupByLibrary.simpleMessage("Delete Symptom"),
    "deleteTimeDialogContent": MessageLookupByLibrary.simpleMessage(
      "Do want to delete the selected item?",
    ),
    "deleteTimeDialogPluralContent": MessageLookupByLibrary.simpleMessage(
      "Do want to delete all items of this meal?",
    ),
    "deleteTimeDialogPluralTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Items?",
    ),
    "deleteTimeDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Item?",
    ),
    "deleteTracker": MessageLookupByLibrary.simpleMessage("Delete Tracker"),
    "deleteWeight": MessageLookupByLibrary.simpleMessage("Delete Entry"),
    "dialogCancelLabel": MessageLookupByLibrary.simpleMessage("CANCEL"),
    "dialogCopyLabel": MessageLookupByLibrary.simpleMessage("Copy to today"),
    "dialogDeleteLabel": MessageLookupByLibrary.simpleMessage("DELETE"),
    "dialogOKLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "diaryLabel": MessageLookupByLibrary.simpleMessage("Diary"),
    "dinnerExample": MessageLookupByLibrary.simpleMessage(
      "e.g. soup, chicken, wine ...",
    ),
    "dinnerLabel": MessageLookupByLibrary.simpleMessage("Dinner"),
    "disclaimerText": MessageLookupByLibrary.simpleMessage(
      "Nutriq is not a medical application. All data provided is not validated and should be used with caution. Please maintain a healthy lifestyle and consult a professional if you have any problems. Use during illness, pregnancy or lactation is not recommended.",
    ),
    "doseMissed": MessageLookupByLibrary.simpleMessage("Dose Missed"),
    "doseTaken": MessageLookupByLibrary.simpleMessage("Dose Taken"),
    "editItemDialogTitle": MessageLookupByLibrary.simpleMessage("Edit item"),
    "editMealLabel": MessageLookupByLibrary.simpleMessage("Edit meal"),
    "elapsedTimeLabel": MessageLookupByLibrary.simpleMessage("Elapsed"),
    "emptyShoppingListLabel": MessageLookupByLibrary.simpleMessage(
      "No items in shopping list",
    ),
    "emptySlotLabel": MessageLookupByLibrary.simpleMessage("Empty"),
    "enableCalorieCycling": MessageLookupByLibrary.simpleMessage(
      "Enable Calorie Cycling",
    ),
    "enableDailySummaryLabel": MessageLookupByLibrary.simpleMessage(
      "Enable Daily Summary",
    ),
    "endFastLabel": MessageLookupByLibrary.simpleMessage("End Fast"),
    "energyLabel": MessageLookupByLibrary.simpleMessage("energy"),
    "errorFetchingProductData": MessageLookupByLibrary.simpleMessage(
      "Error while fetching product data",
    ),
    "errorLoadingActivities": MessageLookupByLibrary.simpleMessage(
      "Error while loading activities",
    ),
    "errorMealSave": MessageLookupByLibrary.simpleMessage(
      "Error while saving meal. Did you input the correct meal information?",
    ),
    "errorOpeningBrowser": MessageLookupByLibrary.simpleMessage(
      "Error while opening browser app",
    ),
    "errorOpeningEmail": MessageLookupByLibrary.simpleMessage(
      "Error while opening email app",
    ),
    "errorProductNotFound": MessageLookupByLibrary.simpleMessage(
      "Product not found",
    ),
    "exerciseCalorieImpact": MessageLookupByLibrary.simpleMessage(
      "Exercise Impact",
    ),
    "exerciseCredit100": MessageLookupByLibrary.simpleMessage("100%"),
    "exerciseCredit50": MessageLookupByLibrary.simpleMessage("50%"),
    "exerciseCreditCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "exerciseCreditLabel": MessageLookupByLibrary.simpleMessage(
      "Exercise Credit",
    ),
    "exerciseCreditNone": MessageLookupByLibrary.simpleMessage("None"),
    "exerciseCreditPercent": MessageLookupByLibrary.simpleMessage(
      "Credit Percent",
    ),
    "exerciseListLabel": MessageLookupByLibrary.simpleMessage(
      "Exercises Today",
    ),
    "exportAction": MessageLookupByLibrary.simpleMessage("Export"),
    "exportChartLabel": MessageLookupByLibrary.simpleMessage("Share Chart"),
    "exportImportDescription": MessageLookupByLibrary.simpleMessage(
      "You can export the app data to a zip file and import it later. This is useful if you want to backup your data or transfer it to another device.\n\nThe app does not use any cloud service to store your data.",
    ),
    "exportImportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Export / Import error",
    ),
    "exportImportLabel": MessageLookupByLibrary.simpleMessage(
      "Export / Import data",
    ),
    "exportImportSuccessLabel": MessageLookupByLibrary.simpleMessage(
      "Export / Import successful",
    ),
    "fasting": MessageLookupByLibrary.simpleMessage("Fasting"),
    "fastingEndedNotificationBody": MessageLookupByLibrary.simpleMessage(
      "Congratulations! You have reached your fasting goal.",
    ),
    "fastingEndedNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Fasting Complete",
    ),
    "fastingHistoryLabel": MessageLookupByLibrary.simpleMessage(
      "Fasting History",
    ),
    "fastingStartedNotificationBody": MessageLookupByLibrary.simpleMessage(
      "Your fasting period has begun. Stay strong!",
    ),
    "fastingStartedNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Fasting Started",
    ),
    "fastingTrackerLabel": MessageLookupByLibrary.simpleMessage(
      "Intermittent Fasting",
    ),
    "fatLabel": MessageLookupByLibrary.simpleMessage("fat"),
    "fiberLabel": MessageLookupByLibrary.simpleMessage("fiber"),
    "fiberPer100Label": MessageLookupByLibrary.simpleMessage("Fiber per "),
    "filterByGrade": MessageLookupByLibrary.simpleMessage("Filter by Grade"),
    "flOzUnit": MessageLookupByLibrary.simpleMessage("fl.oz"),
    "foodGradeDescription": MessageLookupByLibrary.simpleMessage(
      "Food Grade rates foods from A (best) to D (worst) based on nutritional density. Higher protein and fiber improve the grade, while high sugar, sodium, saturated fat, and calorie density lower it.",
    ),
    "foodGradeLabel": MessageLookupByLibrary.simpleMessage("Food Grade"),
    "fridayLabel": MessageLookupByLibrary.simpleMessage("Friday"),
    "ftLabel": MessageLookupByLibrary.simpleMessage("ft"),
    "genderFemaleLabel": MessageLookupByLibrary.simpleMessage("♀ female"),
    "genderLabel": MessageLookupByLibrary.simpleMessage("Gender"),
    "genderMaleLabel": MessageLookupByLibrary.simpleMessage("♂ male"),
    "globalCalorieBudget": MessageLookupByLibrary.simpleMessage(
      "Global Calorie Budget",
    ),
    "goalGainWeight": MessageLookupByLibrary.simpleMessage("Gain Weight"),
    "goalLabel": MessageLookupByLibrary.simpleMessage("Goal"),
    "goalLoseWeight": MessageLookupByLibrary.simpleMessage("Lose Weight"),
    "goalMaintainWeight": MessageLookupByLibrary.simpleMessage(
      "Maintain Weight",
    ),
    "goalWeight": MessageLookupByLibrary.simpleMessage("Goal Weight"),
    "gradeA": MessageLookupByLibrary.simpleMessage("Grade A - Excellent"),
    "gradeAExplain": MessageLookupByLibrary.simpleMessage(
      "Very high nutritional value. Rich in protein and fiber, low in sugar, sodium, and saturated fat. These foods support a healthy diet.",
    ),
    "gradeB": MessageLookupByLibrary.simpleMessage("Grade B - Good"),
    "gradeBExplain": MessageLookupByLibrary.simpleMessage(
      "Good nutritional value. Generally beneficial with moderate amounts of positive nutrients and limited negative factors.",
    ),
    "gradeC": MessageLookupByLibrary.simpleMessage("Grade C - Moderate"),
    "gradeCExplain": MessageLookupByLibrary.simpleMessage(
      "Moderate nutritional value. May contain higher amounts of sugar, sodium, or saturated fat. Consume in moderation.",
    ),
    "gradeD": MessageLookupByLibrary.simpleMessage("Grade D - Poor"),
    "gradeDExplain": MessageLookupByLibrary.simpleMessage(
      "Low nutritional value. High in sugar, sodium, saturated fat, or calories with limited beneficial nutrients. Limit consumption.",
    ),
    "gramMilliliterUnit": MessageLookupByLibrary.simpleMessage("g/ml"),
    "gramUnit": MessageLookupByLibrary.simpleMessage("g"),
    "groceryCheckClearAll": MessageLookupByLibrary.simpleMessage("Clear All"),
    "groceryCheckCompareButton": MessageLookupByLibrary.simpleMessage(
      "Compare",
    ),
    "groceryCheckComparisonTitle": MessageLookupByLibrary.simpleMessage(
      "Nutrition Comparison",
    ),
    "groceryCheckEmptyList": MessageLookupByLibrary.simpleMessage(
      "No products scanned yet. Tap the scan button to start comparing.",
    ),
    "groceryCheckItemAdded": MessageLookupByLibrary.simpleMessage(
      "Product added to comparison list",
    ),
    "groceryCheckNoNutritionData": MessageLookupByLibrary.simpleMessage(
      "Nutrition data not available",
    ),
    "groceryCheckPer100gml": MessageLookupByLibrary.simpleMessage(
      "per 100 g/ml",
    ),
    "groceryCheckProductNotFound": MessageLookupByLibrary.simpleMessage(
      "Product not found. Try scanning again.",
    ),
    "groceryCheckRemoveItem": MessageLookupByLibrary.simpleMessage("Remove"),
    "groceryCheckScanButton": MessageLookupByLibrary.simpleMessage(
      "Scan Barcode",
    ),
    "groceryCheckScanning": MessageLookupByLibrary.simpleMessage("Scanning..."),
    "groceryCheckSelectTwoHint": MessageLookupByLibrary.simpleMessage(
      "Select two products to compare",
    ),
    "groceryCheckSubtitle": MessageLookupByLibrary.simpleMessage(
      "Scan barcodes to compare nutrition grades while shopping",
    ),
    "groceryCheckTitle": MessageLookupByLibrary.simpleMessage("Grocery Check"),
    "groceryCheckWinner": MessageLookupByLibrary.simpleMessage("Better Choice"),
    "hasNoteIndicator": MessageLookupByLibrary.simpleMessage("Has note"),
    "healthSyncDataTypes": MessageLookupByLibrary.simpleMessage("Data Types"),
    "healthSyncGrantPermission": MessageLookupByLibrary.simpleMessage(
      "Grant Permission",
    ),
    "healthSyncLastSync": m4,
    "healthSyncNeverSynced": MessageLookupByLibrary.simpleMessage(
      "Never synced",
    ),
    "healthSyncNow": MessageLookupByLibrary.simpleMessage("Sync Now"),
    "healthSyncPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Permission required to access health data",
    ),
    "healthSyncSteps": MessageLookupByLibrary.simpleMessage("Steps"),
    "healthSyncStepsResult": m5,
    "healthSyncTitle": MessageLookupByLibrary.simpleMessage("Health Sync"),
    "healthSyncWeight": MessageLookupByLibrary.simpleMessage("Weight"),
    "healthSyncWorkouts": MessageLookupByLibrary.simpleMessage("Workouts"),
    "heightLabel": MessageLookupByLibrary.simpleMessage("Height"),
    "hideNutritionLabel": MessageLookupByLibrary.simpleMessage(
      "Hide nutrition details",
    ),
    "hipCm": MessageLookupByLibrary.simpleMessage("Hip (cm)"),
    "homeLabel": MessageLookupByLibrary.simpleMessage("Home"),
    "hoursLabel": MessageLookupByLibrary.simpleMessage("Hours"),
    "importAction": MessageLookupByLibrary.simpleMessage("Import"),
    "importFromUrl": MessageLookupByLibrary.simpleMessage("Import from URL"),
    "importingRecipe": MessageLookupByLibrary.simpleMessage(
      "Importing recipe...",
    ),
    "inactiveFastLabel": MessageLookupByLibrary.simpleMessage("No active fast"),
    "infoAddedActivityLabel": MessageLookupByLibrary.simpleMessage(
      "Added new activity",
    ),
    "infoAddedIntakeLabel": MessageLookupByLibrary.simpleMessage(
      "Added new intake",
    ),
    "ingredientsLabel": MessageLookupByLibrary.simpleMessage("ingredients"),
    "instructionsLabel": MessageLookupByLibrary.simpleMessage("Instructions"),
    "insufficientSymptomData": MessageLookupByLibrary.simpleMessage(
      "Need at least 2 entries for trend",
    ),
    "insufficientWeightData": MessageLookupByLibrary.simpleMessage(
      "Not enough weight data to show trend",
    ),
    "itemDeletedSnackbar": MessageLookupByLibrary.simpleMessage("Item deleted"),
    "itemUpdatedSnackbar": MessageLookupByLibrary.simpleMessage("Item updated"),
    "kcalLabel": MessageLookupByLibrary.simpleMessage("kcal"),
    "kcalLeftLabel": MessageLookupByLibrary.simpleMessage("kcal left"),
    "keyboardShortcutBack": MessageLookupByLibrary.simpleMessage("Go back"),
    "keyboardShortcutNewEntry": MessageLookupByLibrary.simpleMessage(
      "New entry",
    ),
    "keyboardShortcutSave": MessageLookupByLibrary.simpleMessage("Save"),
    "kgLabel": MessageLookupByLibrary.simpleMessage("kg"),
    "lastAdjustment": MessageLookupByLibrary.simpleMessage("Last Adjustment"),
    "lbsLabel": MessageLookupByLibrary.simpleMessage("lbs"),
    "logDose": MessageLookupByLibrary.simpleMessage("Log Dose"),
    "logEntry": MessageLookupByLibrary.simpleMessage("Log Entry"),
    "logWeight": MessageLookupByLibrary.simpleMessage("Log Weight"),
    "lunchExample": MessageLookupByLibrary.simpleMessage(
      "e.g. pizza, salad, rice ...",
    ),
    "lunchLabel": MessageLookupByLibrary.simpleMessage("Lunch"),
    "macroDistributionLabel": MessageLookupByLibrary.simpleMessage(
      "Macronutrient Distribution:",
    ),
    "macroTrendChart": MessageLookupByLibrary.simpleMessage("Macro Trend"),
    "macrosTab": MessageLookupByLibrary.simpleMessage("Macros"),
    "maxValue": MessageLookupByLibrary.simpleMessage("Max"),
    "mealAddedToPlanLabel": MessageLookupByLibrary.simpleMessage(
      "Meal added to plan",
    ),
    "mealBrandsLabel": MessageLookupByLibrary.simpleMessage("Brands"),
    "mealCarbsLabel": MessageLookupByLibrary.simpleMessage("carbs per"),
    "mealFatLabel": MessageLookupByLibrary.simpleMessage("fat per"),
    "mealKcalLabel": MessageLookupByLibrary.simpleMessage("kcal per"),
    "mealNameLabel": MessageLookupByLibrary.simpleMessage("Meal name"),
    "mealPlanLabel": MessageLookupByLibrary.simpleMessage("Meal Planning"),
    "mealPlanSubtitle": MessageLookupByLibrary.simpleMessage(
      "Plan meals for the week",
    ),
    "mealProteinLabel": MessageLookupByLibrary.simpleMessage(
      "protein per 100 g/ml",
    ),
    "mealRemindersLabel": MessageLookupByLibrary.simpleMessage(
      "Meal Reminders",
    ),
    "mealSizeLabel": MessageLookupByLibrary.simpleMessage("Meal size (g/ml)"),
    "mealSizeLabelImperial": MessageLookupByLibrary.simpleMessage(
      "Meal size (oz/fl oz)",
    ),
    "mealTimeLabel": MessageLookupByLibrary.simpleMessage("Meal Time"),
    "mealTimeNowLabel": MessageLookupByLibrary.simpleMessage("Now"),
    "mealTimingAvgTimesLabel": MessageLookupByLibrary.simpleMessage(
      "Average Meal Times",
    ),
    "mealTimingDistributionLabel": MessageLookupByLibrary.simpleMessage(
      "Meal Time Distribution",
    ),
    "mealTimingEntriesLabel": MessageLookupByLibrary.simpleMessage(
      "Recent Entries",
    ),
    "mealTimingLabel": MessageLookupByLibrary.simpleMessage("Meal Timing"),
    "mealTimingNoDataLabel": MessageLookupByLibrary.simpleMessage(
      "No meal time data yet. Set a time when logging meals to see patterns.",
    ),
    "mealUnitLabel": MessageLookupByLibrary.simpleMessage("Meal unit"),
    "measurementHistory": MessageLookupByLibrary.simpleMessage(
      "Measurement History",
    ),
    "medicationDosage": MessageLookupByLibrary.simpleMessage("Dosage"),
    "medicationFrequency": MessageLookupByLibrary.simpleMessage("Frequency"),
    "medicationLog": MessageLookupByLibrary.simpleMessage("Medication Log"),
    "medicationName": MessageLookupByLibrary.simpleMessage("Medication Name"),
    "medicationProgress": m6,
    "medicationReminder": MessageLookupByLibrary.simpleMessage(
      "Medication Reminder",
    ),
    "medicationSummaryTitle": MessageLookupByLibrary.simpleMessage(
      "Medications",
    ),
    "medicationTitle": MessageLookupByLibrary.simpleMessage("Medications"),
    "menuScanAddSelected": m7,
    "menuScanAddedCount": m8,
    "menuScanAddingItems": MessageLookupByLibrary.simpleMessage(
      "Adding items to diary...",
    ),
    "menuScanCalories": MessageLookupByLibrary.simpleMessage("Cal"),
    "menuScanCaptureButton": MessageLookupByLibrary.simpleMessage("Scan Menu"),
    "menuScanCarbs": MessageLookupByLibrary.simpleMessage("Carbs"),
    "menuScanDescription": MessageLookupByLibrary.simpleMessage(
      "Take a photo of a menu and we\'ll identify dishes with nutrition data.",
    ),
    "menuScanFat": MessageLookupByLibrary.simpleMessage("Fat"),
    "menuScanGalleryButton": MessageLookupByLibrary.simpleMessage(
      "Pick from Gallery",
    ),
    "menuScanItemCount": m9,
    "menuScanNoNutritionInfo": MessageLookupByLibrary.simpleMessage(
      "Nutrition info not available",
    ),
    "menuScanProcessing": MessageLookupByLibrary.simpleMessage(
      "Processing menu...",
    ),
    "menuScanProtein": MessageLookupByLibrary.simpleMessage("Protein"),
    "menuScanResultsTitle": MessageLookupByLibrary.simpleMessage("Menu Items"),
    "menuScanSearchManually": MessageLookupByLibrary.simpleMessage(
      "Search manually",
    ),
    "menuScanSubtitle": MessageLookupByLibrary.simpleMessage(
      "Scan a restaurant menu to see nutrition info",
    ),
    "menuScanTitle": MessageLookupByLibrary.simpleMessage("Menu Scanner"),
    "microNutrientsLabel": MessageLookupByLibrary.simpleMessage(
      "Micronutrients",
    ),
    "milliliterUnit": MessageLookupByLibrary.simpleMessage("ml"),
    "minValue": MessageLookupByLibrary.simpleMessage("Min"),
    "minimumGrade": MessageLookupByLibrary.simpleMessage("Minimum Grade"),
    "minutesLabel": MessageLookupByLibrary.simpleMessage("Minutes"),
    "missingProductInfo": MessageLookupByLibrary.simpleMessage(
      "Product missing required kcal or macronutrients information",
    ),
    "ml": MessageLookupByLibrary.simpleMessage("ml"),
    "mondayLabel": MessageLookupByLibrary.simpleMessage("Monday"),
    "monthlyCalorieChart": MessageLookupByLibrary.simpleMessage(
      "Monthly Calories",
    ),
    "monthlyLabel": MessageLookupByLibrary.simpleMessage("Month"),
    "movingAverage": MessageLookupByLibrary.simpleMessage("Moving Average"),
    "myMealsLabel": MessageLookupByLibrary.simpleMessage("My Meals"),
    "neckCm": MessageLookupByLibrary.simpleMessage("Neck (cm)"),
    "netCaloriesLabel": MessageLookupByLibrary.simpleMessage("Net Calories"),
    "netCarbsDescription": MessageLookupByLibrary.simpleMessage(
      "Show net carbs (total carbs minus fiber) instead of total carbs in macros and summaries.",
    ),
    "netCarbsEnabledLabel": MessageLookupByLibrary.simpleMessage(
      "Enable Net Carbs",
    ),
    "netCarbsLabel": MessageLookupByLibrary.simpleMessage("net carbs"),
    "netCarbsSettingsLabel": MessageLookupByLibrary.simpleMessage("Net Carbs"),
    "noActivityRecentlyAddedLabel": MessageLookupByLibrary.simpleMessage(
      "No activity recently added",
    ),
    "noLogsToday": MessageLookupByLibrary.simpleMessage(
      "No medication logs for today",
    ),
    "noMealsRecentlyAddedLabel": MessageLookupByLibrary.simpleMessage(
      "No meals recently added",
    ),
    "noMeasurements": MessageLookupByLibrary.simpleMessage(
      "No measurements yet",
    ),
    "noMedicationsAdded": MessageLookupByLibrary.simpleMessage(
      "No medications added",
    ),
    "noPhotosLabel": MessageLookupByLibrary.simpleMessage(
      "No progress photos yet. Tap + to add one.",
    ),
    "noRecipesLabel": MessageLookupByLibrary.simpleMessage(
      "No recipes yet. Create one!",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage("No results found"),
    "noResultsHint": MessageLookupByLibrary.simpleMessage(
      "Try searching with different keywords",
    ),
    "noSymptomData": MessageLookupByLibrary.simpleMessage(
      "No symptom data yet. Start logging!",
    ),
    "noWaterEntries": MessageLookupByLibrary.simpleMessage(
      "No water entries yet",
    ),
    "noWeightEntries": MessageLookupByLibrary.simpleMessage(
      "No weight entries yet",
    ),
    "notAvailableLabel": MessageLookupByLibrary.simpleMessage("N/A"),
    "notSetLabel": MessageLookupByLibrary.simpleMessage("Not set"),
    "note": MessageLookupByLibrary.simpleMessage("Note"),
    "notes": MessageLookupByLibrary.simpleMessage("Notes"),
    "nothingAddedLabel": MessageLookupByLibrary.simpleMessage("Nothing added"),
    "notificationSettingsLabel": MessageLookupByLibrary.simpleMessage(
      "Notifications",
    ),
    "nutritionInfoLabel": MessageLookupByLibrary.simpleMessage(
      "Nutrition Information",
    ),
    "nutritionLabel": MessageLookupByLibrary.simpleMessage("Nutrition"),
    "nutritionPreviewLabel": MessageLookupByLibrary.simpleMessage(
      "Projected Nutrition",
    ),
    "nutritionalStatusNormalWeight": MessageLookupByLibrary.simpleMessage(
      "Normal Weight",
    ),
    "nutritionalStatusObeseClassI": MessageLookupByLibrary.simpleMessage(
      "Obesity Class I",
    ),
    "nutritionalStatusObeseClassII": MessageLookupByLibrary.simpleMessage(
      "Obesity Class II",
    ),
    "nutritionalStatusObeseClassIII": MessageLookupByLibrary.simpleMessage(
      "Obesity Class III",
    ),
    "nutritionalStatusPreObesity": MessageLookupByLibrary.simpleMessage(
      "Pre-obesity",
    ),
    "nutritionalStatusRiskAverage": MessageLookupByLibrary.simpleMessage(
      "Average",
    ),
    "nutritionalStatusRiskIncreased": MessageLookupByLibrary.simpleMessage(
      "Increased",
    ),
    "nutritionalStatusRiskLabel": m10,
    "nutritionalStatusRiskLow": MessageLookupByLibrary.simpleMessage(
      "Low \n(but risk of other \nclinical problems increased)",
    ),
    "nutritionalStatusRiskModerate": MessageLookupByLibrary.simpleMessage(
      "Moderate",
    ),
    "nutritionalStatusRiskSevere": MessageLookupByLibrary.simpleMessage(
      "Severe",
    ),
    "nutritionalStatusRiskVerySevere": MessageLookupByLibrary.simpleMessage(
      "Very severe",
    ),
    "nutritionalStatusUnderweight": MessageLookupByLibrary.simpleMessage(
      "Underweight",
    ),
    "offDisclaimer": MessageLookupByLibrary.simpleMessage(
      "The data provided to you by this app are retrieved from the Open Food Facts database. No guarantees can be made for the accuracy, completeness, or reliability of the information provided. The data are provided “as is” and the originating source for the data (Open Food Facts) is not liable for any damages arising out of the use of the data.",
    ),
    "onboardingActivityQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "How active are you? (without workouts)",
    ),
    "onboardingBirthdayHint": MessageLookupByLibrary.simpleMessage(
      "Enter Date",
    ),
    "onboardingBirthdayQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "When is your birthday?",
    ),
    "onboardingEnterBirthdayLabel": MessageLookupByLibrary.simpleMessage(
      "Birthday",
    ),
    "onboardingGenderQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "What\'s your gender?",
    ),
    "onboardingGoalQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "What\'s your current weight goal?",
    ),
    "onboardingHeightExampleHintCm": MessageLookupByLibrary.simpleMessage(
      "e.g. 170",
    ),
    "onboardingHeightExampleHintFt": MessageLookupByLibrary.simpleMessage(
      "e.g. 5.8",
    ),
    "onboardingHeightQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Whats your current height?",
    ),
    "onboardingIntroDescription": MessageLookupByLibrary.simpleMessage(
      "To start, the app needs some information about you to calculate your daily calorie goal.\nAll information about you is stored securely on your device.",
    ),
    "onboardingKcalPerDayLabel": MessageLookupByLibrary.simpleMessage(
      "kcal per day",
    ),
    "onboardingOverviewLabel": MessageLookupByLibrary.simpleMessage("Overview"),
    "onboardingSaveUserError": MessageLookupByLibrary.simpleMessage(
      "Wrong input, please try again",
    ),
    "onboardingWeightExampleHintKg": MessageLookupByLibrary.simpleMessage(
      "e.g. 60",
    ),
    "onboardingWeightExampleHintLbs": MessageLookupByLibrary.simpleMessage(
      "e.g. 132",
    ),
    "onboardingWeightQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Whats your current weight?",
    ),
    "onboardingWelcomeLabel": MessageLookupByLibrary.simpleMessage(
      "Welcome to",
    ),
    "onboardingWrongHeightLabel": MessageLookupByLibrary.simpleMessage(
      "Enter correct height",
    ),
    "onboardingWrongWeightLabel": MessageLookupByLibrary.simpleMessage(
      "Enter correct weight",
    ),
    "onboardingYourGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Your calorie goal:",
    ),
    "onboardingYourMacrosGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Your macronutrient goals:",
    ),
    "ozUnit": MessageLookupByLibrary.simpleMessage("oz"),
    "paAmericanFootballGeneral": MessageLookupByLibrary.simpleMessage(
      "football",
    ),
    "paAmericanFootballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "touch, flag, general",
    ),
    "paArcheryGeneral": MessageLookupByLibrary.simpleMessage("archery"),
    "paArcheryGeneralDesc": MessageLookupByLibrary.simpleMessage("non-hunting"),
    "paAutoRacing": MessageLookupByLibrary.simpleMessage("auto racing"),
    "paAutoRacingDesc": MessageLookupByLibrary.simpleMessage("open wheel"),
    "paBackpackingGeneral": MessageLookupByLibrary.simpleMessage("backpacking"),
    "paBackpackingGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paBadmintonGeneral": MessageLookupByLibrary.simpleMessage("badminton"),
    "paBadmintonGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "social singles and doubles, general",
    ),
    "paBasketballGeneral": MessageLookupByLibrary.simpleMessage("basketball"),
    "paBasketballGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paBicyclingGeneral": MessageLookupByLibrary.simpleMessage("bicycling"),
    "paBicyclingGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paBicyclingMountainGeneral": MessageLookupByLibrary.simpleMessage(
      "bicycling, mountain",
    ),
    "paBicyclingMountainGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "general",
    ),
    "paBicyclingStationaryGeneral": MessageLookupByLibrary.simpleMessage(
      "bicycling, stationary",
    ),
    "paBicyclingStationaryGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "general",
    ),
    "paBilliardsGeneral": MessageLookupByLibrary.simpleMessage("billiards"),
    "paBilliardsGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paBowlingGeneral": MessageLookupByLibrary.simpleMessage("bowling"),
    "paBowlingGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paBoxingBag": MessageLookupByLibrary.simpleMessage("boxing"),
    "paBoxingBagDesc": MessageLookupByLibrary.simpleMessage("punching bag"),
    "paBoxingGeneral": MessageLookupByLibrary.simpleMessage("boxing"),
    "paBoxingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "in ring, general",
    ),
    "paBroomball": MessageLookupByLibrary.simpleMessage("broomball"),
    "paBroomballDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paCalisthenicsGeneral": MessageLookupByLibrary.simpleMessage(
      "calisthenics",
    ),
    "paCalisthenicsGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "light or moderate effort, general (e.g., back exercises)",
    ),
    "paCanoeingGeneral": MessageLookupByLibrary.simpleMessage("canoeing"),
    "paCanoeingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "rowing, for pleasure, general",
    ),
    "paCatch": MessageLookupByLibrary.simpleMessage("football or baseball"),
    "paCatchDesc": MessageLookupByLibrary.simpleMessage("playing catch"),
    "paCheerleading": MessageLookupByLibrary.simpleMessage("cheerleading"),
    "paCheerleadingDesc": MessageLookupByLibrary.simpleMessage(
      "gymnastic moves, competitive",
    ),
    "paChildrenGame": MessageLookupByLibrary.simpleMessage("children’s games"),
    "paChildrenGameDesc": MessageLookupByLibrary.simpleMessage(
      "(e.g., hopscotch, 4-square, dodgeball, playground apparatus, t-ball, tetherball, marbles, arcade games), moderate effort",
    ),
    "paClimbingHillsNoLoadGeneral": MessageLookupByLibrary.simpleMessage(
      "climbing hills, no load",
    ),
    "paClimbingHillsNoLoadGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "no load",
    ),
    "paCricket": MessageLookupByLibrary.simpleMessage("cricket"),
    "paCricketDesc": MessageLookupByLibrary.simpleMessage(
      "batting, bowling, fielding",
    ),
    "paCroquet": MessageLookupByLibrary.simpleMessage("croquet"),
    "paCroquetDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paCurling": MessageLookupByLibrary.simpleMessage("curling"),
    "paCurlingDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paDancingAerobicGeneral": MessageLookupByLibrary.simpleMessage("aerobic"),
    "paDancingAerobicGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "general",
    ),
    "paDancingGeneral": MessageLookupByLibrary.simpleMessage("general dancing"),
    "paDancingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "e.g. disco, folk, Irish step dancing, line dancing, polka, contra, country",
    ),
    "paDartsWall": MessageLookupByLibrary.simpleMessage("darts"),
    "paDartsWallDesc": MessageLookupByLibrary.simpleMessage("wall or lawn"),
    "paDivingGeneral": MessageLookupByLibrary.simpleMessage("diving"),
    "paDivingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "skindiving, scuba diving, general",
    ),
    "paDivingSpringboardPlatform": MessageLookupByLibrary.simpleMessage(
      "diving",
    ),
    "paDivingSpringboardPlatformDesc": MessageLookupByLibrary.simpleMessage(
      "springboard or platform",
    ),
    "paFencing": MessageLookupByLibrary.simpleMessage("fencing"),
    "paFencingDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paFrisbee": MessageLookupByLibrary.simpleMessage("frisbee playing"),
    "paFrisbeeDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paGolfGeneral": MessageLookupByLibrary.simpleMessage("golf"),
    "paGolfGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paGymnasticsGeneral": MessageLookupByLibrary.simpleMessage("gymnastics"),
    "paGymnasticsGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paHackySack": MessageLookupByLibrary.simpleMessage("hacky sack"),
    "paHackySackDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paHandballGeneral": MessageLookupByLibrary.simpleMessage("handball"),
    "paHandballGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paHangGliding": MessageLookupByLibrary.simpleMessage("hang gliding"),
    "paHangGlidingDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paHeadingBicycling": MessageLookupByLibrary.simpleMessage("bicycling"),
    "paHeadingConditionalExercise": MessageLookupByLibrary.simpleMessage(
      "conditioning exercise",
    ),
    "paHeadingDancing": MessageLookupByLibrary.simpleMessage("dancing"),
    "paHeadingRunning": MessageLookupByLibrary.simpleMessage("running"),
    "paHeadingSports": MessageLookupByLibrary.simpleMessage("sports"),
    "paHeadingWalking": MessageLookupByLibrary.simpleMessage("walking"),
    "paHeadingWaterActivities": MessageLookupByLibrary.simpleMessage(
      "water activities",
    ),
    "paHeadingWinterActivities": MessageLookupByLibrary.simpleMessage(
      "winter activities",
    ),
    "paHikingCrossCountry": MessageLookupByLibrary.simpleMessage("hiking"),
    "paHikingCrossCountryDesc": MessageLookupByLibrary.simpleMessage(
      "cross country",
    ),
    "paHockeyField": MessageLookupByLibrary.simpleMessage("hockey, field"),
    "paHockeyFieldDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paHorseRidingGeneral": MessageLookupByLibrary.simpleMessage(
      "horseback riding",
    ),
    "paHorseRidingGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paIceHockeyGeneral": MessageLookupByLibrary.simpleMessage("ice hockey"),
    "paIceHockeyGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paIceSkatingGeneral": MessageLookupByLibrary.simpleMessage("ice skating"),
    "paIceSkatingGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paJaiAlai": MessageLookupByLibrary.simpleMessage("jai alai"),
    "paJaiAlaiDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paJoggingGeneral": MessageLookupByLibrary.simpleMessage("jogging"),
    "paJoggingGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paJuggling": MessageLookupByLibrary.simpleMessage("juggling"),
    "paJugglingDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paKayakingModerate": MessageLookupByLibrary.simpleMessage("kayaking"),
    "paKayakingModerateDesc": MessageLookupByLibrary.simpleMessage(
      "moderate effort",
    ),
    "paKickball": MessageLookupByLibrary.simpleMessage("kickball"),
    "paKickballDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paLacrosse": MessageLookupByLibrary.simpleMessage("lacrosse"),
    "paLacrosseDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paLawnBowling": MessageLookupByLibrary.simpleMessage("lawn bowling"),
    "paLawnBowlingDesc": MessageLookupByLibrary.simpleMessage(
      "bocce ball, outdoor",
    ),
    "paMartialArtsModerate": MessageLookupByLibrary.simpleMessage(
      "martial arts",
    ),
    "paMartialArtsModerateDesc": MessageLookupByLibrary.simpleMessage(
      "different types, moderate pace (e.g., judo, jujitsu, karate, kick boxing, tae kwan do, tai-bo, Muay Thai boxing)",
    ),
    "paMartialArtsSlower": MessageLookupByLibrary.simpleMessage("martial arts"),
    "paMartialArtsSlowerDesc": MessageLookupByLibrary.simpleMessage(
      "different types, slower pace, novice performers, practice",
    ),
    "paMotoCross": MessageLookupByLibrary.simpleMessage("moto-cross"),
    "paMotoCrossDesc": MessageLookupByLibrary.simpleMessage(
      "off-road motor sports, all-terrain vehicle, general",
    ),
    "paMountainClimbing": MessageLookupByLibrary.simpleMessage("climbing"),
    "paMountainClimbingDesc": MessageLookupByLibrary.simpleMessage(
      "rock or mountain climbing",
    ),
    "paOrienteering": MessageLookupByLibrary.simpleMessage("orienteering"),
    "paOrienteeringDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paPaddleBoarding": MessageLookupByLibrary.simpleMessage("paddle boarding"),
    "paPaddleBoardingDesc": MessageLookupByLibrary.simpleMessage("standing"),
    "paPaddleBoat": MessageLookupByLibrary.simpleMessage("paddle boat"),
    "paPaddleBoatDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paPaddleball": MessageLookupByLibrary.simpleMessage("paddleball"),
    "paPaddleballDesc": MessageLookupByLibrary.simpleMessage("casual, general"),
    "paPoloHorse": MessageLookupByLibrary.simpleMessage("polo"),
    "paPoloHorseDesc": MessageLookupByLibrary.simpleMessage("on horseback"),
    "paRacquetball": MessageLookupByLibrary.simpleMessage("racquetball"),
    "paRacquetballDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paResistanceTraining": MessageLookupByLibrary.simpleMessage(
      "resistance training",
    ),
    "paResistanceTrainingDesc": MessageLookupByLibrary.simpleMessage(
      "weight lifting, free weight, nautilus or universal",
    ),
    "paRodeoSportGeneralModerate": MessageLookupByLibrary.simpleMessage(
      "rodeo sports",
    ),
    "paRodeoSportGeneralModerateDesc": MessageLookupByLibrary.simpleMessage(
      "general, moderate effort",
    ),
    "paRollerbladingLight": MessageLookupByLibrary.simpleMessage(
      "rollerblading",
    ),
    "paRollerbladingLightDesc": MessageLookupByLibrary.simpleMessage(
      "in-line skating",
    ),
    "paRopeJumpingGeneral": MessageLookupByLibrary.simpleMessage(
      "rope jumping",
    ),
    "paRopeJumpingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "moderate pace, 100-120 skips/min, general, 2 foot skip, plain bounce",
    ),
    "paRopeSkippingGeneral": MessageLookupByLibrary.simpleMessage(
      "rope skipping",
    ),
    "paRopeSkippingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "general",
    ),
    "paRugbyCompetitive": MessageLookupByLibrary.simpleMessage("rugby"),
    "paRugbyCompetitiveDesc": MessageLookupByLibrary.simpleMessage(
      "union, team, competitive",
    ),
    "paRugbyNonCompetitive": MessageLookupByLibrary.simpleMessage("rugby"),
    "paRugbyNonCompetitiveDesc": MessageLookupByLibrary.simpleMessage(
      "touch, non-competitive",
    ),
    "paRunningGeneral": MessageLookupByLibrary.simpleMessage("running"),
    "paRunningGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paSailingGeneral": MessageLookupByLibrary.simpleMessage("sailing"),
    "paSailingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "boat and board sailing, windsurfing, ice sailing, general",
    ),
    "paShuffleboard": MessageLookupByLibrary.simpleMessage("shuffleboard"),
    "paShuffleboardDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paSkateboardingGeneral": MessageLookupByLibrary.simpleMessage(
      "skateboarding",
    ),
    "paSkateboardingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "general, moderate effort",
    ),
    "paSkatingRoller": MessageLookupByLibrary.simpleMessage("roller skating"),
    "paSkatingRollerDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paSkiingGeneral": MessageLookupByLibrary.simpleMessage("skiing"),
    "paSkiingGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paSkiingWaterWakeboarding": MessageLookupByLibrary.simpleMessage(
      "water skiing",
    ),
    "paSkiingWaterWakeboardingDesc": MessageLookupByLibrary.simpleMessage(
      "water or wakeboarding",
    ),
    "paSkydiving": MessageLookupByLibrary.simpleMessage("skydiving"),
    "paSkydivingDesc": MessageLookupByLibrary.simpleMessage(
      "skydiving, base jumping, bungee jumping",
    ),
    "paSnorkeling": MessageLookupByLibrary.simpleMessage("snorkeling"),
    "paSnorkelingDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paSnowShovingModerate": MessageLookupByLibrary.simpleMessage(
      "snow shoveling",
    ),
    "paSnowShovingModerateDesc": MessageLookupByLibrary.simpleMessage(
      "by hand, moderate effort",
    ),
    "paSoccerGeneral": MessageLookupByLibrary.simpleMessage("soccer"),
    "paSoccerGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "casual, general",
    ),
    "paSoftballBaseballGeneral": MessageLookupByLibrary.simpleMessage(
      "softball / baseball",
    ),
    "paSoftballBaseballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "fast or slow pitch, general",
    ),
    "paSquashGeneral": MessageLookupByLibrary.simpleMessage("squash"),
    "paSquashGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paSurfing": MessageLookupByLibrary.simpleMessage("surfing"),
    "paSurfingDesc": MessageLookupByLibrary.simpleMessage(
      "body or board, general",
    ),
    "paSwimmingGeneral": MessageLookupByLibrary.simpleMessage("swimming"),
    "paSwimmingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "treading water, moderate effort, general",
    ),
    "paTableTennisGeneral": MessageLookupByLibrary.simpleMessage(
      "table tennis",
    ),
    "paTableTennisGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "table tennis, ping pong",
    ),
    "paTaiChiQiGongGeneral": MessageLookupByLibrary.simpleMessage(
      "tai chi, qi gong",
    ),
    "paTaiChiQiGongGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "general",
    ),
    "paTennisGeneral": MessageLookupByLibrary.simpleMessage("tennis"),
    "paTennisGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paTrackField": MessageLookupByLibrary.simpleMessage("track and field"),
    "paTrackField1Desc": MessageLookupByLibrary.simpleMessage(
      "(e.g. shot, discus, hammer throw)",
    ),
    "paTrackField2Desc": MessageLookupByLibrary.simpleMessage(
      "(e.g. high jump, long jump, triple jump, javelin, pole vault)",
    ),
    "paTrackField3Desc": MessageLookupByLibrary.simpleMessage(
      "(e.g. steeplechase, hurdles)",
    ),
    "paTrampolineLight": MessageLookupByLibrary.simpleMessage("trampoline"),
    "paTrampolineLightDesc": MessageLookupByLibrary.simpleMessage(
      "recreational",
    ),
    "paUnicyclingGeneral": MessageLookupByLibrary.simpleMessage("unicycling"),
    "paUnicyclingGeneralDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paVolleyballGeneral": MessageLookupByLibrary.simpleMessage("volleyball"),
    "paVolleyballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "non-competitive, 6 - 9 member team, general",
    ),
    "paWalkingForPleasure": MessageLookupByLibrary.simpleMessage("walking"),
    "paWalkingForPleasureDesc": MessageLookupByLibrary.simpleMessage(
      "for pleasure",
    ),
    "paWalkingTheDog": MessageLookupByLibrary.simpleMessage("walking the dog"),
    "paWalkingTheDogDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paWallyball": MessageLookupByLibrary.simpleMessage("wallyball"),
    "paWallyballDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paWaterAerobics": MessageLookupByLibrary.simpleMessage("water exercise"),
    "paWaterAerobicsDesc": MessageLookupByLibrary.simpleMessage(
      "water aerobics, water calisthenics",
    ),
    "paWaterPolo": MessageLookupByLibrary.simpleMessage("water polo"),
    "paWaterPoloDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paWaterVolleyball": MessageLookupByLibrary.simpleMessage(
      "water volleyball",
    ),
    "paWaterVolleyballDesc": MessageLookupByLibrary.simpleMessage("general"),
    "paWateraerobicsCalisthenics": MessageLookupByLibrary.simpleMessage(
      "water aerobics",
    ),
    "paWateraerobicsCalisthenicsDesc": MessageLookupByLibrary.simpleMessage(
      "water aerobics, water calisthenics",
    ),
    "paWrestling": MessageLookupByLibrary.simpleMessage("wrestling"),
    "paWrestlingDesc": MessageLookupByLibrary.simpleMessage("general"),
    "palActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Mostly standing or walking in job and active free time activities",
    ),
    "palActiveLabel": MessageLookupByLibrary.simpleMessage("Active"),
    "palExtraActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Very intense physical job and extremely active free time activities",
    ),
    "palExtraActiveLabel": MessageLookupByLibrary.simpleMessage("Extra Active"),
    "palLowActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "e.g. sitting or standing in job and light free time activities",
    ),
    "palLowLActiveLabel": MessageLookupByLibrary.simpleMessage("Low Active"),
    "palSedentaryDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "e.g. office job and mostly sitting free time activities",
    ),
    "palSedentaryLabel": MessageLookupByLibrary.simpleMessage("Sedentary"),
    "palVeryActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Mostly walking, running or carrying weight in job and active free time activities",
    ),
    "palVeryActiveLabel": MessageLookupByLibrary.simpleMessage("Very Active"),
    "per100gmlLabel": MessageLookupByLibrary.simpleMessage("Per 100g/ml"),
    "perServingLabel": MessageLookupByLibrary.simpleMessage("Per Serving"),
    "photoCaptureButton": MessageLookupByLibrary.simpleMessage("Take Photo"),
    "photoComparisonTitle": MessageLookupByLibrary.simpleMessage(
      "Before & After",
    ),
    "photoGalleryButton": MessageLookupByLibrary.simpleMessage(
      "Pick from Gallery",
    ),
    "photoProgressLabel": MessageLookupByLibrary.simpleMessage(
      "Photo Progress",
    ),
    "photoProgressSubtitle": MessageLookupByLibrary.simpleMessage(
      "Track progress with photos",
    ),
    "photoProgressTitle": MessageLookupByLibrary.simpleMessage(
      "Photo Progress",
    ),
    "photoTagsHint": MessageLookupByLibrary.simpleMessage("e.g. front, side"),
    "photoTagsLabel": MessageLookupByLibrary.simpleMessage("Tags"),
    "potassiumPer100Label": MessageLookupByLibrary.simpleMessage(
      "Potassium per ",
    ),
    "prepTimeLabel": MessageLookupByLibrary.simpleMessage("Prep time"),
    "presetCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "presetEighteenSix": MessageLookupByLibrary.simpleMessage("18:6"),
    "presetOMAD": MessageLookupByLibrary.simpleMessage("OMAD"),
    "presetSixteenEight": MessageLookupByLibrary.simpleMessage("16:8"),
    "presetTwentyFour": MessageLookupByLibrary.simpleMessage("20:4"),
    "privacyPolicyLabel": MessageLookupByLibrary.simpleMessage(
      "Privacy policy",
    ),
    "profileLabel": MessageLookupByLibrary.simpleMessage("Profile"),
    "progressChartsLabel": MessageLookupByLibrary.simpleMessage("Progress"),
    "proteinLabel": MessageLookupByLibrary.simpleMessage("protein"),
    "proteinLabelShort": MessageLookupByLibrary.simpleMessage("Protein"),
    "quantityLabel": MessageLookupByLibrary.simpleMessage("Quantity"),
    "readLabel": MessageLookupByLibrary.simpleMessage(
      "I have read and accept the privacy policy.",
    ),
    "recalculateBudget": MessageLookupByLibrary.simpleMessage(
      "Recalculate Budget",
    ),
    "recentFoodsLabel": MessageLookupByLibrary.simpleMessage("Recent Foods"),
    "recentlyAddedLabel": MessageLookupByLibrary.simpleMessage("Recently"),
    "recipeBuilderLabel": MessageLookupByLibrary.simpleMessage(
      "Recipe Builder",
    ),
    "recipeCatalogAddToDiary": MessageLookupByLibrary.simpleMessage(
      "Add to Diary",
    ),
    "recipeCatalogDetailTitle": MessageLookupByLibrary.simpleMessage(
      "Recipe Details",
    ),
    "recipeCatalogEmpty": MessageLookupByLibrary.simpleMessage(
      "No recipes found",
    ),
    "recipeCatalogMin": MessageLookupByLibrary.simpleMessage("min"),
    "recipeCatalogNutrition": MessageLookupByLibrary.simpleMessage("Nutrition"),
    "recipeCatalogSearch": MessageLookupByLibrary.simpleMessage(
      "Search recipes",
    ),
    "recipeCatalogSearchHint": MessageLookupByLibrary.simpleMessage(
      "Search by name, ingredient...",
    ),
    "recipeCatalogTitle": MessageLookupByLibrary.simpleMessage(
      "Recipe Catalog",
    ),
    "recipeImportTitle": MessageLookupByLibrary.simpleMessage("Import Recipe"),
    "recipeNameLabel": MessageLookupByLibrary.simpleMessage("Recipe name"),
    "recipePreview": MessageLookupByLibrary.simpleMessage("Recipe Preview"),
    "recipeServingsLabel": MessageLookupByLibrary.simpleMessage("Servings"),
    "recipeUrl": MessageLookupByLibrary.simpleMessage("Recipe URL"),
    "remainingBudgetLabel": MessageLookupByLibrary.simpleMessage(
      "Remaining Budget",
    ),
    "remainingLabel": MessageLookupByLibrary.simpleMessage("Remaining"),
    "remainingTimeLabel": MessageLookupByLibrary.simpleMessage("Remaining"),
    "reportErrorDialogText": MessageLookupByLibrary.simpleMessage(
      "Do you want to report an error to the developer?",
    ),
    "retryLabel": MessageLookupByLibrary.simpleMessage("Retry"),
    "saturatedFatLabel": MessageLookupByLibrary.simpleMessage("saturated fat"),
    "saturatedFatPer100Label": MessageLookupByLibrary.simpleMessage(
      "Saturated fat per ",
    ),
    "saturdayLabel": MessageLookupByLibrary.simpleMessage("Saturday"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveRecipeLabel": MessageLookupByLibrary.simpleMessage("Save recipe"),
    "scaleType": MessageLookupByLibrary.simpleMessage("Scale"),
    "scanProductLabel": MessageLookupByLibrary.simpleMessage("Scan Product"),
    "searchDefaultLabel": MessageLookupByLibrary.simpleMessage(
      "Please enter a search word",
    ),
    "searchFoodPage": MessageLookupByLibrary.simpleMessage("Food"),
    "searchLabel": MessageLookupByLibrary.simpleMessage("Search"),
    "searchProductsPage": MessageLookupByLibrary.simpleMessage("Products"),
    "searchResultsLabel": MessageLookupByLibrary.simpleMessage(
      "Search results",
    ),
    "seeAllLabel": MessageLookupByLibrary.simpleMessage("See All"),
    "selectGenderDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Select Gender",
    ),
    "selectHeightDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Select Height",
    ),
    "selectPalCategoryLabel": MessageLookupByLibrary.simpleMessage(
      "Select Activity Level",
    ),
    "selectWeightDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Select Weight",
    ),
    "sendAnonymousUserData": MessageLookupByLibrary.simpleMessage(
      "Send anonymous usage data",
    ),
    "servingLabel": MessageLookupByLibrary.simpleMessage("Serving"),
    "servingSizeLabelImperial": MessageLookupByLibrary.simpleMessage(
      "Serving size (oz/fl oz)",
    ),
    "servingSizeLabelMetric": MessageLookupByLibrary.simpleMessage(
      "Serving size (g/ml)",
    ),
    "settingAboutLabel": MessageLookupByLibrary.simpleMessage("About"),
    "settingFeedbackLabel": MessageLookupByLibrary.simpleMessage("Feedback"),
    "settingsCalculationsLabel": MessageLookupByLibrary.simpleMessage(
      "Calculations",
    ),
    "settingsDisclaimerLabel": MessageLookupByLibrary.simpleMessage(
      "Disclaimer",
    ),
    "settingsDistanceLabel": MessageLookupByLibrary.simpleMessage("Distance"),
    "settingsImperialLabel": MessageLookupByLibrary.simpleMessage(
      "Imperial (lbs, ft, oz)",
    ),
    "settingsLabel": MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsLicensesLabel": MessageLookupByLibrary.simpleMessage("Licenses"),
    "settingsMassLabel": MessageLookupByLibrary.simpleMessage("Mass"),
    "settingsMetricLabel": MessageLookupByLibrary.simpleMessage(
      "Metric (kg, cm, ml)",
    ),
    "settingsPrivacySettings": MessageLookupByLibrary.simpleMessage(
      "Privacy Settings",
    ),
    "settingsReportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Report Error",
    ),
    "settingsSourceCodeLabel": MessageLookupByLibrary.simpleMessage(
      "Source Code",
    ),
    "settingsSystemLabel": MessageLookupByLibrary.simpleMessage("System"),
    "settingsThemeDarkLabel": MessageLookupByLibrary.simpleMessage("Dark"),
    "settingsThemeLabel": MessageLookupByLibrary.simpleMessage("Theme"),
    "settingsThemeLightLabel": MessageLookupByLibrary.simpleMessage("Light"),
    "settingsThemeSystemDefaultLabel": MessageLookupByLibrary.simpleMessage(
      "System default",
    ),
    "settingsUnitsLabel": MessageLookupByLibrary.simpleMessage("Units"),
    "settingsVolumeLabel": MessageLookupByLibrary.simpleMessage("Volume"),
    "shoppingListLabel": MessageLookupByLibrary.simpleMessage("Shopping List"),
    "showNutritionLabel": MessageLookupByLibrary.simpleMessage(
      "Show nutrition details",
    ),
    "snackExample": MessageLookupByLibrary.simpleMessage(
      "e.g. apple, ice cream, chocolate ...",
    ),
    "snackLabel": MessageLookupByLibrary.simpleMessage("Snack"),
    "sodiumLabel": MessageLookupByLibrary.simpleMessage("Sodium"),
    "sodiumPer100Label": MessageLookupByLibrary.simpleMessage("Sodium per "),
    "sourceUrlLabel": MessageLookupByLibrary.simpleMessage("Source"),
    "startFastLabel": MessageLookupByLibrary.simpleMessage("Start Fast"),
    "startWeight": MessageLookupByLibrary.simpleMessage("Start"),
    "stepBonusCreditLabel": MessageLookupByLibrary.simpleMessage("Step credit"),
    "stepBonusDescription": MessageLookupByLibrary.simpleMessage(
      "Earn calorie credits from your daily step count. The more you walk, the more calories you get back.",
    ),
    "stepBonusEnableLabel": MessageLookupByLibrary.simpleMessage(
      "Enable Step Bonus",
    ),
    "stepBonusLabel": MessageLookupByLibrary.simpleMessage("Step Bonus"),
    "stepBonusPercentLabel": MessageLookupByLibrary.simpleMessage(
      "Credit Percentage",
    ),
    "stepBonusRefreshLabel": MessageLookupByLibrary.simpleMessage("Refresh"),
    "stepBonusStepsLabel": MessageLookupByLibrary.simpleMessage("Steps today"),
    "stepBonusTodaySummary": MessageLookupByLibrary.simpleMessage(
      "Today\'s Step Bonus",
    ),
    "streakLabel": MessageLookupByLibrary.simpleMessage("Streak"),
    "sugarLabel": MessageLookupByLibrary.simpleMessage("sugar"),
    "sugarsPer100Label": MessageLookupByLibrary.simpleMessage("Sugars per "),
    "summaryTimeLabel": MessageLookupByLibrary.simpleMessage("Summary Time"),
    "sundayLabel": MessageLookupByLibrary.simpleMessage("Sunday"),
    "suppliedLabel": MessageLookupByLibrary.simpleMessage("supplied"),
    "symptomHistory": MessageLookupByLibrary.simpleMessage("History"),
    "symptomNotes": MessageLookupByLibrary.simpleMessage("Notes"),
    "symptomSeverity": MessageLookupByLibrary.simpleMessage("Severity"),
    "symptomSeverityOverTime": MessageLookupByLibrary.simpleMessage(
      "Severity over time",
    ),
    "symptomTitle": MessageLookupByLibrary.simpleMessage("Symptom Tracking"),
    "symptomTrend": MessageLookupByLibrary.simpleMessage("Severity Trend"),
    "symptomType": MessageLookupByLibrary.simpleMessage("Symptom Type"),
    "symptomTypeAnxiety": MessageLookupByLibrary.simpleMessage("Anxiety"),
    "symptomTypeBloating": MessageLookupByLibrary.simpleMessage("Bloating"),
    "symptomTypeCramps": MessageLookupByLibrary.simpleMessage("Cramps"),
    "symptomTypeDizziness": MessageLookupByLibrary.simpleMessage("Dizziness"),
    "symptomTypeFatigue": MessageLookupByLibrary.simpleMessage("Fatigue"),
    "symptomTypeHeadache": MessageLookupByLibrary.simpleMessage("Headache"),
    "symptomTypeInsomnia": MessageLookupByLibrary.simpleMessage("Insomnia"),
    "symptomTypeNausea": MessageLookupByLibrary.simpleMessage("Nausea"),
    "symptomTypeOther": MessageLookupByLibrary.simpleMessage("Other"),
    "tdeeLabel": MessageLookupByLibrary.simpleMessage("TDEE"),
    "textType": MessageLookupByLibrary.simpleMessage("Text"),
    "thighCm": MessageLookupByLibrary.simpleMessage("Thigh (cm)"),
    "thursdayLabel": MessageLookupByLibrary.simpleMessage("Thursday"),
    "timeLabel": MessageLookupByLibrary.simpleMessage("Time"),
    "timesPerDay": MessageLookupByLibrary.simpleMessage("Times Per Day"),
    "todayEntries": MessageLookupByLibrary.simpleMessage("Today"),
    "trackerName": MessageLookupByLibrary.simpleMessage("Tracker Name"),
    "trackerTrend": MessageLookupByLibrary.simpleMessage("Trend"),
    "trackerType": MessageLookupByLibrary.simpleMessage("Type"),
    "tuesdayLabel": MessageLookupByLibrary.simpleMessage("Tuesday"),
    "unitLabel": MessageLookupByLibrary.simpleMessage("Unit"),
    "viewPhotoLabel": MessageLookupByLibrary.simpleMessage("View Photo"),
    "voiceLoggingConfirmButton": MessageLookupByLibrary.simpleMessage(
      "Confirm",
    ),
    "voiceLoggingExample": MessageLookupByLibrary.simpleMessage(
      "Log food by speaking",
    ),
    "voiceLoggingLabel": MessageLookupByLibrary.simpleMessage("Voice Log"),
    "voiceLoggingListening": MessageLookupByLibrary.simpleMessage(
      "Listening...",
    ),
    "voiceLoggingNoMatches": MessageLookupByLibrary.simpleMessage(
      "No matching products found",
    ),
    "voiceLoggingParsing": MessageLookupByLibrary.simpleMessage(
      "Identifying food items...",
    ),
    "voiceLoggingResultsTitle": MessageLookupByLibrary.simpleMessage(
      "Recognized Food Items",
    ),
    "voiceLoggingRetryButton": MessageLookupByLibrary.simpleMessage("Retry"),
    "voiceLoggingStartButton": MessageLookupByLibrary.simpleMessage(
      "Start Recording",
    ),
    "voiceLoggingStopButton": MessageLookupByLibrary.simpleMessage(
      "Stop Recording",
    ),
    "voiceLoggingSubtitle": MessageLookupByLibrary.simpleMessage(
      "Tap the microphone and describe what you ate",
    ),
    "voiceLoggingTitle": MessageLookupByLibrary.simpleMessage(
      "Voice Food Logging",
    ),
    "waistCm": MessageLookupByLibrary.simpleMessage("Waist (cm)"),
    "waterProgress": m11,
    "waterTrackerTitle": MessageLookupByLibrary.simpleMessage("Water Tracker"),
    "wednesdayLabel": MessageLookupByLibrary.simpleMessage("Wednesday"),
    "weekdayTargets": MessageLookupByLibrary.simpleMessage("Weekday Targets"),
    "weekly": MessageLookupByLibrary.simpleMessage("Weekly"),
    "weeklyCalorieChart": MessageLookupByLibrary.simpleMessage(
      "Weekly Calories",
    ),
    "weeklyLabel": MessageLookupByLibrary.simpleMessage("Week"),
    "weeklySummaryLabel": MessageLookupByLibrary.simpleMessage(
      "Weekly Summary",
    ),
    "weightKg": MessageLookupByLibrary.simpleMessage("Weight (kg)"),
    "weightLabel": MessageLookupByLibrary.simpleMessage("Weight"),
    "weightTab": MessageLookupByLibrary.simpleMessage("Weight"),
    "weightTracking": MessageLookupByLibrary.simpleMessage("Weight Tracking"),
    "weightTrend": MessageLookupByLibrary.simpleMessage("Weight Trend"),
    "widgetCarbsShort": MessageLookupByLibrary.simpleMessage("C"),
    "widgetFatsShort": MessageLookupByLibrary.simpleMessage("F"),
    "widgetHomeDescription": MessageLookupByLibrary.simpleMessage(
      "Show remaining calories and macros on your home screen.",
    ),
    "widgetHomeTitle": MessageLookupByLibrary.simpleMessage("Nutriq Home"),
    "widgetKcalLeft": MessageLookupByLibrary.simpleMessage("kcal left"),
    "widgetLockDescription": MessageLookupByLibrary.simpleMessage(
      "Show remaining calories on your lock screen.",
    ),
    "widgetLockTitle": MessageLookupByLibrary.simpleMessage("Nutriq Calories"),
    "widgetProteinsShort": MessageLookupByLibrary.simpleMessage("P"),
    "yearsLabel": m12,
  };
}
