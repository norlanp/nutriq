// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Nutriq`
  String get appTitle {
    return Intl.message('Nutriq', name: 'appTitle', desc: '', args: []);
  }

  /// `Version {versionNumber}`
  String appVersionName(Object versionNumber) {
    return Intl.message(
      'Version $versionNumber',
      name: 'appVersionName',
      desc: '',
      args: [versionNumber],
    );
  }

  /// `Nutriq is a free and open-source calorie and nutrient tracker that respects your privacy.`
  String get appDescription {
    return Intl.message(
      'Nutriq is a free and open-source calorie and nutrient tracker that respects your privacy.',
      name: 'appDescription',
      desc: '',
      args: [],
    );
  }

  /// `[Alpha]`
  String get alphaVersionName {
    return Intl.message(
      '[Alpha]',
      name: 'alphaVersionName',
      desc: '',
      args: [],
    );
  }

  /// `[Beta]`
  String get betaVersionName {
    return Intl.message('[Beta]', name: 'betaVersionName', desc: '', args: []);
  }

  /// `Add`
  String get addLabel {
    return Intl.message('Add', name: 'addLabel', desc: '', args: []);
  }

  /// `Create custom meal item?`
  String get createCustomDialogTitle {
    return Intl.message(
      'Create custom meal item?',
      name: 'createCustomDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want create a custom meal item?`
  String get createCustomDialogContent {
    return Intl.message(
      'Do you want create a custom meal item?',
      name: 'createCustomDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsLabel {
    return Intl.message('Settings', name: 'settingsLabel', desc: '', args: []);
  }

  /// `Home`
  String get homeLabel {
    return Intl.message('Home', name: 'homeLabel', desc: '', args: []);
  }

  /// `Diary`
  String get diaryLabel {
    return Intl.message('Diary', name: 'diaryLabel', desc: '', args: []);
  }

  /// `Profile`
  String get profileLabel {
    return Intl.message('Profile', name: 'profileLabel', desc: '', args: []);
  }

  /// `Search`
  String get searchLabel {
    return Intl.message('Search', name: 'searchLabel', desc: '', args: []);
  }

  /// `Products`
  String get searchProductsPage {
    return Intl.message(
      'Products',
      name: 'searchProductsPage',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get searchFoodPage {
    return Intl.message('Food', name: 'searchFoodPage', desc: '', args: []);
  }

  /// `Search results`
  String get searchResultsLabel {
    return Intl.message(
      'Search results',
      name: 'searchResultsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a search word`
  String get searchDefaultLabel {
    return Intl.message(
      'Please enter a search word',
      name: 'searchDefaultLabel',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get allItemsLabel {
    return Intl.message('All', name: 'allItemsLabel', desc: '', args: []);
  }

  /// `Recently`
  String get recentlyAddedLabel {
    return Intl.message(
      'Recently',
      name: 'recentlyAddedLabel',
      desc: '',
      args: [],
    );
  }

  /// `No meals recently added`
  String get noMealsRecentlyAddedLabel {
    return Intl.message(
      'No meals recently added',
      name: 'noMealsRecentlyAddedLabel',
      desc: '',
      args: [],
    );
  }

  /// `No activity recently added`
  String get noActivityRecentlyAddedLabel {
    return Intl.message(
      'No activity recently added',
      name: 'noActivityRecentlyAddedLabel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get dialogOKLabel {
    return Intl.message('OK', name: 'dialogOKLabel', desc: '', args: []);
  }

  /// `CANCEL`
  String get dialogCancelLabel {
    return Intl.message(
      'CANCEL',
      name: 'dialogCancelLabel',
      desc: '',
      args: [],
    );
  }

  /// `START`
  String get buttonStartLabel {
    return Intl.message('START', name: 'buttonStartLabel', desc: '', args: []);
  }

  /// `NEXT`
  String get buttonNextLabel {
    return Intl.message('NEXT', name: 'buttonNextLabel', desc: '', args: []);
  }

  /// `Save`
  String get buttonSaveLabel {
    return Intl.message('Save', name: 'buttonSaveLabel', desc: '', args: []);
  }

  /// `YES`
  String get buttonYesLabel {
    return Intl.message('YES', name: 'buttonYesLabel', desc: '', args: []);
  }

  /// `Reset`
  String get buttonResetLabel {
    return Intl.message('Reset', name: 'buttonResetLabel', desc: '', args: []);
  }

  /// `Welcome to`
  String get onboardingWelcomeLabel {
    return Intl.message(
      'Welcome to',
      name: 'onboardingWelcomeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get onboardingOverviewLabel {
    return Intl.message(
      'Overview',
      name: 'onboardingOverviewLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your calorie goal:`
  String get onboardingYourGoalLabel {
    return Intl.message(
      'Your calorie goal:',
      name: 'onboardingYourGoalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your macronutrient goals:`
  String get onboardingYourMacrosGoalLabel {
    return Intl.message(
      'Your macronutrient goals:',
      name: 'onboardingYourMacrosGoalLabel',
      desc: '',
      args: [],
    );
  }

  /// `kcal per day`
  String get onboardingKcalPerDayLabel {
    return Intl.message(
      'kcal per day',
      name: 'onboardingKcalPerDayLabel',
      desc: '',
      args: [],
    );
  }

  /// `To start, the app needs some information about you to calculate your daily calorie goal.\nAll information about you is stored securely on your device.`
  String get onboardingIntroDescription {
    return Intl.message(
      'To start, the app needs some information about you to calculate your daily calorie goal.\nAll information about you is stored securely on your device.',
      name: 'onboardingIntroDescription',
      desc: '',
      args: [],
    );
  }

  /// `What's your gender?`
  String get onboardingGenderQuestionSubtitle {
    return Intl.message(
      'What\'s your gender?',
      name: 'onboardingGenderQuestionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get onboardingEnterBirthdayLabel {
    return Intl.message(
      'Birthday',
      name: 'onboardingEnterBirthdayLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Date`
  String get onboardingBirthdayHint {
    return Intl.message(
      'Enter Date',
      name: 'onboardingBirthdayHint',
      desc: '',
      args: [],
    );
  }

  /// `When is your birthday?`
  String get onboardingBirthdayQuestionSubtitle {
    return Intl.message(
      'When is your birthday?',
      name: 'onboardingBirthdayQuestionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Whats your current height?`
  String get onboardingHeightQuestionSubtitle {
    return Intl.message(
      'Whats your current height?',
      name: 'onboardingHeightQuestionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Whats your current weight?`
  String get onboardingWeightQuestionSubtitle {
    return Intl.message(
      'Whats your current weight?',
      name: 'onboardingWeightQuestionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter correct height`
  String get onboardingWrongHeightLabel {
    return Intl.message(
      'Enter correct height',
      name: 'onboardingWrongHeightLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter correct weight`
  String get onboardingWrongWeightLabel {
    return Intl.message(
      'Enter correct weight',
      name: 'onboardingWrongWeightLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 60`
  String get onboardingWeightExampleHintKg {
    return Intl.message(
      'e.g. 60',
      name: 'onboardingWeightExampleHintKg',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 132`
  String get onboardingWeightExampleHintLbs {
    return Intl.message(
      'e.g. 132',
      name: 'onboardingWeightExampleHintLbs',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 170`
  String get onboardingHeightExampleHintCm {
    return Intl.message(
      'e.g. 170',
      name: 'onboardingHeightExampleHintCm',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 5.8`
  String get onboardingHeightExampleHintFt {
    return Intl.message(
      'e.g. 5.8',
      name: 'onboardingHeightExampleHintFt',
      desc: '',
      args: [],
    );
  }

  /// `How active are you? (without workouts)`
  String get onboardingActivityQuestionSubtitle {
    return Intl.message(
      'How active are you? (without workouts)',
      name: 'onboardingActivityQuestionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `What's your current weight goal?`
  String get onboardingGoalQuestionSubtitle {
    return Intl.message(
      'What\'s your current weight goal?',
      name: 'onboardingGoalQuestionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Wrong input, please try again`
  String get onboardingSaveUserError {
    return Intl.message(
      'Wrong input, please try again',
      name: 'onboardingSaveUserError',
      desc: '',
      args: [],
    );
  }

  /// `Units`
  String get settingsUnitsLabel {
    return Intl.message(
      'Units',
      name: 'settingsUnitsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Calculations`
  String get settingsCalculationsLabel {
    return Intl.message(
      'Calculations',
      name: 'settingsCalculationsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get settingsThemeLabel {
    return Intl.message(
      'Theme',
      name: 'settingsThemeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get settingsThemeLightLabel {
    return Intl.message(
      'Light',
      name: 'settingsThemeLightLabel',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get settingsThemeDarkLabel {
    return Intl.message(
      'Dark',
      name: 'settingsThemeDarkLabel',
      desc: '',
      args: [],
    );
  }

  /// `System default`
  String get settingsThemeSystemDefaultLabel {
    return Intl.message(
      'System default',
      name: 'settingsThemeSystemDefaultLabel',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get settingsLicensesLabel {
    return Intl.message(
      'Licenses',
      name: 'settingsLicensesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Disclaimer`
  String get settingsDisclaimerLabel {
    return Intl.message(
      'Disclaimer',
      name: 'settingsDisclaimerLabel',
      desc: '',
      args: [],
    );
  }

  /// `Report Error`
  String get settingsReportErrorLabel {
    return Intl.message(
      'Report Error',
      name: 'settingsReportErrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Settings`
  String get settingsPrivacySettings {
    return Intl.message(
      'Privacy Settings',
      name: 'settingsPrivacySettings',
      desc: '',
      args: [],
    );
  }

  /// `Source Code`
  String get settingsSourceCodeLabel {
    return Intl.message(
      'Source Code',
      name: 'settingsSourceCodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get settingFeedbackLabel {
    return Intl.message(
      'Feedback',
      name: 'settingFeedbackLabel',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get settingAboutLabel {
    return Intl.message('About', name: 'settingAboutLabel', desc: '', args: []);
  }

  /// `Mass`
  String get settingsMassLabel {
    return Intl.message('Mass', name: 'settingsMassLabel', desc: '', args: []);
  }

  /// `System`
  String get settingsSystemLabel {
    return Intl.message(
      'System',
      name: 'settingsSystemLabel',
      desc: '',
      args: [],
    );
  }

  /// `Metric (kg, cm, ml)`
  String get settingsMetricLabel {
    return Intl.message(
      'Metric (kg, cm, ml)',
      name: 'settingsMetricLabel',
      desc: '',
      args: [],
    );
  }

  /// `Imperial (lbs, ft, oz)`
  String get settingsImperialLabel {
    return Intl.message(
      'Imperial (lbs, ft, oz)',
      name: 'settingsImperialLabel',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get settingsDistanceLabel {
    return Intl.message(
      'Distance',
      name: 'settingsDistanceLabel',
      desc: '',
      args: [],
    );
  }

  /// `Volume`
  String get settingsVolumeLabel {
    return Intl.message(
      'Volume',
      name: 'settingsVolumeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Nutriq is not a medical application. All data provided is not validated and should be used with caution. Please maintain a healthy lifestyle and consult a professional if you have any problems. Use during illness, pregnancy or lactation is not recommended.`
  String get disclaimerText {
    return Intl.message(
      'Nutriq is not a medical application. All data provided is not validated and should be used with caution. Please maintain a healthy lifestyle and consult a professional if you have any problems. Use during illness, pregnancy or lactation is not recommended.',
      name: 'disclaimerText',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to report an error to the developer?`
  String get reportErrorDialogText {
    return Intl.message(
      'Do you want to report an error to the developer?',
      name: 'reportErrorDialogText',
      desc: '',
      args: [],
    );
  }

  /// `Send anonymous usage data`
  String get sendAnonymousUserData {
    return Intl.message(
      'Send anonymous usage data',
      name: 'sendAnonymousUserData',
      desc: '',
      args: [],
    );
  }

  /// `GPL-3.0 license`
  String get appLicenseLabel {
    return Intl.message(
      'GPL-3.0 license',
      name: 'appLicenseLabel',
      desc: '',
      args: [],
    );
  }

  /// `TDEE equation`
  String get calculationsTDEELabel {
    return Intl.message(
      'TDEE equation',
      name: 'calculationsTDEELabel',
      desc: '',
      args: [],
    );
  }

  /// `Institute of Medicine Equation`
  String get calculationsTDEEIOM2006Label {
    return Intl.message(
      'Institute of Medicine Equation',
      name: 'calculationsTDEEIOM2006Label',
      desc: '',
      args: [],
    );
  }

  /// `Mifflin-St Jeor Equation`
  String get calculationsTDEEMifflinStJeorLabel {
    return Intl.message(
      'Mifflin-St Jeor Equation',
      name: 'calculationsTDEEMifflinStJeorLabel',
      desc: '',
      args: [],
    );
  }

  /// `(recommended)`
  String get calculationsRecommendedLabel {
    return Intl.message(
      '(recommended)',
      name: 'calculationsRecommendedLabel',
      desc: '',
      args: [],
    );
  }

  /// `BMR`
  String get bmrLabel {
    return Intl.message('BMR', name: 'bmrLabel', desc: '', args: []);
  }

  /// `Basal Metabolic Rate`
  String get bmrKcal {
    return Intl.message(
      'Basal Metabolic Rate',
      name: 'bmrKcal',
      desc: '',
      args: [],
    );
  }

  /// `TDEE`
  String get tdeeLabel {
    return Intl.message('TDEE', name: 'tdeeLabel', desc: '', args: []);
  }

  /// `Activity Multiplier`
  String get activityMultiplierLabel {
    return Intl.message(
      'Activity Multiplier',
      name: 'activityMultiplierLabel',
      desc: '',
      args: [],
    );
  }

  /// `Calculation Method`
  String get calculationMethodLabel {
    return Intl.message(
      'Calculation Method',
      name: 'calculationMethodLabel',
      desc: '',
      args: [],
    );
  }

  /// `Macros distribution`
  String get calculationsMacronutrientsDistributionLabel {
    return Intl.message(
      'Macros distribution',
      name: 'calculationsMacronutrientsDistributionLabel',
      desc: '',
      args: [],
    );
  }

  /// `{pctCarbs}% carbs, {pctFats}% fats, {pctProteins}% proteins`
  String calculationsMacrosDistribution(
    Object pctCarbs,
    Object pctFats,
    Object pctProteins,
  ) {
    return Intl.message(
      '$pctCarbs% carbs, $pctFats% fats, $pctProteins% proteins',
      name: 'calculationsMacrosDistribution',
      desc: '',
      args: [pctCarbs, pctFats, pctProteins],
    );
  }

  /// `Daily Kcal adjustment:`
  String get dailyKcalAdjustmentLabel {
    return Intl.message(
      'Daily Kcal adjustment:',
      name: 'dailyKcalAdjustmentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Macronutrient Distribution:`
  String get macroDistributionLabel {
    return Intl.message(
      'Macronutrient Distribution:',
      name: 'macroDistributionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Export / Import data`
  String get exportImportLabel {
    return Intl.message(
      'Export / Import data',
      name: 'exportImportLabel',
      desc: '',
      args: [],
    );
  }

  /// `You can export the app data to a zip file and import it later. This is useful if you want to backup your data or transfer it to another device.\n\nThe app does not use any cloud service to store your data.`
  String get exportImportDescription {
    return Intl.message(
      'You can export the app data to a zip file and import it later. This is useful if you want to backup your data or transfer it to another device.\n\nThe app does not use any cloud service to store your data.',
      name: 'exportImportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Export / Import successful`
  String get exportImportSuccessLabel {
    return Intl.message(
      'Export / Import successful',
      name: 'exportImportSuccessLabel',
      desc: '',
      args: [],
    );
  }

  /// `Export / Import error`
  String get exportImportErrorLabel {
    return Intl.message(
      'Export / Import error',
      name: 'exportImportErrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get exportAction {
    return Intl.message('Export', name: 'exportAction', desc: '', args: []);
  }

  /// `Import`
  String get importAction {
    return Intl.message('Import', name: 'importAction', desc: '', args: []);
  }

  /// `Add new Item:`
  String get addItemLabel {
    return Intl.message(
      'Add new Item:',
      name: 'addItemLabel',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activityLabel {
    return Intl.message('Activity', name: 'activityLabel', desc: '', args: []);
  }

  /// `e.g. running, biking, yoga ...`
  String get activityExample {
    return Intl.message(
      'e.g. running, biking, yoga ...',
      name: 'activityExample',
      desc: '',
      args: [],
    );
  }

  /// `Breakfast`
  String get breakfastLabel {
    return Intl.message(
      'Breakfast',
      name: 'breakfastLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g. cereal, milk, coffee ...`
  String get breakfastExample {
    return Intl.message(
      'e.g. cereal, milk, coffee ...',
      name: 'breakfastExample',
      desc: '',
      args: [],
    );
  }

  /// `Lunch`
  String get lunchLabel {
    return Intl.message('Lunch', name: 'lunchLabel', desc: '', args: []);
  }

  /// `e.g. pizza, salad, rice ...`
  String get lunchExample {
    return Intl.message(
      'e.g. pizza, salad, rice ...',
      name: 'lunchExample',
      desc: '',
      args: [],
    );
  }

  /// `Dinner`
  String get dinnerLabel {
    return Intl.message('Dinner', name: 'dinnerLabel', desc: '', args: []);
  }

  /// `e.g. soup, chicken, wine ...`
  String get dinnerExample {
    return Intl.message(
      'e.g. soup, chicken, wine ...',
      name: 'dinnerExample',
      desc: '',
      args: [],
    );
  }

  /// `Snack`
  String get snackLabel {
    return Intl.message('Snack', name: 'snackLabel', desc: '', args: []);
  }

  /// `e.g. apple, ice cream, chocolate ...`
  String get snackExample {
    return Intl.message(
      'e.g. apple, ice cream, chocolate ...',
      name: 'snackExample',
      desc: '',
      args: [],
    );
  }

  /// `Edit item`
  String get editItemDialogTitle {
    return Intl.message(
      'Edit item',
      name: 'editItemDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Item updated`
  String get itemUpdatedSnackbar {
    return Intl.message(
      'Item updated',
      name: 'itemUpdatedSnackbar',
      desc: '',
      args: [],
    );
  }

  /// `Delete Item?`
  String get deleteTimeDialogTitle {
    return Intl.message(
      'Delete Item?',
      name: 'deleteTimeDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do want to delete the selected item?`
  String get deleteTimeDialogContent {
    return Intl.message(
      'Do want to delete the selected item?',
      name: 'deleteTimeDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Delete Items?`
  String get deleteTimeDialogPluralTitle {
    return Intl.message(
      'Delete Items?',
      name: 'deleteTimeDialogPluralTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do want to delete all items of this meal?`
  String get deleteTimeDialogPluralContent {
    return Intl.message(
      'Do want to delete all items of this meal?',
      name: 'deleteTimeDialogPluralContent',
      desc: '',
      args: [],
    );
  }

  /// `Item deleted`
  String get itemDeletedSnackbar {
    return Intl.message(
      'Item deleted',
      name: 'itemDeletedSnackbar',
      desc: '',
      args: [],
    );
  }

  /// `Which meal type do you want to copy to?`
  String get copyDialogTitle {
    return Intl.message(
      'Which meal type do you want to copy to?',
      name: 'copyDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to do?`
  String get copyOrDeleteTimeDialogTitle {
    return Intl.message(
      'What do you want to do?',
      name: 'copyOrDeleteTimeDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `With "Copy to today" you can copy the meal to today. With "Delete" you can delete the meal.`
  String get copyOrDeleteTimeDialogContent {
    return Intl.message(
      'With "Copy to today" you can copy the meal to today. With "Delete" you can delete the meal.',
      name: 'copyOrDeleteTimeDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Copy to today`
  String get dialogCopyLabel {
    return Intl.message(
      'Copy to today',
      name: 'dialogCopyLabel',
      desc: '',
      args: [],
    );
  }

  /// `DELETE`
  String get dialogDeleteLabel {
    return Intl.message(
      'DELETE',
      name: 'dialogDeleteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Delete all`
  String get deleteAllLabel {
    return Intl.message(
      'Delete all',
      name: 'deleteAllLabel',
      desc: '',
      args: [],
    );
  }

  /// `supplied`
  String get suppliedLabel {
    return Intl.message('supplied', name: 'suppliedLabel', desc: '', args: []);
  }

  /// `burned`
  String get burnedLabel {
    return Intl.message('burned', name: 'burnedLabel', desc: '', args: []);
  }

  /// `kcal left`
  String get kcalLeftLabel {
    return Intl.message('kcal left', name: 'kcalLeftLabel', desc: '', args: []);
  }

  /// `Nutrition Information`
  String get nutritionInfoLabel {
    return Intl.message(
      'Nutrition Information',
      name: 'nutritionInfoLabel',
      desc: '',
      args: [],
    );
  }

  /// `kcal`
  String get kcalLabel {
    return Intl.message('kcal', name: 'kcalLabel', desc: '', args: []);
  }

  /// `carbs`
  String get carbsLabel {
    return Intl.message('carbs', name: 'carbsLabel', desc: '', args: []);
  }

  /// `fat`
  String get fatLabel {
    return Intl.message('fat', name: 'fatLabel', desc: '', args: []);
  }

  /// `protein`
  String get proteinLabel {
    return Intl.message('protein', name: 'proteinLabel', desc: '', args: []);
  }

  /// `energy`
  String get energyLabel {
    return Intl.message('energy', name: 'energyLabel', desc: '', args: []);
  }

  /// `saturated fat`
  String get saturatedFatLabel {
    return Intl.message(
      'saturated fat',
      name: 'saturatedFatLabel',
      desc: '',
      args: [],
    );
  }

  /// `carbohydrate`
  String get carbohydrateLabel {
    return Intl.message(
      'carbohydrate',
      name: 'carbohydrateLabel',
      desc: '',
      args: [],
    );
  }

  /// `sugar`
  String get sugarLabel {
    return Intl.message('sugar', name: 'sugarLabel', desc: '', args: []);
  }

  /// `fiber`
  String get fiberLabel {
    return Intl.message('fiber', name: 'fiberLabel', desc: '', args: []);
  }

  /// `Per 100g/ml`
  String get per100gmlLabel {
    return Intl.message(
      'Per 100g/ml',
      name: 'per100gmlLabel',
      desc: '',
      args: [],
    );
  }

  /// `More Information at\nOpenFoodFacts`
  String get additionalInfoLabelOFF {
    return Intl.message(
      'More Information at\nOpenFoodFacts',
      name: 'additionalInfoLabelOFF',
      desc: '',
      args: [],
    );
  }

  /// `The data provided to you by this app are retrieved from the Open Food Facts database. No guarantees can be made for the accuracy, completeness, or reliability of the information provided. The data are provided “as is” and the originating source for the data (Open Food Facts) is not liable for any damages arising out of the use of the data.`
  String get offDisclaimer {
    return Intl.message(
      'The data provided to you by this app are retrieved from the Open Food Facts database. No guarantees can be made for the accuracy, completeness, or reliability of the information provided. The data are provided “as is” and the originating source for the data (Open Food Facts) is not liable for any damages arising out of the use of the data.',
      name: 'offDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `More Information at\nFoodData Central`
  String get additionalInfoLabelFDC {
    return Intl.message(
      'More Information at\nFoodData Central',
      name: 'additionalInfoLabelFDC',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Meal Item`
  String get additionalInfoLabelUnknown {
    return Intl.message(
      'Unknown Meal Item',
      name: 'additionalInfoLabelUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Custom Meal Item`
  String get additionalInfoLabelCustom {
    return Intl.message(
      'Custom Meal Item',
      name: 'additionalInfoLabelCustom',
      desc: '',
      args: [],
    );
  }

  /// `Information provided\n by the \n'2011 Compendium\n of Physical Activities'`
  String get additionalInfoLabelCompendium2011 {
    return Intl.message(
      'Information provided\n by the \n\'2011 Compendium\n of Physical Activities\'',
      name: 'additionalInfoLabelCompendium2011',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantityLabel {
    return Intl.message('Quantity', name: 'quantityLabel', desc: '', args: []);
  }

  /// `Base quantity (g/ml)`
  String get baseQuantityLabel {
    return Intl.message(
      'Base quantity (g/ml)',
      name: 'baseQuantityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unitLabel {
    return Intl.message('Unit', name: 'unitLabel', desc: '', args: []);
  }

  /// `Scan Product`
  String get scanProductLabel {
    return Intl.message(
      'Scan Product',
      name: 'scanProductLabel',
      desc: '',
      args: [],
    );
  }

  /// `g`
  String get gramUnit {
    return Intl.message('g', name: 'gramUnit', desc: '', args: []);
  }

  /// `ml`
  String get milliliterUnit {
    return Intl.message('ml', name: 'milliliterUnit', desc: '', args: []);
  }

  /// `g/ml`
  String get gramMilliliterUnit {
    return Intl.message('g/ml', name: 'gramMilliliterUnit', desc: '', args: []);
  }

  /// `oz`
  String get ozUnit {
    return Intl.message('oz', name: 'ozUnit', desc: '', args: []);
  }

  /// `fl.oz`
  String get flOzUnit {
    return Intl.message('fl.oz', name: 'flOzUnit', desc: '', args: []);
  }

  /// `N/A`
  String get notAvailableLabel {
    return Intl.message('N/A', name: 'notAvailableLabel', desc: '', args: []);
  }

  /// `Product missing required kcal or macronutrients information`
  String get missingProductInfo {
    return Intl.message(
      'Product missing required kcal or macronutrients information',
      name: 'missingProductInfo',
      desc: '',
      args: [],
    );
  }

  /// `Added new intake`
  String get infoAddedIntakeLabel {
    return Intl.message(
      'Added new intake',
      name: 'infoAddedIntakeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Added new activity`
  String get infoAddedActivityLabel {
    return Intl.message(
      'Added new activity',
      name: 'infoAddedActivityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Edit meal`
  String get editMealLabel {
    return Intl.message('Edit meal', name: 'editMealLabel', desc: '', args: []);
  }

  /// `Meal name`
  String get mealNameLabel {
    return Intl.message('Meal name', name: 'mealNameLabel', desc: '', args: []);
  }

  /// `Brands`
  String get mealBrandsLabel {
    return Intl.message('Brands', name: 'mealBrandsLabel', desc: '', args: []);
  }

  /// `Meal size (g/ml)`
  String get mealSizeLabel {
    return Intl.message(
      'Meal size (g/ml)',
      name: 'mealSizeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Meal size (oz/fl oz)`
  String get mealSizeLabelImperial {
    return Intl.message(
      'Meal size (oz/fl oz)',
      name: 'mealSizeLabelImperial',
      desc: '',
      args: [],
    );
  }

  /// `Serving`
  String get servingLabel {
    return Intl.message('Serving', name: 'servingLabel', desc: '', args: []);
  }

  /// `Per Serving`
  String get perServingLabel {
    return Intl.message(
      'Per Serving',
      name: 'perServingLabel',
      desc: '',
      args: [],
    );
  }

  /// `Serving size (g/ml)`
  String get servingSizeLabelMetric {
    return Intl.message(
      'Serving size (g/ml)',
      name: 'servingSizeLabelMetric',
      desc: '',
      args: [],
    );
  }

  /// `Serving size (oz/fl oz)`
  String get servingSizeLabelImperial {
    return Intl.message(
      'Serving size (oz/fl oz)',
      name: 'servingSizeLabelImperial',
      desc: '',
      args: [],
    );
  }

  /// `Meal unit`
  String get mealUnitLabel {
    return Intl.message('Meal unit', name: 'mealUnitLabel', desc: '', args: []);
  }

  /// `kcal per`
  String get mealKcalLabel {
    return Intl.message('kcal per', name: 'mealKcalLabel', desc: '', args: []);
  }

  /// `carbs per`
  String get mealCarbsLabel {
    return Intl.message(
      'carbs per',
      name: 'mealCarbsLabel',
      desc: '',
      args: [],
    );
  }

  /// `fat per`
  String get mealFatLabel {
    return Intl.message('fat per', name: 'mealFatLabel', desc: '', args: []);
  }

  /// `protein per 100 g/ml`
  String get mealProteinLabel {
    return Intl.message(
      'protein per 100 g/ml',
      name: 'mealProteinLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sugars per `
  String get sugarsPer100Label {
    return Intl.message(
      'Sugars per ',
      name: 'sugarsPer100Label',
      desc: '',
      args: [],
    );
  }

  /// `Saturated fat per `
  String get saturatedFatPer100Label {
    return Intl.message(
      'Saturated fat per ',
      name: 'saturatedFatPer100Label',
      desc: '',
      args: [],
    );
  }

  /// `Fiber per `
  String get fiberPer100Label {
    return Intl.message(
      'Fiber per ',
      name: 'fiberPer100Label',
      desc: '',
      args: [],
    );
  }

  /// `Sodium per `
  String get sodiumPer100Label {
    return Intl.message(
      'Sodium per ',
      name: 'sodiumPer100Label',
      desc: '',
      args: [],
    );
  }

  /// `Potassium per `
  String get potassiumPer100Label {
    return Intl.message(
      'Potassium per ',
      name: 'potassiumPer100Label',
      desc: '',
      args: [],
    );
  }

  /// `Error while saving meal. Did you input the correct meal information?`
  String get errorMealSave {
    return Intl.message(
      'Error while saving meal. Did you input the correct meal information?',
      name: 'errorMealSave',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get bmiLabel {
    return Intl.message('BMI', name: 'bmiLabel', desc: '', args: []);
  }

  /// `Body Mass Index (BMI) is a index to classify overweight and obesity in adults. It is defined as weight in kilograms divided by the square of height in meters (kg/m²).\n\nBMI does not differentiate between fat and muscle mass and can be misleading for some individuals.`
  String get bmiInfo {
    return Intl.message(
      'Body Mass Index (BMI) is a index to classify overweight and obesity in adults. It is defined as weight in kilograms divided by the square of height in meters (kg/m²).\n\nBMI does not differentiate between fat and muscle mass and can be misleading for some individuals.',
      name: 'bmiInfo',
      desc: '',
      args: [],
    );
  }

  /// `I have read and accept the privacy policy.`
  String get readLabel {
    return Intl.message(
      'I have read and accept the privacy policy.',
      name: 'readLabel',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicyLabel {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicyLabel',
      desc: '',
      args: [],
    );
  }

  /// `Support development by providing anonymous usage data`
  String get dataCollectionLabel {
    return Intl.message(
      'Support development by providing anonymous usage data',
      name: 'dataCollectionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sedentary`
  String get palSedentaryLabel {
    return Intl.message(
      'Sedentary',
      name: 'palSedentaryLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g. office job and mostly sitting free time activities`
  String get palSedentaryDescriptionLabel {
    return Intl.message(
      'e.g. office job and mostly sitting free time activities',
      name: 'palSedentaryDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Low Active`
  String get palLowLActiveLabel {
    return Intl.message(
      'Low Active',
      name: 'palLowLActiveLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g. sitting or standing in job and light free time activities`
  String get palLowActiveDescriptionLabel {
    return Intl.message(
      'e.g. sitting or standing in job and light free time activities',
      name: 'palLowActiveDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get palActiveLabel {
    return Intl.message('Active', name: 'palActiveLabel', desc: '', args: []);
  }

  /// `Mostly standing or walking in job and active free time activities`
  String get palActiveDescriptionLabel {
    return Intl.message(
      'Mostly standing or walking in job and active free time activities',
      name: 'palActiveDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Very Active`
  String get palVeryActiveLabel {
    return Intl.message(
      'Very Active',
      name: 'palVeryActiveLabel',
      desc: '',
      args: [],
    );
  }

  /// `Mostly walking, running or carrying weight in job and active free time activities`
  String get palVeryActiveDescriptionLabel {
    return Intl.message(
      'Mostly walking, running or carrying weight in job and active free time activities',
      name: 'palVeryActiveDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Extra Active`
  String get palExtraActiveLabel {
    return Intl.message(
      'Extra Active',
      name: 'palExtraActiveLabel',
      desc: '',
      args: [],
    );
  }

  /// `Very intense physical job and extremely active free time activities`
  String get palExtraActiveDescriptionLabel {
    return Intl.message(
      'Very intense physical job and extremely active free time activities',
      name: 'palExtraActiveDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select Activity Level`
  String get selectPalCategoryLabel {
    return Intl.message(
      'Select Activity Level',
      name: 'selectPalCategoryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Choose Weight Goal`
  String get chooseWeightGoalLabel {
    return Intl.message(
      'Choose Weight Goal',
      name: 'chooseWeightGoalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Lose Weight`
  String get goalLoseWeight {
    return Intl.message(
      'Lose Weight',
      name: 'goalLoseWeight',
      desc: '',
      args: [],
    );
  }

  /// `Maintain Weight`
  String get goalMaintainWeight {
    return Intl.message(
      'Maintain Weight',
      name: 'goalMaintainWeight',
      desc: '',
      args: [],
    );
  }

  /// `Gain Weight`
  String get goalGainWeight {
    return Intl.message(
      'Gain Weight',
      name: 'goalGainWeight',
      desc: '',
      args: [],
    );
  }

  /// `Goal`
  String get goalLabel {
    return Intl.message('Goal', name: 'goalLabel', desc: '', args: []);
  }

  /// `Select Height`
  String get selectHeightDialogLabel {
    return Intl.message(
      'Select Height',
      name: 'selectHeightDialogLabel',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get heightLabel {
    return Intl.message('Height', name: 'heightLabel', desc: '', args: []);
  }

  /// `cm`
  String get cmLabel {
    return Intl.message('cm', name: 'cmLabel', desc: '', args: []);
  }

  /// `ft`
  String get ftLabel {
    return Intl.message('ft', name: 'ftLabel', desc: '', args: []);
  }

  /// `Select Weight`
  String get selectWeightDialogLabel {
    return Intl.message(
      'Select Weight',
      name: 'selectWeightDialogLabel',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weightLabel {
    return Intl.message('Weight', name: 'weightLabel', desc: '', args: []);
  }

  /// `kg`
  String get kgLabel {
    return Intl.message('kg', name: 'kgLabel', desc: '', args: []);
  }

  /// `lbs`
  String get lbsLabel {
    return Intl.message('lbs', name: 'lbsLabel', desc: '', args: []);
  }

  /// `Age`
  String get ageLabel {
    return Intl.message('Age', name: 'ageLabel', desc: '', args: []);
  }

  /// `{age} years`
  String yearsLabel(Object age) {
    return Intl.message(
      '$age years',
      name: 'yearsLabel',
      desc: '',
      args: [age],
    );
  }

  /// `Select Gender`
  String get selectGenderDialogLabel {
    return Intl.message(
      'Select Gender',
      name: 'selectGenderDialogLabel',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get genderLabel {
    return Intl.message('Gender', name: 'genderLabel', desc: '', args: []);
  }

  /// `♂ male`
  String get genderMaleLabel {
    return Intl.message('♂ male', name: 'genderMaleLabel', desc: '', args: []);
  }

  /// `♀ female`
  String get genderFemaleLabel {
    return Intl.message(
      '♀ female',
      name: 'genderFemaleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Nothing added`
  String get nothingAddedLabel {
    return Intl.message(
      'Nothing added',
      name: 'nothingAddedLabel',
      desc: '',
      args: [],
    );
  }

  /// `Underweight`
  String get nutritionalStatusUnderweight {
    return Intl.message(
      'Underweight',
      name: 'nutritionalStatusUnderweight',
      desc: '',
      args: [],
    );
  }

  /// `Normal Weight`
  String get nutritionalStatusNormalWeight {
    return Intl.message(
      'Normal Weight',
      name: 'nutritionalStatusNormalWeight',
      desc: '',
      args: [],
    );
  }

  /// `Pre-obesity`
  String get nutritionalStatusPreObesity {
    return Intl.message(
      'Pre-obesity',
      name: 'nutritionalStatusPreObesity',
      desc: '',
      args: [],
    );
  }

  /// `Obesity Class I`
  String get nutritionalStatusObeseClassI {
    return Intl.message(
      'Obesity Class I',
      name: 'nutritionalStatusObeseClassI',
      desc: '',
      args: [],
    );
  }

  /// `Obesity Class II`
  String get nutritionalStatusObeseClassII {
    return Intl.message(
      'Obesity Class II',
      name: 'nutritionalStatusObeseClassII',
      desc: '',
      args: [],
    );
  }

  /// `Obesity Class III`
  String get nutritionalStatusObeseClassIII {
    return Intl.message(
      'Obesity Class III',
      name: 'nutritionalStatusObeseClassIII',
      desc: '',
      args: [],
    );
  }

  /// `Risk of comorbidities: {riskValue}`
  String nutritionalStatusRiskLabel(Object riskValue) {
    return Intl.message(
      'Risk of comorbidities: $riskValue',
      name: 'nutritionalStatusRiskLabel',
      desc: '',
      args: [riskValue],
    );
  }

  /// `Low \n(but risk of other \nclinical problems increased)`
  String get nutritionalStatusRiskLow {
    return Intl.message(
      'Low \n(but risk of other \nclinical problems increased)',
      name: 'nutritionalStatusRiskLow',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get nutritionalStatusRiskAverage {
    return Intl.message(
      'Average',
      name: 'nutritionalStatusRiskAverage',
      desc: '',
      args: [],
    );
  }

  /// `Increased`
  String get nutritionalStatusRiskIncreased {
    return Intl.message(
      'Increased',
      name: 'nutritionalStatusRiskIncreased',
      desc: '',
      args: [],
    );
  }

  /// `Moderate`
  String get nutritionalStatusRiskModerate {
    return Intl.message(
      'Moderate',
      name: 'nutritionalStatusRiskModerate',
      desc: '',
      args: [],
    );
  }

  /// `Severe`
  String get nutritionalStatusRiskSevere {
    return Intl.message(
      'Severe',
      name: 'nutritionalStatusRiskSevere',
      desc: '',
      args: [],
    );
  }

  /// `Very severe`
  String get nutritionalStatusRiskVerySevere {
    return Intl.message(
      'Very severe',
      name: 'nutritionalStatusRiskVerySevere',
      desc: '',
      args: [],
    );
  }

  /// `Error while opening email app`
  String get errorOpeningEmail {
    return Intl.message(
      'Error while opening email app',
      name: 'errorOpeningEmail',
      desc: '',
      args: [],
    );
  }

  /// `Error while opening browser app`
  String get errorOpeningBrowser {
    return Intl.message(
      'Error while opening browser app',
      name: 'errorOpeningBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Error while fetching product data`
  String get errorFetchingProductData {
    return Intl.message(
      'Error while fetching product data',
      name: 'errorFetchingProductData',
      desc: '',
      args: [],
    );
  }

  /// `Product not found`
  String get errorProductNotFound {
    return Intl.message(
      'Product not found',
      name: 'errorProductNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Error while loading activities`
  String get errorLoadingActivities {
    return Intl.message(
      'Error while loading activities',
      name: 'errorLoadingActivities',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Try searching with different keywords`
  String get noResultsHint {
    return Intl.message(
      'Try searching with different keywords',
      name: 'noResultsHint',
      desc: '',
      args: [],
    );
  }

  /// `Create custom food`
  String get createCustomFoodLabel {
    return Intl.message(
      'Create custom food',
      name: 'createCustomFoodLabel',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retryLabel {
    return Intl.message('Retry', name: 'retryLabel', desc: '', args: []);
  }

  /// `Recent Foods`
  String get recentFoodsLabel {
    return Intl.message(
      'Recent Foods',
      name: 'recentFoodsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Food name is required`
  String get customFoodNameRequired {
    return Intl.message(
      'Food name is required',
      name: 'customFoodNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Energy (kcal per 100 g/ml)`
  String get customFoodEnergyLabel {
    return Intl.message(
      'Energy (kcal per 100 g/ml)',
      name: 'customFoodEnergyLabel',
      desc: '',
      args: [],
    );
  }

  /// `bicycling`
  String get paHeadingBicycling {
    return Intl.message(
      'bicycling',
      name: 'paHeadingBicycling',
      desc: '',
      args: [],
    );
  }

  /// `conditioning exercise`
  String get paHeadingConditionalExercise {
    return Intl.message(
      'conditioning exercise',
      name: 'paHeadingConditionalExercise',
      desc: '',
      args: [],
    );
  }

  /// `dancing`
  String get paHeadingDancing {
    return Intl.message(
      'dancing',
      name: 'paHeadingDancing',
      desc: '',
      args: [],
    );
  }

  /// `running`
  String get paHeadingRunning {
    return Intl.message(
      'running',
      name: 'paHeadingRunning',
      desc: '',
      args: [],
    );
  }

  /// `sports`
  String get paHeadingSports {
    return Intl.message('sports', name: 'paHeadingSports', desc: '', args: []);
  }

  /// `walking`
  String get paHeadingWalking {
    return Intl.message(
      'walking',
      name: 'paHeadingWalking',
      desc: '',
      args: [],
    );
  }

  /// `water activities`
  String get paHeadingWaterActivities {
    return Intl.message(
      'water activities',
      name: 'paHeadingWaterActivities',
      desc: '',
      args: [],
    );
  }

  /// `winter activities`
  String get paHeadingWinterActivities {
    return Intl.message(
      'winter activities',
      name: 'paHeadingWinterActivities',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paGeneralDesc {
    return Intl.message('general', name: 'paGeneralDesc', desc: '', args: []);
  }

  /// `bicycling`
  String get paBicyclingGeneral {
    return Intl.message(
      'bicycling',
      name: 'paBicyclingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paBicyclingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paBicyclingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `bicycling, mountain`
  String get paBicyclingMountainGeneral {
    return Intl.message(
      'bicycling, mountain',
      name: 'paBicyclingMountainGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paBicyclingMountainGeneralDesc {
    return Intl.message(
      'general',
      name: 'paBicyclingMountainGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `unicycling`
  String get paUnicyclingGeneral {
    return Intl.message(
      'unicycling',
      name: 'paUnicyclingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paUnicyclingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paUnicyclingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `bicycling, stationary`
  String get paBicyclingStationaryGeneral {
    return Intl.message(
      'bicycling, stationary',
      name: 'paBicyclingStationaryGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paBicyclingStationaryGeneralDesc {
    return Intl.message(
      'general',
      name: 'paBicyclingStationaryGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `calisthenics`
  String get paCalisthenicsGeneral {
    return Intl.message(
      'calisthenics',
      name: 'paCalisthenicsGeneral',
      desc: '',
      args: [],
    );
  }

  /// `light or moderate effort, general (e.g., back exercises)`
  String get paCalisthenicsGeneralDesc {
    return Intl.message(
      'light or moderate effort, general (e.g., back exercises)',
      name: 'paCalisthenicsGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `resistance training`
  String get paResistanceTraining {
    return Intl.message(
      'resistance training',
      name: 'paResistanceTraining',
      desc: '',
      args: [],
    );
  }

  /// `weight lifting, free weight, nautilus or universal`
  String get paResistanceTrainingDesc {
    return Intl.message(
      'weight lifting, free weight, nautilus or universal',
      name: 'paResistanceTrainingDesc',
      desc: '',
      args: [],
    );
  }

  /// `rope skipping`
  String get paRopeSkippingGeneral {
    return Intl.message(
      'rope skipping',
      name: 'paRopeSkippingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paRopeSkippingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paRopeSkippingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `water exercise`
  String get paWaterAerobics {
    return Intl.message(
      'water exercise',
      name: 'paWaterAerobics',
      desc: '',
      args: [],
    );
  }

  /// `water aerobics, water calisthenics`
  String get paWaterAerobicsDesc {
    return Intl.message(
      'water aerobics, water calisthenics',
      name: 'paWaterAerobicsDesc',
      desc: '',
      args: [],
    );
  }

  /// `aerobic`
  String get paDancingAerobicGeneral {
    return Intl.message(
      'aerobic',
      name: 'paDancingAerobicGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paDancingAerobicGeneralDesc {
    return Intl.message(
      'general',
      name: 'paDancingAerobicGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `general dancing`
  String get paDancingGeneral {
    return Intl.message(
      'general dancing',
      name: 'paDancingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `e.g. disco, folk, Irish step dancing, line dancing, polka, contra, country`
  String get paDancingGeneralDesc {
    return Intl.message(
      'e.g. disco, folk, Irish step dancing, line dancing, polka, contra, country',
      name: 'paDancingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `jogging`
  String get paJoggingGeneral {
    return Intl.message(
      'jogging',
      name: 'paJoggingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paJoggingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paJoggingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `running`
  String get paRunningGeneral {
    return Intl.message(
      'running',
      name: 'paRunningGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paRunningGeneralDesc {
    return Intl.message(
      'general',
      name: 'paRunningGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `archery`
  String get paArcheryGeneral {
    return Intl.message(
      'archery',
      name: 'paArcheryGeneral',
      desc: '',
      args: [],
    );
  }

  /// `non-hunting`
  String get paArcheryGeneralDesc {
    return Intl.message(
      'non-hunting',
      name: 'paArcheryGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `badminton`
  String get paBadmintonGeneral {
    return Intl.message(
      'badminton',
      name: 'paBadmintonGeneral',
      desc: '',
      args: [],
    );
  }

  /// `social singles and doubles, general`
  String get paBadmintonGeneralDesc {
    return Intl.message(
      'social singles and doubles, general',
      name: 'paBadmintonGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `basketball`
  String get paBasketballGeneral {
    return Intl.message(
      'basketball',
      name: 'paBasketballGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paBasketballGeneralDesc {
    return Intl.message(
      'general',
      name: 'paBasketballGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `billiards`
  String get paBilliardsGeneral {
    return Intl.message(
      'billiards',
      name: 'paBilliardsGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paBilliardsGeneralDesc {
    return Intl.message(
      'general',
      name: 'paBilliardsGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `bowling`
  String get paBowlingGeneral {
    return Intl.message(
      'bowling',
      name: 'paBowlingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paBowlingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paBowlingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `boxing`
  String get paBoxingBag {
    return Intl.message('boxing', name: 'paBoxingBag', desc: '', args: []);
  }

  /// `punching bag`
  String get paBoxingBagDesc {
    return Intl.message(
      'punching bag',
      name: 'paBoxingBagDesc',
      desc: '',
      args: [],
    );
  }

  /// `boxing`
  String get paBoxingGeneral {
    return Intl.message('boxing', name: 'paBoxingGeneral', desc: '', args: []);
  }

  /// `in ring, general`
  String get paBoxingGeneralDesc {
    return Intl.message(
      'in ring, general',
      name: 'paBoxingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `broomball`
  String get paBroomball {
    return Intl.message('broomball', name: 'paBroomball', desc: '', args: []);
  }

  /// `general`
  String get paBroomballDesc {
    return Intl.message('general', name: 'paBroomballDesc', desc: '', args: []);
  }

  /// `children’s games`
  String get paChildrenGame {
    return Intl.message(
      'children’s games',
      name: 'paChildrenGame',
      desc: '',
      args: [],
    );
  }

  /// `(e.g., hopscotch, 4-square, dodgeball, playground apparatus, t-ball, tetherball, marbles, arcade games), moderate effort`
  String get paChildrenGameDesc {
    return Intl.message(
      '(e.g., hopscotch, 4-square, dodgeball, playground apparatus, t-ball, tetherball, marbles, arcade games), moderate effort',
      name: 'paChildrenGameDesc',
      desc: '',
      args: [],
    );
  }

  /// `cheerleading`
  String get paCheerleading {
    return Intl.message(
      'cheerleading',
      name: 'paCheerleading',
      desc: '',
      args: [],
    );
  }

  /// `gymnastic moves, competitive`
  String get paCheerleadingDesc {
    return Intl.message(
      'gymnastic moves, competitive',
      name: 'paCheerleadingDesc',
      desc: '',
      args: [],
    );
  }

  /// `cricket`
  String get paCricket {
    return Intl.message('cricket', name: 'paCricket', desc: '', args: []);
  }

  /// `batting, bowling, fielding`
  String get paCricketDesc {
    return Intl.message(
      'batting, bowling, fielding',
      name: 'paCricketDesc',
      desc: '',
      args: [],
    );
  }

  /// `croquet`
  String get paCroquet {
    return Intl.message('croquet', name: 'paCroquet', desc: '', args: []);
  }

  /// `general`
  String get paCroquetDesc {
    return Intl.message('general', name: 'paCroquetDesc', desc: '', args: []);
  }

  /// `curling`
  String get paCurling {
    return Intl.message('curling', name: 'paCurling', desc: '', args: []);
  }

  /// `general`
  String get paCurlingDesc {
    return Intl.message('general', name: 'paCurlingDesc', desc: '', args: []);
  }

  /// `darts`
  String get paDartsWall {
    return Intl.message('darts', name: 'paDartsWall', desc: '', args: []);
  }

  /// `wall or lawn`
  String get paDartsWallDesc {
    return Intl.message(
      'wall or lawn',
      name: 'paDartsWallDesc',
      desc: '',
      args: [],
    );
  }

  /// `auto racing`
  String get paAutoRacing {
    return Intl.message(
      'auto racing',
      name: 'paAutoRacing',
      desc: '',
      args: [],
    );
  }

  /// `open wheel`
  String get paAutoRacingDesc {
    return Intl.message(
      'open wheel',
      name: 'paAutoRacingDesc',
      desc: '',
      args: [],
    );
  }

  /// `fencing`
  String get paFencing {
    return Intl.message('fencing', name: 'paFencing', desc: '', args: []);
  }

  /// `general`
  String get paFencingDesc {
    return Intl.message('general', name: 'paFencingDesc', desc: '', args: []);
  }

  /// `football`
  String get paAmericanFootballGeneral {
    return Intl.message(
      'football',
      name: 'paAmericanFootballGeneral',
      desc: '',
      args: [],
    );
  }

  /// `touch, flag, general`
  String get paAmericanFootballGeneralDesc {
    return Intl.message(
      'touch, flag, general',
      name: 'paAmericanFootballGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `football or baseball`
  String get paCatch {
    return Intl.message(
      'football or baseball',
      name: 'paCatch',
      desc: '',
      args: [],
    );
  }

  /// `playing catch`
  String get paCatchDesc {
    return Intl.message(
      'playing catch',
      name: 'paCatchDesc',
      desc: '',
      args: [],
    );
  }

  /// `frisbee playing`
  String get paFrisbee {
    return Intl.message(
      'frisbee playing',
      name: 'paFrisbee',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paFrisbeeDesc {
    return Intl.message('general', name: 'paFrisbeeDesc', desc: '', args: []);
  }

  /// `golf`
  String get paGolfGeneral {
    return Intl.message('golf', name: 'paGolfGeneral', desc: '', args: []);
  }

  /// `general`
  String get paGolfGeneralDesc {
    return Intl.message(
      'general',
      name: 'paGolfGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `gymnastics`
  String get paGymnasticsGeneral {
    return Intl.message(
      'gymnastics',
      name: 'paGymnasticsGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paGymnasticsGeneralDesc {
    return Intl.message(
      'general',
      name: 'paGymnasticsGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `hacky sack`
  String get paHackySack {
    return Intl.message('hacky sack', name: 'paHackySack', desc: '', args: []);
  }

  /// `general`
  String get paHackySackDesc {
    return Intl.message('general', name: 'paHackySackDesc', desc: '', args: []);
  }

  /// `handball`
  String get paHandballGeneral {
    return Intl.message(
      'handball',
      name: 'paHandballGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paHandballGeneralDesc {
    return Intl.message(
      'general',
      name: 'paHandballGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `hang gliding`
  String get paHangGliding {
    return Intl.message(
      'hang gliding',
      name: 'paHangGliding',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paHangGlidingDesc {
    return Intl.message(
      'general',
      name: 'paHangGlidingDesc',
      desc: '',
      args: [],
    );
  }

  /// `hockey, field`
  String get paHockeyField {
    return Intl.message(
      'hockey, field',
      name: 'paHockeyField',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paHockeyFieldDesc {
    return Intl.message(
      'general',
      name: 'paHockeyFieldDesc',
      desc: '',
      args: [],
    );
  }

  /// `ice hockey`
  String get paIceHockeyGeneral {
    return Intl.message(
      'ice hockey',
      name: 'paIceHockeyGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paIceHockeyGeneralDesc {
    return Intl.message(
      'general',
      name: 'paIceHockeyGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `horseback riding`
  String get paHorseRidingGeneral {
    return Intl.message(
      'horseback riding',
      name: 'paHorseRidingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paHorseRidingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paHorseRidingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `jai alai`
  String get paJaiAlai {
    return Intl.message('jai alai', name: 'paJaiAlai', desc: '', args: []);
  }

  /// `general`
  String get paJaiAlaiDesc {
    return Intl.message('general', name: 'paJaiAlaiDesc', desc: '', args: []);
  }

  /// `martial arts`
  String get paMartialArtsSlower {
    return Intl.message(
      'martial arts',
      name: 'paMartialArtsSlower',
      desc: '',
      args: [],
    );
  }

  /// `different types, slower pace, novice performers, practice`
  String get paMartialArtsSlowerDesc {
    return Intl.message(
      'different types, slower pace, novice performers, practice',
      name: 'paMartialArtsSlowerDesc',
      desc: '',
      args: [],
    );
  }

  /// `martial arts`
  String get paMartialArtsModerate {
    return Intl.message(
      'martial arts',
      name: 'paMartialArtsModerate',
      desc: '',
      args: [],
    );
  }

  /// `different types, moderate pace (e.g., judo, jujitsu, karate, kick boxing, tae kwan do, tai-bo, Muay Thai boxing)`
  String get paMartialArtsModerateDesc {
    return Intl.message(
      'different types, moderate pace (e.g., judo, jujitsu, karate, kick boxing, tae kwan do, tai-bo, Muay Thai boxing)',
      name: 'paMartialArtsModerateDesc',
      desc: '',
      args: [],
    );
  }

  /// `juggling`
  String get paJuggling {
    return Intl.message('juggling', name: 'paJuggling', desc: '', args: []);
  }

  /// `general`
  String get paJugglingDesc {
    return Intl.message('general', name: 'paJugglingDesc', desc: '', args: []);
  }

  /// `kickball`
  String get paKickball {
    return Intl.message('kickball', name: 'paKickball', desc: '', args: []);
  }

  /// `general`
  String get paKickballDesc {
    return Intl.message('general', name: 'paKickballDesc', desc: '', args: []);
  }

  /// `lacrosse`
  String get paLacrosse {
    return Intl.message('lacrosse', name: 'paLacrosse', desc: '', args: []);
  }

  /// `general`
  String get paLacrosseDesc {
    return Intl.message('general', name: 'paLacrosseDesc', desc: '', args: []);
  }

  /// `lawn bowling`
  String get paLawnBowling {
    return Intl.message(
      'lawn bowling',
      name: 'paLawnBowling',
      desc: '',
      args: [],
    );
  }

  /// `bocce ball, outdoor`
  String get paLawnBowlingDesc {
    return Intl.message(
      'bocce ball, outdoor',
      name: 'paLawnBowlingDesc',
      desc: '',
      args: [],
    );
  }

  /// `moto-cross`
  String get paMotoCross {
    return Intl.message('moto-cross', name: 'paMotoCross', desc: '', args: []);
  }

  /// `off-road motor sports, all-terrain vehicle, general`
  String get paMotoCrossDesc {
    return Intl.message(
      'off-road motor sports, all-terrain vehicle, general',
      name: 'paMotoCrossDesc',
      desc: '',
      args: [],
    );
  }

  /// `orienteering`
  String get paOrienteering {
    return Intl.message(
      'orienteering',
      name: 'paOrienteering',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paOrienteeringDesc {
    return Intl.message(
      'general',
      name: 'paOrienteeringDesc',
      desc: '',
      args: [],
    );
  }

  /// `paddleball`
  String get paPaddleball {
    return Intl.message('paddleball', name: 'paPaddleball', desc: '', args: []);
  }

  /// `casual, general`
  String get paPaddleballDesc {
    return Intl.message(
      'casual, general',
      name: 'paPaddleballDesc',
      desc: '',
      args: [],
    );
  }

  /// `polo`
  String get paPoloHorse {
    return Intl.message('polo', name: 'paPoloHorse', desc: '', args: []);
  }

  /// `on horseback`
  String get paPoloHorseDesc {
    return Intl.message(
      'on horseback',
      name: 'paPoloHorseDesc',
      desc: '',
      args: [],
    );
  }

  /// `racquetball`
  String get paRacquetball {
    return Intl.message(
      'racquetball',
      name: 'paRacquetball',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paRacquetballDesc {
    return Intl.message(
      'general',
      name: 'paRacquetballDesc',
      desc: '',
      args: [],
    );
  }

  /// `climbing`
  String get paMountainClimbing {
    return Intl.message(
      'climbing',
      name: 'paMountainClimbing',
      desc: '',
      args: [],
    );
  }

  /// `rock or mountain climbing`
  String get paMountainClimbingDesc {
    return Intl.message(
      'rock or mountain climbing',
      name: 'paMountainClimbingDesc',
      desc: '',
      args: [],
    );
  }

  /// `rodeo sports`
  String get paRodeoSportGeneralModerate {
    return Intl.message(
      'rodeo sports',
      name: 'paRodeoSportGeneralModerate',
      desc: '',
      args: [],
    );
  }

  /// `general, moderate effort`
  String get paRodeoSportGeneralModerateDesc {
    return Intl.message(
      'general, moderate effort',
      name: 'paRodeoSportGeneralModerateDesc',
      desc: '',
      args: [],
    );
  }

  /// `rope jumping`
  String get paRopeJumpingGeneral {
    return Intl.message(
      'rope jumping',
      name: 'paRopeJumpingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `moderate pace, 100-120 skips/min, general, 2 foot skip, plain bounce`
  String get paRopeJumpingGeneralDesc {
    return Intl.message(
      'moderate pace, 100-120 skips/min, general, 2 foot skip, plain bounce',
      name: 'paRopeJumpingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `rugby`
  String get paRugbyCompetitive {
    return Intl.message(
      'rugby',
      name: 'paRugbyCompetitive',
      desc: '',
      args: [],
    );
  }

  /// `union, team, competitive`
  String get paRugbyCompetitiveDesc {
    return Intl.message(
      'union, team, competitive',
      name: 'paRugbyCompetitiveDesc',
      desc: '',
      args: [],
    );
  }

  /// `rugby`
  String get paRugbyNonCompetitive {
    return Intl.message(
      'rugby',
      name: 'paRugbyNonCompetitive',
      desc: '',
      args: [],
    );
  }

  /// `touch, non-competitive`
  String get paRugbyNonCompetitiveDesc {
    return Intl.message(
      'touch, non-competitive',
      name: 'paRugbyNonCompetitiveDesc',
      desc: '',
      args: [],
    );
  }

  /// `shuffleboard`
  String get paShuffleboard {
    return Intl.message(
      'shuffleboard',
      name: 'paShuffleboard',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paShuffleboardDesc {
    return Intl.message(
      'general',
      name: 'paShuffleboardDesc',
      desc: '',
      args: [],
    );
  }

  /// `skateboarding`
  String get paSkateboardingGeneral {
    return Intl.message(
      'skateboarding',
      name: 'paSkateboardingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general, moderate effort`
  String get paSkateboardingGeneralDesc {
    return Intl.message(
      'general, moderate effort',
      name: 'paSkateboardingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `roller skating`
  String get paSkatingRoller {
    return Intl.message(
      'roller skating',
      name: 'paSkatingRoller',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paSkatingRollerDesc {
    return Intl.message(
      'general',
      name: 'paSkatingRollerDesc',
      desc: '',
      args: [],
    );
  }

  /// `rollerblading`
  String get paRollerbladingLight {
    return Intl.message(
      'rollerblading',
      name: 'paRollerbladingLight',
      desc: '',
      args: [],
    );
  }

  /// `in-line skating`
  String get paRollerbladingLightDesc {
    return Intl.message(
      'in-line skating',
      name: 'paRollerbladingLightDesc',
      desc: '',
      args: [],
    );
  }

  /// `skydiving`
  String get paSkydiving {
    return Intl.message('skydiving', name: 'paSkydiving', desc: '', args: []);
  }

  /// `skydiving, base jumping, bungee jumping`
  String get paSkydivingDesc {
    return Intl.message(
      'skydiving, base jumping, bungee jumping',
      name: 'paSkydivingDesc',
      desc: '',
      args: [],
    );
  }

  /// `soccer`
  String get paSoccerGeneral {
    return Intl.message('soccer', name: 'paSoccerGeneral', desc: '', args: []);
  }

  /// `casual, general`
  String get paSoccerGeneralDesc {
    return Intl.message(
      'casual, general',
      name: 'paSoccerGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `softball / baseball`
  String get paSoftballBaseballGeneral {
    return Intl.message(
      'softball / baseball',
      name: 'paSoftballBaseballGeneral',
      desc: '',
      args: [],
    );
  }

  /// `fast or slow pitch, general`
  String get paSoftballBaseballGeneralDesc {
    return Intl.message(
      'fast or slow pitch, general',
      name: 'paSoftballBaseballGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `squash`
  String get paSquashGeneral {
    return Intl.message('squash', name: 'paSquashGeneral', desc: '', args: []);
  }

  /// `general`
  String get paSquashGeneralDesc {
    return Intl.message(
      'general',
      name: 'paSquashGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `table tennis`
  String get paTableTennisGeneral {
    return Intl.message(
      'table tennis',
      name: 'paTableTennisGeneral',
      desc: '',
      args: [],
    );
  }

  /// `table tennis, ping pong`
  String get paTableTennisGeneralDesc {
    return Intl.message(
      'table tennis, ping pong',
      name: 'paTableTennisGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `tai chi, qi gong`
  String get paTaiChiQiGongGeneral {
    return Intl.message(
      'tai chi, qi gong',
      name: 'paTaiChiQiGongGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paTaiChiQiGongGeneralDesc {
    return Intl.message(
      'general',
      name: 'paTaiChiQiGongGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `tennis`
  String get paTennisGeneral {
    return Intl.message('tennis', name: 'paTennisGeneral', desc: '', args: []);
  }

  /// `general`
  String get paTennisGeneralDesc {
    return Intl.message(
      'general',
      name: 'paTennisGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `trampoline`
  String get paTrampolineLight {
    return Intl.message(
      'trampoline',
      name: 'paTrampolineLight',
      desc: '',
      args: [],
    );
  }

  /// `recreational`
  String get paTrampolineLightDesc {
    return Intl.message(
      'recreational',
      name: 'paTrampolineLightDesc',
      desc: '',
      args: [],
    );
  }

  /// `volleyball`
  String get paVolleyballGeneral {
    return Intl.message(
      'volleyball',
      name: 'paVolleyballGeneral',
      desc: '',
      args: [],
    );
  }

  /// `non-competitive, 6 - 9 member team, general`
  String get paVolleyballGeneralDesc {
    return Intl.message(
      'non-competitive, 6 - 9 member team, general',
      name: 'paVolleyballGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `wrestling`
  String get paWrestling {
    return Intl.message('wrestling', name: 'paWrestling', desc: '', args: []);
  }

  /// `general`
  String get paWrestlingDesc {
    return Intl.message('general', name: 'paWrestlingDesc', desc: '', args: []);
  }

  /// `wallyball`
  String get paWallyball {
    return Intl.message('wallyball', name: 'paWallyball', desc: '', args: []);
  }

  /// `general`
  String get paWallyballDesc {
    return Intl.message('general', name: 'paWallyballDesc', desc: '', args: []);
  }

  /// `track and field`
  String get paTrackField {
    return Intl.message(
      'track and field',
      name: 'paTrackField',
      desc: '',
      args: [],
    );
  }

  /// `(e.g. shot, discus, hammer throw)`
  String get paTrackField1Desc {
    return Intl.message(
      '(e.g. shot, discus, hammer throw)',
      name: 'paTrackField1Desc',
      desc: '',
      args: [],
    );
  }

  /// `(e.g. high jump, long jump, triple jump, javelin, pole vault)`
  String get paTrackField2Desc {
    return Intl.message(
      '(e.g. high jump, long jump, triple jump, javelin, pole vault)',
      name: 'paTrackField2Desc',
      desc: '',
      args: [],
    );
  }

  /// `(e.g. steeplechase, hurdles)`
  String get paTrackField3Desc {
    return Intl.message(
      '(e.g. steeplechase, hurdles)',
      name: 'paTrackField3Desc',
      desc: '',
      args: [],
    );
  }

  /// `backpacking`
  String get paBackpackingGeneral {
    return Intl.message(
      'backpacking',
      name: 'paBackpackingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paBackpackingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paBackpackingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `climbing hills, no load`
  String get paClimbingHillsNoLoadGeneral {
    return Intl.message(
      'climbing hills, no load',
      name: 'paClimbingHillsNoLoadGeneral',
      desc: '',
      args: [],
    );
  }

  /// `no load`
  String get paClimbingHillsNoLoadGeneralDesc {
    return Intl.message(
      'no load',
      name: 'paClimbingHillsNoLoadGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `hiking`
  String get paHikingCrossCountry {
    return Intl.message(
      'hiking',
      name: 'paHikingCrossCountry',
      desc: '',
      args: [],
    );
  }

  /// `cross country`
  String get paHikingCrossCountryDesc {
    return Intl.message(
      'cross country',
      name: 'paHikingCrossCountryDesc',
      desc: '',
      args: [],
    );
  }

  /// `walking`
  String get paWalkingForPleasure {
    return Intl.message(
      'walking',
      name: 'paWalkingForPleasure',
      desc: '',
      args: [],
    );
  }

  /// `for pleasure`
  String get paWalkingForPleasureDesc {
    return Intl.message(
      'for pleasure',
      name: 'paWalkingForPleasureDesc',
      desc: '',
      args: [],
    );
  }

  /// `walking the dog`
  String get paWalkingTheDog {
    return Intl.message(
      'walking the dog',
      name: 'paWalkingTheDog',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paWalkingTheDogDesc {
    return Intl.message(
      'general',
      name: 'paWalkingTheDogDesc',
      desc: '',
      args: [],
    );
  }

  /// `canoeing`
  String get paCanoeingGeneral {
    return Intl.message(
      'canoeing',
      name: 'paCanoeingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `rowing, for pleasure, general`
  String get paCanoeingGeneralDesc {
    return Intl.message(
      'rowing, for pleasure, general',
      name: 'paCanoeingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `diving`
  String get paDivingSpringboardPlatform {
    return Intl.message(
      'diving',
      name: 'paDivingSpringboardPlatform',
      desc: '',
      args: [],
    );
  }

  /// `springboard or platform`
  String get paDivingSpringboardPlatformDesc {
    return Intl.message(
      'springboard or platform',
      name: 'paDivingSpringboardPlatformDesc',
      desc: '',
      args: [],
    );
  }

  /// `kayaking`
  String get paKayakingModerate {
    return Intl.message(
      'kayaking',
      name: 'paKayakingModerate',
      desc: '',
      args: [],
    );
  }

  /// `moderate effort`
  String get paKayakingModerateDesc {
    return Intl.message(
      'moderate effort',
      name: 'paKayakingModerateDesc',
      desc: '',
      args: [],
    );
  }

  /// `paddle boat`
  String get paPaddleBoat {
    return Intl.message(
      'paddle boat',
      name: 'paPaddleBoat',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paPaddleBoatDesc {
    return Intl.message(
      'general',
      name: 'paPaddleBoatDesc',
      desc: '',
      args: [],
    );
  }

  /// `sailing`
  String get paSailingGeneral {
    return Intl.message(
      'sailing',
      name: 'paSailingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `boat and board sailing, windsurfing, ice sailing, general`
  String get paSailingGeneralDesc {
    return Intl.message(
      'boat and board sailing, windsurfing, ice sailing, general',
      name: 'paSailingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `water skiing`
  String get paSkiingWaterWakeboarding {
    return Intl.message(
      'water skiing',
      name: 'paSkiingWaterWakeboarding',
      desc: '',
      args: [],
    );
  }

  /// `water or wakeboarding`
  String get paSkiingWaterWakeboardingDesc {
    return Intl.message(
      'water or wakeboarding',
      name: 'paSkiingWaterWakeboardingDesc',
      desc: '',
      args: [],
    );
  }

  /// `diving`
  String get paDivingGeneral {
    return Intl.message('diving', name: 'paDivingGeneral', desc: '', args: []);
  }

  /// `skindiving, scuba diving, general`
  String get paDivingGeneralDesc {
    return Intl.message(
      'skindiving, scuba diving, general',
      name: 'paDivingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `snorkeling`
  String get paSnorkeling {
    return Intl.message('snorkeling', name: 'paSnorkeling', desc: '', args: []);
  }

  /// `general`
  String get paSnorkelingDesc {
    return Intl.message(
      'general',
      name: 'paSnorkelingDesc',
      desc: '',
      args: [],
    );
  }

  /// `surfing`
  String get paSurfing {
    return Intl.message('surfing', name: 'paSurfing', desc: '', args: []);
  }

  /// `body or board, general`
  String get paSurfingDesc {
    return Intl.message(
      'body or board, general',
      name: 'paSurfingDesc',
      desc: '',
      args: [],
    );
  }

  /// `paddle boarding`
  String get paPaddleBoarding {
    return Intl.message(
      'paddle boarding',
      name: 'paPaddleBoarding',
      desc: '',
      args: [],
    );
  }

  /// `standing`
  String get paPaddleBoardingDesc {
    return Intl.message(
      'standing',
      name: 'paPaddleBoardingDesc',
      desc: '',
      args: [],
    );
  }

  /// `swimming`
  String get paSwimmingGeneral {
    return Intl.message(
      'swimming',
      name: 'paSwimmingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `treading water, moderate effort, general`
  String get paSwimmingGeneralDesc {
    return Intl.message(
      'treading water, moderate effort, general',
      name: 'paSwimmingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `water aerobics`
  String get paWateraerobicsCalisthenics {
    return Intl.message(
      'water aerobics',
      name: 'paWateraerobicsCalisthenics',
      desc: '',
      args: [],
    );
  }

  /// `water aerobics, water calisthenics`
  String get paWateraerobicsCalisthenicsDesc {
    return Intl.message(
      'water aerobics, water calisthenics',
      name: 'paWateraerobicsCalisthenicsDesc',
      desc: '',
      args: [],
    );
  }

  /// `water polo`
  String get paWaterPolo {
    return Intl.message('water polo', name: 'paWaterPolo', desc: '', args: []);
  }

  /// `general`
  String get paWaterPoloDesc {
    return Intl.message('general', name: 'paWaterPoloDesc', desc: '', args: []);
  }

  /// `water volleyball`
  String get paWaterVolleyball {
    return Intl.message(
      'water volleyball',
      name: 'paWaterVolleyball',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paWaterVolleyballDesc {
    return Intl.message(
      'general',
      name: 'paWaterVolleyballDesc',
      desc: '',
      args: [],
    );
  }

  /// `ice skating`
  String get paIceSkatingGeneral {
    return Intl.message(
      'ice skating',
      name: 'paIceSkatingGeneral',
      desc: '',
      args: [],
    );
  }

  /// `general`
  String get paIceSkatingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paIceSkatingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `skiing`
  String get paSkiingGeneral {
    return Intl.message('skiing', name: 'paSkiingGeneral', desc: '', args: []);
  }

  /// `general`
  String get paSkiingGeneralDesc {
    return Intl.message(
      'general',
      name: 'paSkiingGeneralDesc',
      desc: '',
      args: [],
    );
  }

  /// `snow shoveling`
  String get paSnowShovingModerate {
    return Intl.message(
      'snow shoveling',
      name: 'paSnowShovingModerate',
      desc: '',
      args: [],
    );
  }

  /// `by hand, moderate effort`
  String get paSnowShovingModerateDesc {
    return Intl.message(
      'by hand, moderate effort',
      name: 'paSnowShovingModerateDesc',
      desc: '',
      args: [],
    );
  }

  /// `My Meals`
  String get myMealsLabel {
    return Intl.message('My Meals', name: 'myMealsLabel', desc: '', args: []);
  }

  /// `No recipes yet. Create one!`
  String get noRecipesLabel {
    return Intl.message(
      'No recipes yet. Create one!',
      name: 'noRecipesLabel',
      desc: '',
      args: [],
    );
  }

  /// `ingredients`
  String get ingredientsLabel {
    return Intl.message(
      'ingredients',
      name: 'ingredientsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Recipe name`
  String get recipeNameLabel {
    return Intl.message(
      'Recipe name',
      name: 'recipeNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Servings`
  String get recipeServingsLabel {
    return Intl.message(
      'Servings',
      name: 'recipeServingsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add ingredient`
  String get addIngredientLabel {
    return Intl.message(
      'Add ingredient',
      name: 'addIngredientLabel',
      desc: '',
      args: [],
    );
  }

  /// `Save recipe`
  String get saveRecipeLabel {
    return Intl.message(
      'Save recipe',
      name: 'saveRecipeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Delete recipe`
  String get deleteRecipeLabel {
    return Intl.message(
      'Delete recipe',
      name: 'deleteRecipeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Recipe Builder`
  String get recipeBuilderLabel {
    return Intl.message(
      'Recipe Builder',
      name: 'recipeBuilderLabel',
      desc: '',
      args: [],
    );
  }

  /// `Weight Tracking`
  String get weightTracking {
    return Intl.message(
      'Weight Tracking',
      name: 'weightTracking',
      desc: '',
      args: [],
    );
  }

  /// `Log Weight`
  String get logWeight {
    return Intl.message('Log Weight', name: 'logWeight', desc: '', args: []);
  }

  /// `Weight (kg)`
  String get weightKg {
    return Intl.message('Weight (kg)', name: 'weightKg', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Note`
  String get note {
    return Intl.message('Note', name: 'note', desc: '', args: []);
  }

  /// `No weight entries yet`
  String get noWeightEntries {
    return Intl.message(
      'No weight entries yet',
      name: 'noWeightEntries',
      desc: '',
      args: [],
    );
  }

  /// `Delete Entry`
  String get deleteWeight {
    return Intl.message(
      'Delete Entry',
      name: 'deleteWeight',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get bmi {
    return Intl.message('BMI', name: 'bmi', desc: '', args: []);
  }

  /// `Underweight`
  String get bmiUnderweight {
    return Intl.message(
      'Underweight',
      name: 'bmiUnderweight',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get bmiNormal {
    return Intl.message('Normal', name: 'bmiNormal', desc: '', args: []);
  }

  /// `Overweight`
  String get bmiOverweight {
    return Intl.message(
      'Overweight',
      name: 'bmiOverweight',
      desc: '',
      args: [],
    );
  }

  /// `Obese`
  String get bmiObese {
    return Intl.message('Obese', name: 'bmiObese', desc: '', args: []);
  }

  /// `Goal Weight`
  String get goalWeight {
    return Intl.message('Goal Weight', name: 'goalWeight', desc: '', args: []);
  }

  /// `Current`
  String get currentWeight {
    return Intl.message('Current', name: 'currentWeight', desc: '', args: []);
  }

  /// `Start`
  String get startWeight {
    return Intl.message('Start', name: 'startWeight', desc: '', args: []);
  }

  /// `Weight Trend`
  String get weightTrend {
    return Intl.message(
      'Weight Trend',
      name: 'weightTrend',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Daily Summary`
  String get dailySummaryLabel {
    return Intl.message(
      'Daily Summary',
      name: 'dailySummaryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Summary`
  String get weeklySummaryLabel {
    return Intl.message(
      'Weekly Summary',
      name: 'weeklySummaryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Daily Goal`
  String get dailyGoalLabel {
    return Intl.message(
      'Daily Goal',
      name: 'dailyGoalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Consumed`
  String get consumedLabel {
    return Intl.message('Consumed', name: 'consumedLabel', desc: '', args: []);
  }

  /// `Remaining`
  String get remainingLabel {
    return Intl.message(
      'Remaining',
      name: 'remainingLabel',
      desc: '',
      args: [],
    );
  }

  /// `Micronutrients`
  String get microNutrientsLabel {
    return Intl.message(
      'Micronutrients',
      name: 'microNutrientsLabel',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAllLabel {
    return Intl.message('See All', name: 'seeAllLabel', desc: '', args: []);
  }

  /// `Notifications`
  String get notificationSettingsLabel {
    return Intl.message(
      'Notifications',
      name: 'notificationSettingsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Meal Reminders`
  String get mealRemindersLabel {
    return Intl.message(
      'Meal Reminders',
      name: 'mealRemindersLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enable Daily Summary`
  String get enableDailySummaryLabel {
    return Intl.message(
      'Enable Daily Summary',
      name: 'enableDailySummaryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Summary Time`
  String get summaryTimeLabel {
    return Intl.message(
      'Summary Time',
      name: 'summaryTimeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Not set`
  String get notSetLabel {
    return Intl.message('Not set', name: 'notSetLabel', desc: '', args: []);
  }

  /// `Water Tracker`
  String get waterTrackerTitle {
    return Intl.message(
      'Water Tracker',
      name: 'waterTrackerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Water`
  String get addWater {
    return Intl.message('Add Water', name: 'addWater', desc: '', args: []);
  }

  /// `ml`
  String get ml {
    return Intl.message('ml', name: 'ml', desc: '', args: []);
  }

  /// `Custom`
  String get custom {
    return Intl.message('Custom', name: 'custom', desc: '', args: []);
  }

  /// `No water entries yet`
  String get noWaterEntries {
    return Intl.message(
      'No water entries yet',
      name: 'noWaterEntries',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get todayEntries {
    return Intl.message('Today', name: 'todayEntries', desc: '', args: []);
  }

  /// `Daily Water Goal`
  String get dailyWaterGoal {
    return Intl.message(
      'Daily Water Goal',
      name: 'dailyWaterGoal',
      desc: '',
      args: [],
    );
  }

  /// `{current} / {goal} ml`
  String waterProgress(Object current, Object goal) {
    return Intl.message(
      '$current / $goal ml',
      name: 'waterProgress',
      desc: '',
      args: [current, goal],
    );
  }

  /// `Progress`
  String get progressChartsLabel {
    return Intl.message(
      'Progress',
      name: 'progressChartsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Calories`
  String get weeklyCalorieChart {
    return Intl.message(
      'Weekly Calories',
      name: 'weeklyCalorieChart',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Calories`
  String get monthlyCalorieChart {
    return Intl.message(
      'Monthly Calories',
      name: 'monthlyCalorieChart',
      desc: '',
      args: [],
    );
  }

  /// `Macro Trend`
  String get macroTrendChart {
    return Intl.message(
      'Macro Trend',
      name: 'macroTrendChart',
      desc: '',
      args: [],
    );
  }

  /// `Avg`
  String get averageLabel {
    return Intl.message('Avg', name: 'averageLabel', desc: '', args: []);
  }

  /// `Week`
  String get weeklyLabel {
    return Intl.message('Week', name: 'weeklyLabel', desc: '', args: []);
  }

  /// `Month`
  String get monthlyLabel {
    return Intl.message('Month', name: 'monthlyLabel', desc: '', args: []);
  }

  /// `Calories`
  String get caloriesTab {
    return Intl.message('Calories', name: 'caloriesTab', desc: '', args: []);
  }

  /// `Macros`
  String get macrosTab {
    return Intl.message('Macros', name: 'macrosTab', desc: '', args: []);
  }

  /// `Weight`
  String get weightTab {
    return Intl.message('Weight', name: 'weightTab', desc: '', args: []);
  }

  /// `Not enough weight data to show trend`
  String get insufficientWeightData {
    return Intl.message(
      'Not enough weight data to show trend',
      name: 'insufficientWeightData',
      desc: '',
      args: [],
    );
  }

  /// `Moving Average`
  String get movingAverage {
    return Intl.message(
      'Moving Average',
      name: 'movingAverage',
      desc: '',
      args: [],
    );
  }

  /// `Burned`
  String get burnedCaloriesLabel {
    return Intl.message(
      'Burned',
      name: 'burnedCaloriesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Net Calories`
  String get netCaloriesLabel {
    return Intl.message(
      'Net Calories',
      name: 'netCaloriesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Exercise Impact`
  String get exerciseCalorieImpact {
    return Intl.message(
      'Exercise Impact',
      name: 'exerciseCalorieImpact',
      desc: '',
      args: [],
    );
  }

  /// `Intermittent Fasting`
  String get fastingTrackerLabel {
    return Intl.message(
      'Intermittent Fasting',
      name: 'fastingTrackerLabel',
      desc: '',
      args: [],
    );
  }

  /// `Start Fast`
  String get startFastLabel {
    return Intl.message(
      'Start Fast',
      name: 'startFastLabel',
      desc: '',
      args: [],
    );
  }

  /// `End Fast`
  String get endFastLabel {
    return Intl.message('End Fast', name: 'endFastLabel', desc: '', args: []);
  }

  /// `Active Fast`
  String get activeFastLabel {
    return Intl.message(
      'Active Fast',
      name: 'activeFastLabel',
      desc: '',
      args: [],
    );
  }

  /// `No active fast`
  String get inactiveFastLabel {
    return Intl.message(
      'No active fast',
      name: 'inactiveFastLabel',
      desc: '',
      args: [],
    );
  }

  /// `16:8`
  String get presetSixteenEight {
    return Intl.message('16:8', name: 'presetSixteenEight', desc: '', args: []);
  }

  /// `18:6`
  String get presetEighteenSix {
    return Intl.message('18:6', name: 'presetEighteenSix', desc: '', args: []);
  }

  /// `20:4`
  String get presetTwentyFour {
    return Intl.message('20:4', name: 'presetTwentyFour', desc: '', args: []);
  }

  /// `OMAD`
  String get presetOMAD {
    return Intl.message('OMAD', name: 'presetOMAD', desc: '', args: []);
  }

  /// `Custom`
  String get presetCustom {
    return Intl.message('Custom', name: 'presetCustom', desc: '', args: []);
  }

  /// `Elapsed`
  String get elapsedTimeLabel {
    return Intl.message(
      'Elapsed',
      name: 'elapsedTimeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get remainingTimeLabel {
    return Intl.message(
      'Remaining',
      name: 'remainingTimeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Streak`
  String get streakLabel {
    return Intl.message('Streak', name: 'streakLabel', desc: '', args: []);
  }

  /// `Fasting History`
  String get fastingHistoryLabel {
    return Intl.message(
      'Fasting History',
      name: 'fastingHistoryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hoursLabel {
    return Intl.message('Hours', name: 'hoursLabel', desc: '', args: []);
  }

  /// `Minutes`
  String get minutesLabel {
    return Intl.message('Minutes', name: 'minutesLabel', desc: '', args: []);
  }

  /// `Share Chart`
  String get exportChartLabel {
    return Intl.message(
      'Share Chart',
      name: 'exportChartLabel',
      desc: '',
      args: [],
    );
  }

  /// `Chart shared`
  String get chartExportedLabel {
    return Intl.message(
      'Chart shared',
      name: 'chartExportedLabel',
      desc: '',
      args: [],
    );
  }

  /// `Failed to share chart`
  String get chartExportErrorLabel {
    return Intl.message(
      'Failed to share chart',
      name: 'chartExportErrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Budget`
  String get remainingBudgetLabel {
    return Intl.message(
      'Remaining Budget',
      name: 'remainingBudgetLabel',
      desc: '',
      args: [],
    );
  }

  /// `Exercises Today`
  String get exerciseListLabel {
    return Intl.message(
      'Exercises Today',
      name: 'exerciseListLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add Exercise`
  String get addExerciseLabel {
    return Intl.message(
      'Add Exercise',
      name: 'addExerciseLabel',
      desc: '',
      args: [],
    );
  }

  /// `Fasting Started`
  String get fastingStartedNotificationTitle {
    return Intl.message(
      'Fasting Started',
      name: 'fastingStartedNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your fasting period has begun. Stay strong!`
  String get fastingStartedNotificationBody {
    return Intl.message(
      'Your fasting period has begun. Stay strong!',
      name: 'fastingStartedNotificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Fasting Complete`
  String get fastingEndedNotificationTitle {
    return Intl.message(
      'Fasting Complete',
      name: 'fastingEndedNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have reached your fasting goal.`
  String get fastingEndedNotificationBody {
    return Intl.message(
      'Congratulations! You have reached your fasting goal.',
      name: 'fastingEndedNotificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Health Sync`
  String get healthSyncTitle {
    return Intl.message(
      'Health Sync',
      name: 'healthSyncTitle',
      desc: '',
      args: [],
    );
  }

  /// `Permission required to access health data`
  String get healthSyncPermissionRequired {
    return Intl.message(
      'Permission required to access health data',
      name: 'healthSyncPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Grant Permission`
  String get healthSyncGrantPermission {
    return Intl.message(
      'Grant Permission',
      name: 'healthSyncGrantPermission',
      desc: '',
      args: [],
    );
  }

  /// `Data Types`
  String get healthSyncDataTypes {
    return Intl.message(
      'Data Types',
      name: 'healthSyncDataTypes',
      desc: '',
      args: [],
    );
  }

  /// `Steps`
  String get healthSyncSteps {
    return Intl.message('Steps', name: 'healthSyncSteps', desc: '', args: []);
  }

  /// `Workouts`
  String get healthSyncWorkouts {
    return Intl.message(
      'Workouts',
      name: 'healthSyncWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get healthSyncWeight {
    return Intl.message('Weight', name: 'healthSyncWeight', desc: '', args: []);
  }

  /// `Last synced: {timestamp}`
  String healthSyncLastSync(Object timestamp) {
    return Intl.message(
      'Last synced: $timestamp',
      name: 'healthSyncLastSync',
      desc: '',
      args: [timestamp],
    );
  }

  /// `Never synced`
  String get healthSyncNeverSynced {
    return Intl.message(
      'Never synced',
      name: 'healthSyncNeverSynced',
      desc: '',
      args: [],
    );
  }

  /// `Sync Now`
  String get healthSyncNow {
    return Intl.message('Sync Now', name: 'healthSyncNow', desc: '', args: []);
  }

  /// `{steps} steps synced`
  String healthSyncStepsResult(Object steps) {
    return Intl.message(
      '$steps steps synced',
      name: 'healthSyncStepsResult',
      desc: '',
      args: [steps],
    );
  }

  /// `AI Food Scanner`
  String get aiScannerLabel {
    return Intl.message(
      'AI Food Scanner',
      name: 'aiScannerLabel',
      desc: '',
      args: [],
    );
  }

  /// `Identify food with AI`
  String get aiScannerExample {
    return Intl.message(
      'Identify food with AI',
      name: 'aiScannerExample',
      desc: '',
      args: [],
    );
  }

  /// `AI Food Scanner`
  String get aiScannerTitle {
    return Intl.message(
      'AI Food Scanner',
      name: 'aiScannerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo or pick from gallery to identify food`
  String get aiScannerSubtitle {
    return Intl.message(
      'Take a photo or pick from gallery to identify food',
      name: 'aiScannerSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get aiScannerCaptureButton {
    return Intl.message(
      'Take Photo',
      name: 'aiScannerCaptureButton',
      desc: '',
      args: [],
    );
  }

  /// `Pick from Gallery`
  String get aiScannerGalleryButton {
    return Intl.message(
      'Pick from Gallery',
      name: 'aiScannerGalleryButton',
      desc: '',
      args: [],
    );
  }

  /// `Search manually`
  String get aiScannerSearchManually {
    return Intl.message(
      'Search manually',
      name: 'aiScannerSearchManually',
      desc: '',
      args: [],
    );
  }

  /// `Classification Results`
  String get aiScannerResultsTitle {
    return Intl.message(
      'Classification Results',
      name: 'aiScannerResultsTitle',
      desc: '',
      args: [],
    );
  }

  /// `{pct}% confidence`
  String aiScannerConfidence(Object pct) {
    return Intl.message(
      '$pct% confidence',
      name: 'aiScannerConfidence',
      desc: '',
      args: [pct],
    );
  }

  /// `We couldn't identify this food. Try again or search manually.`
  String get aiScannerClassificationFailed {
    return Intl.message(
      'We couldn\'t identify this food. Try again or search manually.',
      name: 'aiScannerClassificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Meal Planning`
  String get mealPlanLabel {
    return Intl.message(
      'Meal Planning',
      name: 'mealPlanLabel',
      desc: '',
      args: [],
    );
  }

  /// `Plan meals for the week`
  String get mealPlanSubtitle {
    return Intl.message(
      'Plan meals for the week',
      name: 'mealPlanSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Shopping List`
  String get shoppingListLabel {
    return Intl.message(
      'Shopping List',
      name: 'shoppingListLabel',
      desc: '',
      args: [],
    );
  }

  /// `No items in shopping list`
  String get emptyShoppingListLabel {
    return Intl.message(
      'No items in shopping list',
      name: 'emptyShoppingListLabel',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get emptySlotLabel {
    return Intl.message('Empty', name: 'emptySlotLabel', desc: '', args: []);
  }

  /// `Meal added to plan`
  String get mealAddedToPlanLabel {
    return Intl.message(
      'Meal added to plan',
      name: 'mealAddedToPlanLabel',
      desc: '',
      args: [],
    );
  }

  /// `Projected Nutrition`
  String get nutritionPreviewLabel {
    return Intl.message(
      'Projected Nutrition',
      name: 'nutritionPreviewLabel',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get mondayLabel {
    return Intl.message('Monday', name: 'mondayLabel', desc: '', args: []);
  }

  /// `Tuesday`
  String get tuesdayLabel {
    return Intl.message('Tuesday', name: 'tuesdayLabel', desc: '', args: []);
  }

  /// `Wednesday`
  String get wednesdayLabel {
    return Intl.message(
      'Wednesday',
      name: 'wednesdayLabel',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursdayLabel {
    return Intl.message('Thursday', name: 'thursdayLabel', desc: '', args: []);
  }

  /// `Friday`
  String get fridayLabel {
    return Intl.message('Friday', name: 'fridayLabel', desc: '', args: []);
  }

  /// `Saturday`
  String get saturdayLabel {
    return Intl.message('Saturday', name: 'saturdayLabel', desc: '', args: []);
  }

  /// `Sunday`
  String get sundayLabel {
    return Intl.message('Sunday', name: 'sundayLabel', desc: '', args: []);
  }

  /// `New entry`
  String get keyboardShortcutNewEntry {
    return Intl.message(
      'New entry',
      name: 'keyboardShortcutNewEntry',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get keyboardShortcutSave {
    return Intl.message(
      'Save',
      name: 'keyboardShortcutSave',
      desc: '',
      args: [],
    );
  }

  /// `Go back`
  String get keyboardShortcutBack {
    return Intl.message(
      'Go back',
      name: 'keyboardShortcutBack',
      desc: '',
      args: [],
    );
  }

  /// `Photo Progress`
  String get photoProgressTitle {
    return Intl.message(
      'Photo Progress',
      name: 'photoProgressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Photo Progress`
  String get photoProgressLabel {
    return Intl.message(
      'Photo Progress',
      name: 'photoProgressLabel',
      desc: '',
      args: [],
    );
  }

  /// `Track progress with photos`
  String get photoProgressSubtitle {
    return Intl.message(
      'Track progress with photos',
      name: 'photoProgressSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get photoCaptureButton {
    return Intl.message(
      'Take Photo',
      name: 'photoCaptureButton',
      desc: '',
      args: [],
    );
  }

  /// `Pick from Gallery`
  String get photoGalleryButton {
    return Intl.message(
      'Pick from Gallery',
      name: 'photoGalleryButton',
      desc: '',
      args: [],
    );
  }

  /// `Tags`
  String get photoTagsLabel {
    return Intl.message('Tags', name: 'photoTagsLabel', desc: '', args: []);
  }

  /// `e.g. front, side`
  String get photoTagsHint {
    return Intl.message(
      'e.g. front, side',
      name: 'photoTagsHint',
      desc: '',
      args: [],
    );
  }

  /// `Before & After`
  String get photoComparisonTitle {
    return Intl.message(
      'Before & After',
      name: 'photoComparisonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Before`
  String get beforeLabel {
    return Intl.message('Before', name: 'beforeLabel', desc: '', args: []);
  }

  /// `After`
  String get afterLabel {
    return Intl.message('After', name: 'afterLabel', desc: '', args: []);
  }

  /// `No progress photos yet. Tap + to add one.`
  String get noPhotosLabel {
    return Intl.message(
      'No progress photos yet. Tap + to add one.',
      name: 'noPhotosLabel',
      desc: '',
      args: [],
    );
  }

  /// `View Photo`
  String get viewPhotoLabel {
    return Intl.message(
      'View Photo',
      name: 'viewPhotoLabel',
      desc: '',
      args: [],
    );
  }

  /// `Delete Photo`
  String get deletePhotoLabel {
    return Intl.message(
      'Delete Photo',
      name: 'deletePhotoLabel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this photo?`
  String get deletePhotoDialogContent {
    return Intl.message(
      'Are you sure you want to delete this photo?',
      name: 'deletePhotoDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Export Data`
  String get dataSyncExportTitle {
    return Intl.message(
      'Export Data',
      name: 'dataSyncExportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Import Data`
  String get dataSyncImportTitle {
    return Intl.message(
      'Import Data',
      name: 'dataSyncImportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select data types to export`
  String get dataSyncSelectDataTypes {
    return Intl.message(
      'Select data types to export',
      name: 'dataSyncSelectDataTypes',
      desc: '',
      args: [],
    );
  }

  /// `Export format`
  String get dataSyncSelectFormat {
    return Intl.message(
      'Export format',
      name: 'dataSyncSelectFormat',
      desc: '',
      args: [],
    );
  }

  /// `JSON`
  String get dataSyncFormatJson {
    return Intl.message('JSON', name: 'dataSyncFormatJson', desc: '', args: []);
  }

  /// `ZIP`
  String get dataSyncFormatZip {
    return Intl.message('ZIP', name: 'dataSyncFormatZip', desc: '', args: []);
  }

  /// `Data exported successfully`
  String get dataSyncExportSuccess {
    return Intl.message(
      'Data exported successfully',
      name: 'dataSyncExportSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Data imported successfully`
  String get dataSyncImportSuccess {
    return Intl.message(
      'Data imported successfully',
      name: 'dataSyncImportSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Encrypted Backup`
  String get dataSyncEncryptBackup {
    return Intl.message(
      'Encrypted Backup',
      name: 'dataSyncEncryptBackup',
      desc: '',
      args: [],
    );
  }

  /// `Create an AES-256 encrypted backup of your data. The backup is stored locally on your device.`
  String get dataSyncEncryptBackupDescription {
    return Intl.message(
      'Create an AES-256 encrypted backup of your data. The backup is stored locally on your device.',
      name: 'dataSyncEncryptBackupDescription',
      desc: '',
      args: [],
    );
  }

  /// `Create Encrypted Backup`
  String get dataSyncCreateEncryptedBackup {
    return Intl.message(
      'Create Encrypted Backup',
      name: 'dataSyncCreateEncryptedBackup',
      desc: '',
      args: [],
    );
  }

  /// `Restore from Encrypted Backup`
  String get dataSyncRestoreEncrypted {
    return Intl.message(
      'Restore from Encrypted Backup',
      name: 'dataSyncRestoreEncrypted',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get dataSyncPassword {
    return Intl.message(
      'Password',
      name: 'dataSyncPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get dataSyncConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'dataSyncConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get dataSyncPasswordMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'dataSyncPasswordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get dataSyncTypeConfig {
    return Intl.message(
      'Settings',
      name: 'dataSyncTypeConfig',
      desc: '',
      args: [],
    );
  }

  /// `User Profile`
  String get dataSyncTypeUsers {
    return Intl.message(
      'User Profile',
      name: 'dataSyncTypeUsers',
      desc: '',
      args: [],
    );
  }

  /// `Food Intakes`
  String get dataSyncTypeIntakes {
    return Intl.message(
      'Food Intakes',
      name: 'dataSyncTypeIntakes',
      desc: '',
      args: [],
    );
  }

  /// `Meals`
  String get dataSyncTypeMeals {
    return Intl.message('Meals', name: 'dataSyncTypeMeals', desc: '', args: []);
  }

  /// `Activities`
  String get dataSyncTypeActivities {
    return Intl.message(
      'Activities',
      name: 'dataSyncTypeActivities',
      desc: '',
      args: [],
    );
  }

  /// `Tracked Days`
  String get dataSyncTypeTrackedDays {
    return Intl.message(
      'Tracked Days',
      name: 'dataSyncTypeTrackedDays',
      desc: '',
      args: [],
    );
  }

  /// `Recipes`
  String get dataSyncTypeRecipes {
    return Intl.message(
      'Recipes',
      name: 'dataSyncTypeRecipes',
      desc: '',
      args: [],
    );
  }

  /// `Weights`
  String get dataSyncTypeWeights {
    return Intl.message(
      'Weights',
      name: 'dataSyncTypeWeights',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get dataSyncTypeNotificationSettings {
    return Intl.message(
      'Notification Settings',
      name: 'dataSyncTypeNotificationSettings',
      desc: '',
      args: [],
    );
  }

  /// `Water Entries`
  String get dataSyncTypeWaterEntries {
    return Intl.message(
      'Water Entries',
      name: 'dataSyncTypeWaterEntries',
      desc: '',
      args: [],
    );
  }

  /// `Fasting Sessions`
  String get dataSyncTypeFasts {
    return Intl.message(
      'Fasting Sessions',
      name: 'dataSyncTypeFasts',
      desc: '',
      args: [],
    );
  }

  /// `Meal Plans`
  String get dataSyncTypeMealPlans {
    return Intl.message(
      'Meal Plans',
      name: 'dataSyncTypeMealPlans',
      desc: '',
      args: [],
    );
  }

  /// `Import data from a previously exported JSON or ZIP file. This will merge with existing data.`
  String get dataSyncImportDescription {
    return Intl.message(
      'Import data from a previously exported JSON or ZIP file. This will merge with existing data.',
      name: 'dataSyncImportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Import from JSON`
  String get dataSyncImportJson {
    return Intl.message(
      'Import from JSON',
      name: 'dataSyncImportJson',
      desc: '',
      args: [],
    );
  }

  /// `Import from ZIP`
  String get dataSyncImportZip {
    return Intl.message(
      'Import from ZIP',
      name: 'dataSyncImportZip',
      desc: '',
      args: [],
    );
  }

  /// `Encrypted Restore`
  String get dataSyncEncryptedRestore {
    return Intl.message(
      'Encrypted Restore',
      name: 'dataSyncEncryptedRestore',
      desc: '',
      args: [],
    );
  }

  /// `Import Preview`
  String get dataSyncPreviewTitle {
    return Intl.message(
      'Import Preview',
      name: 'dataSyncPreviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `records`
  String get dataSyncRecords {
    return Intl.message('records', name: 'dataSyncRecords', desc: '', args: []);
  }

  /// `Backup file path`
  String get dataSyncBackupFilePath {
    return Intl.message(
      'Backup file path',
      name: 'dataSyncBackupFilePath',
      desc: '',
      args: [],
    );
  }

  /// `Cloud Backup`
  String get dataSyncCloudBackupTitle {
    return Intl.message(
      'Cloud Backup',
      name: 'dataSyncCloudBackupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Backup created successfully`
  String get dataSyncBackupCreated {
    return Intl.message(
      'Backup created successfully',
      name: 'dataSyncBackupCreated',
      desc: '',
      args: [],
    );
  }

  /// `Last Backup`
  String get dataSyncLastBackup {
    return Intl.message(
      'Last Backup',
      name: 'dataSyncLastBackup',
      desc: '',
      args: [],
    );
  }

  /// `No backup found`
  String get dataSyncNoBackup {
    return Intl.message(
      'No backup found',
      name: 'dataSyncNoBackup',
      desc: '',
      args: [],
    );
  }

  /// `Cloud Provider`
  String get dataSyncCloudProvider {
    return Intl.message(
      'Cloud Provider',
      name: 'dataSyncCloudProvider',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get dataSyncComingSoon {
    return Intl.message(
      'Coming soon',
      name: 'dataSyncComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Local Encryption`
  String get dataSyncLocalEncryption {
    return Intl.message(
      'Local Encryption',
      name: 'dataSyncLocalEncryption',
      desc: '',
      args: [],
    );
  }

  /// `Encrypt and store your backup locally. You can transfer the encrypted file to cloud storage manually.`
  String get dataSyncLocalEncryptionDescription {
    return Intl.message(
      'Encrypt and store your backup locally. You can transfer the encrypted file to cloud storage manually.',
      name: 'dataSyncLocalEncryptionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Restore from Backup`
  String get dataSyncRestoreFromBackup {
    return Intl.message(
      'Restore from Backup',
      name: 'dataSyncRestoreFromBackup',
      desc: '',
      args: [],
    );
  }

  /// `Meal Time`
  String get mealTimeLabel {
    return Intl.message('Meal Time', name: 'mealTimeLabel', desc: '', args: []);
  }

  /// `Now`
  String get mealTimeNowLabel {
    return Intl.message('Now', name: 'mealTimeNowLabel', desc: '', args: []);
  }

  /// `Meal Timing`
  String get mealTimingLabel {
    return Intl.message(
      'Meal Timing',
      name: 'mealTimingLabel',
      desc: '',
      args: [],
    );
  }

  /// `Average Meal Times`
  String get mealTimingAvgTimesLabel {
    return Intl.message(
      'Average Meal Times',
      name: 'mealTimingAvgTimesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Meal Time Distribution`
  String get mealTimingDistributionLabel {
    return Intl.message(
      'Meal Time Distribution',
      name: 'mealTimingDistributionLabel',
      desc: '',
      args: [],
    );
  }

  /// `No meal time data yet. Set a time when logging meals to see patterns.`
  String get mealTimingNoDataLabel {
    return Intl.message(
      'No meal time data yet. Set a time when logging meals to see patterns.',
      name: 'mealTimingNoDataLabel',
      desc: '',
      args: [],
    );
  }

  /// `Recent Entries`
  String get mealTimingEntriesLabel {
    return Intl.message(
      'Recent Entries',
      name: 'mealTimingEntriesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Body Measurements`
  String get bodyMeasurementTitle {
    return Intl.message(
      'Body Measurements',
      name: 'bodyMeasurementTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Measurement`
  String get addMeasurement {
    return Intl.message(
      'Add Measurement',
      name: 'addMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `No measurements yet`
  String get noMeasurements {
    return Intl.message(
      'No measurements yet',
      name: 'noMeasurements',
      desc: '',
      args: [],
    );
  }

  /// `Measurement History`
  String get measurementHistory {
    return Intl.message(
      'Measurement History',
      name: 'measurementHistory',
      desc: '',
      args: [],
    );
  }

  /// `Waist (cm)`
  String get waistCm {
    return Intl.message('Waist (cm)', name: 'waistCm', desc: '', args: []);
  }

  /// `Neck (cm)`
  String get neckCm {
    return Intl.message('Neck (cm)', name: 'neckCm', desc: '', args: []);
  }

  /// `Hip (cm)`
  String get hipCm {
    return Intl.message('Hip (cm)', name: 'hipCm', desc: '', args: []);
  }

  /// `Chest (cm)`
  String get chestCm {
    return Intl.message('Chest (cm)', name: 'chestCm', desc: '', args: []);
  }

  /// `Bicep (cm)`
  String get bicepCm {
    return Intl.message('Bicep (cm)', name: 'bicepCm', desc: '', args: []);
  }

  /// `Thigh (cm)`
  String get thighCm {
    return Intl.message('Thigh (cm)', name: 'thighCm', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Food Grade`
  String get foodGradeLabel {
    return Intl.message(
      'Food Grade',
      name: 'foodGradeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Food Grade rates foods from A (best) to D (worst) based on nutritional density. Higher protein and fiber improve the grade, while high sugar, sodium, saturated fat, and calorie density lower it.`
  String get foodGradeDescription {
    return Intl.message(
      'Food Grade rates foods from A (best) to D (worst) based on nutritional density. Higher protein and fiber improve the grade, while high sugar, sodium, saturated fat, and calorie density lower it.',
      name: 'foodGradeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Grade A - Excellent`
  String get gradeA {
    return Intl.message(
      'Grade A - Excellent',
      name: 'gradeA',
      desc: '',
      args: [],
    );
  }

  /// `Grade B - Good`
  String get gradeB {
    return Intl.message('Grade B - Good', name: 'gradeB', desc: '', args: []);
  }

  /// `Grade C - Moderate`
  String get gradeC {
    return Intl.message(
      'Grade C - Moderate',
      name: 'gradeC',
      desc: '',
      args: [],
    );
  }

  /// `Grade D - Poor`
  String get gradeD {
    return Intl.message('Grade D - Poor', name: 'gradeD', desc: '', args: []);
  }

  /// `Very high nutritional value. Rich in protein and fiber, low in sugar, sodium, and saturated fat. These foods support a healthy diet.`
  String get gradeAExplain {
    return Intl.message(
      'Very high nutritional value. Rich in protein and fiber, low in sugar, sodium, and saturated fat. These foods support a healthy diet.',
      name: 'gradeAExplain',
      desc: '',
      args: [],
    );
  }

  /// `Good nutritional value. Generally beneficial with moderate amounts of positive nutrients and limited negative factors.`
  String get gradeBExplain {
    return Intl.message(
      'Good nutritional value. Generally beneficial with moderate amounts of positive nutrients and limited negative factors.',
      name: 'gradeBExplain',
      desc: '',
      args: [],
    );
  }

  /// `Moderate nutritional value. May contain higher amounts of sugar, sodium, or saturated fat. Consume in moderation.`
  String get gradeCExplain {
    return Intl.message(
      'Moderate nutritional value. May contain higher amounts of sugar, sodium, or saturated fat. Consume in moderation.',
      name: 'gradeCExplain',
      desc: '',
      args: [],
    );
  }

  /// `Low nutritional value. High in sugar, sodium, saturated fat, or calories with limited beneficial nutrients. Limit consumption.`
  String get gradeDExplain {
    return Intl.message(
      'Low nutritional value. High in sugar, sodium, saturated fat, or calories with limited beneficial nutrients. Limit consumption.',
      name: 'gradeDExplain',
      desc: '',
      args: [],
    );
  }

  /// `Filter by Grade`
  String get filterByGrade {
    return Intl.message(
      'Filter by Grade',
      name: 'filterByGrade',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Grade`
  String get minimumGrade {
    return Intl.message(
      'Minimum Grade',
      name: 'minimumGrade',
      desc: '',
      args: [],
    );
  }

  /// `Daily Note`
  String get dailyNoteLabel {
    return Intl.message(
      'Daily Note',
      name: 'dailyNoteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Write a note for today...`
  String get dailyNoteHint {
    return Intl.message(
      'Write a note for today...',
      name: 'dailyNoteHint',
      desc: '',
      args: [],
    );
  }

  /// `No note yet`
  String get dailyNoteEmpty {
    return Intl.message(
      'No note yet',
      name: 'dailyNoteEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Note saved`
  String get dailyNoteSaved {
    return Intl.message(
      'Note saved',
      name: 'dailyNoteSaved',
      desc: '',
      args: [],
    );
  }

  /// `Has note`
  String get hasNoteIndicator {
    return Intl.message(
      'Has note',
      name: 'hasNoteIndicator',
      desc: '',
      args: [],
    );
  }

  /// `Autopilot`
  String get autopilotLabel {
    return Intl.message(
      'Autopilot',
      name: 'autopilotLabel',
      desc: '',
      args: [],
    );
  }

  /// `Automatically adjusts your daily calorie budget based on your weight trend. Losing too fast increases your budget; losing too slowly decreases it.`
  String get autopilotDescription {
    return Intl.message(
      'Automatically adjusts your daily calorie budget based on your weight trend. Losing too fast increases your budget; losing too slowly decreases it.',
      name: 'autopilotDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enabled`
  String get autopilotEnabled {
    return Intl.message(
      'Enabled',
      name: 'autopilotEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get autopilotDisabled {
    return Intl.message(
      'Disabled',
      name: 'autopilotDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Baseline Calories`
  String get baselineCalories {
    return Intl.message(
      'Baseline Calories',
      name: 'baselineCalories',
      desc: '',
      args: [],
    );
  }

  /// `Adjusted Calories`
  String get adjustedCalories {
    return Intl.message(
      'Adjusted Calories',
      name: 'adjustedCalories',
      desc: '',
      args: [],
    );
  }

  /// `Last Adjustment`
  String get lastAdjustment {
    return Intl.message(
      'Last Adjustment',
      name: 'lastAdjustment',
      desc: '',
      args: [],
    );
  }

  /// `Recalculate Budget`
  String get recalculateBudget {
    return Intl.message(
      'Recalculate Budget',
      name: 'recalculateBudget',
      desc: '',
      args: [],
    );
  }

  /// `Calorie Cycling`
  String get calorieCyclingLabel {
    return Intl.message(
      'Calorie Cycling',
      name: 'calorieCyclingLabel',
      desc: '',
      args: [],
    );
  }

  /// `Set different calorie targets for each day of the week. This helps you eat more on active days and less on rest days while maintaining your weekly budget.`
  String get calorieCyclingDescription {
    return Intl.message(
      'Set different calorie targets for each day of the week. This helps you eat more on active days and less on rest days while maintaining your weekly budget.',
      name: 'calorieCyclingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enable Calorie Cycling`
  String get enableCalorieCycling {
    return Intl.message(
      'Enable Calorie Cycling',
      name: 'enableCalorieCycling',
      desc: '',
      args: [],
    );
  }

  /// `Weekday Targets`
  String get weekdayTargets {
    return Intl.message(
      'Weekday Targets',
      name: 'weekdayTargets',
      desc: '',
      args: [],
    );
  }

  /// `Daily Target`
  String get dailyTarget {
    return Intl.message(
      'Daily Target',
      name: 'dailyTarget',
      desc: '',
      args: [],
    );
  }

  /// `Global Calorie Budget`
  String get globalCalorieBudget {
    return Intl.message(
      'Global Calorie Budget',
      name: 'globalCalorieBudget',
      desc: '',
      args: [],
    );
  }

  /// `Exercise Credit`
  String get exerciseCreditLabel {
    return Intl.message(
      'Exercise Credit',
      name: 'exerciseCreditLabel',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get exerciseCreditNone {
    return Intl.message('None', name: 'exerciseCreditNone', desc: '', args: []);
  }

  /// `50%`
  String get exerciseCredit50 {
    return Intl.message('50%', name: 'exerciseCredit50', desc: '', args: []);
  }

  /// `100%`
  String get exerciseCredit100 {
    return Intl.message('100%', name: 'exerciseCredit100', desc: '', args: []);
  }

  /// `Custom`
  String get exerciseCreditCustom {
    return Intl.message(
      'Custom',
      name: 'exerciseCreditCustom',
      desc: '',
      args: [],
    );
  }

  /// `Credit Percent`
  String get exerciseCreditPercent {
    return Intl.message(
      'Credit Percent',
      name: 'exerciseCreditPercent',
      desc: '',
      args: [],
    );
  }

  /// `Custom Trackers`
  String get customTrackersLabel {
    return Intl.message(
      'Custom Trackers',
      name: 'customTrackersLabel',
      desc: '',
      args: [],
    );
  }

  /// `Create Tracker`
  String get createTracker {
    return Intl.message(
      'Create Tracker',
      name: 'createTracker',
      desc: '',
      args: [],
    );
  }

  /// `Tracker Name`
  String get trackerName {
    return Intl.message(
      'Tracker Name',
      name: 'trackerName',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get trackerType {
    return Intl.message('Type', name: 'trackerType', desc: '', args: []);
  }

  /// `Scale`
  String get scaleType {
    return Intl.message('Scale', name: 'scaleType', desc: '', args: []);
  }

  /// `Boolean`
  String get booleanType {
    return Intl.message('Boolean', name: 'booleanType', desc: '', args: []);
  }

  /// `Text`
  String get textType {
    return Intl.message('Text', name: 'textType', desc: '', args: []);
  }

  /// `Min`
  String get minValue {
    return Intl.message('Min', name: 'minValue', desc: '', args: []);
  }

  /// `Max`
  String get maxValue {
    return Intl.message('Max', name: 'maxValue', desc: '', args: []);
  }

  /// `Log Entry`
  String get logEntry {
    return Intl.message('Log Entry', name: 'logEntry', desc: '', args: []);
  }

  /// `Delete Tracker`
  String get deleteTracker {
    return Intl.message(
      'Delete Tracker',
      name: 'deleteTracker',
      desc: '',
      args: [],
    );
  }

  /// `Trend`
  String get trackerTrend {
    return Intl.message('Trend', name: 'trackerTrend', desc: '', args: []);
  }

  /// `Import Recipe`
  String get recipeImportTitle {
    return Intl.message(
      'Import Recipe',
      name: 'recipeImportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Import from URL`
  String get importFromUrl {
    return Intl.message(
      'Import from URL',
      name: 'importFromUrl',
      desc: '',
      args: [],
    );
  }

  /// `Recipe URL`
  String get recipeUrl {
    return Intl.message('Recipe URL', name: 'recipeUrl', desc: '', args: []);
  }

  /// `Importing recipe...`
  String get importingRecipe {
    return Intl.message(
      'Importing recipe...',
      name: 'importingRecipe',
      desc: '',
      args: [],
    );
  }

  /// `Recipe Preview`
  String get recipePreview {
    return Intl.message(
      'Recipe Preview',
      name: 'recipePreview',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructionsLabel {
    return Intl.message(
      'Instructions',
      name: 'instructionsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get timeLabel {
    return Intl.message('Time', name: 'timeLabel', desc: '', args: []);
  }

  /// `Prep time`
  String get prepTimeLabel {
    return Intl.message('Prep time', name: 'prepTimeLabel', desc: '', args: []);
  }

  /// `Cook time`
  String get cookTimeLabel {
    return Intl.message('Cook time', name: 'cookTimeLabel', desc: '', args: []);
  }

  /// `Nutrition`
  String get nutritionLabel {
    return Intl.message(
      'Nutrition',
      name: 'nutritionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get caloriesLabel {
    return Intl.message('Calories', name: 'caloriesLabel', desc: '', args: []);
  }

  /// `Source`
  String get sourceUrlLabel {
    return Intl.message('Source', name: 'sourceUrlLabel', desc: '', args: []);
  }

  /// `Confirm Import`
  String get confirmImport {
    return Intl.message(
      'Confirm Import',
      name: 'confirmImport',
      desc: '',
      args: [],
    );
  }

  /// `Symptom Tracking`
  String get symptomTitle {
    return Intl.message(
      'Symptom Tracking',
      name: 'symptomTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Symptom`
  String get addSymptom {
    return Intl.message('Add Symptom', name: 'addSymptom', desc: '', args: []);
  }

  /// `Delete Symptom`
  String get deleteSymptom {
    return Intl.message(
      'Delete Symptom',
      name: 'deleteSymptom',
      desc: '',
      args: [],
    );
  }

  /// `Symptom Type`
  String get symptomType {
    return Intl.message(
      'Symptom Type',
      name: 'symptomType',
      desc: '',
      args: [],
    );
  }

  /// `Severity`
  String get symptomSeverity {
    return Intl.message(
      'Severity',
      name: 'symptomSeverity',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get symptomNotes {
    return Intl.message('Notes', name: 'symptomNotes', desc: '', args: []);
  }

  /// `Severity Trend`
  String get symptomTrend {
    return Intl.message(
      'Severity Trend',
      name: 'symptomTrend',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get symptomHistory {
    return Intl.message('History', name: 'symptomHistory', desc: '', args: []);
  }

  /// `No symptom data yet. Start logging!`
  String get noSymptomData {
    return Intl.message(
      'No symptom data yet. Start logging!',
      name: 'noSymptomData',
      desc: '',
      args: [],
    );
  }

  /// `Need at least 2 entries for trend`
  String get insufficientSymptomData {
    return Intl.message(
      'Need at least 2 entries for trend',
      name: 'insufficientSymptomData',
      desc: '',
      args: [],
    );
  }

  /// `Severity over time`
  String get symptomSeverityOverTime {
    return Intl.message(
      'Severity over time',
      name: 'symptomSeverityOverTime',
      desc: '',
      args: [],
    );
  }

  /// `Headache`
  String get symptomTypeHeadache {
    return Intl.message(
      'Headache',
      name: 'symptomTypeHeadache',
      desc: '',
      args: [],
    );
  }

  /// `Fatigue`
  String get symptomTypeFatigue {
    return Intl.message(
      'Fatigue',
      name: 'symptomTypeFatigue',
      desc: '',
      args: [],
    );
  }

  /// `Nausea`
  String get symptomTypeNausea {
    return Intl.message(
      'Nausea',
      name: 'symptomTypeNausea',
      desc: '',
      args: [],
    );
  }

  /// `Dizziness`
  String get symptomTypeDizziness {
    return Intl.message(
      'Dizziness',
      name: 'symptomTypeDizziness',
      desc: '',
      args: [],
    );
  }

  /// `Bloating`
  String get symptomTypeBloating {
    return Intl.message(
      'Bloating',
      name: 'symptomTypeBloating',
      desc: '',
      args: [],
    );
  }

  /// `Cramps`
  String get symptomTypeCramps {
    return Intl.message(
      'Cramps',
      name: 'symptomTypeCramps',
      desc: '',
      args: [],
    );
  }

  /// `Anxiety`
  String get symptomTypeAnxiety {
    return Intl.message(
      'Anxiety',
      name: 'symptomTypeAnxiety',
      desc: '',
      args: [],
    );
  }

  /// `Insomnia`
  String get symptomTypeInsomnia {
    return Intl.message(
      'Insomnia',
      name: 'symptomTypeInsomnia',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get symptomTypeOther {
    return Intl.message('Other', name: 'symptomTypeOther', desc: '', args: []);
  }

  /// `Allergens`
  String get allergenSettingsLabel {
    return Intl.message(
      'Allergens',
      name: 'allergenSettingsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Allergen Settings`
  String get allergenSettingsTitle {
    return Intl.message(
      'Allergen Settings',
      name: 'allergenSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select allergens to filter from search results. Foods containing selected allergens will be hidden.`
  String get allergenSettingsDescription {
    return Intl.message(
      'Select allergens to filter from search results. Foods containing selected allergens will be hidden.',
      name: 'allergenSettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Contains allergen`
  String get allergenWarning {
    return Intl.message(
      'Contains allergen',
      name: 'allergenWarning',
      desc: '',
      args: [],
    );
  }

  /// `Contains`
  String get containsAllergen {
    return Intl.message(
      'Contains',
      name: 'containsAllergen',
      desc: '',
      args: [],
    );
  }

  /// `{count} allergens filtering active`
  String allergenFilterEnabled(int count) {
    return Intl.message(
      '$count allergens filtering active',
      name: 'allergenFilterEnabled',
      desc: '',
      args: [count],
    );
  }

  /// `Gluten`
  String get allergenGluten {
    return Intl.message('Gluten', name: 'allergenGluten', desc: '', args: []);
  }

  /// `Dairy`
  String get allergenDairy {
    return Intl.message('Dairy', name: 'allergenDairy', desc: '', args: []);
  }

  /// `Soy`
  String get allergenSoy {
    return Intl.message('Soy', name: 'allergenSoy', desc: '', args: []);
  }

  /// `Nuts`
  String get allergenNuts {
    return Intl.message('Nuts', name: 'allergenNuts', desc: '', args: []);
  }

  /// `Shellfish`
  String get allergenShellfish {
    return Intl.message(
      'Shellfish',
      name: 'allergenShellfish',
      desc: '',
      args: [],
    );
  }

  /// `Eggs`
  String get allergenEggs {
    return Intl.message('Eggs', name: 'allergenEggs', desc: '', args: []);
  }

  /// `Fish`
  String get allergenFish {
    return Intl.message('Fish', name: 'allergenFish', desc: '', args: []);
  }

  /// `Sesame`
  String get allergenSesame {
    return Intl.message('Sesame', name: 'allergenSesame', desc: '', args: []);
  }

  /// `Peanuts`
  String get allergenPeanuts {
    return Intl.message('Peanuts', name: 'allergenPeanuts', desc: '', args: []);
  }

  /// `Celery`
  String get allergenCelery {
    return Intl.message('Celery', name: 'allergenCelery', desc: '', args: []);
  }

  /// `Mustard`
  String get allergenMustard {
    return Intl.message('Mustard', name: 'allergenMustard', desc: '', args: []);
  }

  /// `Lupin`
  String get allergenLupin {
    return Intl.message('Lupin', name: 'allergenLupin', desc: '', args: []);
  }

  /// `Molluscs`
  String get allergenMolluscs {
    return Intl.message(
      'Molluscs',
      name: 'allergenMolluscs',
      desc: '',
      args: [],
    );
  }

  /// `Sulphur Dioxide`
  String get allergenSulphurDioxide {
    return Intl.message(
      'Sulphur Dioxide',
      name: 'allergenSulphurDioxide',
      desc: '',
      args: [],
    );
  }

  /// `Wheat, barley, rye and other gluten-containing grains`
  String get allergenGlutenDesc {
    return Intl.message(
      'Wheat, barley, rye and other gluten-containing grains',
      name: 'allergenGlutenDesc',
      desc: '',
      args: [],
    );
  }

  /// `Milk, cheese, butter, yogurt and other dairy products`
  String get allergenDairyDesc {
    return Intl.message(
      'Milk, cheese, butter, yogurt and other dairy products',
      name: 'allergenDairyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Soybeans, tofu, soy sauce and other soy products`
  String get allergenSoyDesc {
    return Intl.message(
      'Soybeans, tofu, soy sauce and other soy products',
      name: 'allergenSoyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Almonds, hazelnuts, walnuts and other tree nuts`
  String get allergenNutsDesc {
    return Intl.message(
      'Almonds, hazelnuts, walnuts and other tree nuts',
      name: 'allergenNutsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Shrimp, crab, lobster and other shellfish`
  String get allergenShellfishDesc {
    return Intl.message(
      'Shrimp, crab, lobster and other shellfish',
      name: 'allergenShellfishDesc',
      desc: '',
      args: [],
    );
  }

  /// `Eggs and egg-based products`
  String get allergenEggsDesc {
    return Intl.message(
      'Eggs and egg-based products',
      name: 'allergenEggsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Fish and fish-based products`
  String get allergenFishDesc {
    return Intl.message(
      'Fish and fish-based products',
      name: 'allergenFishDesc',
      desc: '',
      args: [],
    );
  }

  /// `Sesame seeds and sesame-based products`
  String get allergenSesameDesc {
    return Intl.message(
      'Sesame seeds and sesame-based products',
      name: 'allergenSesameDesc',
      desc: '',
      args: [],
    );
  }

  /// `Peanuts and peanut-based products`
  String get allergenPeanutsDesc {
    return Intl.message(
      'Peanuts and peanut-based products',
      name: 'allergenPeanutsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Celery and celeriac`
  String get allergenCeleryDesc {
    return Intl.message(
      'Celery and celeriac',
      name: 'allergenCeleryDesc',
      desc: '',
      args: [],
    );
  }

  /// `Mustard seeds and mustard-based products`
  String get allergenMustardDesc {
    return Intl.message(
      'Mustard seeds and mustard-based products',
      name: 'allergenMustardDesc',
      desc: '',
      args: [],
    );
  }

  /// `Lupin seeds and lupin flour`
  String get allergenLupinDesc {
    return Intl.message(
      'Lupin seeds and lupin flour',
      name: 'allergenLupinDesc',
      desc: '',
      args: [],
    );
  }

  /// `Mussels, oysters, squid and other molluscs`
  String get allergenMolluscsDesc {
    return Intl.message(
      'Mussels, oysters, squid and other molluscs',
      name: 'allergenMolluscsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Sulphites, commonly found in wine and dried fruit`
  String get allergenSulphurDioxideDesc {
    return Intl.message(
      'Sulphites, commonly found in wine and dried fruit',
      name: 'allergenSulphurDioxideDesc',
      desc: '',
      args: [],
    );
  }

  /// `Medications`
  String get medicationTitle {
    return Intl.message(
      'Medications',
      name: 'medicationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Medication`
  String get addMedication {
    return Intl.message(
      'Add Medication',
      name: 'addMedication',
      desc: '',
      args: [],
    );
  }

  /// `Delete Medication`
  String get deleteMedication {
    return Intl.message(
      'Delete Medication',
      name: 'deleteMedication',
      desc: '',
      args: [],
    );
  }

  /// `Medication Name`
  String get medicationName {
    return Intl.message(
      'Medication Name',
      name: 'medicationName',
      desc: '',
      args: [],
    );
  }

  /// `Dosage`
  String get medicationDosage {
    return Intl.message('Dosage', name: 'medicationDosage', desc: '', args: []);
  }

  /// `Frequency`
  String get medicationFrequency {
    return Intl.message(
      'Frequency',
      name: 'medicationFrequency',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get daily {
    return Intl.message('Daily', name: 'daily', desc: '', args: []);
  }

  /// `Weekly`
  String get weekly {
    return Intl.message('Weekly', name: 'weekly', desc: '', args: []);
  }

  /// `As Needed`
  String get asNeeded {
    return Intl.message('As Needed', name: 'asNeeded', desc: '', args: []);
  }

  /// `Times Per Day`
  String get timesPerDay {
    return Intl.message(
      'Times Per Day',
      name: 'timesPerDay',
      desc: '',
      args: [],
    );
  }

  /// `Log Dose`
  String get logDose {
    return Intl.message('Log Dose', name: 'logDose', desc: '', args: []);
  }

  /// `Dose Taken`
  String get doseTaken {
    return Intl.message('Dose Taken', name: 'doseTaken', desc: '', args: []);
  }

  /// `Dose Missed`
  String get doseMissed {
    return Intl.message('Dose Missed', name: 'doseMissed', desc: '', args: []);
  }

  /// `Medication Reminder`
  String get medicationReminder {
    return Intl.message(
      'Medication Reminder',
      name: 'medicationReminder',
      desc: '',
      args: [],
    );
  }

  /// `No medications added`
  String get noMedicationsAdded {
    return Intl.message(
      'No medications added',
      name: 'noMedicationsAdded',
      desc: '',
      args: [],
    );
  }

  /// `No medication logs for today`
  String get noLogsToday {
    return Intl.message(
      'No medication logs for today',
      name: 'noLogsToday',
      desc: '',
      args: [],
    );
  }

  /// `Medication Log`
  String get medicationLog {
    return Intl.message(
      'Medication Log',
      name: 'medicationLog',
      desc: '',
      args: [],
    );
  }

  /// `Medications`
  String get medicationSummaryTitle {
    return Intl.message(
      'Medications',
      name: 'medicationSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `{taken} / {total} doses taken`
  String medicationProgress(String taken, String total) {
    return Intl.message(
      '$taken / $total doses taken',
      name: 'medicationProgress',
      desc: '',
      args: [taken, total],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Blood Glucose`
  String get bloodGlucoseTitle {
    return Intl.message(
      'Blood Glucose',
      name: 'bloodGlucoseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Entry`
  String get addBloodGlucoseEntry {
    return Intl.message(
      'Add Entry',
      name: 'addBloodGlucoseEntry',
      desc: '',
      args: [],
    );
  }

  /// `Delete Entry`
  String get deleteBloodGlucoseEntry {
    return Intl.message(
      'Delete Entry',
      name: 'deleteBloodGlucoseEntry',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get bloodGlucoseValue {
    return Intl.message('Value', name: 'bloodGlucoseValue', desc: '', args: []);
  }

  /// `Label`
  String get bloodGlucoseLabel {
    return Intl.message('Label', name: 'bloodGlucoseLabel', desc: '', args: []);
  }

  /// `Fasting`
  String get fasting {
    return Intl.message('Fasting', name: 'fasting', desc: '', args: []);
  }

  /// `Before Meal`
  String get beforeMeal {
    return Intl.message('Before Meal', name: 'beforeMeal', desc: '', args: []);
  }

  /// `After Meal`
  String get afterMeal {
    return Intl.message('After Meal', name: 'afterMeal', desc: '', args: []);
  }

  /// `Bedtime`
  String get bedtime {
    return Intl.message('Bedtime', name: 'bedtime', desc: '', args: []);
  }

  /// `Average`
  String get bloodGlucoseAverage {
    return Intl.message(
      'Average',
      name: 'bloodGlucoseAverage',
      desc: '',
      args: [],
    );
  }

  /// `Trend`
  String get bloodGlucoseTrend {
    return Intl.message('Trend', name: 'bloodGlucoseTrend', desc: '', args: []);
  }

  /// `Timeline`
  String get bloodGlucoseTimeline {
    return Intl.message(
      'Timeline',
      name: 'bloodGlucoseTimeline',
      desc: '',
      args: [],
    );
  }

  /// `mg/dL`
  String get bloodGlucoseMgdL {
    return Intl.message('mg/dL', name: 'bloodGlucoseMgdL', desc: '', args: []);
  }

  /// `Blood Glucose Reminder`
  String get bloodGlucoseReminder {
    return Intl.message(
      'Blood Glucose Reminder',
      name: 'bloodGlucoseReminder',
      desc: '',
      args: [],
    );
  }

  /// `net carbs`
  String get netCarbsLabel {
    return Intl.message('net carbs', name: 'netCarbsLabel', desc: '', args: []);
  }

  /// `Net Carbs`
  String get netCarbsSettingsLabel {
    return Intl.message(
      'Net Carbs',
      name: 'netCarbsSettingsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Show net carbs (total carbs minus fiber) instead of total carbs in macros and summaries.`
  String get netCarbsDescription {
    return Intl.message(
      'Show net carbs (total carbs minus fiber) instead of total carbs in macros and summaries.',
      name: 'netCarbsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enable Net Carbs`
  String get netCarbsEnabledLabel {
    return Intl.message(
      'Enable Net Carbs',
      name: 'netCarbsEnabledLabel',
      desc: '',
      args: [],
    );
  }

  /// `Recipe Catalog`
  String get recipeCatalogTitle {
    return Intl.message(
      'Recipe Catalog',
      name: 'recipeCatalogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recipe Details`
  String get recipeCatalogDetailTitle {
    return Intl.message(
      'Recipe Details',
      name: 'recipeCatalogDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search recipes`
  String get recipeCatalogSearch {
    return Intl.message(
      'Search recipes',
      name: 'recipeCatalogSearch',
      desc: '',
      args: [],
    );
  }

  /// `Search by name, ingredient...`
  String get recipeCatalogSearchHint {
    return Intl.message(
      'Search by name, ingredient...',
      name: 'recipeCatalogSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `No recipes found`
  String get recipeCatalogEmpty {
    return Intl.message(
      'No recipes found',
      name: 'recipeCatalogEmpty',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get recipeCatalogMin {
    return Intl.message('min', name: 'recipeCatalogMin', desc: '', args: []);
  }

  /// `Nutrition`
  String get recipeCatalogNutrition {
    return Intl.message(
      'Nutrition',
      name: 'recipeCatalogNutrition',
      desc: '',
      args: [],
    );
  }

  /// `Add to Diary`
  String get recipeCatalogAddToDiary {
    return Intl.message(
      'Add to Diary',
      name: 'recipeCatalogAddToDiary',
      desc: '',
      args: [],
    );
  }

  /// `Grocery Check`
  String get groceryCheckTitle {
    return Intl.message(
      'Grocery Check',
      name: 'groceryCheckTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan barcodes to compare nutrition grades while shopping`
  String get groceryCheckSubtitle {
    return Intl.message(
      'Scan barcodes to compare nutrition grades while shopping',
      name: 'groceryCheckSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan Barcode`
  String get groceryCheckScanButton {
    return Intl.message(
      'Scan Barcode',
      name: 'groceryCheckScanButton',
      desc: '',
      args: [],
    );
  }

  /// `No products scanned yet. Tap the scan button to start comparing.`
  String get groceryCheckEmptyList {
    return Intl.message(
      'No products scanned yet. Tap the scan button to start comparing.',
      name: 'groceryCheckEmptyList',
      desc: '',
      args: [],
    );
  }

  /// `Compare`
  String get groceryCheckCompareButton {
    return Intl.message(
      'Compare',
      name: 'groceryCheckCompareButton',
      desc: '',
      args: [],
    );
  }

  /// `Select two products to compare`
  String get groceryCheckSelectTwoHint {
    return Intl.message(
      'Select two products to compare',
      name: 'groceryCheckSelectTwoHint',
      desc: '',
      args: [],
    );
  }

  /// `Nutrition Comparison`
  String get groceryCheckComparisonTitle {
    return Intl.message(
      'Nutrition Comparison',
      name: 'groceryCheckComparisonTitle',
      desc: '',
      args: [],
    );
  }

  /// `per 100 g/ml`
  String get groceryCheckPer100gml {
    return Intl.message(
      'per 100 g/ml',
      name: 'groceryCheckPer100gml',
      desc: '',
      args: [],
    );
  }

  /// `Better Choice`
  String get groceryCheckWinner {
    return Intl.message(
      'Better Choice',
      name: 'groceryCheckWinner',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get groceryCheckClearAll {
    return Intl.message(
      'Clear All',
      name: 'groceryCheckClearAll',
      desc: '',
      args: [],
    );
  }

  /// `Product not found. Try scanning again.`
  String get groceryCheckProductNotFound {
    return Intl.message(
      'Product not found. Try scanning again.',
      name: 'groceryCheckProductNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Scanning...`
  String get groceryCheckScanning {
    return Intl.message(
      'Scanning...',
      name: 'groceryCheckScanning',
      desc: '',
      args: [],
    );
  }

  /// `Product added to comparison list`
  String get groceryCheckItemAdded {
    return Intl.message(
      'Product added to comparison list',
      name: 'groceryCheckItemAdded',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get groceryCheckRemoveItem {
    return Intl.message(
      'Remove',
      name: 'groceryCheckRemoveItem',
      desc: '',
      args: [],
    );
  }

  /// `Nutrition data not available`
  String get groceryCheckNoNutritionData {
    return Intl.message(
      'Nutrition data not available',
      name: 'groceryCheckNoNutritionData',
      desc: '',
      args: [],
    );
  }

  /// `Show nutrition details`
  String get showNutritionLabel {
    return Intl.message(
      'Show nutrition details',
      name: 'showNutritionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Hide nutrition details`
  String get hideNutritionLabel {
    return Intl.message(
      'Hide nutrition details',
      name: 'hideNutritionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sodium`
  String get sodiumLabel {
    return Intl.message('Sodium', name: 'sodiumLabel', desc: '', args: []);
  }

  /// `Protein`
  String get proteinLabelShort {
    return Intl.message(
      'Protein',
      name: 'proteinLabelShort',
      desc: '',
      args: [],
    );
  }

  /// `Compare`
  String get compareLabel {
    return Intl.message('Compare', name: 'compareLabel', desc: '', args: []);
  }

  /// `Voice Food Logging`
  String get voiceLoggingTitle {
    return Intl.message(
      'Voice Food Logging',
      name: 'voiceLoggingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tap the microphone and describe what you ate`
  String get voiceLoggingSubtitle {
    return Intl.message(
      'Tap the microphone and describe what you ate',
      name: 'voiceLoggingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Start Recording`
  String get voiceLoggingStartButton {
    return Intl.message(
      'Start Recording',
      name: 'voiceLoggingStartButton',
      desc: '',
      args: [],
    );
  }

  /// `Stop Recording`
  String get voiceLoggingStopButton {
    return Intl.message(
      'Stop Recording',
      name: 'voiceLoggingStopButton',
      desc: '',
      args: [],
    );
  }

  /// `Listening...`
  String get voiceLoggingListening {
    return Intl.message(
      'Listening...',
      name: 'voiceLoggingListening',
      desc: '',
      args: [],
    );
  }

  /// `Identifying food items...`
  String get voiceLoggingParsing {
    return Intl.message(
      'Identifying food items...',
      name: 'voiceLoggingParsing',
      desc: '',
      args: [],
    );
  }

  /// `Recognized Food Items`
  String get voiceLoggingResultsTitle {
    return Intl.message(
      'Recognized Food Items',
      name: 'voiceLoggingResultsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get voiceLoggingConfirmButton {
    return Intl.message(
      'Confirm',
      name: 'voiceLoggingConfirmButton',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get voiceLoggingRetryButton {
    return Intl.message(
      'Retry',
      name: 'voiceLoggingRetryButton',
      desc: '',
      args: [],
    );
  }

  /// `No matching products found`
  String get voiceLoggingNoMatches {
    return Intl.message(
      'No matching products found',
      name: 'voiceLoggingNoMatches',
      desc: '',
      args: [],
    );
  }

  /// `Voice Log`
  String get voiceLoggingLabel {
    return Intl.message(
      'Voice Log',
      name: 'voiceLoggingLabel',
      desc: '',
      args: [],
    );
  }

  /// `Log food by speaking`
  String get voiceLoggingExample {
    return Intl.message(
      'Log food by speaking',
      name: 'voiceLoggingExample',
      desc: '',
      args: [],
    );
  }

  /// `Menu Scanner`
  String get menuScanTitle {
    return Intl.message(
      'Menu Scanner',
      name: 'menuScanTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan a restaurant menu to see nutrition info`
  String get menuScanSubtitle {
    return Intl.message(
      'Scan a restaurant menu to see nutrition info',
      name: 'menuScanSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo of a menu and we'll identify dishes with nutrition data.`
  String get menuScanDescription {
    return Intl.message(
      'Take a photo of a menu and we\'ll identify dishes with nutrition data.',
      name: 'menuScanDescription',
      desc: '',
      args: [],
    );
  }

  /// `Scan Menu`
  String get menuScanCaptureButton {
    return Intl.message(
      'Scan Menu',
      name: 'menuScanCaptureButton',
      desc: '',
      args: [],
    );
  }

  /// `Pick from Gallery`
  String get menuScanGalleryButton {
    return Intl.message(
      'Pick from Gallery',
      name: 'menuScanGalleryButton',
      desc: '',
      args: [],
    );
  }

  /// `Search manually`
  String get menuScanSearchManually {
    return Intl.message(
      'Search manually',
      name: 'menuScanSearchManually',
      desc: '',
      args: [],
    );
  }

  /// `Menu Items`
  String get menuScanResultsTitle {
    return Intl.message(
      'Menu Items',
      name: 'menuScanResultsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Processing menu...`
  String get menuScanProcessing {
    return Intl.message(
      'Processing menu...',
      name: 'menuScanProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Adding items to diary...`
  String get menuScanAddingItems {
    return Intl.message(
      'Adding items to diary...',
      name: 'menuScanAddingItems',
      desc: '',
      args: [],
    );
  }

  /// `{count} item(s) added to diary`
  String menuScanAddedCount(Object count) {
    return Intl.message(
      '$count item(s) added to diary',
      name: 'menuScanAddedCount',
      desc: '',
      args: [count],
    );
  }

  /// `{count} items found`
  String menuScanItemCount(Object count) {
    return Intl.message(
      '$count items found',
      name: 'menuScanItemCount',
      desc: '',
      args: [count],
    );
  }

  /// `Add {count} to diary`
  String menuScanAddSelected(Object count) {
    return Intl.message(
      'Add $count to diary',
      name: 'menuScanAddSelected',
      desc: '',
      args: [count],
    );
  }

  /// `Nutrition info not available`
  String get menuScanNoNutritionInfo {
    return Intl.message(
      'Nutrition info not available',
      name: 'menuScanNoNutritionInfo',
      desc: '',
      args: [],
    );
  }

  /// `Cal`
  String get menuScanCalories {
    return Intl.message('Cal', name: 'menuScanCalories', desc: '', args: []);
  }

  /// `Protein`
  String get menuScanProtein {
    return Intl.message('Protein', name: 'menuScanProtein', desc: '', args: []);
  }

  /// `Carbs`
  String get menuScanCarbs {
    return Intl.message('Carbs', name: 'menuScanCarbs', desc: '', args: []);
  }

  /// `Fat`
  String get menuScanFat {
    return Intl.message('Fat', name: 'menuScanFat', desc: '', args: []);
  }

  /// `Step Bonus`
  String get stepBonusLabel {
    return Intl.message(
      'Step Bonus',
      name: 'stepBonusLabel',
      desc: '',
      args: [],
    );
  }

  /// `Earn calorie credits from your daily step count. The more you walk, the more calories you get back.`
  String get stepBonusDescription {
    return Intl.message(
      'Earn calorie credits from your daily step count. The more you walk, the more calories you get back.',
      name: 'stepBonusDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enable Step Bonus`
  String get stepBonusEnableLabel {
    return Intl.message(
      'Enable Step Bonus',
      name: 'stepBonusEnableLabel',
      desc: '',
      args: [],
    );
  }

  /// `Credit Percentage`
  String get stepBonusPercentLabel {
    return Intl.message(
      'Credit Percentage',
      name: 'stepBonusPercentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Today's Step Bonus`
  String get stepBonusTodaySummary {
    return Intl.message(
      'Today\'s Step Bonus',
      name: 'stepBonusTodaySummary',
      desc: '',
      args: [],
    );
  }

  /// `Steps today`
  String get stepBonusStepsLabel {
    return Intl.message(
      'Steps today',
      name: 'stepBonusStepsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Step credit`
  String get stepBonusCreditLabel {
    return Intl.message(
      'Step credit',
      name: 'stepBonusCreditLabel',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get stepBonusRefreshLabel {
    return Intl.message(
      'Refresh',
      name: 'stepBonusRefreshLabel',
      desc: '',
      args: [],
    );
  }

  /// `Nutriq Home`
  String get widgetHomeTitle {
    return Intl.message(
      'Nutriq Home',
      name: 'widgetHomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Show remaining calories and macros on your home screen.`
  String get widgetHomeDescription {
    return Intl.message(
      'Show remaining calories and macros on your home screen.',
      name: 'widgetHomeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Nutriq Calories`
  String get widgetLockTitle {
    return Intl.message(
      'Nutriq Calories',
      name: 'widgetLockTitle',
      desc: '',
      args: [],
    );
  }

  /// `Show remaining calories on your lock screen.`
  String get widgetLockDescription {
    return Intl.message(
      'Show remaining calories on your lock screen.',
      name: 'widgetLockDescription',
      desc: '',
      args: [],
    );
  }

  /// `kcal left`
  String get widgetKcalLeft {
    return Intl.message(
      'kcal left',
      name: 'widgetKcalLeft',
      desc: '',
      args: [],
    );
  }

  /// `C`
  String get widgetCarbsShort {
    return Intl.message('C', name: 'widgetCarbsShort', desc: '', args: []);
  }

  /// `F`
  String get widgetFatsShort {
    return Intl.message('F', name: 'widgetFatsShort', desc: '', args: []);
  }

  /// `P`
  String get widgetProteinsShort {
    return Intl.message('P', name: 'widgetProteinsShort', desc: '', args: []);
  }

  /// `Please enter a valid number`
  String get invalidNumberLabel {
    return Intl.message(
      'Please enter a valid number',
      name: 'invalidNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Value cannot be negative`
  String get invalidNegativeLabel {
    return Intl.message(
      'Value cannot be negative',
      name: 'invalidNegativeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Value cannot exceed 100g per 100g`
  String get invalidMax100Label {
    return Intl.message(
      'Value cannot exceed 100g per 100g',
      name: 'invalidMax100Label',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get trackerValueLabel {
    return Intl.message('Value', name: 'trackerValueLabel', desc: '', args: []);
  }

  /// `Icon`
  String get iconLabel {
    return Intl.message('Icon', name: 'iconLabel', desc: '', args: []);
  }

  /// `Delete item`
  String get deleteItemLabel {
    return Intl.message(
      'Delete item',
      name: 'deleteItemLabel',
      desc: '',
      args: [],
    );
  }

  /// `{current} of {goal} ml water consumed`
  String waterProgressLabel(int current, int goal) {
    return Intl.message(
      '$current of $goal ml water consumed',
      name: 'waterProgressLabel',
      desc: '',
      args: [current, goal],
    );
  }

  /// `{percent}% of daily water goal`
  String waterProgressPercent(int percent) {
    return Intl.message(
      '$percent% of daily water goal',
      name: 'waterProgressPercent',
      desc: '',
      args: [percent],
    );
  }

  /// `Body Mass Index: {value} ({category})`
  String bmiLabelLong(String value, String category) {
    return Intl.message(
      'Body Mass Index: $value ($category)',
      name: 'bmiLabelLong',
      desc: '',
      args: [value, category],
    );
  }

  /// `{percent}% progress toward goal weight`
  String goalProgressLabel(int percent) {
    return Intl.message(
      '$percent% progress toward goal weight',
      name: 'goalProgressLabel',
      desc: '',
      args: [percent],
    );
  }

  /// `{percent}% of fasting goal completed`
  String fastingProgressLabel(int percent) {
    return Intl.message(
      '$percent% of fasting goal completed',
      name: 'fastingProgressLabel',
      desc: '',
      args: [percent],
    );
  }

  /// `Food grade: {grade}`
  String foodGradeLabelLong(String grade) {
    return Intl.message(
      'Food grade: $grade',
      name: 'foodGradeLabelLong',
      desc: '',
      args: [grade],
    );
  }

  /// `Fasting streak: {count} days`
  String streakLabelLong(int count) {
    return Intl.message(
      'Fasting streak: $count days',
      name: 'streakLabelLong',
      desc: '',
      args: [count],
    );
  }

  /// `Add {amount} ml of water`
  String addWaterLabel(int amount) {
    return Intl.message(
      'Add $amount ml of water',
      name: 'addWaterLabel',
      desc: '',
      args: [amount],
    );
  }

  /// `This action cannot be undone.`
  String get deleteDialogContent {
    return Intl.message(
      'This action cannot be undone.',
      name: 'deleteDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmLabel {
    return Intl.message('Confirm', name: 'confirmLabel', desc: '', args: []);
  }

  /// `No trackers yet. Tap + to create your first tracker.`
  String get createTrackerHint {
    return Intl.message(
      'No trackers yet. Tap + to create your first tracker.',
      name: 'createTrackerHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the same password in both fields.`
  String get encryptedBackupMismatchHint {
    return Intl.message(
      'Please enter the same password in both fields.',
      name: 'encryptedBackupMismatchHint',
      desc: '',
      args: [],
    );
  }

  /// `Select your encrypted backup file`
  String get dataSyncBackupPathHint {
    return Intl.message(
      'Select your encrypted backup file',
      name: 'dataSyncBackupPathHint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
