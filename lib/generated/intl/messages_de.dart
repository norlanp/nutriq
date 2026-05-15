// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(pct) => "${pct}% Konfidenz";

  static String m1(count) => "${count} Allergene-Filter aktiv";

  static String m2(versionNumber) => "Version ${versionNumber}";

  static String m3(pctCarbs, pctFats, pctProteins) =>
      "${pctCarbs}% Kohlenhydrate, ${pctFats}% Fette, ${pctProteins}% Proteine";

  static String m4(timestamp) => "Zuletzt synchronisiert: ${timestamp}";

  static String m5(steps) => "${steps} Schritte synchronisiert";

  static String m6(taken, total) => "${taken} / ${total} Dosen eingenommen";

  static String m7(count) => "${count} zum Tagebuch hinzufügen";

  static String m8(count) =>
      "${count} Eintrag/Einträge zum Tagebuch hinzugefügt";

  static String m9(count) => "${count} Positionen gefunden";

  static String m10(riskValue) =>
      "Risiko für Begleiterkrankungen: ${riskValue}";

  static String m11(current, goal) => "${current} / ${goal} ml";

  static String m12(age) => "${age} Jahre";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "activeFastLabel": MessageLookupByLibrary.simpleMessage("Aktives Fasten"),
    "activityExample": MessageLookupByLibrary.simpleMessage(
      "z. B. Laufen, Radfahren, Yoga ...",
    ),
    "activityLabel": MessageLookupByLibrary.simpleMessage("Aktivität"),
    "activityMultiplierLabel": MessageLookupByLibrary.simpleMessage(
      "Aktivitätsmultiplikator",
    ),
    "addBloodGlucoseEntry": MessageLookupByLibrary.simpleMessage(
      "Eintrag hinzufügen",
    ),
    "addExerciseLabel": MessageLookupByLibrary.simpleMessage(
      "Übung hinzufügen",
    ),
    "addIngredientLabel": MessageLookupByLibrary.simpleMessage(
      "Zutat hinzufügen",
    ),
    "addItemLabel": MessageLookupByLibrary.simpleMessage(
      "Neuen Eintrag hinzufügen:",
    ),
    "addLabel": MessageLookupByLibrary.simpleMessage("Hinzufügen"),
    "addMeasurement": MessageLookupByLibrary.simpleMessage(
      "Messung hinzufügen",
    ),
    "addMedication": MessageLookupByLibrary.simpleMessage(
      "Medikament hinzufügen",
    ),
    "addSymptom": MessageLookupByLibrary.simpleMessage("Symptom hinzufügen"),
    "addWater": MessageLookupByLibrary.simpleMessage("Wasser hinzufügen"),
    "additionalInfoLabelCompendium2011": MessageLookupByLibrary.simpleMessage(
      "Informationen bereitgestellt von\n\'2011 Compendium\n of Physical Activities\'",
    ),
    "additionalInfoLabelCustom": MessageLookupByLibrary.simpleMessage(
      "Benutzerdefinierte Mahlzeit",
    ),
    "additionalInfoLabelFDC": MessageLookupByLibrary.simpleMessage(
      "Weitere Informationen unter\nFoodData Central",
    ),
    "additionalInfoLabelOFF": MessageLookupByLibrary.simpleMessage(
      "Weitere Informationen unter\nOpenFoodFacts",
    ),
    "additionalInfoLabelUnknown": MessageLookupByLibrary.simpleMessage(
      "Unbekannte Mahlzeit",
    ),
    "adjustedCalories": MessageLookupByLibrary.simpleMessage(
      "Angepasste Kalorien",
    ),
    "afterLabel": MessageLookupByLibrary.simpleMessage("Nachher"),
    "afterMeal": MessageLookupByLibrary.simpleMessage("Nach dem Essen"),
    "ageLabel": MessageLookupByLibrary.simpleMessage("Alter"),
    "aiScannerCaptureButton": MessageLookupByLibrary.simpleMessage(
      "Foto aufnehmen",
    ),
    "aiScannerConfidence": m0,
    "aiScannerExample": MessageLookupByLibrary.simpleMessage(
      "Lebensmittel mit KI erkennen",
    ),
    "aiScannerGalleryButton": MessageLookupByLibrary.simpleMessage(
      "Aus Galerie wählen",
    ),
    "aiScannerLabel": MessageLookupByLibrary.simpleMessage(
      "KI-Lebensmittel-Scanner",
    ),
    "aiScannerResultsTitle": MessageLookupByLibrary.simpleMessage(
      "Klassifizierungsergebnisse",
    ),
    "aiScannerSearchManually": MessageLookupByLibrary.simpleMessage(
      "Manuell suchen",
    ),
    "aiScannerSubtitle": MessageLookupByLibrary.simpleMessage(
      "Foto aufnehmen oder aus Galerie wählen, um Lebensmittel zu erkennen",
    ),
    "aiScannerTitle": MessageLookupByLibrary.simpleMessage(
      "KI-Lebensmittel-Scanner",
    ),
    "allItemsLabel": MessageLookupByLibrary.simpleMessage("Alle"),
    "allergenCelery": MessageLookupByLibrary.simpleMessage("Sellerie"),
    "allergenCeleryDesc": MessageLookupByLibrary.simpleMessage(
      "Sellerie und Zellerieknolle",
    ),
    "allergenDairy": MessageLookupByLibrary.simpleMessage("Milchprodukte"),
    "allergenDairyDesc": MessageLookupByLibrary.simpleMessage(
      "Milch, Käse, Butter, Joghurt und andere Milchprodukte",
    ),
    "allergenEggs": MessageLookupByLibrary.simpleMessage("Eier"),
    "allergenEggsDesc": MessageLookupByLibrary.simpleMessage(
      "Eier und eihaltige Produkte",
    ),
    "allergenFilterEnabled": m1,
    "allergenFish": MessageLookupByLibrary.simpleMessage("Fisch"),
    "allergenFishDesc": MessageLookupByLibrary.simpleMessage(
      "Fisch und Fischprodukte",
    ),
    "allergenGluten": MessageLookupByLibrary.simpleMessage("Gluten"),
    "allergenGlutenDesc": MessageLookupByLibrary.simpleMessage(
      "Weizen, Gerste, Roggen und andere glutenhaltige Getreide",
    ),
    "allergenLupin": MessageLookupByLibrary.simpleMessage("Lupinen"),
    "allergenLupinDesc": MessageLookupByLibrary.simpleMessage(
      "Lupinensamen und Lupinenmehl",
    ),
    "allergenMolluscs": MessageLookupByLibrary.simpleMessage("Weichtiere"),
    "allergenMolluscsDesc": MessageLookupByLibrary.simpleMessage(
      "Muscheln, Austern, Tintenfisch und andere Weichtiere",
    ),
    "allergenMustard": MessageLookupByLibrary.simpleMessage("Senf"),
    "allergenMustardDesc": MessageLookupByLibrary.simpleMessage(
      "Senfkörner und senfhaltige Produkte",
    ),
    "allergenNuts": MessageLookupByLibrary.simpleMessage("Schalenfrüchte"),
    "allergenNutsDesc": MessageLookupByLibrary.simpleMessage(
      "Mandeln, Haselnüsse, Walnüsse und andere Schalenfrüchte",
    ),
    "allergenPeanuts": MessageLookupByLibrary.simpleMessage("Erdnüsse"),
    "allergenPeanutsDesc": MessageLookupByLibrary.simpleMessage(
      "Erdnüsse und erdnusshaltige Produkte",
    ),
    "allergenSesame": MessageLookupByLibrary.simpleMessage("Sesam"),
    "allergenSesameDesc": MessageLookupByLibrary.simpleMessage(
      "Sesamsamen und sesamhaltige Produkte",
    ),
    "allergenSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Wählen Sie Allergene aus, die aus den Suchergebnissen gefiltert werden sollen. Lebensmittel mit ausgewählten Allergenen werden ausgeblendet.",
    ),
    "allergenSettingsLabel": MessageLookupByLibrary.simpleMessage("Allergene"),
    "allergenSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Allergen-Einstellungen",
    ),
    "allergenShellfish": MessageLookupByLibrary.simpleMessage("Krebstiere"),
    "allergenShellfishDesc": MessageLookupByLibrary.simpleMessage(
      "Garnelen, Krabben, Hummer und andere Krebstiere",
    ),
    "allergenSoy": MessageLookupByLibrary.simpleMessage("Soja"),
    "allergenSoyDesc": MessageLookupByLibrary.simpleMessage(
      "Sojabohnen, Tofu, Sojasauce und andere Sojaprodukte",
    ),
    "allergenSulphurDioxide": MessageLookupByLibrary.simpleMessage(
      "Schwefeldioxid",
    ),
    "allergenSulphurDioxideDesc": MessageLookupByLibrary.simpleMessage(
      "Sulfite, häufig in Wein und Trockenfrüchten",
    ),
    "allergenWarning": MessageLookupByLibrary.simpleMessage("Enthält Allergen"),
    "alphaVersionName": MessageLookupByLibrary.simpleMessage("[Alpha]"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Nutriq ist ein kostenloser und  quelloffener Kalorien- und Nährstofftracker, der Ihre Privatsphäre respektiert.",
    ),
    "appLicenseLabel": MessageLookupByLibrary.simpleMessage("GPL-3.0 Lizenz"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Nutriq"),
    "appVersionName": m2,
    "asNeeded": MessageLookupByLibrary.simpleMessage("Bei Bedarf"),
    "autopilotDescription": MessageLookupByLibrary.simpleMessage(
      "Passt Ihr tägliches Kalorienbudget automatisch basierend auf Ihren Gewichtstrend an. Zu schneller Verlust erhöht das Budget; zu langsamer Verlust senkt es.",
    ),
    "autopilotDisabled": MessageLookupByLibrary.simpleMessage("Deaktiviert"),
    "autopilotEnabled": MessageLookupByLibrary.simpleMessage("Aktiviert"),
    "autopilotLabel": MessageLookupByLibrary.simpleMessage("Autopilot"),
    "averageLabel": MessageLookupByLibrary.simpleMessage("Durchschn."),
    "baselineCalories": MessageLookupByLibrary.simpleMessage("Basis-Kalorien"),
    "bedtime": MessageLookupByLibrary.simpleMessage("Vor dem Schlafen"),
    "beforeLabel": MessageLookupByLibrary.simpleMessage("Vorher"),
    "beforeMeal": MessageLookupByLibrary.simpleMessage("Vor dem Essen"),
    "betaVersionName": MessageLookupByLibrary.simpleMessage("[Beta]"),
    "bicepCm": MessageLookupByLibrary.simpleMessage("Bizeps (cm)"),
    "bloodGlucoseAverage": MessageLookupByLibrary.simpleMessage("Durchschnitt"),
    "bloodGlucoseLabel": MessageLookupByLibrary.simpleMessage("Kennzeichnung"),
    "bloodGlucoseMgdL": MessageLookupByLibrary.simpleMessage("mg/dL"),
    "bloodGlucoseReminder": MessageLookupByLibrary.simpleMessage(
      "Blutzucker-Erinnerung",
    ),
    "bloodGlucoseTimeline": MessageLookupByLibrary.simpleMessage(
      "Tagesverlauf",
    ),
    "bloodGlucoseTitle": MessageLookupByLibrary.simpleMessage("Blutzucker"),
    "bloodGlucoseTrend": MessageLookupByLibrary.simpleMessage("Trend"),
    "bloodGlucoseValue": MessageLookupByLibrary.simpleMessage("Wert"),
    "bmi": MessageLookupByLibrary.simpleMessage("BMI"),
    "bmiInfo": MessageLookupByLibrary.simpleMessage(
      "Der Body-Mass-Index (BMI) ist ein Index zur Klassifizierung von Übergewicht und Fettleibigkeit bei Erwachsenen. Er wird berechnet, indem das Gewicht in Kilogramm durch das Quadrat der Körpergröße in Metern (kg/m²) geteilt wird.\n\nDer BMI unterscheidet nicht zwischen Fett- und Muskelmasse und kann für einige Personen irreführend sein.",
    ),
    "bmiLabel": MessageLookupByLibrary.simpleMessage("BMI"),
    "bmiNormal": MessageLookupByLibrary.simpleMessage("Normal"),
    "bmiObese": MessageLookupByLibrary.simpleMessage("Adipositas"),
    "bmiOverweight": MessageLookupByLibrary.simpleMessage("Übergewicht"),
    "bmiUnderweight": MessageLookupByLibrary.simpleMessage("Untergewicht"),
    "bmrKcal": MessageLookupByLibrary.simpleMessage("Basalmetabolismus"),
    "bmrLabel": MessageLookupByLibrary.simpleMessage("BMR"),
    "bodyMeasurementTitle": MessageLookupByLibrary.simpleMessage("Körpermaße"),
    "booleanType": MessageLookupByLibrary.simpleMessage("Boolean"),
    "breakfastExample": MessageLookupByLibrary.simpleMessage(
      "z. B. Müsli, Milch, Kaffee ...",
    ),
    "breakfastLabel": MessageLookupByLibrary.simpleMessage("Frühstück"),
    "burnedCaloriesLabel": MessageLookupByLibrary.simpleMessage("Verbrannt"),
    "burnedLabel": MessageLookupByLibrary.simpleMessage("verbrannt"),
    "buttonNextLabel": MessageLookupByLibrary.simpleMessage("WEITER"),
    "buttonResetLabel": MessageLookupByLibrary.simpleMessage("Zurücksetzen"),
    "buttonSaveLabel": MessageLookupByLibrary.simpleMessage("Speichern"),
    "buttonStartLabel": MessageLookupByLibrary.simpleMessage("START"),
    "buttonYesLabel": MessageLookupByLibrary.simpleMessage("JA"),
    "calculationMethodLabel": MessageLookupByLibrary.simpleMessage(
      "Berechnungsmethode",
    ),
    "calculationsMacronutrientsDistributionLabel":
        MessageLookupByLibrary.simpleMessage("Verteilung der Makronährstoffe"),
    "calculationsMacrosDistribution": m3,
    "calculationsRecommendedLabel": MessageLookupByLibrary.simpleMessage(
      "(empfohlen)",
    ),
    "calculationsTDEEIOM2006Label": MessageLookupByLibrary.simpleMessage(
      "Institute of Medicine Gleichung",
    ),
    "calculationsTDEELabel": MessageLookupByLibrary.simpleMessage(
      "TDEE-Gleichung",
    ),
    "calculationsTDEEMifflinStJeorLabel": MessageLookupByLibrary.simpleMessage(
      "Mifflin-St Jeor Gleichung",
    ),
    "calorieCyclingDescription": MessageLookupByLibrary.simpleMessage(
      "Legen Sie für jeden Wochentag unterschiedliche Kalorienziele fest. Dies hilft Ihnen, an aktiven Tagen mehr und an Ruhetagen weniger zu essen, während Sie Ihr wöchentliches Budget einhalten.",
    ),
    "calorieCyclingLabel": MessageLookupByLibrary.simpleMessage(
      "Kalorienzyklus",
    ),
    "caloriesLabel": MessageLookupByLibrary.simpleMessage("Kalorien"),
    "caloriesTab": MessageLookupByLibrary.simpleMessage("Kalorien"),
    "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "carbohydrateLabel": MessageLookupByLibrary.simpleMessage("Kohlenhydrate"),
    "carbsLabel": MessageLookupByLibrary.simpleMessage("Kohlenhydrate"),
    "chartExportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Diagramm konnte nicht geteilt werden",
    ),
    "chartExportedLabel": MessageLookupByLibrary.simpleMessage(
      "Diagramm geteilt",
    ),
    "chestCm": MessageLookupByLibrary.simpleMessage("Brust (cm)"),
    "chooseWeightGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Gewichtsziel wählen",
    ),
    "cmLabel": MessageLookupByLibrary.simpleMessage("cm"),
    "compareLabel": MessageLookupByLibrary.simpleMessage("Vergleichen"),
    "confirmImport": MessageLookupByLibrary.simpleMessage("Import bestätigen"),
    "consumedLabel": MessageLookupByLibrary.simpleMessage("Verzehrt"),
    "containsAllergen": MessageLookupByLibrary.simpleMessage("Enthält"),
    "cookTimeLabel": MessageLookupByLibrary.simpleMessage("Kochzeit"),
    "copyDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Zu welcher Mahlzeit hinzufügen?",
    ),
    "copyOrDeleteTimeDialogContent": MessageLookupByLibrary.simpleMessage(
      "Auf \"Nach heute kopieren\" klicken, um die Mahlzeit nach heute zu kopieren. Mit \"Löschen\" kann die Mahlzeit entfernt werden",
    ),
    "copyOrDeleteTimeDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Was soll getan werden?",
    ),
    "createCustomDialogContent": MessageLookupByLibrary.simpleMessage(
      "Möchten Sie einen benutzerdefinierte Mahlzeit erstellen?",
    ),
    "createCustomDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Benutzerdefinierte Mahlzeit erstellen?",
    ),
    "createCustomFoodLabel": MessageLookupByLibrary.simpleMessage(
      "Eigenes Lebensmittel erstellen",
    ),
    "createTracker": MessageLookupByLibrary.simpleMessage("Tracker erstellen"),
    "currentWeight": MessageLookupByLibrary.simpleMessage("Aktuell"),
    "custom": MessageLookupByLibrary.simpleMessage("Benutzerdefiniert"),
    "customFoodEnergyLabel": MessageLookupByLibrary.simpleMessage(
      "Energie (kcal pro 100 g/ml)",
    ),
    "customFoodNameRequired": MessageLookupByLibrary.simpleMessage(
      "Lebensmittelname ist erforderlich",
    ),
    "customTrackersLabel": MessageLookupByLibrary.simpleMessage(
      "Benutzerdefinierte Tracker",
    ),
    "daily": MessageLookupByLibrary.simpleMessage("Täglich"),
    "dailyGoalLabel": MessageLookupByLibrary.simpleMessage("Tagesziel"),
    "dailyKcalAdjustmentLabel": MessageLookupByLibrary.simpleMessage(
      "Tägliche kcal-Anpassung:",
    ),
    "dailyNoteEmpty": MessageLookupByLibrary.simpleMessage("Noch keine Notiz"),
    "dailyNoteHint": MessageLookupByLibrary.simpleMessage(
      "Schreiben Sie eine Notiz für heute...",
    ),
    "dailyNoteLabel": MessageLookupByLibrary.simpleMessage("Tägliche Notiz"),
    "dailyNoteSaved": MessageLookupByLibrary.simpleMessage("Notiz gespeichert"),
    "dailySummaryLabel": MessageLookupByLibrary.simpleMessage(
      "Tageszusammenfassung",
    ),
    "dailyTarget": MessageLookupByLibrary.simpleMessage("Tagesziel"),
    "dailyWaterGoal": MessageLookupByLibrary.simpleMessage(
      "Tägliches Wasserziel",
    ),
    "dataCollectionLabel": MessageLookupByLibrary.simpleMessage(
      "Unterstützen der Entwicklung durch Bereitstellung anonymer Nutzungsdaten",
    ),
    "dataSyncBackupCreated": MessageLookupByLibrary.simpleMessage(
      "Backup erfolgreich erstellt",
    ),
    "dataSyncBackupFilePath": MessageLookupByLibrary.simpleMessage(
      "Backup-Dateipfad",
    ),
    "dataSyncCloudBackupTitle": MessageLookupByLibrary.simpleMessage(
      "Cloud-Backup",
    ),
    "dataSyncCloudProvider": MessageLookupByLibrary.simpleMessage(
      "Cloud-Anbieter",
    ),
    "dataSyncComingSoon": MessageLookupByLibrary.simpleMessage(
      "Demnächst verfügbar",
    ),
    "dataSyncConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Passwort bestätigen",
    ),
    "dataSyncCreateEncryptedBackup": MessageLookupByLibrary.simpleMessage(
      "Verschlüsseltes Backup erstellen",
    ),
    "dataSyncEncryptBackup": MessageLookupByLibrary.simpleMessage(
      "Verschlüsseltes Backup",
    ),
    "dataSyncEncryptBackupDescription": MessageLookupByLibrary.simpleMessage(
      "Erstellen Sie ein AES-256-verschlüsseltes Backup Ihrer Daten. Das Backup wird lokal auf Ihrem Gerät gespeichert.",
    ),
    "dataSyncEncryptedRestore": MessageLookupByLibrary.simpleMessage(
      "Verschlüsselte Wiederherstellung",
    ),
    "dataSyncExportSuccess": MessageLookupByLibrary.simpleMessage(
      "Daten erfolgreich exportiert",
    ),
    "dataSyncExportTitle": MessageLookupByLibrary.simpleMessage(
      "Daten exportieren",
    ),
    "dataSyncFormatJson": MessageLookupByLibrary.simpleMessage("JSON"),
    "dataSyncFormatZip": MessageLookupByLibrary.simpleMessage("ZIP"),
    "dataSyncImportDescription": MessageLookupByLibrary.simpleMessage(
      "Importieren Sie Daten aus einer zuvor exportierten JSON- oder ZIP-Datei. Dies wird mit vorhandenen Daten zusammengeführt.",
    ),
    "dataSyncImportJson": MessageLookupByLibrary.simpleMessage(
      "Aus JSON importieren",
    ),
    "dataSyncImportSuccess": MessageLookupByLibrary.simpleMessage(
      "Daten erfolgreich importiert",
    ),
    "dataSyncImportTitle": MessageLookupByLibrary.simpleMessage(
      "Daten importieren",
    ),
    "dataSyncImportZip": MessageLookupByLibrary.simpleMessage(
      "Aus ZIP importieren",
    ),
    "dataSyncLastBackup": MessageLookupByLibrary.simpleMessage(
      "Letztes Backup",
    ),
    "dataSyncLocalEncryption": MessageLookupByLibrary.simpleMessage(
      "Lokale Verschlüsselung",
    ),
    "dataSyncLocalEncryptionDescription": MessageLookupByLibrary.simpleMessage(
      "Verschlüsseln und speichern Sie Ihr Backup lokal. Sie können die verschlüsselte Datei manuell in den Cloud-Speicher übertragen.",
    ),
    "dataSyncNoBackup": MessageLookupByLibrary.simpleMessage(
      "Kein Backup gefunden",
    ),
    "dataSyncPassword": MessageLookupByLibrary.simpleMessage("Passwort"),
    "dataSyncPasswordMismatch": MessageLookupByLibrary.simpleMessage(
      "Passwörter stimmen nicht überein",
    ),
    "dataSyncPreviewTitle": MessageLookupByLibrary.simpleMessage(
      "Importvorschau",
    ),
    "dataSyncRecords": MessageLookupByLibrary.simpleMessage("Datensätze"),
    "dataSyncRestoreEncrypted": MessageLookupByLibrary.simpleMessage(
      "Aus verschlüsseltem Backup wiederherstellen",
    ),
    "dataSyncRestoreFromBackup": MessageLookupByLibrary.simpleMessage(
      "Aus Backup wiederherstellen",
    ),
    "dataSyncSelectDataTypes": MessageLookupByLibrary.simpleMessage(
      "Datentypen zum Exportieren auswählen",
    ),
    "dataSyncSelectFormat": MessageLookupByLibrary.simpleMessage(
      "Exportformat",
    ),
    "dataSyncTypeActivities": MessageLookupByLibrary.simpleMessage(
      "Aktivitäten",
    ),
    "dataSyncTypeConfig": MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "dataSyncTypeFasts": MessageLookupByLibrary.simpleMessage(
      "Fastenzeiträume",
    ),
    "dataSyncTypeIntakes": MessageLookupByLibrary.simpleMessage(
      "Nahrungsaufnahmen",
    ),
    "dataSyncTypeMealPlans": MessageLookupByLibrary.simpleMessage(
      "Essenspläne",
    ),
    "dataSyncTypeMeals": MessageLookupByLibrary.simpleMessage("Mahlzeiten"),
    "dataSyncTypeNotificationSettings": MessageLookupByLibrary.simpleMessage(
      "Benachrichtigungseinstellungen",
    ),
    "dataSyncTypeRecipes": MessageLookupByLibrary.simpleMessage("Rezepte"),
    "dataSyncTypeTrackedDays": MessageLookupByLibrary.simpleMessage(
      "Verfolgte Tage",
    ),
    "dataSyncTypeUsers": MessageLookupByLibrary.simpleMessage("Benutzerprofil"),
    "dataSyncTypeWaterEntries": MessageLookupByLibrary.simpleMessage(
      "Wassereinträge",
    ),
    "dataSyncTypeWeights": MessageLookupByLibrary.simpleMessage("Gewichte"),
    "date": MessageLookupByLibrary.simpleMessage("Datum"),
    "deleteAllLabel": MessageLookupByLibrary.simpleMessage("Alle löschen"),
    "deleteBloodGlucoseEntry": MessageLookupByLibrary.simpleMessage(
      "Eintrag löschen",
    ),
    "deleteMedication": MessageLookupByLibrary.simpleMessage(
      "Medikament löschen",
    ),
    "deletePhotoDialogContent": MessageLookupByLibrary.simpleMessage(
      "Sind Sie sicher, dass Sie dieses Foto löschen möchten?",
    ),
    "deletePhotoLabel": MessageLookupByLibrary.simpleMessage("Foto löschen"),
    "deleteRecipeLabel": MessageLookupByLibrary.simpleMessage("Rezept löschen"),
    "deleteSymptom": MessageLookupByLibrary.simpleMessage("Symptom löschen"),
    "deleteTimeDialogContent": MessageLookupByLibrary.simpleMessage(
      "Möchten Sie den ausgewählten Eintrag löschen?",
    ),
    "deleteTimeDialogPluralContent": MessageLookupByLibrary.simpleMessage(
      "Möchten Sie alle Einträge dieser Mahlzeit löschen?",
    ),
    "deleteTimeDialogPluralTitle": MessageLookupByLibrary.simpleMessage(
      "Einträge löschen?",
    ),
    "deleteTimeDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Eintrag löschen?",
    ),
    "deleteTracker": MessageLookupByLibrary.simpleMessage("Tracker löschen"),
    "deleteWeight": MessageLookupByLibrary.simpleMessage("Eintrag löschen"),
    "dialogCancelLabel": MessageLookupByLibrary.simpleMessage("ABBRECHEN"),
    "dialogCopyLabel": MessageLookupByLibrary.simpleMessage(
      "Nach heute kopieren",
    ),
    "dialogDeleteLabel": MessageLookupByLibrary.simpleMessage("LÖSCHEN"),
    "dialogOKLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "diaryLabel": MessageLookupByLibrary.simpleMessage("Tagebuch"),
    "dinnerExample": MessageLookupByLibrary.simpleMessage(
      "z. B. Suppe, Hähnchen, Wein ...",
    ),
    "dinnerLabel": MessageLookupByLibrary.simpleMessage("Abendessen"),
    "disclaimerText": MessageLookupByLibrary.simpleMessage(
      "Nutriq ist keine medizinische Anwendung. Alle bereitgestellten Daten sind nicht validiert und sollten mit Vorsicht verwendet werden. Bitte pflegen Sie einen gesunden Lebensstil und konsultieren Sie einen Fachmann, wenn Sie Probleme haben. Die Verwendung während einer Krankheit, Schwangerschaft oder Stillzeit wird nicht empfohlen.\n\n\nDie Anwendung befindet sich noch in der Entwicklung. Fehler, Bugs und Abstürze können auftreten.",
    ),
    "doseMissed": MessageLookupByLibrary.simpleMessage("Dosis verpasst"),
    "doseTaken": MessageLookupByLibrary.simpleMessage("Dosis eingenommen"),
    "editItemDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Eintrag aktualisieren",
    ),
    "editMealLabel": MessageLookupByLibrary.simpleMessage(
      "Mahlzeit bearbeiten",
    ),
    "elapsedTimeLabel": MessageLookupByLibrary.simpleMessage("Verstrichen"),
    "emptyShoppingListLabel": MessageLookupByLibrary.simpleMessage(
      "Keine Artikel in der Einkaufsliste",
    ),
    "emptySlotLabel": MessageLookupByLibrary.simpleMessage("Leer"),
    "enableCalorieCycling": MessageLookupByLibrary.simpleMessage(
      "Kalorienzyklus aktivieren",
    ),
    "enableDailySummaryLabel": MessageLookupByLibrary.simpleMessage(
      "Tägliche Zusammenfassung aktivieren",
    ),
    "endFastLabel": MessageLookupByLibrary.simpleMessage("Fasten beenden"),
    "energyLabel": MessageLookupByLibrary.simpleMessage("Energie"),
    "errorFetchingProductData": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Abrufen von Produktinformationen",
    ),
    "errorLoadingActivities": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Laden von Aktivitäten",
    ),
    "errorMealSave": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Speichern der Mahlzeit. Haben Sie die korrekten Mahlzeiteninformationen eingegeben?",
    ),
    "errorOpeningBrowser": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Öffnen der Browser-Anwendung",
    ),
    "errorOpeningEmail": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Öffnen der E-Mail-Anwendung",
    ),
    "errorProductNotFound": MessageLookupByLibrary.simpleMessage(
      "Produkt nicht gefunden",
    ),
    "exerciseCalorieImpact": MessageLookupByLibrary.simpleMessage(
      "Bewegungsauswirkung",
    ),
    "exerciseCredit100": MessageLookupByLibrary.simpleMessage("100%"),
    "exerciseCredit50": MessageLookupByLibrary.simpleMessage("50%"),
    "exerciseCreditCustom": MessageLookupByLibrary.simpleMessage(
      "Benutzerdefiniert",
    ),
    "exerciseCreditLabel": MessageLookupByLibrary.simpleMessage(
      "Bewegungsguthaben",
    ),
    "exerciseCreditNone": MessageLookupByLibrary.simpleMessage("Keins"),
    "exerciseCreditPercent": MessageLookupByLibrary.simpleMessage(
      "Guthabenprozent",
    ),
    "exerciseListLabel": MessageLookupByLibrary.simpleMessage("Übungen heute"),
    "exportAction": MessageLookupByLibrary.simpleMessage("Exportieren"),
    "exportChartLabel": MessageLookupByLibrary.simpleMessage("Diagramm teilen"),
    "exportImportDescription": MessageLookupByLibrary.simpleMessage(
      "Sie können die App-Daten in eine Zip-Datei exportieren und später importieren. Dies ist nützlich, wenn Sie Ihre Daten sichern oder auf ein anderes Gerät übertragen möchten.\n\nDie App nutzt keinen Cloud-Dienst, um Ihre Daten zu speichern.",
    ),
    "exportImportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Export/Import",
    ),
    "exportImportLabel": MessageLookupByLibrary.simpleMessage(
      "Daten Exportieren / Importieren",
    ),
    "exportImportSuccessLabel": MessageLookupByLibrary.simpleMessage(
      "Export / Import erfolgreich",
    ),
    "fasting": MessageLookupByLibrary.simpleMessage("Nüchtern"),
    "fastingEndedNotificationBody": MessageLookupByLibrary.simpleMessage(
      "Herzlichen Glückwunsch! Sie haben Ihr Fastenziel erreicht.",
    ),
    "fastingEndedNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Fasten abgeschlossen",
    ),
    "fastingHistoryLabel": MessageLookupByLibrary.simpleMessage(
      "Fastenverlauf",
    ),
    "fastingStartedNotificationBody": MessageLookupByLibrary.simpleMessage(
      "Ihre Fastenperiode hat begonnen. Bleiben Sie stark!",
    ),
    "fastingStartedNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Fasten gestartet",
    ),
    "fastingTrackerLabel": MessageLookupByLibrary.simpleMessage(
      "Intervallfasten",
    ),
    "fatLabel": MessageLookupByLibrary.simpleMessage("Fett"),
    "fiberLabel": MessageLookupByLibrary.simpleMessage("Ballaststoffe"),
    "fiberPer100Label": MessageLookupByLibrary.simpleMessage(
      "Ballaststoffe pro ",
    ),
    "filterByGrade": MessageLookupByLibrary.simpleMessage("Nach Note filtern"),
    "flOzUnit": MessageLookupByLibrary.simpleMessage("fl.oz"),
    "foodGradeDescription": MessageLookupByLibrary.simpleMessage(
      "Die Lebensmittelnote bewertet Lebensmittel von A (beste) bis D (schlechteste) basierend auf der Nährstoffdichte. Höherer Proteingehalt und Ballaststoffe verbessern die Note, während hoher Zucker-, Natrium- und gesättigter Fettgehalt sie senken.",
    ),
    "foodGradeLabel": MessageLookupByLibrary.simpleMessage("Lebensmittelnote"),
    "fridayLabel": MessageLookupByLibrary.simpleMessage("Freitag"),
    "genderFemaleLabel": MessageLookupByLibrary.simpleMessage("♀ weiblich"),
    "genderLabel": MessageLookupByLibrary.simpleMessage("Geschlecht"),
    "genderMaleLabel": MessageLookupByLibrary.simpleMessage("♂ männlich"),
    "globalCalorieBudget": MessageLookupByLibrary.simpleMessage(
      "Globales Kalorienbudget",
    ),
    "goalGainWeight": MessageLookupByLibrary.simpleMessage("Gewicht zunehmen"),
    "goalLabel": MessageLookupByLibrary.simpleMessage("Ziel"),
    "goalLoseWeight": MessageLookupByLibrary.simpleMessage("Gewicht verlieren"),
    "goalMaintainWeight": MessageLookupByLibrary.simpleMessage(
      "Gewicht halten",
    ),
    "goalWeight": MessageLookupByLibrary.simpleMessage("Zielgewicht"),
    "gradeA": MessageLookupByLibrary.simpleMessage("Note A - Ausgezeichnet"),
    "gradeAExplain": MessageLookupByLibrary.simpleMessage(
      "Sehr hoher Nährwert. Reich an Protein und Ballaststoffen, wenig Zucker, Natrium und gesättigtes Fett. Diese Lebensmittel unterstützen eine gesunde Ernährung.",
    ),
    "gradeB": MessageLookupByLibrary.simpleMessage("Note B - Gut"),
    "gradeBExplain": MessageLookupByLibrary.simpleMessage(
      "Guter Nährwert. Im Allgemeinen vorteilhaft mit moderaten Mengen an positiven Nährstoffen und begrenzten negativen Faktoren.",
    ),
    "gradeC": MessageLookupByLibrary.simpleMessage("Note C - Mäßig"),
    "gradeCExplain": MessageLookupByLibrary.simpleMessage(
      "Mäßiger Nährwert. Kann höhere Mengen an Zucker, Natrium oder gesättigtem Fett enthalten. In Maßen konsumieren.",
    ),
    "gradeD": MessageLookupByLibrary.simpleMessage("Note D - Schlecht"),
    "gradeDExplain": MessageLookupByLibrary.simpleMessage(
      "Niedriger Nährwert. Reich an Zucker, Natrium, gesättigtem Fett oder Kalorien mit begrenzten wertvollen Nährstoffen. Konsum einschränken.",
    ),
    "gramMilliliterUnit": MessageLookupByLibrary.simpleMessage("g/ml"),
    "gramUnit": MessageLookupByLibrary.simpleMessage("g"),
    "groceryCheckClearAll": MessageLookupByLibrary.simpleMessage(
      "Alle löschen",
    ),
    "groceryCheckCompareButton": MessageLookupByLibrary.simpleMessage(
      "Vergleichen",
    ),
    "groceryCheckComparisonTitle": MessageLookupByLibrary.simpleMessage(
      "Nährwertvergleich",
    ),
    "groceryCheckEmptyList": MessageLookupByLibrary.simpleMessage(
      "Noch keine Produkte gescannt. Tippe auf den Scan-Button, um zu vergleichen.",
    ),
    "groceryCheckItemAdded": MessageLookupByLibrary.simpleMessage(
      "Produkt zur Vergleichsliste hinzugefügt",
    ),
    "groceryCheckNoNutritionData": MessageLookupByLibrary.simpleMessage(
      "Nährwertdaten nicht verfügbar",
    ),
    "groceryCheckPer100gml": MessageLookupByLibrary.simpleMessage(
      "pro 100 g/ml",
    ),
    "groceryCheckProductNotFound": MessageLookupByLibrary.simpleMessage(
      "Produkt nicht gefunden. Bitte erneut scannen.",
    ),
    "groceryCheckRemoveItem": MessageLookupByLibrary.simpleMessage("Entfernen"),
    "groceryCheckScanButton": MessageLookupByLibrary.simpleMessage(
      "Barcode scannen",
    ),
    "groceryCheckScanning": MessageLookupByLibrary.simpleMessage("Scannen..."),
    "groceryCheckSelectTwoHint": MessageLookupByLibrary.simpleMessage(
      "Wähle zwei Produkte zum Vergleichen",
    ),
    "groceryCheckSubtitle": MessageLookupByLibrary.simpleMessage(
      "Barcodes scannen, um Nährwertnoten beim Einkaufen zu vergleichen",
    ),
    "groceryCheckTitle": MessageLookupByLibrary.simpleMessage("Einkaufs-Check"),
    "groceryCheckWinner": MessageLookupByLibrary.simpleMessage("Bessere Wahl"),
    "hasNoteIndicator": MessageLookupByLibrary.simpleMessage("Hat Notiz"),
    "healthSyncDataTypes": MessageLookupByLibrary.simpleMessage("Datentypen"),
    "healthSyncGrantPermission": MessageLookupByLibrary.simpleMessage(
      "Berechtigung erteilen",
    ),
    "healthSyncLastSync": m4,
    "healthSyncNeverSynced": MessageLookupByLibrary.simpleMessage(
      "Nie synchronisiert",
    ),
    "healthSyncNow": MessageLookupByLibrary.simpleMessage(
      "Jetzt synchronisieren",
    ),
    "healthSyncPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Berechtigung erforderlich, um auf Gesundheitsdaten zuzugreifen",
    ),
    "healthSyncSteps": MessageLookupByLibrary.simpleMessage("Schritte"),
    "healthSyncStepsResult": m5,
    "healthSyncTitle": MessageLookupByLibrary.simpleMessage("Gesundheitssync"),
    "healthSyncWeight": MessageLookupByLibrary.simpleMessage("Gewicht"),
    "healthSyncWorkouts": MessageLookupByLibrary.simpleMessage("Workouts"),
    "heightLabel": MessageLookupByLibrary.simpleMessage("Größe"),
    "hideNutritionLabel": MessageLookupByLibrary.simpleMessage(
      "Nährwertdetails ausblenden",
    ),
    "hipCm": MessageLookupByLibrary.simpleMessage("Hüfte (cm)"),
    "homeLabel": MessageLookupByLibrary.simpleMessage("Startseite"),
    "hoursLabel": MessageLookupByLibrary.simpleMessage("Stunden"),
    "importAction": MessageLookupByLibrary.simpleMessage("Importieren"),
    "importFromUrl": MessageLookupByLibrary.simpleMessage(
      "Von URL importieren",
    ),
    "importingRecipe": MessageLookupByLibrary.simpleMessage(
      "Rezept wird importiert...",
    ),
    "inactiveFastLabel": MessageLookupByLibrary.simpleMessage(
      "Kein aktives Fasten",
    ),
    "infoAddedActivityLabel": MessageLookupByLibrary.simpleMessage(
      "Neue Aktivität hinzugefügt",
    ),
    "infoAddedIntakeLabel": MessageLookupByLibrary.simpleMessage(
      "Neue Aufnahme hinzugefügt",
    ),
    "ingredientsLabel": MessageLookupByLibrary.simpleMessage("Zutaten"),
    "instructionsLabel": MessageLookupByLibrary.simpleMessage("Anleitung"),
    "insufficientSymptomData": MessageLookupByLibrary.simpleMessage(
      "Mindestens 2 Einträge für Trend nötig",
    ),
    "insufficientWeightData": MessageLookupByLibrary.simpleMessage(
      "Nicht genug Gewichtsdaten für den Trend",
    ),
    "itemDeletedSnackbar": MessageLookupByLibrary.simpleMessage(
      "Eintrag gelöscht",
    ),
    "itemUpdatedSnackbar": MessageLookupByLibrary.simpleMessage(
      "Eintrag aktualisiert",
    ),
    "kcalLabel": MessageLookupByLibrary.simpleMessage("kcal"),
    "kcalLeftLabel": MessageLookupByLibrary.simpleMessage("kcal übrig"),
    "keyboardShortcutBack": MessageLookupByLibrary.simpleMessage("Zurück"),
    "keyboardShortcutNewEntry": MessageLookupByLibrary.simpleMessage(
      "Neuer Eintrag",
    ),
    "keyboardShortcutSave": MessageLookupByLibrary.simpleMessage("Speichern"),
    "kgLabel": MessageLookupByLibrary.simpleMessage("kg"),
    "lastAdjustment": MessageLookupByLibrary.simpleMessage("Letzte Anpassung"),
    "logDose": MessageLookupByLibrary.simpleMessage("Dosis eintragen"),
    "logEntry": MessageLookupByLibrary.simpleMessage("Eintrag erfassen"),
    "logWeight": MessageLookupByLibrary.simpleMessage("Gewicht eintragen"),
    "lunchExample": MessageLookupByLibrary.simpleMessage(
      "z. B. Pizza, Salat, Reis ...",
    ),
    "lunchLabel": MessageLookupByLibrary.simpleMessage("Mittagessen"),
    "macroDistributionLabel": MessageLookupByLibrary.simpleMessage(
      "Makronährstoff-Verteilung:",
    ),
    "macroTrendChart": MessageLookupByLibrary.simpleMessage("Makro-Verlauf"),
    "macrosTab": MessageLookupByLibrary.simpleMessage("Makros"),
    "maxValue": MessageLookupByLibrary.simpleMessage("Max"),
    "mealAddedToPlanLabel": MessageLookupByLibrary.simpleMessage(
      "Mahlzeit zum Plan hinzugefügt",
    ),
    "mealBrandsLabel": MessageLookupByLibrary.simpleMessage("Marken"),
    "mealCarbsLabel": MessageLookupByLibrary.simpleMessage(
      "Kohlenhydrate pro 100 g/ml",
    ),
    "mealFatLabel": MessageLookupByLibrary.simpleMessage("Fett pro 100 g/ml"),
    "mealKcalLabel": MessageLookupByLibrary.simpleMessage("kcal pro 100 g/ml"),
    "mealNameLabel": MessageLookupByLibrary.simpleMessage("Mahlzeitenname"),
    "mealPlanLabel": MessageLookupByLibrary.simpleMessage("Mahlzeitenplanung"),
    "mealPlanSubtitle": MessageLookupByLibrary.simpleMessage(
      "Mahlzeiten für die Woche planen",
    ),
    "mealProteinLabel": MessageLookupByLibrary.simpleMessage(
      "Protein pro 100 g/ml",
    ),
    "mealRemindersLabel": MessageLookupByLibrary.simpleMessage(
      "Mahlzeiten-Erinnerungen",
    ),
    "mealSizeLabel": MessageLookupByLibrary.simpleMessage(
      "Mahlzeitsgröße (g/ml)",
    ),
    "mealSizeLabelImperial": MessageLookupByLibrary.simpleMessage(
      "Mahlzeitsgröße (oz/fl oz)",
    ),
    "mealTimeLabel": MessageLookupByLibrary.simpleMessage("Mahlzeitenzeit"),
    "mealTimeNowLabel": MessageLookupByLibrary.simpleMessage("Jetzt"),
    "mealTimingAvgTimesLabel": MessageLookupByLibrary.simpleMessage(
      "Durchschnittliche Mahlzeitenzeiten",
    ),
    "mealTimingDistributionLabel": MessageLookupByLibrary.simpleMessage(
      "Mahlzeitenzeiten-Verteilung",
    ),
    "mealTimingEntriesLabel": MessageLookupByLibrary.simpleMessage(
      "Letzte Einträge",
    ),
    "mealTimingLabel": MessageLookupByLibrary.simpleMessage("Mahlzeitenzeiten"),
    "mealTimingNoDataLabel": MessageLookupByLibrary.simpleMessage(
      "Noch keine Mahlzeitenzeit-Daten. Geben Sie eine Zeit beim Eintragen von Mahlzeiten an, um Muster zu sehen.",
    ),
    "mealUnitLabel": MessageLookupByLibrary.simpleMessage("Mahlzeiteinheit"),
    "measurementHistory": MessageLookupByLibrary.simpleMessage("Messverlauf"),
    "medicationDosage": MessageLookupByLibrary.simpleMessage("Dosierung"),
    "medicationFrequency": MessageLookupByLibrary.simpleMessage("Häufigkeit"),
    "medicationLog": MessageLookupByLibrary.simpleMessage(
      "Medikamentenprotokoll",
    ),
    "medicationName": MessageLookupByLibrary.simpleMessage("Medikamentenname"),
    "medicationProgress": m6,
    "medicationReminder": MessageLookupByLibrary.simpleMessage(
      "Medikamentenerinnerung",
    ),
    "medicationSummaryTitle": MessageLookupByLibrary.simpleMessage(
      "Medikamente",
    ),
    "medicationTitle": MessageLookupByLibrary.simpleMessage("Medikamente"),
    "menuScanAddSelected": m7,
    "menuScanAddedCount": m8,
    "menuScanAddingItems": MessageLookupByLibrary.simpleMessage(
      "Einträge werden zum Tagebuch hinzugefügt...",
    ),
    "menuScanCalories": MessageLookupByLibrary.simpleMessage("kcal"),
    "menuScanCaptureButton": MessageLookupByLibrary.simpleMessage(
      "Menü scannen",
    ),
    "menuScanCarbs": MessageLookupByLibrary.simpleMessage("Kohlenhydrate"),
    "menuScanDescription": MessageLookupByLibrary.simpleMessage(
      "Fotografieren Sie ein Menü und wir identifizieren Gerichte mit Nährwertdaten.",
    ),
    "menuScanFat": MessageLookupByLibrary.simpleMessage("Fett"),
    "menuScanGalleryButton": MessageLookupByLibrary.simpleMessage(
      "Aus Galerie wählen",
    ),
    "menuScanItemCount": m9,
    "menuScanNoNutritionInfo": MessageLookupByLibrary.simpleMessage(
      "Nährwertinfos nicht verfügbar",
    ),
    "menuScanProcessing": MessageLookupByLibrary.simpleMessage(
      "Menü wird verarbeitet...",
    ),
    "menuScanProtein": MessageLookupByLibrary.simpleMessage("Protein"),
    "menuScanResultsTitle": MessageLookupByLibrary.simpleMessage(
      "Menüpositionen",
    ),
    "menuScanSearchManually": MessageLookupByLibrary.simpleMessage(
      "Manuell suchen",
    ),
    "menuScanSubtitle": MessageLookupByLibrary.simpleMessage(
      "Restaurantmenü scannen für Nährwertinfos",
    ),
    "menuScanTitle": MessageLookupByLibrary.simpleMessage("Menü-Scanner"),
    "microNutrientsLabel": MessageLookupByLibrary.simpleMessage(
      "Mikronährstoffe",
    ),
    "milliliterUnit": MessageLookupByLibrary.simpleMessage("ml"),
    "minValue": MessageLookupByLibrary.simpleMessage("Min"),
    "minimumGrade": MessageLookupByLibrary.simpleMessage("Mindestnote"),
    "minutesLabel": MessageLookupByLibrary.simpleMessage("Minuten"),
    "missingProductInfo": MessageLookupByLibrary.simpleMessage(
      "Produkt fehlen die erforderlichen Angaben zu Kalorien oder Makronährstoffen",
    ),
    "ml": MessageLookupByLibrary.simpleMessage("ml"),
    "mondayLabel": MessageLookupByLibrary.simpleMessage("Montag"),
    "monthlyCalorieChart": MessageLookupByLibrary.simpleMessage(
      "Monatliche Kalorien",
    ),
    "monthlyLabel": MessageLookupByLibrary.simpleMessage("Monat"),
    "movingAverage": MessageLookupByLibrary.simpleMessage(
      "Gleitender Durchschnitt",
    ),
    "myMealsLabel": MessageLookupByLibrary.simpleMessage("Meine Mahlzeiten"),
    "neckCm": MessageLookupByLibrary.simpleMessage("Hals (cm)"),
    "netCaloriesLabel": MessageLookupByLibrary.simpleMessage("Netto-Kalorien"),
    "netCarbsDescription": MessageLookupByLibrary.simpleMessage(
      "Netto-Kohlenhydrate (Gesamtkohlenhydrate minus Ballaststoffe) anstelle der Gesamtkohlenhydrate in Makros und Zusammenfassungen anzeigen.",
    ),
    "netCarbsEnabledLabel": MessageLookupByLibrary.simpleMessage(
      "Netto-Kohlenhydrate aktivieren",
    ),
    "netCarbsLabel": MessageLookupByLibrary.simpleMessage(
      "Netto-Kohlenhydrate",
    ),
    "netCarbsSettingsLabel": MessageLookupByLibrary.simpleMessage(
      "Netto-Kohlenhydrate",
    ),
    "noActivityRecentlyAddedLabel": MessageLookupByLibrary.simpleMessage(
      "Keine kürzlich hinzugefügten Aktivitäten",
    ),
    "noLogsToday": MessageLookupByLibrary.simpleMessage(
      "Keine Medikamentenprotokolle für heute",
    ),
    "noMealsRecentlyAddedLabel": MessageLookupByLibrary.simpleMessage(
      "Keine kürzlich hinzugefügten Mahlzeiten",
    ),
    "noMeasurements": MessageLookupByLibrary.simpleMessage(
      "Noch keine Messungen",
    ),
    "noMedicationsAdded": MessageLookupByLibrary.simpleMessage(
      "Keine Medikamente hinzugefügt",
    ),
    "noPhotosLabel": MessageLookupByLibrary.simpleMessage(
      "Noch keine Fortschrittsfotos. Tippen Sie auf + zum Hinzufügen.",
    ),
    "noRecipesLabel": MessageLookupByLibrary.simpleMessage(
      "Noch keine Rezepte. Erstelle eins!",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Keine Ergebnisse gefunden",
    ),
    "noResultsHint": MessageLookupByLibrary.simpleMessage(
      "Versuchen Sie mit anderen Suchbegriffen",
    ),
    "noSymptomData": MessageLookupByLibrary.simpleMessage(
      "Noch keine Symptomdaten. Jetzt erfassen!",
    ),
    "noWaterEntries": MessageLookupByLibrary.simpleMessage(
      "Noch keine Wassereinträge",
    ),
    "noWeightEntries": MessageLookupByLibrary.simpleMessage(
      "Noch keine Gewichtseinträge",
    ),
    "notAvailableLabel": MessageLookupByLibrary.simpleMessage("N/A"),
    "notSetLabel": MessageLookupByLibrary.simpleMessage("Nicht festgelegt"),
    "note": MessageLookupByLibrary.simpleMessage("Notiz"),
    "notes": MessageLookupByLibrary.simpleMessage("Notizen"),
    "nothingAddedLabel": MessageLookupByLibrary.simpleMessage(
      "Nichts hinzugefügt",
    ),
    "notificationSettingsLabel": MessageLookupByLibrary.simpleMessage(
      "Benachrichtigungen",
    ),
    "nutritionInfoLabel": MessageLookupByLibrary.simpleMessage(
      "Nährwertangaben",
    ),
    "nutritionLabel": MessageLookupByLibrary.simpleMessage("Nährwerte"),
    "nutritionPreviewLabel": MessageLookupByLibrary.simpleMessage(
      "Projizierte Nährwerte",
    ),
    "nutritionalStatusNormalWeight": MessageLookupByLibrary.simpleMessage(
      "Normales Gewicht",
    ),
    "nutritionalStatusObeseClassI": MessageLookupByLibrary.simpleMessage(
      "Fettleibigkeit Klasse I",
    ),
    "nutritionalStatusObeseClassII": MessageLookupByLibrary.simpleMessage(
      "Fettleibigkeit Klasse II",
    ),
    "nutritionalStatusObeseClassIII": MessageLookupByLibrary.simpleMessage(
      "Fettleibigkeit Klasse III",
    ),
    "nutritionalStatusPreObesity": MessageLookupByLibrary.simpleMessage(
      "Prä-Adipositas",
    ),
    "nutritionalStatusRiskAverage": MessageLookupByLibrary.simpleMessage(
      "Durchschnittlich",
    ),
    "nutritionalStatusRiskIncreased": MessageLookupByLibrary.simpleMessage(
      "Erhöht",
    ),
    "nutritionalStatusRiskLabel": m10,
    "nutritionalStatusRiskLow": MessageLookupByLibrary.simpleMessage(
      "Niedrig \n(aber erhöhtes Risiko für andere \nklinische Probleme)",
    ),
    "nutritionalStatusRiskModerate": MessageLookupByLibrary.simpleMessage(
      "Mäßig",
    ),
    "nutritionalStatusRiskSevere": MessageLookupByLibrary.simpleMessage(
      "Schwerwiegend",
    ),
    "nutritionalStatusRiskVerySevere": MessageLookupByLibrary.simpleMessage(
      "Sehr schwerwiegend",
    ),
    "nutritionalStatusUnderweight": MessageLookupByLibrary.simpleMessage(
      "Untergewicht",
    ),
    "offDisclaimer": MessageLookupByLibrary.simpleMessage(
      "Die Daten, die Ihnen mit dieser App zur Verfügung gestellt werden, stammen aus der Open Food Facts-Datenbank. Es kann keine Garantie für die Richtigkeit, Vollständigkeit oder Zuverlässigkeit der bereitgestellten Informationen übernommen werden. Die Daten werden ohne Mängelgewähr zur Verfügung gestellt, und die Ursprungsquelle der Daten (Open Food Facts) haftet nicht für Schäden, die aus der Verwendung der Daten entstehen.",
    ),
    "onboardingActivityQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Wie aktiv sind Sie? (Ohne Trainingseinheiten)",
    ),
    "onboardingBirthdayHint": MessageLookupByLibrary.simpleMessage(
      "Datum eingeben",
    ),
    "onboardingBirthdayQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Wann haben Sie Geburtstag?",
    ),
    "onboardingEnterBirthdayLabel": MessageLookupByLibrary.simpleMessage(
      "Geburtstag",
    ),
    "onboardingGenderQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Was ist Ihr Geschlecht?",
    ),
    "onboardingGoalQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Was ist Ihr aktuelles Gewichtsziel?",
    ),
    "onboardingHeightExampleHintCm": MessageLookupByLibrary.simpleMessage(
      "z. B. 170",
    ),
    "onboardingHeightQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Wie groß sind Sie derzeit?",
    ),
    "onboardingIntroDescription": MessageLookupByLibrary.simpleMessage(
      "Um loszulegen, benötigt die App einige Informationen über Sie, um Ihr tägliches Kalorienziel zu berechnen. Alle Informationen über Sie werden sicher auf Ihrem Gerät gespeichert.",
    ),
    "onboardingKcalPerDayLabel": MessageLookupByLibrary.simpleMessage(
      "kcal pro Tag",
    ),
    "onboardingOverviewLabel": MessageLookupByLibrary.simpleMessage(
      "Übersicht",
    ),
    "onboardingSaveUserError": MessageLookupByLibrary.simpleMessage(
      "Falsche Eingabe, bitte versuchen Sie es erneut",
    ),
    "onboardingWeightExampleHintKg": MessageLookupByLibrary.simpleMessage(
      "z. B. 60",
    ),
    "onboardingWeightQuestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Wie viel wiegen Sie derzeit?",
    ),
    "onboardingWelcomeLabel": MessageLookupByLibrary.simpleMessage(
      "Willkommen bei",
    ),
    "onboardingWrongHeightLabel": MessageLookupByLibrary.simpleMessage(
      "Geben Sie eine korrekte Größe ein",
    ),
    "onboardingWrongWeightLabel": MessageLookupByLibrary.simpleMessage(
      "Geben Sie ein korrekte Gewicht ein",
    ),
    "onboardingYourGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Ihr Kalorienziel:",
    ),
    "onboardingYourMacrosGoalLabel": MessageLookupByLibrary.simpleMessage(
      "Ihr Ziel für Makronährstoffe:",
    ),
    "ozUnit": MessageLookupByLibrary.simpleMessage("oz"),
    "paAmericanFootballGeneral": MessageLookupByLibrary.simpleMessage(
      "American Football",
    ),
    "paAmericanFootballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "Touch, Flag, allgemein",
    ),
    "paArcheryGeneral": MessageLookupByLibrary.simpleMessage("Bogenschießen"),
    "paArcheryGeneralDesc": MessageLookupByLibrary.simpleMessage("keine Jagd"),
    "paAutoRacing": MessageLookupByLibrary.simpleMessage("Autorennen"),
    "paAutoRacingDesc": MessageLookupByLibrary.simpleMessage("offene Räder"),
    "paBackpackingGeneral": MessageLookupByLibrary.simpleMessage(
      "Wandern mit Rucksack",
    ),
    "paBackpackingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paBadmintonGeneral": MessageLookupByLibrary.simpleMessage("Badminton"),
    "paBadmintonGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "gesellige Einzel- und Doppelspiele, allgemein",
    ),
    "paBasketballGeneral": MessageLookupByLibrary.simpleMessage("Basketball"),
    "paBasketballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paBicyclingGeneral": MessageLookupByLibrary.simpleMessage("Radfahren"),
    "paBicyclingGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paBicyclingMountainGeneral": MessageLookupByLibrary.simpleMessage(
      "Mountainbiking",
    ),
    "paBicyclingMountainGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paBicyclingStationaryGeneral": MessageLookupByLibrary.simpleMessage(
      "Stationäres Radfahren",
    ),
    "paBicyclingStationaryGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paBilliardsGeneral": MessageLookupByLibrary.simpleMessage("Billard"),
    "paBilliardsGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paBowlingGeneral": MessageLookupByLibrary.simpleMessage("Bowling"),
    "paBowlingGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paBoxingBag": MessageLookupByLibrary.simpleMessage("Boxen"),
    "paBoxingBagDesc": MessageLookupByLibrary.simpleMessage("Boxsack"),
    "paBoxingGeneral": MessageLookupByLibrary.simpleMessage("Boxen"),
    "paBoxingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "im Ring, allgemein",
    ),
    "paBroomball": MessageLookupByLibrary.simpleMessage("Broomball"),
    "paBroomballDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paCalisthenicsGeneral": MessageLookupByLibrary.simpleMessage(
      "Calisthenics",
    ),
    "paCalisthenicsGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "leichte oder mäßige Anstrengung, allgemein (z.B. Rückenübungen)",
    ),
    "paCanoeingGeneral": MessageLookupByLibrary.simpleMessage("Kanufahren"),
    "paCanoeingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "rudern, zum Vergnügen, allgemein",
    ),
    "paCatch": MessageLookupByLibrary.simpleMessage("Football oder Baseball"),
    "paCatchDesc": MessageLookupByLibrary.simpleMessage("Fangen spielen"),
    "paCheerleading": MessageLookupByLibrary.simpleMessage("Cheerleading"),
    "paCheerleadingDesc": MessageLookupByLibrary.simpleMessage(
      "gymnastische Übungen, Wettkampf",
    ),
    "paChildrenGame": MessageLookupByLibrary.simpleMessage("Kinderspiele"),
    "paChildrenGameDesc": MessageLookupByLibrary.simpleMessage(
      "(z.B. Himmel und Hölle, Vier gewinnt, Völkerball, Spielplatzgeräte, T-Ball, Leitball, Murmeln, Arcade-Spiele), mäßige Anstrengung",
    ),
    "paClimbingHillsNoLoadGeneral": MessageLookupByLibrary.simpleMessage(
      "Hügelklettern ohne Last",
    ),
    "paClimbingHillsNoLoadGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "keine Last",
    ),
    "paCricket": MessageLookupByLibrary.simpleMessage("Cricket"),
    "paCricketDesc": MessageLookupByLibrary.simpleMessage(
      "Schlagen, Werfen, Feldarbeit",
    ),
    "paCroquet": MessageLookupByLibrary.simpleMessage("Croquet"),
    "paCroquetDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paCurling": MessageLookupByLibrary.simpleMessage("Curling"),
    "paCurlingDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paDancingAerobicGeneral": MessageLookupByLibrary.simpleMessage("Aerobic"),
    "paDancingAerobicGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paDancingGeneral": MessageLookupByLibrary.simpleMessage(
      "allgemeines Tanzen",
    ),
    "paDancingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "z.B. Disco, Folk, irischer Stepptanz, Line Dance, Polka, Contra, Country",
    ),
    "paDartsWall": MessageLookupByLibrary.simpleMessage("Darts"),
    "paDartsWallDesc": MessageLookupByLibrary.simpleMessage("Wand oder Rasen"),
    "paDivingGeneral": MessageLookupByLibrary.simpleMessage("Tauchen"),
    "paDivingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "Gerätetauchen, Sporttauchen, allgemein",
    ),
    "paDivingSpringboardPlatform": MessageLookupByLibrary.simpleMessage(
      "Tauchen",
    ),
    "paDivingSpringboardPlatformDesc": MessageLookupByLibrary.simpleMessage(
      "Sprungbrett oder Plattform",
    ),
    "paFencing": MessageLookupByLibrary.simpleMessage("Fechten"),
    "paFencingDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paFrisbee": MessageLookupByLibrary.simpleMessage("Frisbee spielen"),
    "paFrisbeeDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paGolfGeneral": MessageLookupByLibrary.simpleMessage("Golf"),
    "paGolfGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paGymnasticsGeneral": MessageLookupByLibrary.simpleMessage("Gymnastik"),
    "paGymnasticsGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paHackySack": MessageLookupByLibrary.simpleMessage("Hacky Sack"),
    "paHackySackDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paHandballGeneral": MessageLookupByLibrary.simpleMessage("Handball"),
    "paHandballGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paHangGliding": MessageLookupByLibrary.simpleMessage("Drachenfliegen"),
    "paHangGlidingDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paHeadingBicycling": MessageLookupByLibrary.simpleMessage("Radfahren"),
    "paHeadingConditionalExercise": MessageLookupByLibrary.simpleMessage(
      "Konditionstraining",
    ),
    "paHeadingDancing": MessageLookupByLibrary.simpleMessage("Tanzen"),
    "paHeadingRunning": MessageLookupByLibrary.simpleMessage("Laufen"),
    "paHeadingSports": MessageLookupByLibrary.simpleMessage("Sport"),
    "paHeadingWalking": MessageLookupByLibrary.simpleMessage("Gehen"),
    "paHeadingWaterActivities": MessageLookupByLibrary.simpleMessage(
      "Wassersport",
    ),
    "paHeadingWinterActivities": MessageLookupByLibrary.simpleMessage(
      "Winteraktivitäten",
    ),
    "paHikingCrossCountry": MessageLookupByLibrary.simpleMessage("Wandern"),
    "paHikingCrossCountryDesc": MessageLookupByLibrary.simpleMessage(
      "Cross-Country",
    ),
    "paHockeyField": MessageLookupByLibrary.simpleMessage("Hockey, Feld"),
    "paHockeyFieldDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paHorseRidingGeneral": MessageLookupByLibrary.simpleMessage("Reiten"),
    "paHorseRidingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paIceHockeyGeneral": MessageLookupByLibrary.simpleMessage("Eishockey"),
    "paIceHockeyGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paIceSkatingGeneral": MessageLookupByLibrary.simpleMessage("Eislaufen"),
    "paIceSkatingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paJaiAlai": MessageLookupByLibrary.simpleMessage("Jai Alai"),
    "paJaiAlaiDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paJoggingGeneral": MessageLookupByLibrary.simpleMessage("Joggen"),
    "paJoggingGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paJuggling": MessageLookupByLibrary.simpleMessage("Jonglieren"),
    "paJugglingDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paKayakingModerate": MessageLookupByLibrary.simpleMessage("Kajakfahren"),
    "paKayakingModerateDesc": MessageLookupByLibrary.simpleMessage(
      "mäßige Anstrengung",
    ),
    "paKickball": MessageLookupByLibrary.simpleMessage("Kickball"),
    "paKickballDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paLacrosse": MessageLookupByLibrary.simpleMessage("Lacrosse"),
    "paLacrosseDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paLawnBowling": MessageLookupByLibrary.simpleMessage("Rasenbowling"),
    "paLawnBowlingDesc": MessageLookupByLibrary.simpleMessage(
      "Boccia, draußen",
    ),
    "paMartialArtsModerate": MessageLookupByLibrary.simpleMessage("Kampfsport"),
    "paMartialArtsModerateDesc": MessageLookupByLibrary.simpleMessage(
      "verschiedene Arten, moderates Tempo (z.B. Judo, Jujitsu, Karate, Kickboxen, Taekwondo, Tai-Bo, Muay Thai Boxen)",
    ),
    "paMartialArtsSlower": MessageLookupByLibrary.simpleMessage("Kampfsport"),
    "paMartialArtsSlowerDesc": MessageLookupByLibrary.simpleMessage(
      "verschiedene Arten, langsames Tempo, Anfänger, Übung",
    ),
    "paMotoCross": MessageLookupByLibrary.simpleMessage("Motocross"),
    "paMotoCrossDesc": MessageLookupByLibrary.simpleMessage(
      "Geländemotorsport, Geländewagen, allgemein",
    ),
    "paMountainClimbing": MessageLookupByLibrary.simpleMessage("Klettern"),
    "paMountainClimbingDesc": MessageLookupByLibrary.simpleMessage(
      "Felsen- oder Bergsteigen",
    ),
    "paOrienteering": MessageLookupByLibrary.simpleMessage("Orientierungslauf"),
    "paOrienteeringDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paPaddleBoarding": MessageLookupByLibrary.simpleMessage(
      "Stand-Up Paddeln",
    ),
    "paPaddleBoardingDesc": MessageLookupByLibrary.simpleMessage("stehend"),
    "paPaddleBoat": MessageLookupByLibrary.simpleMessage("Tretboot"),
    "paPaddleBoatDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paPaddleball": MessageLookupByLibrary.simpleMessage("Paddleball"),
    "paPaddleballDesc": MessageLookupByLibrary.simpleMessage(
      "ungezwungen, allgemein",
    ),
    "paPoloHorse": MessageLookupByLibrary.simpleMessage("Polo"),
    "paPoloHorseDesc": MessageLookupByLibrary.simpleMessage("auf dem Pferd"),
    "paRacquetball": MessageLookupByLibrary.simpleMessage("Racquetball"),
    "paRacquetballDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paResistanceTraining": MessageLookupByLibrary.simpleMessage(
      "Krafttraining",
    ),
    "paResistanceTrainingDesc": MessageLookupByLibrary.simpleMessage(
      "Gewichtheben, Freigewichte, Nautilus oder Universal",
    ),
    "paRodeoSportGeneralModerate": MessageLookupByLibrary.simpleMessage(
      "Rodeosport",
    ),
    "paRodeoSportGeneralModerateDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein, moderater Aufwand",
    ),
    "paRollerbladingLight": MessageLookupByLibrary.simpleMessage(
      "Inlineskaten",
    ),
    "paRollerbladingLightDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paRopeJumpingGeneral": MessageLookupByLibrary.simpleMessage(
      "Seilspringen",
    ),
    "paRopeJumpingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "mittleres Tempo, 100-120 Sprünge/Min., allgemein, beidfüßiges Springen, einfacher Sprung",
    ),
    "paRopeSkippingGeneral": MessageLookupByLibrary.simpleMessage(
      "Seilspringen",
    ),
    "paRopeSkippingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paRugbyCompetitive": MessageLookupByLibrary.simpleMessage("Rugby"),
    "paRugbyCompetitiveDesc": MessageLookupByLibrary.simpleMessage(
      "Union, Mannschaft, wettbewerbsorientiert",
    ),
    "paRugbyNonCompetitive": MessageLookupByLibrary.simpleMessage("Rugby"),
    "paRugbyNonCompetitiveDesc": MessageLookupByLibrary.simpleMessage(
      "Berührung, nicht wettbewerbsorientiert",
    ),
    "paRunningGeneral": MessageLookupByLibrary.simpleMessage("Laufen"),
    "paRunningGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paSailingGeneral": MessageLookupByLibrary.simpleMessage("Segeln"),
    "paSailingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "Segeln, Windsurfen, Eissegeln, allgemein",
    ),
    "paShuffleboard": MessageLookupByLibrary.simpleMessage("Shuffleboard"),
    "paShuffleboardDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paSkateboardingGeneral": MessageLookupByLibrary.simpleMessage(
      "Skateboarding",
    ),
    "paSkateboardingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein, mäßiger Aufwand",
    ),
    "paSkatingRoller": MessageLookupByLibrary.simpleMessage("Roller-Skating"),
    "paSkatingRollerDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paSkiingGeneral": MessageLookupByLibrary.simpleMessage("Skifahren"),
    "paSkiingGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paSkiingWaterWakeboarding": MessageLookupByLibrary.simpleMessage(
      "Wasserski",
    ),
    "paSkiingWaterWakeboardingDesc": MessageLookupByLibrary.simpleMessage(
      "Wasser- oder Wakeboarding",
    ),
    "paSkydivingDesc": MessageLookupByLibrary.simpleMessage(
      "Fallschirmspringen, Base-Jumping, Bungee-Jumping",
    ),
    "paSnorkeling": MessageLookupByLibrary.simpleMessage("Schnorcheln"),
    "paSnorkelingDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paSnowShovingModerate": MessageLookupByLibrary.simpleMessage(
      "Schnee schaufeln",
    ),
    "paSnowShovingModerateDesc": MessageLookupByLibrary.simpleMessage(
      "manuell, mäßige Anstrengung",
    ),
    "paSoccerGeneral": MessageLookupByLibrary.simpleMessage("Fußball"),
    "paSoccerGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "Freizeit, allgemein",
    ),
    "paSoftballBaseballGeneral": MessageLookupByLibrary.simpleMessage(
      "Softball / Baseball",
    ),
    "paSoftballBaseballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "Schnell- oder Langstreckenpitching, allgemein",
    ),
    "paSquashGeneral": MessageLookupByLibrary.simpleMessage("Squash"),
    "paSquashGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paSurfing": MessageLookupByLibrary.simpleMessage("Surfen"),
    "paSurfingDesc": MessageLookupByLibrary.simpleMessage(
      "Körper- oder Brettsurfen, allgemein",
    ),
    "paSwimmingGeneral": MessageLookupByLibrary.simpleMessage("Schwimmen"),
    "paSwimmingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "Wassertreten, mäßige Anstrengung, allgemein",
    ),
    "paTableTennisGeneral": MessageLookupByLibrary.simpleMessage("Tischtennis"),
    "paTableTennisGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "Tischtennis, Ping Pong",
    ),
    "paTaiChiQiGongGeneral": MessageLookupByLibrary.simpleMessage(
      "Tai Chi, Qi Gong",
    ),
    "paTaiChiQiGongGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paTennisGeneral": MessageLookupByLibrary.simpleMessage("Tennis"),
    "paTennisGeneralDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paTrackField": MessageLookupByLibrary.simpleMessage("Leichtathletik"),
    "paTrackField1Desc": MessageLookupByLibrary.simpleMessage(
      "(z. B. Kugelstoßen, Diskuswurf, Hammerwurf)",
    ),
    "paTrackField2Desc": MessageLookupByLibrary.simpleMessage(
      "(z. B. Hochsprung, Weitsprung, Dreisprung, Speerwurf, Stabhochsprung)",
    ),
    "paTrackField3Desc": MessageLookupByLibrary.simpleMessage(
      "(z. B. Hindernislauf, Hürdenlauf)",
    ),
    "paTrampolineLight": MessageLookupByLibrary.simpleMessage("Trampolin"),
    "paTrampolineLightDesc": MessageLookupByLibrary.simpleMessage("Freizeit"),
    "paUnicyclingGeneral": MessageLookupByLibrary.simpleMessage("Einradfahren"),
    "paUnicyclingGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "allgemein",
    ),
    "paVolleyballGeneral": MessageLookupByLibrary.simpleMessage("Volleyball"),
    "paVolleyballGeneralDesc": MessageLookupByLibrary.simpleMessage(
      "nicht-wettkampforientiert, 6-9 Spieler, allgemein",
    ),
    "paWalkingForPleasure": MessageLookupByLibrary.simpleMessage(
      "Spazieren gehen",
    ),
    "paWalkingForPleasureDesc": MessageLookupByLibrary.simpleMessage(
      "aus Vergnügen",
    ),
    "paWalkingTheDog": MessageLookupByLibrary.simpleMessage("Gassi gehen"),
    "paWalkingTheDogDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paWallyball": MessageLookupByLibrary.simpleMessage("Wallyball"),
    "paWallyballDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paWaterAerobics": MessageLookupByLibrary.simpleMessage("Wassergymnastik"),
    "paWaterAerobicsDesc": MessageLookupByLibrary.simpleMessage(
      "Wassergymnastik, Wasser-Calisthenics",
    ),
    "paWaterPolo": MessageLookupByLibrary.simpleMessage("Wasserball"),
    "paWaterPoloDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paWaterVolleyball": MessageLookupByLibrary.simpleMessage(
      "Wasser-Volleyball",
    ),
    "paWaterVolleyballDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "paWateraerobicsCalisthenics": MessageLookupByLibrary.simpleMessage(
      "Wassergymnastik",
    ),
    "paWateraerobicsCalisthenicsDesc": MessageLookupByLibrary.simpleMessage(
      "Wassergymnastik, Wasser-Kalorienverbrennungsgymnastik",
    ),
    "paWrestling": MessageLookupByLibrary.simpleMessage("Ringen"),
    "paWrestlingDesc": MessageLookupByLibrary.simpleMessage("allgemein"),
    "palActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Überwiegend Stehen oder Gehen bei der Arbeit und aktive Freizeitaktivitäten",
    ),
    "palActiveLabel": MessageLookupByLibrary.simpleMessage("Aktiv"),
    "palExtraActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Sehr intensive körperliche Arbeit und extrem aktive Freizeitaktivitäten",
    ),
    "palExtraActiveLabel": MessageLookupByLibrary.simpleMessage("Extrem aktiv"),
    "palLowActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "z. B. Sitzen oder Stehen bei der Arbeit und leichte Freizeitaktivitäten",
    ),
    "palLowLActiveLabel": MessageLookupByLibrary.simpleMessage("Leicht aktiv"),
    "palSedentaryDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "z. B. Büroarbeit und hauptsächlich sitzende Freizeitaktivitäten",
    ),
    "palSedentaryLabel": MessageLookupByLibrary.simpleMessage("Sitzend"),
    "palVeryActiveDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Überwiegend Gehen, Laufen oder Gewichte tragen bei der Arbeit und aktive Freizeitaktivitäten",
    ),
    "palVeryActiveLabel": MessageLookupByLibrary.simpleMessage("Sehr aktiv"),
    "per100gmlLabel": MessageLookupByLibrary.simpleMessage("Pro 100 g/ml"),
    "perServingLabel": MessageLookupByLibrary.simpleMessage("Pro Portion"),
    "photoCaptureButton": MessageLookupByLibrary.simpleMessage(
      "Foto aufnehmen",
    ),
    "photoComparisonTitle": MessageLookupByLibrary.simpleMessage(
      "Vorher & Nachher",
    ),
    "photoGalleryButton": MessageLookupByLibrary.simpleMessage(
      "Aus Galerie wählen",
    ),
    "photoProgressLabel": MessageLookupByLibrary.simpleMessage(
      "Fotofortschritt",
    ),
    "photoProgressSubtitle": MessageLookupByLibrary.simpleMessage(
      "Fortschritt mit Fotos verfolgen",
    ),
    "photoProgressTitle": MessageLookupByLibrary.simpleMessage(
      "Fotofortschritt",
    ),
    "photoTagsHint": MessageLookupByLibrary.simpleMessage(
      "z.B. Vorderseite, Seite",
    ),
    "photoTagsLabel": MessageLookupByLibrary.simpleMessage("Tags"),
    "potassiumPer100Label": MessageLookupByLibrary.simpleMessage("Kalium pro "),
    "prepTimeLabel": MessageLookupByLibrary.simpleMessage("Vorbereitungszeit"),
    "presetCustom": MessageLookupByLibrary.simpleMessage("Benutzerdefiniert"),
    "presetEighteenSix": MessageLookupByLibrary.simpleMessage("18:6"),
    "presetOMAD": MessageLookupByLibrary.simpleMessage("OMAD"),
    "presetSixteenEight": MessageLookupByLibrary.simpleMessage("16:8"),
    "presetTwentyFour": MessageLookupByLibrary.simpleMessage("20:4"),
    "privacyPolicyLabel": MessageLookupByLibrary.simpleMessage(
      "Datenschutzrichtlinie",
    ),
    "profileLabel": MessageLookupByLibrary.simpleMessage("Profil"),
    "progressChartsLabel": MessageLookupByLibrary.simpleMessage("Verlauf"),
    "proteinLabel": MessageLookupByLibrary.simpleMessage("Protein"),
    "proteinLabelShort": MessageLookupByLibrary.simpleMessage("Protein"),
    "quantityLabel": MessageLookupByLibrary.simpleMessage("Menge"),
    "readLabel": MessageLookupByLibrary.simpleMessage(
      "Ich habe die Datenschutzbestimmungen gelesen und akzeptiere sie.",
    ),
    "recalculateBudget": MessageLookupByLibrary.simpleMessage(
      "Budget neu berechnen",
    ),
    "recentFoodsLabel": MessageLookupByLibrary.simpleMessage(
      "Kürzliche Lebensmittel",
    ),
    "recentlyAddedLabel": MessageLookupByLibrary.simpleMessage("Kürzlich"),
    "recipeBuilderLabel": MessageLookupByLibrary.simpleMessage(
      "Rezept-Builder",
    ),
    "recipeCatalogAddToDiary": MessageLookupByLibrary.simpleMessage(
      "Zum Tagebuch hinzufügen",
    ),
    "recipeCatalogDetailTitle": MessageLookupByLibrary.simpleMessage(
      "Rezeptdetails",
    ),
    "recipeCatalogEmpty": MessageLookupByLibrary.simpleMessage(
      "Keine Rezepte gefunden",
    ),
    "recipeCatalogMin": MessageLookupByLibrary.simpleMessage("Min"),
    "recipeCatalogNutrition": MessageLookupByLibrary.simpleMessage("Nährwerte"),
    "recipeCatalogSearch": MessageLookupByLibrary.simpleMessage(
      "Rezepte suchen",
    ),
    "recipeCatalogSearchHint": MessageLookupByLibrary.simpleMessage(
      "Nach Name, Zutat suchen...",
    ),
    "recipeCatalogTitle": MessageLookupByLibrary.simpleMessage("Rezeptkatalog"),
    "recipeImportTitle": MessageLookupByLibrary.simpleMessage(
      "Rezept importieren",
    ),
    "recipeNameLabel": MessageLookupByLibrary.simpleMessage("Rezeptname"),
    "recipePreview": MessageLookupByLibrary.simpleMessage("Rezeptvorschau"),
    "recipeServingsLabel": MessageLookupByLibrary.simpleMessage("Portionen"),
    "recipeUrl": MessageLookupByLibrary.simpleMessage("Rezept-URL"),
    "remainingBudgetLabel": MessageLookupByLibrary.simpleMessage(
      "Verbleibendes Budget",
    ),
    "remainingLabel": MessageLookupByLibrary.simpleMessage("Übrig"),
    "remainingTimeLabel": MessageLookupByLibrary.simpleMessage("Verbleibend"),
    "reportErrorDialogText": MessageLookupByLibrary.simpleMessage(
      "Möchten Sie einen Fehler an den Entwickler melden?",
    ),
    "retryLabel": MessageLookupByLibrary.simpleMessage("Erneut versuchen"),
    "saturatedFatLabel": MessageLookupByLibrary.simpleMessage(
      "gesättigtes Fett",
    ),
    "saturatedFatPer100Label": MessageLookupByLibrary.simpleMessage(
      "Gesättigtes Fett pro ",
    ),
    "saturdayLabel": MessageLookupByLibrary.simpleMessage("Samstag"),
    "save": MessageLookupByLibrary.simpleMessage("Speichern"),
    "saveRecipeLabel": MessageLookupByLibrary.simpleMessage("Rezept speichern"),
    "scaleType": MessageLookupByLibrary.simpleMessage("Skala"),
    "scanProductLabel": MessageLookupByLibrary.simpleMessage("Produkt scannen"),
    "searchDefaultLabel": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie ein Suchwort ein",
    ),
    "searchFoodPage": MessageLookupByLibrary.simpleMessage("Lebensmittel"),
    "searchLabel": MessageLookupByLibrary.simpleMessage("Suchen"),
    "searchProductsPage": MessageLookupByLibrary.simpleMessage("Produkte"),
    "searchResultsLabel": MessageLookupByLibrary.simpleMessage(
      "Suchergebnisse",
    ),
    "seeAllLabel": MessageLookupByLibrary.simpleMessage("Alle anzeigen"),
    "selectGenderDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Geschlecht auswählen",
    ),
    "selectHeightDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Größe auswählen",
    ),
    "selectPalCategoryLabel": MessageLookupByLibrary.simpleMessage(
      "Aktivitätslevel auswählen",
    ),
    "selectWeightDialogLabel": MessageLookupByLibrary.simpleMessage(
      "Gewicht auswählen",
    ),
    "sendAnonymousUserData": MessageLookupByLibrary.simpleMessage(
      "Anonyme Nutzungsdaten senden?",
    ),
    "servingLabel": MessageLookupByLibrary.simpleMessage("Portion"),
    "servingSizeLabelImperial": MessageLookupByLibrary.simpleMessage(
      "Portionsgröße (oz/fl oz)",
    ),
    "servingSizeLabelMetric": MessageLookupByLibrary.simpleMessage(
      "Portionsgröße (g/ml)",
    ),
    "settingAboutLabel": MessageLookupByLibrary.simpleMessage("Über"),
    "settingFeedbackLabel": MessageLookupByLibrary.simpleMessage("Feedback"),
    "settingsCalculationsLabel": MessageLookupByLibrary.simpleMessage(
      "Berechnungen",
    ),
    "settingsDisclaimerLabel": MessageLookupByLibrary.simpleMessage("Hinweis"),
    "settingsDistanceLabel": MessageLookupByLibrary.simpleMessage("Entfernung"),
    "settingsLabel": MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "settingsLicensesLabel": MessageLookupByLibrary.simpleMessage("Lizenzen"),
    "settingsMassLabel": MessageLookupByLibrary.simpleMessage("Masse"),
    "settingsPrivacySettings": MessageLookupByLibrary.simpleMessage(
      "Datenschutzeinstellungen",
    ),
    "settingsReportErrorLabel": MessageLookupByLibrary.simpleMessage(
      "Fehler melden",
    ),
    "settingsSourceCodeLabel": MessageLookupByLibrary.simpleMessage(
      "Quellcode",
    ),
    "settingsThemeDarkLabel": MessageLookupByLibrary.simpleMessage("Dunkel"),
    "settingsThemeLabel": MessageLookupByLibrary.simpleMessage("Thema"),
    "settingsThemeLightLabel": MessageLookupByLibrary.simpleMessage("Hell"),
    "settingsThemeSystemDefaultLabel": MessageLookupByLibrary.simpleMessage(
      "Systemstandard",
    ),
    "settingsUnitsLabel": MessageLookupByLibrary.simpleMessage("Einheiten"),
    "settingsVolumeLabel": MessageLookupByLibrary.simpleMessage("Volumen"),
    "shoppingListLabel": MessageLookupByLibrary.simpleMessage("Einkaufsliste"),
    "showNutritionLabel": MessageLookupByLibrary.simpleMessage(
      "Nährwertdetails anzeigen",
    ),
    "snackExample": MessageLookupByLibrary.simpleMessage(
      "z. B. Apfel, Eiscreme, Schokolade ...",
    ),
    "snackLabel": MessageLookupByLibrary.simpleMessage("Snack"),
    "sodiumLabel": MessageLookupByLibrary.simpleMessage("Natrium"),
    "sodiumPer100Label": MessageLookupByLibrary.simpleMessage("Natrium pro "),
    "sourceUrlLabel": MessageLookupByLibrary.simpleMessage("Quelle"),
    "startFastLabel": MessageLookupByLibrary.simpleMessage("Fasten starten"),
    "startWeight": MessageLookupByLibrary.simpleMessage("Start"),
    "stepBonusCreditLabel": MessageLookupByLibrary.simpleMessage(
      "Schrittgutschrift",
    ),
    "stepBonusDescription": MessageLookupByLibrary.simpleMessage(
      "Verdienen Sie Kaloriengutschriften aus Ihrer täglichen Schrittzahl. Je mehr Sie gehen, desto mehr Kalorien bekommen Sie zurück.",
    ),
    "stepBonusEnableLabel": MessageLookupByLibrary.simpleMessage(
      "Schrittbonus aktivieren",
    ),
    "stepBonusLabel": MessageLookupByLibrary.simpleMessage("Schrittbonus"),
    "stepBonusPercentLabel": MessageLookupByLibrary.simpleMessage(
      "Gutschriftenprozentsatz",
    ),
    "stepBonusRefreshLabel": MessageLookupByLibrary.simpleMessage(
      "Aktualisieren",
    ),
    "stepBonusStepsLabel": MessageLookupByLibrary.simpleMessage(
      "Schritte heute",
    ),
    "stepBonusTodaySummary": MessageLookupByLibrary.simpleMessage(
      "Heutiger Schrittbonus",
    ),
    "streakLabel": MessageLookupByLibrary.simpleMessage("Serie"),
    "sugarLabel": MessageLookupByLibrary.simpleMessage("Zucker"),
    "sugarsPer100Label": MessageLookupByLibrary.simpleMessage("Zucker pro "),
    "summaryTimeLabel": MessageLookupByLibrary.simpleMessage(
      "Zeit der Zusammenfassung",
    ),
    "sundayLabel": MessageLookupByLibrary.simpleMessage("Sonntag"),
    "suppliedLabel": MessageLookupByLibrary.simpleMessage("zugeführt"),
    "symptomHistory": MessageLookupByLibrary.simpleMessage("Verlauf"),
    "symptomNotes": MessageLookupByLibrary.simpleMessage("Notizen"),
    "symptomSeverity": MessageLookupByLibrary.simpleMessage("Schweregrad"),
    "symptomSeverityOverTime": MessageLookupByLibrary.simpleMessage(
      "Schweregrad im Zeitverlauf",
    ),
    "symptomTitle": MessageLookupByLibrary.simpleMessage("Symptomverfolgung"),
    "symptomTrend": MessageLookupByLibrary.simpleMessage("Schweregrad-Trend"),
    "symptomType": MessageLookupByLibrary.simpleMessage("Symptomtyp"),
    "symptomTypeAnxiety": MessageLookupByLibrary.simpleMessage("Angst"),
    "symptomTypeBloating": MessageLookupByLibrary.simpleMessage("Blähungen"),
    "symptomTypeCramps": MessageLookupByLibrary.simpleMessage("Krämpfe"),
    "symptomTypeDizziness": MessageLookupByLibrary.simpleMessage("Schwindel"),
    "symptomTypeFatigue": MessageLookupByLibrary.simpleMessage("Erschöpfung"),
    "symptomTypeHeadache": MessageLookupByLibrary.simpleMessage(
      "Kopfschmerzen",
    ),
    "symptomTypeInsomnia": MessageLookupByLibrary.simpleMessage(
      "Schlaflosigkeit",
    ),
    "symptomTypeNausea": MessageLookupByLibrary.simpleMessage("Übelkeit"),
    "symptomTypeOther": MessageLookupByLibrary.simpleMessage("Sonstige"),
    "tdeeLabel": MessageLookupByLibrary.simpleMessage("TDEE"),
    "textType": MessageLookupByLibrary.simpleMessage("Text"),
    "thighCm": MessageLookupByLibrary.simpleMessage("Oberschenkel (cm)"),
    "thursdayLabel": MessageLookupByLibrary.simpleMessage("Donnerstag"),
    "timeLabel": MessageLookupByLibrary.simpleMessage("Zeit"),
    "timesPerDay": MessageLookupByLibrary.simpleMessage("Mal pro Tag"),
    "todayEntries": MessageLookupByLibrary.simpleMessage("Heute"),
    "trackerName": MessageLookupByLibrary.simpleMessage("Tracker-Name"),
    "trackerTrend": MessageLookupByLibrary.simpleMessage("Trend"),
    "trackerType": MessageLookupByLibrary.simpleMessage("Typ"),
    "tuesdayLabel": MessageLookupByLibrary.simpleMessage("Dienstag"),
    "unitLabel": MessageLookupByLibrary.simpleMessage("Einheit"),
    "viewPhotoLabel": MessageLookupByLibrary.simpleMessage("Foto ansehen"),
    "voiceLoggingConfirmButton": MessageLookupByLibrary.simpleMessage(
      "Bestätigen",
    ),
    "voiceLoggingExample": MessageLookupByLibrary.simpleMessage(
      "Lebensmittel per Sprache erfassen",
    ),
    "voiceLoggingLabel": MessageLookupByLibrary.simpleMessage(
      "Spracherfassung",
    ),
    "voiceLoggingListening": MessageLookupByLibrary.simpleMessage("Höre zu..."),
    "voiceLoggingNoMatches": MessageLookupByLibrary.simpleMessage(
      "Keine passenden Produkte gefunden",
    ),
    "voiceLoggingParsing": MessageLookupByLibrary.simpleMessage(
      "Lebensmittel werden identifiziert...",
    ),
    "voiceLoggingResultsTitle": MessageLookupByLibrary.simpleMessage(
      "Erkannte Lebensmittel",
    ),
    "voiceLoggingRetryButton": MessageLookupByLibrary.simpleMessage(
      "Erneut versuchen",
    ),
    "voiceLoggingStartButton": MessageLookupByLibrary.simpleMessage(
      "Aufnahme starten",
    ),
    "voiceLoggingStopButton": MessageLookupByLibrary.simpleMessage(
      "Aufnahme stoppen",
    ),
    "voiceLoggingSubtitle": MessageLookupByLibrary.simpleMessage(
      "Tippen Sie auf das Mikrofon und beschreiben Sie, was Sie gegessen haben",
    ),
    "voiceLoggingTitle": MessageLookupByLibrary.simpleMessage(
      "Sprachgesteuerte Lebensmittelerfassung",
    ),
    "waistCm": MessageLookupByLibrary.simpleMessage("Taille (cm)"),
    "waterProgress": m11,
    "waterTrackerTitle": MessageLookupByLibrary.simpleMessage("Wasser-Tracker"),
    "wednesdayLabel": MessageLookupByLibrary.simpleMessage("Mittwoch"),
    "weekdayTargets": MessageLookupByLibrary.simpleMessage("Wochentagsziele"),
    "weekly": MessageLookupByLibrary.simpleMessage("Wöchentlich"),
    "weeklyCalorieChart": MessageLookupByLibrary.simpleMessage(
      "Wöchentliche Kalorien",
    ),
    "weeklyLabel": MessageLookupByLibrary.simpleMessage("Woche"),
    "weeklySummaryLabel": MessageLookupByLibrary.simpleMessage(
      "Wöchentliche Zusammenfassung",
    ),
    "weightKg": MessageLookupByLibrary.simpleMessage("Gewicht (kg)"),
    "weightLabel": MessageLookupByLibrary.simpleMessage("Gewicht"),
    "weightTab": MessageLookupByLibrary.simpleMessage("Gewicht"),
    "weightTracking": MessageLookupByLibrary.simpleMessage(
      "Gewichtsverfolgung",
    ),
    "weightTrend": MessageLookupByLibrary.simpleMessage("Gewichtstrend"),
    "widgetCarbsShort": MessageLookupByLibrary.simpleMessage("K"),
    "widgetFatsShort": MessageLookupByLibrary.simpleMessage("F"),
    "widgetHomeDescription": MessageLookupByLibrary.simpleMessage(
      "Verbleibende Kalorien und Makros auf dem Startbild anzeigen.",
    ),
    "widgetHomeTitle": MessageLookupByLibrary.simpleMessage(
      "Nutriq Startseite",
    ),
    "widgetKcalLeft": MessageLookupByLibrary.simpleMessage("kcal übrig"),
    "widgetLockDescription": MessageLookupByLibrary.simpleMessage(
      "Verbleibende Kalorien auf dem Sperrbildschirm anzeigen.",
    ),
    "widgetLockTitle": MessageLookupByLibrary.simpleMessage("Nutriq Kalorien"),
    "widgetProteinsShort": MessageLookupByLibrary.simpleMessage("P"),
    "yearsLabel": m12,
  };
}
