// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ConfigEntriesTable extends ConfigEntries
    with TableInfo<$ConfigEntriesTable, ConfigEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfigEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _hasAcceptedDisclaimerMeta =
      const VerificationMeta('hasAcceptedDisclaimer');
  @override
  late final GeneratedColumn<bool> hasAcceptedDisclaimer =
      GeneratedColumn<bool>('has_accepted_disclaimer', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_accepted_disclaimer" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _hasAcceptedPolicyMeta =
      const VerificationMeta('hasAcceptedPolicy');
  @override
  late final GeneratedColumn<bool> hasAcceptedPolicy = GeneratedColumn<bool>(
      'has_accepted_policy', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_accepted_policy" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hasAcceptedSendAnonymousDataMeta =
      const VerificationMeta('hasAcceptedSendAnonymousData');
  @override
  late final GeneratedColumn<bool> hasAcceptedSendAnonymousData =
      GeneratedColumn<bool>(
          'has_accepted_send_anonymous_data', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_accepted_send_anonymous_data" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _selectedAppThemeMeta =
      const VerificationMeta('selectedAppTheme');
  @override
  late final GeneratedColumn<String> selectedAppTheme = GeneratedColumn<String>(
      'selected_app_theme', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('system'));
  static const VerificationMeta _usesImperialUnitsMeta =
      const VerificationMeta('usesImperialUnits');
  @override
  late final GeneratedColumn<bool> usesImperialUnits = GeneratedColumn<bool>(
      'uses_imperial_units', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("uses_imperial_units" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _userKcalAdjustmentMeta =
      const VerificationMeta('userKcalAdjustment');
  @override
  late final GeneratedColumn<double> userKcalAdjustment =
      GeneratedColumn<double>('user_kcal_adjustment', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _userCarbGoalPctMeta =
      const VerificationMeta('userCarbGoalPct');
  @override
  late final GeneratedColumn<double> userCarbGoalPct = GeneratedColumn<double>(
      'user_carb_goal_pct', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _userProteinGoalPctMeta =
      const VerificationMeta('userProteinGoalPct');
  @override
  late final GeneratedColumn<double> userProteinGoalPct =
      GeneratedColumn<double>('user_protein_goal_pct', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _userFatGoalPctMeta =
      const VerificationMeta('userFatGoalPct');
  @override
  late final GeneratedColumn<double> userFatGoalPct = GeneratedColumn<double>(
      'user_fat_goal_pct', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _dailyWaterGoalMlMeta =
      const VerificationMeta('dailyWaterGoalMl');
  @override
  late final GeneratedColumn<int> dailyWaterGoalMl = GeneratedColumn<int>(
      'daily_water_goal_ml', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(2000));
  static const VerificationMeta _tdeeMethodMeta =
      const VerificationMeta('tdeeMethod');
  @override
  late final GeneratedColumn<String> tdeeMethod = GeneratedColumn<String>(
      'tdee_method', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('iom2005'));
  static const VerificationMeta _exerciseCalorieModeMeta =
      const VerificationMeta('exerciseCalorieMode');
  @override
  late final GeneratedColumn<String> exerciseCalorieMode =
      GeneratedColumn<String>('exercise_calorie_mode', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('half'));
  static const VerificationMeta _exerciseCreditPercentMeta =
      const VerificationMeta('exerciseCreditPercent');
  @override
  late final GeneratedColumn<double> exerciseCreditPercent =
      GeneratedColumn<double>('exercise_credit_percent', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.5));
  static const VerificationMeta _calorieCycleJsonMeta =
      const VerificationMeta('calorieCycleJson');
  @override
  late final GeneratedColumn<String> calorieCycleJson = GeneratedColumn<String>(
      'calorie_cycle_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _calorieCyclingEnabledMeta =
      const VerificationMeta('calorieCyclingEnabled');
  @override
  late final GeneratedColumn<int> calorieCyclingEnabled = GeneratedColumn<int>(
      'calorie_cycling_enabled', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _allergensMeta =
      const VerificationMeta('allergens');
  @override
  late final GeneratedColumn<String> allergens = GeneratedColumn<String>(
      'allergens', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _bloodGlucoseMinMgDlMeta =
      const VerificationMeta('bloodGlucoseMinMgDl');
  @override
  late final GeneratedColumn<int> bloodGlucoseMinMgDl = GeneratedColumn<int>(
      'blood_glucose_min_mg_dl', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(70));
  static const VerificationMeta _bloodGlucoseMaxMgDlMeta =
      const VerificationMeta('bloodGlucoseMaxMgDl');
  @override
  late final GeneratedColumn<int> bloodGlucoseMaxMgDl = GeneratedColumn<int>(
      'blood_glucose_max_mg_dl', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(180));
  static const VerificationMeta _netCarbsEnabledMeta =
      const VerificationMeta('netCarbsEnabled');
  @override
  late final GeneratedColumn<int> netCarbsEnabled = GeneratedColumn<int>(
      'net_carbs_enabled', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _stepBonusEnabledMeta =
      const VerificationMeta('stepBonusEnabled');
  @override
  late final GeneratedColumn<int> stepBonusEnabled = GeneratedColumn<int>(
      'step_bonus_enabled', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _stepBonusPercentMeta =
      const VerificationMeta('stepBonusPercent');
  @override
  late final GeneratedColumn<double> stepBonusPercent = GeneratedColumn<double>(
      'step_bonus_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.5));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        hasAcceptedDisclaimer,
        hasAcceptedPolicy,
        hasAcceptedSendAnonymousData,
        selectedAppTheme,
        usesImperialUnits,
        userKcalAdjustment,
        userCarbGoalPct,
        userProteinGoalPct,
        userFatGoalPct,
        dailyWaterGoalMl,
        tdeeMethod,
        exerciseCalorieMode,
        exerciseCreditPercent,
        calorieCycleJson,
        calorieCyclingEnabled,
        allergens,
        bloodGlucoseMinMgDl,
        bloodGlucoseMaxMgDl,
        netCarbsEnabled,
        stepBonusEnabled,
        stepBonusPercent
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'config_entries';
  @override
  VerificationContext validateIntegrity(Insertable<ConfigEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('has_accepted_disclaimer')) {
      context.handle(
          _hasAcceptedDisclaimerMeta,
          hasAcceptedDisclaimer.isAcceptableOrUnknown(
              data['has_accepted_disclaimer']!, _hasAcceptedDisclaimerMeta));
    }
    if (data.containsKey('has_accepted_policy')) {
      context.handle(
          _hasAcceptedPolicyMeta,
          hasAcceptedPolicy.isAcceptableOrUnknown(
              data['has_accepted_policy']!, _hasAcceptedPolicyMeta));
    }
    if (data.containsKey('has_accepted_send_anonymous_data')) {
      context.handle(
          _hasAcceptedSendAnonymousDataMeta,
          hasAcceptedSendAnonymousData.isAcceptableOrUnknown(
              data['has_accepted_send_anonymous_data']!,
              _hasAcceptedSendAnonymousDataMeta));
    }
    if (data.containsKey('selected_app_theme')) {
      context.handle(
          _selectedAppThemeMeta,
          selectedAppTheme.isAcceptableOrUnknown(
              data['selected_app_theme']!, _selectedAppThemeMeta));
    }
    if (data.containsKey('uses_imperial_units')) {
      context.handle(
          _usesImperialUnitsMeta,
          usesImperialUnits.isAcceptableOrUnknown(
              data['uses_imperial_units']!, _usesImperialUnitsMeta));
    }
    if (data.containsKey('user_kcal_adjustment')) {
      context.handle(
          _userKcalAdjustmentMeta,
          userKcalAdjustment.isAcceptableOrUnknown(
              data['user_kcal_adjustment']!, _userKcalAdjustmentMeta));
    }
    if (data.containsKey('user_carb_goal_pct')) {
      context.handle(
          _userCarbGoalPctMeta,
          userCarbGoalPct.isAcceptableOrUnknown(
              data['user_carb_goal_pct']!, _userCarbGoalPctMeta));
    }
    if (data.containsKey('user_protein_goal_pct')) {
      context.handle(
          _userProteinGoalPctMeta,
          userProteinGoalPct.isAcceptableOrUnknown(
              data['user_protein_goal_pct']!, _userProteinGoalPctMeta));
    }
    if (data.containsKey('user_fat_goal_pct')) {
      context.handle(
          _userFatGoalPctMeta,
          userFatGoalPct.isAcceptableOrUnknown(
              data['user_fat_goal_pct']!, _userFatGoalPctMeta));
    }
    if (data.containsKey('daily_water_goal_ml')) {
      context.handle(
          _dailyWaterGoalMlMeta,
          dailyWaterGoalMl.isAcceptableOrUnknown(
              data['daily_water_goal_ml']!, _dailyWaterGoalMlMeta));
    }
    if (data.containsKey('tdee_method')) {
      context.handle(
          _tdeeMethodMeta,
          tdeeMethod.isAcceptableOrUnknown(
              data['tdee_method']!, _tdeeMethodMeta));
    }
    if (data.containsKey('exercise_calorie_mode')) {
      context.handle(
          _exerciseCalorieModeMeta,
          exerciseCalorieMode.isAcceptableOrUnknown(
              data['exercise_calorie_mode']!, _exerciseCalorieModeMeta));
    }
    if (data.containsKey('exercise_credit_percent')) {
      context.handle(
          _exerciseCreditPercentMeta,
          exerciseCreditPercent.isAcceptableOrUnknown(
              data['exercise_credit_percent']!, _exerciseCreditPercentMeta));
    }
    if (data.containsKey('calorie_cycle_json')) {
      context.handle(
          _calorieCycleJsonMeta,
          calorieCycleJson.isAcceptableOrUnknown(
              data['calorie_cycle_json']!, _calorieCycleJsonMeta));
    }
    if (data.containsKey('calorie_cycling_enabled')) {
      context.handle(
          _calorieCyclingEnabledMeta,
          calorieCyclingEnabled.isAcceptableOrUnknown(
              data['calorie_cycling_enabled']!, _calorieCyclingEnabledMeta));
    }
    if (data.containsKey('allergens')) {
      context.handle(_allergensMeta,
          allergens.isAcceptableOrUnknown(data['allergens']!, _allergensMeta));
    }
    if (data.containsKey('blood_glucose_min_mg_dl')) {
      context.handle(
          _bloodGlucoseMinMgDlMeta,
          bloodGlucoseMinMgDl.isAcceptableOrUnknown(
              data['blood_glucose_min_mg_dl']!, _bloodGlucoseMinMgDlMeta));
    }
    if (data.containsKey('blood_glucose_max_mg_dl')) {
      context.handle(
          _bloodGlucoseMaxMgDlMeta,
          bloodGlucoseMaxMgDl.isAcceptableOrUnknown(
              data['blood_glucose_max_mg_dl']!, _bloodGlucoseMaxMgDlMeta));
    }
    if (data.containsKey('net_carbs_enabled')) {
      context.handle(
          _netCarbsEnabledMeta,
          netCarbsEnabled.isAcceptableOrUnknown(
              data['net_carbs_enabled']!, _netCarbsEnabledMeta));
    }
    if (data.containsKey('step_bonus_enabled')) {
      context.handle(
          _stepBonusEnabledMeta,
          stepBonusEnabled.isAcceptableOrUnknown(
              data['step_bonus_enabled']!, _stepBonusEnabledMeta));
    }
    if (data.containsKey('step_bonus_percent')) {
      context.handle(
          _stepBonusPercentMeta,
          stepBonusPercent.isAcceptableOrUnknown(
              data['step_bonus_percent']!, _stepBonusPercentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfigEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfigEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hasAcceptedDisclaimer: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}has_accepted_disclaimer'])!,
      hasAcceptedPolicy: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_accepted_policy'])!,
      hasAcceptedSendAnonymousData: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}has_accepted_send_anonymous_data'])!,
      selectedAppTheme: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}selected_app_theme'])!,
      usesImperialUnits: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}uses_imperial_units']),
      userKcalAdjustment: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}user_kcal_adjustment']),
      userCarbGoalPct: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}user_carb_goal_pct']),
      userProteinGoalPct: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}user_protein_goal_pct']),
      userFatGoalPct: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}user_fat_goal_pct']),
      dailyWaterGoalMl: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}daily_water_goal_ml']),
      tdeeMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tdee_method'])!,
      exerciseCalorieMode: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}exercise_calorie_mode'])!,
      exerciseCreditPercent: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}exercise_credit_percent'])!,
      calorieCycleJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}calorie_cycle_json']),
      calorieCyclingEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}calorie_cycling_enabled'])!,
      allergens: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}allergens'])!,
      bloodGlucoseMinMgDl: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}blood_glucose_min_mg_dl']),
      bloodGlucoseMaxMgDl: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}blood_glucose_max_mg_dl']),
      netCarbsEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}net_carbs_enabled'])!,
      stepBonusEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}step_bonus_enabled'])!,
      stepBonusPercent: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}step_bonus_percent'])!,
    );
  }

  @override
  $ConfigEntriesTable createAlias(String alias) {
    return $ConfigEntriesTable(attachedDatabase, alias);
  }
}

class ConfigEntry extends DataClass implements Insertable<ConfigEntry> {
  final int id;
  final bool hasAcceptedDisclaimer;
  final bool hasAcceptedPolicy;
  final bool hasAcceptedSendAnonymousData;
  final String selectedAppTheme;
  final bool? usesImperialUnits;
  final double? userKcalAdjustment;
  final double? userCarbGoalPct;
  final double? userProteinGoalPct;
  final double? userFatGoalPct;
  final int? dailyWaterGoalMl;
  final String tdeeMethod;
  final String exerciseCalorieMode;
  final double exerciseCreditPercent;
  final String? calorieCycleJson;
  final int calorieCyclingEnabled;
  final String allergens;
  final int? bloodGlucoseMinMgDl;
  final int? bloodGlucoseMaxMgDl;
  final int netCarbsEnabled;
  final int stepBonusEnabled;
  final double stepBonusPercent;
  const ConfigEntry(
      {required this.id,
      required this.hasAcceptedDisclaimer,
      required this.hasAcceptedPolicy,
      required this.hasAcceptedSendAnonymousData,
      required this.selectedAppTheme,
      this.usesImperialUnits,
      this.userKcalAdjustment,
      this.userCarbGoalPct,
      this.userProteinGoalPct,
      this.userFatGoalPct,
      this.dailyWaterGoalMl,
      required this.tdeeMethod,
      required this.exerciseCalorieMode,
      required this.exerciseCreditPercent,
      this.calorieCycleJson,
      required this.calorieCyclingEnabled,
      required this.allergens,
      this.bloodGlucoseMinMgDl,
      this.bloodGlucoseMaxMgDl,
      required this.netCarbsEnabled,
      required this.stepBonusEnabled,
      required this.stepBonusPercent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['has_accepted_disclaimer'] = Variable<bool>(hasAcceptedDisclaimer);
    map['has_accepted_policy'] = Variable<bool>(hasAcceptedPolicy);
    map['has_accepted_send_anonymous_data'] =
        Variable<bool>(hasAcceptedSendAnonymousData);
    map['selected_app_theme'] = Variable<String>(selectedAppTheme);
    if (!nullToAbsent || usesImperialUnits != null) {
      map['uses_imperial_units'] = Variable<bool>(usesImperialUnits);
    }
    if (!nullToAbsent || userKcalAdjustment != null) {
      map['user_kcal_adjustment'] = Variable<double>(userKcalAdjustment);
    }
    if (!nullToAbsent || userCarbGoalPct != null) {
      map['user_carb_goal_pct'] = Variable<double>(userCarbGoalPct);
    }
    if (!nullToAbsent || userProteinGoalPct != null) {
      map['user_protein_goal_pct'] = Variable<double>(userProteinGoalPct);
    }
    if (!nullToAbsent || userFatGoalPct != null) {
      map['user_fat_goal_pct'] = Variable<double>(userFatGoalPct);
    }
    if (!nullToAbsent || dailyWaterGoalMl != null) {
      map['daily_water_goal_ml'] = Variable<int>(dailyWaterGoalMl);
    }
    map['tdee_method'] = Variable<String>(tdeeMethod);
    map['exercise_calorie_mode'] = Variable<String>(exerciseCalorieMode);
    map['exercise_credit_percent'] = Variable<double>(exerciseCreditPercent);
    if (!nullToAbsent || calorieCycleJson != null) {
      map['calorie_cycle_json'] = Variable<String>(calorieCycleJson);
    }
    map['calorie_cycling_enabled'] = Variable<int>(calorieCyclingEnabled);
    map['allergens'] = Variable<String>(allergens);
    if (!nullToAbsent || bloodGlucoseMinMgDl != null) {
      map['blood_glucose_min_mg_dl'] = Variable<int>(bloodGlucoseMinMgDl);
    }
    if (!nullToAbsent || bloodGlucoseMaxMgDl != null) {
      map['blood_glucose_max_mg_dl'] = Variable<int>(bloodGlucoseMaxMgDl);
    }
    map['net_carbs_enabled'] = Variable<int>(netCarbsEnabled);
    map['step_bonus_enabled'] = Variable<int>(stepBonusEnabled);
    map['step_bonus_percent'] = Variable<double>(stepBonusPercent);
    return map;
  }

  ConfigEntriesCompanion toCompanion(bool nullToAbsent) {
    return ConfigEntriesCompanion(
      id: Value(id),
      hasAcceptedDisclaimer: Value(hasAcceptedDisclaimer),
      hasAcceptedPolicy: Value(hasAcceptedPolicy),
      hasAcceptedSendAnonymousData: Value(hasAcceptedSendAnonymousData),
      selectedAppTheme: Value(selectedAppTheme),
      usesImperialUnits: usesImperialUnits == null && nullToAbsent
          ? const Value.absent()
          : Value(usesImperialUnits),
      userKcalAdjustment: userKcalAdjustment == null && nullToAbsent
          ? const Value.absent()
          : Value(userKcalAdjustment),
      userCarbGoalPct: userCarbGoalPct == null && nullToAbsent
          ? const Value.absent()
          : Value(userCarbGoalPct),
      userProteinGoalPct: userProteinGoalPct == null && nullToAbsent
          ? const Value.absent()
          : Value(userProteinGoalPct),
      userFatGoalPct: userFatGoalPct == null && nullToAbsent
          ? const Value.absent()
          : Value(userFatGoalPct),
      dailyWaterGoalMl: dailyWaterGoalMl == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyWaterGoalMl),
      tdeeMethod: Value(tdeeMethod),
      exerciseCalorieMode: Value(exerciseCalorieMode),
      exerciseCreditPercent: Value(exerciseCreditPercent),
      calorieCycleJson: calorieCycleJson == null && nullToAbsent
          ? const Value.absent()
          : Value(calorieCycleJson),
      calorieCyclingEnabled: Value(calorieCyclingEnabled),
      allergens: Value(allergens),
      bloodGlucoseMinMgDl: bloodGlucoseMinMgDl == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodGlucoseMinMgDl),
      bloodGlucoseMaxMgDl: bloodGlucoseMaxMgDl == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodGlucoseMaxMgDl),
      netCarbsEnabled: Value(netCarbsEnabled),
      stepBonusEnabled: Value(stepBonusEnabled),
      stepBonusPercent: Value(stepBonusPercent),
    );
  }

  factory ConfigEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfigEntry(
      id: serializer.fromJson<int>(json['id']),
      hasAcceptedDisclaimer:
          serializer.fromJson<bool>(json['hasAcceptedDisclaimer']),
      hasAcceptedPolicy: serializer.fromJson<bool>(json['hasAcceptedPolicy']),
      hasAcceptedSendAnonymousData:
          serializer.fromJson<bool>(json['hasAcceptedSendAnonymousData']),
      selectedAppTheme: serializer.fromJson<String>(json['selectedAppTheme']),
      usesImperialUnits: serializer.fromJson<bool?>(json['usesImperialUnits']),
      userKcalAdjustment:
          serializer.fromJson<double?>(json['userKcalAdjustment']),
      userCarbGoalPct: serializer.fromJson<double?>(json['userCarbGoalPct']),
      userProteinGoalPct:
          serializer.fromJson<double?>(json['userProteinGoalPct']),
      userFatGoalPct: serializer.fromJson<double?>(json['userFatGoalPct']),
      dailyWaterGoalMl: serializer.fromJson<int?>(json['dailyWaterGoalMl']),
      tdeeMethod: serializer.fromJson<String>(json['tdeeMethod']),
      exerciseCalorieMode:
          serializer.fromJson<String>(json['exerciseCalorieMode']),
      exerciseCreditPercent:
          serializer.fromJson<double>(json['exerciseCreditPercent']),
      calorieCycleJson: serializer.fromJson<String?>(json['calorieCycleJson']),
      calorieCyclingEnabled:
          serializer.fromJson<int>(json['calorieCyclingEnabled']),
      allergens: serializer.fromJson<String>(json['allergens']),
      bloodGlucoseMinMgDl:
          serializer.fromJson<int?>(json['bloodGlucoseMinMgDl']),
      bloodGlucoseMaxMgDl:
          serializer.fromJson<int?>(json['bloodGlucoseMaxMgDl']),
      netCarbsEnabled: serializer.fromJson<int>(json['netCarbsEnabled']),
      stepBonusEnabled: serializer.fromJson<int>(json['stepBonusEnabled']),
      stepBonusPercent: serializer.fromJson<double>(json['stepBonusPercent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hasAcceptedDisclaimer': serializer.toJson<bool>(hasAcceptedDisclaimer),
      'hasAcceptedPolicy': serializer.toJson<bool>(hasAcceptedPolicy),
      'hasAcceptedSendAnonymousData':
          serializer.toJson<bool>(hasAcceptedSendAnonymousData),
      'selectedAppTheme': serializer.toJson<String>(selectedAppTheme),
      'usesImperialUnits': serializer.toJson<bool?>(usesImperialUnits),
      'userKcalAdjustment': serializer.toJson<double?>(userKcalAdjustment),
      'userCarbGoalPct': serializer.toJson<double?>(userCarbGoalPct),
      'userProteinGoalPct': serializer.toJson<double?>(userProteinGoalPct),
      'userFatGoalPct': serializer.toJson<double?>(userFatGoalPct),
      'dailyWaterGoalMl': serializer.toJson<int?>(dailyWaterGoalMl),
      'tdeeMethod': serializer.toJson<String>(tdeeMethod),
      'exerciseCalorieMode': serializer.toJson<String>(exerciseCalorieMode),
      'exerciseCreditPercent': serializer.toJson<double>(exerciseCreditPercent),
      'calorieCycleJson': serializer.toJson<String?>(calorieCycleJson),
      'calorieCyclingEnabled': serializer.toJson<int>(calorieCyclingEnabled),
      'allergens': serializer.toJson<String>(allergens),
      'bloodGlucoseMinMgDl': serializer.toJson<int?>(bloodGlucoseMinMgDl),
      'bloodGlucoseMaxMgDl': serializer.toJson<int?>(bloodGlucoseMaxMgDl),
      'netCarbsEnabled': serializer.toJson<int>(netCarbsEnabled),
      'stepBonusEnabled': serializer.toJson<int>(stepBonusEnabled),
      'stepBonusPercent': serializer.toJson<double>(stepBonusPercent),
    };
  }

  ConfigEntry copyWith(
          {int? id,
          bool? hasAcceptedDisclaimer,
          bool? hasAcceptedPolicy,
          bool? hasAcceptedSendAnonymousData,
          String? selectedAppTheme,
          Value<bool?> usesImperialUnits = const Value.absent(),
          Value<double?> userKcalAdjustment = const Value.absent(),
          Value<double?> userCarbGoalPct = const Value.absent(),
          Value<double?> userProteinGoalPct = const Value.absent(),
          Value<double?> userFatGoalPct = const Value.absent(),
          Value<int?> dailyWaterGoalMl = const Value.absent(),
          String? tdeeMethod,
          String? exerciseCalorieMode,
          double? exerciseCreditPercent,
          Value<String?> calorieCycleJson = const Value.absent(),
          int? calorieCyclingEnabled,
          String? allergens,
          Value<int?> bloodGlucoseMinMgDl = const Value.absent(),
          Value<int?> bloodGlucoseMaxMgDl = const Value.absent(),
          int? netCarbsEnabled,
          int? stepBonusEnabled,
          double? stepBonusPercent}) =>
      ConfigEntry(
        id: id ?? this.id,
        hasAcceptedDisclaimer:
            hasAcceptedDisclaimer ?? this.hasAcceptedDisclaimer,
        hasAcceptedPolicy: hasAcceptedPolicy ?? this.hasAcceptedPolicy,
        hasAcceptedSendAnonymousData:
            hasAcceptedSendAnonymousData ?? this.hasAcceptedSendAnonymousData,
        selectedAppTheme: selectedAppTheme ?? this.selectedAppTheme,
        usesImperialUnits: usesImperialUnits.present
            ? usesImperialUnits.value
            : this.usesImperialUnits,
        userKcalAdjustment: userKcalAdjustment.present
            ? userKcalAdjustment.value
            : this.userKcalAdjustment,
        userCarbGoalPct: userCarbGoalPct.present
            ? userCarbGoalPct.value
            : this.userCarbGoalPct,
        userProteinGoalPct: userProteinGoalPct.present
            ? userProteinGoalPct.value
            : this.userProteinGoalPct,
        userFatGoalPct:
            userFatGoalPct.present ? userFatGoalPct.value : this.userFatGoalPct,
        dailyWaterGoalMl: dailyWaterGoalMl.present
            ? dailyWaterGoalMl.value
            : this.dailyWaterGoalMl,
        tdeeMethod: tdeeMethod ?? this.tdeeMethod,
        exerciseCalorieMode: exerciseCalorieMode ?? this.exerciseCalorieMode,
        exerciseCreditPercent:
            exerciseCreditPercent ?? this.exerciseCreditPercent,
        calorieCycleJson: calorieCycleJson.present
            ? calorieCycleJson.value
            : this.calorieCycleJson,
        calorieCyclingEnabled:
            calorieCyclingEnabled ?? this.calorieCyclingEnabled,
        allergens: allergens ?? this.allergens,
        bloodGlucoseMinMgDl: bloodGlucoseMinMgDl.present
            ? bloodGlucoseMinMgDl.value
            : this.bloodGlucoseMinMgDl,
        bloodGlucoseMaxMgDl: bloodGlucoseMaxMgDl.present
            ? bloodGlucoseMaxMgDl.value
            : this.bloodGlucoseMaxMgDl,
        netCarbsEnabled: netCarbsEnabled ?? this.netCarbsEnabled,
        stepBonusEnabled: stepBonusEnabled ?? this.stepBonusEnabled,
        stepBonusPercent: stepBonusPercent ?? this.stepBonusPercent,
      );
  ConfigEntry copyWithCompanion(ConfigEntriesCompanion data) {
    return ConfigEntry(
      id: data.id.present ? data.id.value : this.id,
      hasAcceptedDisclaimer: data.hasAcceptedDisclaimer.present
          ? data.hasAcceptedDisclaimer.value
          : this.hasAcceptedDisclaimer,
      hasAcceptedPolicy: data.hasAcceptedPolicy.present
          ? data.hasAcceptedPolicy.value
          : this.hasAcceptedPolicy,
      hasAcceptedSendAnonymousData: data.hasAcceptedSendAnonymousData.present
          ? data.hasAcceptedSendAnonymousData.value
          : this.hasAcceptedSendAnonymousData,
      selectedAppTheme: data.selectedAppTheme.present
          ? data.selectedAppTheme.value
          : this.selectedAppTheme,
      usesImperialUnits: data.usesImperialUnits.present
          ? data.usesImperialUnits.value
          : this.usesImperialUnits,
      userKcalAdjustment: data.userKcalAdjustment.present
          ? data.userKcalAdjustment.value
          : this.userKcalAdjustment,
      userCarbGoalPct: data.userCarbGoalPct.present
          ? data.userCarbGoalPct.value
          : this.userCarbGoalPct,
      userProteinGoalPct: data.userProteinGoalPct.present
          ? data.userProteinGoalPct.value
          : this.userProteinGoalPct,
      userFatGoalPct: data.userFatGoalPct.present
          ? data.userFatGoalPct.value
          : this.userFatGoalPct,
      dailyWaterGoalMl: data.dailyWaterGoalMl.present
          ? data.dailyWaterGoalMl.value
          : this.dailyWaterGoalMl,
      tdeeMethod:
          data.tdeeMethod.present ? data.tdeeMethod.value : this.tdeeMethod,
      exerciseCalorieMode: data.exerciseCalorieMode.present
          ? data.exerciseCalorieMode.value
          : this.exerciseCalorieMode,
      exerciseCreditPercent: data.exerciseCreditPercent.present
          ? data.exerciseCreditPercent.value
          : this.exerciseCreditPercent,
      calorieCycleJson: data.calorieCycleJson.present
          ? data.calorieCycleJson.value
          : this.calorieCycleJson,
      calorieCyclingEnabled: data.calorieCyclingEnabled.present
          ? data.calorieCyclingEnabled.value
          : this.calorieCyclingEnabled,
      allergens: data.allergens.present ? data.allergens.value : this.allergens,
      bloodGlucoseMinMgDl: data.bloodGlucoseMinMgDl.present
          ? data.bloodGlucoseMinMgDl.value
          : this.bloodGlucoseMinMgDl,
      bloodGlucoseMaxMgDl: data.bloodGlucoseMaxMgDl.present
          ? data.bloodGlucoseMaxMgDl.value
          : this.bloodGlucoseMaxMgDl,
      netCarbsEnabled: data.netCarbsEnabled.present
          ? data.netCarbsEnabled.value
          : this.netCarbsEnabled,
      stepBonusEnabled: data.stepBonusEnabled.present
          ? data.stepBonusEnabled.value
          : this.stepBonusEnabled,
      stepBonusPercent: data.stepBonusPercent.present
          ? data.stepBonusPercent.value
          : this.stepBonusPercent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConfigEntry(')
          ..write('id: $id, ')
          ..write('hasAcceptedDisclaimer: $hasAcceptedDisclaimer, ')
          ..write('hasAcceptedPolicy: $hasAcceptedPolicy, ')
          ..write(
              'hasAcceptedSendAnonymousData: $hasAcceptedSendAnonymousData, ')
          ..write('selectedAppTheme: $selectedAppTheme, ')
          ..write('usesImperialUnits: $usesImperialUnits, ')
          ..write('userKcalAdjustment: $userKcalAdjustment, ')
          ..write('userCarbGoalPct: $userCarbGoalPct, ')
          ..write('userProteinGoalPct: $userProteinGoalPct, ')
          ..write('userFatGoalPct: $userFatGoalPct, ')
          ..write('dailyWaterGoalMl: $dailyWaterGoalMl, ')
          ..write('tdeeMethod: $tdeeMethod, ')
          ..write('exerciseCalorieMode: $exerciseCalorieMode, ')
          ..write('exerciseCreditPercent: $exerciseCreditPercent, ')
          ..write('calorieCycleJson: $calorieCycleJson, ')
          ..write('calorieCyclingEnabled: $calorieCyclingEnabled, ')
          ..write('allergens: $allergens, ')
          ..write('bloodGlucoseMinMgDl: $bloodGlucoseMinMgDl, ')
          ..write('bloodGlucoseMaxMgDl: $bloodGlucoseMaxMgDl, ')
          ..write('netCarbsEnabled: $netCarbsEnabled, ')
          ..write('stepBonusEnabled: $stepBonusEnabled, ')
          ..write('stepBonusPercent: $stepBonusPercent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        hasAcceptedDisclaimer,
        hasAcceptedPolicy,
        hasAcceptedSendAnonymousData,
        selectedAppTheme,
        usesImperialUnits,
        userKcalAdjustment,
        userCarbGoalPct,
        userProteinGoalPct,
        userFatGoalPct,
        dailyWaterGoalMl,
        tdeeMethod,
        exerciseCalorieMode,
        exerciseCreditPercent,
        calorieCycleJson,
        calorieCyclingEnabled,
        allergens,
        bloodGlucoseMinMgDl,
        bloodGlucoseMaxMgDl,
        netCarbsEnabled,
        stepBonusEnabled,
        stepBonusPercent
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigEntry &&
          other.id == this.id &&
          other.hasAcceptedDisclaimer == this.hasAcceptedDisclaimer &&
          other.hasAcceptedPolicy == this.hasAcceptedPolicy &&
          other.hasAcceptedSendAnonymousData ==
              this.hasAcceptedSendAnonymousData &&
          other.selectedAppTheme == this.selectedAppTheme &&
          other.usesImperialUnits == this.usesImperialUnits &&
          other.userKcalAdjustment == this.userKcalAdjustment &&
          other.userCarbGoalPct == this.userCarbGoalPct &&
          other.userProteinGoalPct == this.userProteinGoalPct &&
          other.userFatGoalPct == this.userFatGoalPct &&
          other.dailyWaterGoalMl == this.dailyWaterGoalMl &&
          other.tdeeMethod == this.tdeeMethod &&
          other.exerciseCalorieMode == this.exerciseCalorieMode &&
          other.exerciseCreditPercent == this.exerciseCreditPercent &&
          other.calorieCycleJson == this.calorieCycleJson &&
          other.calorieCyclingEnabled == this.calorieCyclingEnabled &&
          other.allergens == this.allergens &&
          other.bloodGlucoseMinMgDl == this.bloodGlucoseMinMgDl &&
          other.bloodGlucoseMaxMgDl == this.bloodGlucoseMaxMgDl &&
          other.netCarbsEnabled == this.netCarbsEnabled &&
          other.stepBonusEnabled == this.stepBonusEnabled &&
          other.stepBonusPercent == this.stepBonusPercent);
}

class ConfigEntriesCompanion extends UpdateCompanion<ConfigEntry> {
  final Value<int> id;
  final Value<bool> hasAcceptedDisclaimer;
  final Value<bool> hasAcceptedPolicy;
  final Value<bool> hasAcceptedSendAnonymousData;
  final Value<String> selectedAppTheme;
  final Value<bool?> usesImperialUnits;
  final Value<double?> userKcalAdjustment;
  final Value<double?> userCarbGoalPct;
  final Value<double?> userProteinGoalPct;
  final Value<double?> userFatGoalPct;
  final Value<int?> dailyWaterGoalMl;
  final Value<String> tdeeMethod;
  final Value<String> exerciseCalorieMode;
  final Value<double> exerciseCreditPercent;
  final Value<String?> calorieCycleJson;
  final Value<int> calorieCyclingEnabled;
  final Value<String> allergens;
  final Value<int?> bloodGlucoseMinMgDl;
  final Value<int?> bloodGlucoseMaxMgDl;
  final Value<int> netCarbsEnabled;
  final Value<int> stepBonusEnabled;
  final Value<double> stepBonusPercent;
  const ConfigEntriesCompanion({
    this.id = const Value.absent(),
    this.hasAcceptedDisclaimer = const Value.absent(),
    this.hasAcceptedPolicy = const Value.absent(),
    this.hasAcceptedSendAnonymousData = const Value.absent(),
    this.selectedAppTheme = const Value.absent(),
    this.usesImperialUnits = const Value.absent(),
    this.userKcalAdjustment = const Value.absent(),
    this.userCarbGoalPct = const Value.absent(),
    this.userProteinGoalPct = const Value.absent(),
    this.userFatGoalPct = const Value.absent(),
    this.dailyWaterGoalMl = const Value.absent(),
    this.tdeeMethod = const Value.absent(),
    this.exerciseCalorieMode = const Value.absent(),
    this.exerciseCreditPercent = const Value.absent(),
    this.calorieCycleJson = const Value.absent(),
    this.calorieCyclingEnabled = const Value.absent(),
    this.allergens = const Value.absent(),
    this.bloodGlucoseMinMgDl = const Value.absent(),
    this.bloodGlucoseMaxMgDl = const Value.absent(),
    this.netCarbsEnabled = const Value.absent(),
    this.stepBonusEnabled = const Value.absent(),
    this.stepBonusPercent = const Value.absent(),
  });
  ConfigEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.hasAcceptedDisclaimer = const Value.absent(),
    this.hasAcceptedPolicy = const Value.absent(),
    this.hasAcceptedSendAnonymousData = const Value.absent(),
    this.selectedAppTheme = const Value.absent(),
    this.usesImperialUnits = const Value.absent(),
    this.userKcalAdjustment = const Value.absent(),
    this.userCarbGoalPct = const Value.absent(),
    this.userProteinGoalPct = const Value.absent(),
    this.userFatGoalPct = const Value.absent(),
    this.dailyWaterGoalMl = const Value.absent(),
    this.tdeeMethod = const Value.absent(),
    this.exerciseCalorieMode = const Value.absent(),
    this.exerciseCreditPercent = const Value.absent(),
    this.calorieCycleJson = const Value.absent(),
    this.calorieCyclingEnabled = const Value.absent(),
    this.allergens = const Value.absent(),
    this.bloodGlucoseMinMgDl = const Value.absent(),
    this.bloodGlucoseMaxMgDl = const Value.absent(),
    this.netCarbsEnabled = const Value.absent(),
    this.stepBonusEnabled = const Value.absent(),
    this.stepBonusPercent = const Value.absent(),
  });
  static Insertable<ConfigEntry> custom({
    Expression<int>? id,
    Expression<bool>? hasAcceptedDisclaimer,
    Expression<bool>? hasAcceptedPolicy,
    Expression<bool>? hasAcceptedSendAnonymousData,
    Expression<String>? selectedAppTheme,
    Expression<bool>? usesImperialUnits,
    Expression<double>? userKcalAdjustment,
    Expression<double>? userCarbGoalPct,
    Expression<double>? userProteinGoalPct,
    Expression<double>? userFatGoalPct,
    Expression<int>? dailyWaterGoalMl,
    Expression<String>? tdeeMethod,
    Expression<String>? exerciseCalorieMode,
    Expression<double>? exerciseCreditPercent,
    Expression<String>? calorieCycleJson,
    Expression<int>? calorieCyclingEnabled,
    Expression<String>? allergens,
    Expression<int>? bloodGlucoseMinMgDl,
    Expression<int>? bloodGlucoseMaxMgDl,
    Expression<int>? netCarbsEnabled,
    Expression<int>? stepBonusEnabled,
    Expression<double>? stepBonusPercent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hasAcceptedDisclaimer != null)
        'has_accepted_disclaimer': hasAcceptedDisclaimer,
      if (hasAcceptedPolicy != null) 'has_accepted_policy': hasAcceptedPolicy,
      if (hasAcceptedSendAnonymousData != null)
        'has_accepted_send_anonymous_data': hasAcceptedSendAnonymousData,
      if (selectedAppTheme != null) 'selected_app_theme': selectedAppTheme,
      if (usesImperialUnits != null) 'uses_imperial_units': usesImperialUnits,
      if (userKcalAdjustment != null)
        'user_kcal_adjustment': userKcalAdjustment,
      if (userCarbGoalPct != null) 'user_carb_goal_pct': userCarbGoalPct,
      if (userProteinGoalPct != null)
        'user_protein_goal_pct': userProteinGoalPct,
      if (userFatGoalPct != null) 'user_fat_goal_pct': userFatGoalPct,
      if (dailyWaterGoalMl != null) 'daily_water_goal_ml': dailyWaterGoalMl,
      if (tdeeMethod != null) 'tdee_method': tdeeMethod,
      if (exerciseCalorieMode != null)
        'exercise_calorie_mode': exerciseCalorieMode,
      if (exerciseCreditPercent != null)
        'exercise_credit_percent': exerciseCreditPercent,
      if (calorieCycleJson != null) 'calorie_cycle_json': calorieCycleJson,
      if (calorieCyclingEnabled != null)
        'calorie_cycling_enabled': calorieCyclingEnabled,
      if (allergens != null) 'allergens': allergens,
      if (bloodGlucoseMinMgDl != null)
        'blood_glucose_min_mg_dl': bloodGlucoseMinMgDl,
      if (bloodGlucoseMaxMgDl != null)
        'blood_glucose_max_mg_dl': bloodGlucoseMaxMgDl,
      if (netCarbsEnabled != null) 'net_carbs_enabled': netCarbsEnabled,
      if (stepBonusEnabled != null) 'step_bonus_enabled': stepBonusEnabled,
      if (stepBonusPercent != null) 'step_bonus_percent': stepBonusPercent,
    });
  }

  ConfigEntriesCompanion copyWith(
      {Value<int>? id,
      Value<bool>? hasAcceptedDisclaimer,
      Value<bool>? hasAcceptedPolicy,
      Value<bool>? hasAcceptedSendAnonymousData,
      Value<String>? selectedAppTheme,
      Value<bool?>? usesImperialUnits,
      Value<double?>? userKcalAdjustment,
      Value<double?>? userCarbGoalPct,
      Value<double?>? userProteinGoalPct,
      Value<double?>? userFatGoalPct,
      Value<int?>? dailyWaterGoalMl,
      Value<String>? tdeeMethod,
      Value<String>? exerciseCalorieMode,
      Value<double>? exerciseCreditPercent,
      Value<String?>? calorieCycleJson,
      Value<int>? calorieCyclingEnabled,
      Value<String>? allergens,
      Value<int?>? bloodGlucoseMinMgDl,
      Value<int?>? bloodGlucoseMaxMgDl,
      Value<int>? netCarbsEnabled,
      Value<int>? stepBonusEnabled,
      Value<double>? stepBonusPercent}) {
    return ConfigEntriesCompanion(
      id: id ?? this.id,
      hasAcceptedDisclaimer:
          hasAcceptedDisclaimer ?? this.hasAcceptedDisclaimer,
      hasAcceptedPolicy: hasAcceptedPolicy ?? this.hasAcceptedPolicy,
      hasAcceptedSendAnonymousData:
          hasAcceptedSendAnonymousData ?? this.hasAcceptedSendAnonymousData,
      selectedAppTheme: selectedAppTheme ?? this.selectedAppTheme,
      usesImperialUnits: usesImperialUnits ?? this.usesImperialUnits,
      userKcalAdjustment: userKcalAdjustment ?? this.userKcalAdjustment,
      userCarbGoalPct: userCarbGoalPct ?? this.userCarbGoalPct,
      userProteinGoalPct: userProteinGoalPct ?? this.userProteinGoalPct,
      userFatGoalPct: userFatGoalPct ?? this.userFatGoalPct,
      dailyWaterGoalMl: dailyWaterGoalMl ?? this.dailyWaterGoalMl,
      tdeeMethod: tdeeMethod ?? this.tdeeMethod,
      exerciseCalorieMode: exerciseCalorieMode ?? this.exerciseCalorieMode,
      exerciseCreditPercent:
          exerciseCreditPercent ?? this.exerciseCreditPercent,
      calorieCycleJson: calorieCycleJson ?? this.calorieCycleJson,
      calorieCyclingEnabled:
          calorieCyclingEnabled ?? this.calorieCyclingEnabled,
      allergens: allergens ?? this.allergens,
      bloodGlucoseMinMgDl: bloodGlucoseMinMgDl ?? this.bloodGlucoseMinMgDl,
      bloodGlucoseMaxMgDl: bloodGlucoseMaxMgDl ?? this.bloodGlucoseMaxMgDl,
      netCarbsEnabled: netCarbsEnabled ?? this.netCarbsEnabled,
      stepBonusEnabled: stepBonusEnabled ?? this.stepBonusEnabled,
      stepBonusPercent: stepBonusPercent ?? this.stepBonusPercent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hasAcceptedDisclaimer.present) {
      map['has_accepted_disclaimer'] =
          Variable<bool>(hasAcceptedDisclaimer.value);
    }
    if (hasAcceptedPolicy.present) {
      map['has_accepted_policy'] = Variable<bool>(hasAcceptedPolicy.value);
    }
    if (hasAcceptedSendAnonymousData.present) {
      map['has_accepted_send_anonymous_data'] =
          Variable<bool>(hasAcceptedSendAnonymousData.value);
    }
    if (selectedAppTheme.present) {
      map['selected_app_theme'] = Variable<String>(selectedAppTheme.value);
    }
    if (usesImperialUnits.present) {
      map['uses_imperial_units'] = Variable<bool>(usesImperialUnits.value);
    }
    if (userKcalAdjustment.present) {
      map['user_kcal_adjustment'] = Variable<double>(userKcalAdjustment.value);
    }
    if (userCarbGoalPct.present) {
      map['user_carb_goal_pct'] = Variable<double>(userCarbGoalPct.value);
    }
    if (userProteinGoalPct.present) {
      map['user_protein_goal_pct'] = Variable<double>(userProteinGoalPct.value);
    }
    if (userFatGoalPct.present) {
      map['user_fat_goal_pct'] = Variable<double>(userFatGoalPct.value);
    }
    if (dailyWaterGoalMl.present) {
      map['daily_water_goal_ml'] = Variable<int>(dailyWaterGoalMl.value);
    }
    if (tdeeMethod.present) {
      map['tdee_method'] = Variable<String>(tdeeMethod.value);
    }
    if (exerciseCalorieMode.present) {
      map['exercise_calorie_mode'] =
          Variable<String>(exerciseCalorieMode.value);
    }
    if (exerciseCreditPercent.present) {
      map['exercise_credit_percent'] =
          Variable<double>(exerciseCreditPercent.value);
    }
    if (calorieCycleJson.present) {
      map['calorie_cycle_json'] = Variable<String>(calorieCycleJson.value);
    }
    if (calorieCyclingEnabled.present) {
      map['calorie_cycling_enabled'] =
          Variable<int>(calorieCyclingEnabled.value);
    }
    if (allergens.present) {
      map['allergens'] = Variable<String>(allergens.value);
    }
    if (bloodGlucoseMinMgDl.present) {
      map['blood_glucose_min_mg_dl'] = Variable<int>(bloodGlucoseMinMgDl.value);
    }
    if (bloodGlucoseMaxMgDl.present) {
      map['blood_glucose_max_mg_dl'] = Variable<int>(bloodGlucoseMaxMgDl.value);
    }
    if (netCarbsEnabled.present) {
      map['net_carbs_enabled'] = Variable<int>(netCarbsEnabled.value);
    }
    if (stepBonusEnabled.present) {
      map['step_bonus_enabled'] = Variable<int>(stepBonusEnabled.value);
    }
    if (stepBonusPercent.present) {
      map['step_bonus_percent'] = Variable<double>(stepBonusPercent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigEntriesCompanion(')
          ..write('id: $id, ')
          ..write('hasAcceptedDisclaimer: $hasAcceptedDisclaimer, ')
          ..write('hasAcceptedPolicy: $hasAcceptedPolicy, ')
          ..write(
              'hasAcceptedSendAnonymousData: $hasAcceptedSendAnonymousData, ')
          ..write('selectedAppTheme: $selectedAppTheme, ')
          ..write('usesImperialUnits: $usesImperialUnits, ')
          ..write('userKcalAdjustment: $userKcalAdjustment, ')
          ..write('userCarbGoalPct: $userCarbGoalPct, ')
          ..write('userProteinGoalPct: $userProteinGoalPct, ')
          ..write('userFatGoalPct: $userFatGoalPct, ')
          ..write('dailyWaterGoalMl: $dailyWaterGoalMl, ')
          ..write('tdeeMethod: $tdeeMethod, ')
          ..write('exerciseCalorieMode: $exerciseCalorieMode, ')
          ..write('exerciseCreditPercent: $exerciseCreditPercent, ')
          ..write('calorieCycleJson: $calorieCycleJson, ')
          ..write('calorieCyclingEnabled: $calorieCyclingEnabled, ')
          ..write('allergens: $allergens, ')
          ..write('bloodGlucoseMinMgDl: $bloodGlucoseMinMgDl, ')
          ..write('bloodGlucoseMaxMgDl: $bloodGlucoseMaxMgDl, ')
          ..write('netCarbsEnabled: $netCarbsEnabled, ')
          ..write('stepBonusEnabled: $stepBonusEnabled, ')
          ..write('stepBonusPercent: $stepBonusPercent')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _birthdayMeta =
      const VerificationMeta('birthday');
  @override
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
      'birthday', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _heightCMMeta =
      const VerificationMeta('heightCM');
  @override
  late final GeneratedColumn<double> heightCM = GeneratedColumn<double>(
      'height_c_m', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _weightKGMeta =
      const VerificationMeta('weightKG');
  @override
  late final GeneratedColumn<double> weightKG = GeneratedColumn<double>(
      'weight_k_g', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _goalMeta = const VerificationMeta('goal');
  @override
  late final GeneratedColumn<String> goal = GeneratedColumn<String>(
      'goal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _palMeta = const VerificationMeta('pal');
  @override
  late final GeneratedColumn<String> pal = GeneratedColumn<String>(
      'pal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, birthday, heightCM, weightKG, gender, goal, pal];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    if (data.containsKey('height_c_m')) {
      context.handle(_heightCMMeta,
          heightCM.isAcceptableOrUnknown(data['height_c_m']!, _heightCMMeta));
    } else if (isInserting) {
      context.missing(_heightCMMeta);
    }
    if (data.containsKey('weight_k_g')) {
      context.handle(_weightKGMeta,
          weightKG.isAcceptableOrUnknown(data['weight_k_g']!, _weightKGMeta));
    } else if (isInserting) {
      context.missing(_weightKGMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('goal')) {
      context.handle(
          _goalMeta, goal.isAcceptableOrUnknown(data['goal']!, _goalMeta));
    } else if (isInserting) {
      context.missing(_goalMeta);
    }
    if (data.containsKey('pal')) {
      context.handle(
          _palMeta, pal.isAcceptableOrUnknown(data['pal']!, _palMeta));
    } else if (isInserting) {
      context.missing(_palMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      birthday: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birthday'])!,
      heightCM: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height_c_m'])!,
      weightKG: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_k_g'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      goal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal'])!,
      pal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pal'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final DateTime birthday;
  final double heightCM;
  final double weightKG;
  final String gender;
  final String goal;
  final String pal;
  const User(
      {required this.id,
      required this.birthday,
      required this.heightCM,
      required this.weightKG,
      required this.gender,
      required this.goal,
      required this.pal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['birthday'] = Variable<DateTime>(birthday);
    map['height_c_m'] = Variable<double>(heightCM);
    map['weight_k_g'] = Variable<double>(weightKG);
    map['gender'] = Variable<String>(gender);
    map['goal'] = Variable<String>(goal);
    map['pal'] = Variable<String>(pal);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      birthday: Value(birthday),
      heightCM: Value(heightCM),
      weightKG: Value(weightKG),
      gender: Value(gender),
      goal: Value(goal),
      pal: Value(pal),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
      heightCM: serializer.fromJson<double>(json['heightCM']),
      weightKG: serializer.fromJson<double>(json['weightKG']),
      gender: serializer.fromJson<String>(json['gender']),
      goal: serializer.fromJson<String>(json['goal']),
      pal: serializer.fromJson<String>(json['pal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'birthday': serializer.toJson<DateTime>(birthday),
      'heightCM': serializer.toJson<double>(heightCM),
      'weightKG': serializer.toJson<double>(weightKG),
      'gender': serializer.toJson<String>(gender),
      'goal': serializer.toJson<String>(goal),
      'pal': serializer.toJson<String>(pal),
    };
  }

  User copyWith(
          {int? id,
          DateTime? birthday,
          double? heightCM,
          double? weightKG,
          String? gender,
          String? goal,
          String? pal}) =>
      User(
        id: id ?? this.id,
        birthday: birthday ?? this.birthday,
        heightCM: heightCM ?? this.heightCM,
        weightKG: weightKG ?? this.weightKG,
        gender: gender ?? this.gender,
        goal: goal ?? this.goal,
        pal: pal ?? this.pal,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      birthday: data.birthday.present ? data.birthday.value : this.birthday,
      heightCM: data.heightCM.present ? data.heightCM.value : this.heightCM,
      weightKG: data.weightKG.present ? data.weightKG.value : this.weightKG,
      gender: data.gender.present ? data.gender.value : this.gender,
      goal: data.goal.present ? data.goal.value : this.goal,
      pal: data.pal.present ? data.pal.value : this.pal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('birthday: $birthday, ')
          ..write('heightCM: $heightCM, ')
          ..write('weightKG: $weightKG, ')
          ..write('gender: $gender, ')
          ..write('goal: $goal, ')
          ..write('pal: $pal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, birthday, heightCM, weightKG, gender, goal, pal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.birthday == this.birthday &&
          other.heightCM == this.heightCM &&
          other.weightKG == this.weightKG &&
          other.gender == this.gender &&
          other.goal == this.goal &&
          other.pal == this.pal);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<DateTime> birthday;
  final Value<double> heightCM;
  final Value<double> weightKG;
  final Value<String> gender;
  final Value<String> goal;
  final Value<String> pal;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.birthday = const Value.absent(),
    this.heightCM = const Value.absent(),
    this.weightKG = const Value.absent(),
    this.gender = const Value.absent(),
    this.goal = const Value.absent(),
    this.pal = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required DateTime birthday,
    required double heightCM,
    required double weightKG,
    required String gender,
    required String goal,
    required String pal,
  })  : birthday = Value(birthday),
        heightCM = Value(heightCM),
        weightKG = Value(weightKG),
        gender = Value(gender),
        goal = Value(goal),
        pal = Value(pal);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<DateTime>? birthday,
    Expression<double>? heightCM,
    Expression<double>? weightKG,
    Expression<String>? gender,
    Expression<String>? goal,
    Expression<String>? pal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (birthday != null) 'birthday': birthday,
      if (heightCM != null) 'height_c_m': heightCM,
      if (weightKG != null) 'weight_k_g': weightKG,
      if (gender != null) 'gender': gender,
      if (goal != null) 'goal': goal,
      if (pal != null) 'pal': pal,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? birthday,
      Value<double>? heightCM,
      Value<double>? weightKG,
      Value<String>? gender,
      Value<String>? goal,
      Value<String>? pal}) {
    return UsersCompanion(
      id: id ?? this.id,
      birthday: birthday ?? this.birthday,
      heightCM: heightCM ?? this.heightCM,
      weightKG: weightKG ?? this.weightKG,
      gender: gender ?? this.gender,
      goal: goal ?? this.goal,
      pal: pal ?? this.pal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (heightCM.present) {
      map['height_c_m'] = Variable<double>(heightCM.value);
    }
    if (weightKG.present) {
      map['weight_k_g'] = Variable<double>(weightKG.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String>(goal.value);
    }
    if (pal.present) {
      map['pal'] = Variable<String>(pal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('birthday: $birthday, ')
          ..write('heightCM: $heightCM, ')
          ..write('weightKG: $weightKG, ')
          ..write('gender: $gender, ')
          ..write('goal: $goal, ')
          ..write('pal: $pal')
          ..write(')'))
        .toString();
  }
}

class $IntakesTable extends Intakes with TableInfo<$IntakesTable, Intake> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IntakesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  @override
  late final GeneratedColumn<String> mealId = GeneratedColumn<String>(
      'meal_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timeMinutesMeta =
      const VerificationMeta('timeMinutes');
  @override
  late final GeneratedColumn<int> timeMinutes = GeneratedColumn<int>(
      'time_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, unit, amount, type, mealId, date, timeMinutes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'intakes';
  @override
  VerificationContext validateIntegrity(Insertable<Intake> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('meal_id')) {
      context.handle(_mealIdMeta,
          mealId.isAcceptableOrUnknown(data['meal_id']!, _mealIdMeta));
    } else if (isInserting) {
      context.missing(_mealIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('time_minutes')) {
      context.handle(
          _timeMinutesMeta,
          timeMinutes.isAcceptableOrUnknown(
              data['time_minutes']!, _timeMinutesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Intake map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Intake(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      mealId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      timeMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_minutes']),
    );
  }

  @override
  $IntakesTable createAlias(String alias) {
    return $IntakesTable(attachedDatabase, alias);
  }
}

class Intake extends DataClass implements Insertable<Intake> {
  final String id;
  final String unit;
  final double amount;
  final String type;
  final String mealId;
  final DateTime date;
  final int? timeMinutes;
  const Intake(
      {required this.id,
      required this.unit,
      required this.amount,
      required this.type,
      required this.mealId,
      required this.date,
      this.timeMinutes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['unit'] = Variable<String>(unit);
    map['amount'] = Variable<double>(amount);
    map['type'] = Variable<String>(type);
    map['meal_id'] = Variable<String>(mealId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || timeMinutes != null) {
      map['time_minutes'] = Variable<int>(timeMinutes);
    }
    return map;
  }

  IntakesCompanion toCompanion(bool nullToAbsent) {
    return IntakesCompanion(
      id: Value(id),
      unit: Value(unit),
      amount: Value(amount),
      type: Value(type),
      mealId: Value(mealId),
      date: Value(date),
      timeMinutes: timeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(timeMinutes),
    );
  }

  factory Intake.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Intake(
      id: serializer.fromJson<String>(json['id']),
      unit: serializer.fromJson<String>(json['unit']),
      amount: serializer.fromJson<double>(json['amount']),
      type: serializer.fromJson<String>(json['type']),
      mealId: serializer.fromJson<String>(json['mealId']),
      date: serializer.fromJson<DateTime>(json['date']),
      timeMinutes: serializer.fromJson<int?>(json['timeMinutes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'unit': serializer.toJson<String>(unit),
      'amount': serializer.toJson<double>(amount),
      'type': serializer.toJson<String>(type),
      'mealId': serializer.toJson<String>(mealId),
      'date': serializer.toJson<DateTime>(date),
      'timeMinutes': serializer.toJson<int?>(timeMinutes),
    };
  }

  Intake copyWith(
          {String? id,
          String? unit,
          double? amount,
          String? type,
          String? mealId,
          DateTime? date,
          Value<int?> timeMinutes = const Value.absent()}) =>
      Intake(
        id: id ?? this.id,
        unit: unit ?? this.unit,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        mealId: mealId ?? this.mealId,
        date: date ?? this.date,
        timeMinutes: timeMinutes.present ? timeMinutes.value : this.timeMinutes,
      );
  Intake copyWithCompanion(IntakesCompanion data) {
    return Intake(
      id: data.id.present ? data.id.value : this.id,
      unit: data.unit.present ? data.unit.value : this.unit,
      amount: data.amount.present ? data.amount.value : this.amount,
      type: data.type.present ? data.type.value : this.type,
      mealId: data.mealId.present ? data.mealId.value : this.mealId,
      date: data.date.present ? data.date.value : this.date,
      timeMinutes:
          data.timeMinutes.present ? data.timeMinutes.value : this.timeMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Intake(')
          ..write('id: $id, ')
          ..write('unit: $unit, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('mealId: $mealId, ')
          ..write('date: $date, ')
          ..write('timeMinutes: $timeMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, unit, amount, type, mealId, date, timeMinutes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Intake &&
          other.id == this.id &&
          other.unit == this.unit &&
          other.amount == this.amount &&
          other.type == this.type &&
          other.mealId == this.mealId &&
          other.date == this.date &&
          other.timeMinutes == this.timeMinutes);
}

class IntakesCompanion extends UpdateCompanion<Intake> {
  final Value<String> id;
  final Value<String> unit;
  final Value<double> amount;
  final Value<String> type;
  final Value<String> mealId;
  final Value<DateTime> date;
  final Value<int?> timeMinutes;
  final Value<int> rowid;
  const IntakesCompanion({
    this.id = const Value.absent(),
    this.unit = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.mealId = const Value.absent(),
    this.date = const Value.absent(),
    this.timeMinutes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IntakesCompanion.insert({
    required String id,
    required String unit,
    required double amount,
    required String type,
    required String mealId,
    required DateTime date,
    this.timeMinutes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        unit = Value(unit),
        amount = Value(amount),
        type = Value(type),
        mealId = Value(mealId),
        date = Value(date);
  static Insertable<Intake> custom({
    Expression<String>? id,
    Expression<String>? unit,
    Expression<double>? amount,
    Expression<String>? type,
    Expression<String>? mealId,
    Expression<DateTime>? date,
    Expression<int>? timeMinutes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unit != null) 'unit': unit,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (mealId != null) 'meal_id': mealId,
      if (date != null) 'date': date,
      if (timeMinutes != null) 'time_minutes': timeMinutes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IntakesCompanion copyWith(
      {Value<String>? id,
      Value<String>? unit,
      Value<double>? amount,
      Value<String>? type,
      Value<String>? mealId,
      Value<DateTime>? date,
      Value<int?>? timeMinutes,
      Value<int>? rowid}) {
    return IntakesCompanion(
      id: id ?? this.id,
      unit: unit ?? this.unit,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      mealId: mealId ?? this.mealId,
      date: date ?? this.date,
      timeMinutes: timeMinutes ?? this.timeMinutes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (mealId.present) {
      map['meal_id'] = Variable<String>(mealId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (timeMinutes.present) {
      map['time_minutes'] = Variable<int>(timeMinutes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IntakesCompanion(')
          ..write('id: $id, ')
          ..write('unit: $unit, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('mealId: $mealId, ')
          ..write('date: $date, ')
          ..write('timeMinutes: $timeMinutes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _brandsMeta = const VerificationMeta('brands');
  @override
  late final GeneratedColumn<String> brands = GeneratedColumn<String>(
      'brands', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailImageUrlMeta =
      const VerificationMeta('thumbnailImageUrl');
  @override
  late final GeneratedColumn<String> thumbnailImageUrl =
      GeneratedColumn<String>('thumbnail_image_url', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mainImageUrlMeta =
      const VerificationMeta('mainImageUrl');
  @override
  late final GeneratedColumn<String> mainImageUrl = GeneratedColumn<String>(
      'main_image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mealQuantityMeta =
      const VerificationMeta('mealQuantity');
  @override
  late final GeneratedColumn<String> mealQuantity = GeneratedColumn<String>(
      'meal_quantity', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mealUnitMeta =
      const VerificationMeta('mealUnit');
  @override
  late final GeneratedColumn<String> mealUnit = GeneratedColumn<String>(
      'meal_unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingQuantityMeta =
      const VerificationMeta('servingQuantity');
  @override
  late final GeneratedColumn<double> servingQuantity = GeneratedColumn<double>(
      'serving_quantity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _servingUnitMeta =
      const VerificationMeta('servingUnit');
  @override
  late final GeneratedColumn<String> servingUnit = GeneratedColumn<String>(
      'serving_unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingSizeMeta =
      const VerificationMeta('servingSize');
  @override
  late final GeneratedColumn<String> servingSize = GeneratedColumn<String>(
      'serving_size', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('unknown'));
  static const VerificationMeta _energyKcal100Meta =
      const VerificationMeta('energyKcal100');
  @override
  late final GeneratedColumn<double> energyKcal100 = GeneratedColumn<double>(
      'energy_kcal100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _carbohydrates100Meta =
      const VerificationMeta('carbohydrates100');
  @override
  late final GeneratedColumn<double> carbohydrates100 = GeneratedColumn<double>(
      'carbohydrates100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fat100Meta = const VerificationMeta('fat100');
  @override
  late final GeneratedColumn<double> fat100 = GeneratedColumn<double>(
      'fat100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _proteins100Meta =
      const VerificationMeta('proteins100');
  @override
  late final GeneratedColumn<double> proteins100 = GeneratedColumn<double>(
      'proteins100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sugars100Meta =
      const VerificationMeta('sugars100');
  @override
  late final GeneratedColumn<double> sugars100 = GeneratedColumn<double>(
      'sugars100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _saturatedFat100Meta =
      const VerificationMeta('saturatedFat100');
  @override
  late final GeneratedColumn<double> saturatedFat100 = GeneratedColumn<double>(
      'saturated_fat100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fiber100Meta =
      const VerificationMeta('fiber100');
  @override
  late final GeneratedColumn<double> fiber100 = GeneratedColumn<double>(
      'fiber100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sodium100Meta =
      const VerificationMeta('sodium100');
  @override
  late final GeneratedColumn<double> sodium100 = GeneratedColumn<double>(
      'sodium100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _potassium100Meta =
      const VerificationMeta('potassium100');
  @override
  late final GeneratedColumn<double> potassium100 = GeneratedColumn<double>(
      'potassium100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cholesterol100Meta =
      const VerificationMeta('cholesterol100');
  @override
  late final GeneratedColumn<double> cholesterol100 = GeneratedColumn<double>(
      'cholesterol100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminA100Meta =
      const VerificationMeta('vitaminA100');
  @override
  late final GeneratedColumn<double> vitaminA100 = GeneratedColumn<double>(
      'vitamin_a100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminC100Meta =
      const VerificationMeta('vitaminC100');
  @override
  late final GeneratedColumn<double> vitaminC100 = GeneratedColumn<double>(
      'vitamin_c100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _vitaminD100Meta =
      const VerificationMeta('vitaminD100');
  @override
  late final GeneratedColumn<double> vitaminD100 = GeneratedColumn<double>(
      'vitamin_d100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _calcium100Meta =
      const VerificationMeta('calcium100');
  @override
  late final GeneratedColumn<double> calcium100 = GeneratedColumn<double>(
      'calcium100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _iron100Meta =
      const VerificationMeta('iron100');
  @override
  late final GeneratedColumn<double> iron100 = GeneratedColumn<double>(
      'iron100', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        name,
        brands,
        thumbnailImageUrl,
        mainImageUrl,
        url,
        mealQuantity,
        mealUnit,
        servingQuantity,
        servingUnit,
        servingSize,
        source,
        energyKcal100,
        carbohydrates100,
        fat100,
        proteins100,
        sugars100,
        saturatedFat100,
        fiber100,
        sodium100,
        potassium100,
        cholesterol100,
        vitaminA100,
        vitaminC100,
        vitaminD100,
        calcium100,
        iron100
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meals';
  @override
  VerificationContext validateIntegrity(Insertable<Meal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('brands')) {
      context.handle(_brandsMeta,
          brands.isAcceptableOrUnknown(data['brands']!, _brandsMeta));
    }
    if (data.containsKey('thumbnail_image_url')) {
      context.handle(
          _thumbnailImageUrlMeta,
          thumbnailImageUrl.isAcceptableOrUnknown(
              data['thumbnail_image_url']!, _thumbnailImageUrlMeta));
    }
    if (data.containsKey('main_image_url')) {
      context.handle(
          _mainImageUrlMeta,
          mainImageUrl.isAcceptableOrUnknown(
              data['main_image_url']!, _mainImageUrlMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('meal_quantity')) {
      context.handle(
          _mealQuantityMeta,
          mealQuantity.isAcceptableOrUnknown(
              data['meal_quantity']!, _mealQuantityMeta));
    }
    if (data.containsKey('meal_unit')) {
      context.handle(_mealUnitMeta,
          mealUnit.isAcceptableOrUnknown(data['meal_unit']!, _mealUnitMeta));
    }
    if (data.containsKey('serving_quantity')) {
      context.handle(
          _servingQuantityMeta,
          servingQuantity.isAcceptableOrUnknown(
              data['serving_quantity']!, _servingQuantityMeta));
    }
    if (data.containsKey('serving_unit')) {
      context.handle(
          _servingUnitMeta,
          servingUnit.isAcceptableOrUnknown(
              data['serving_unit']!, _servingUnitMeta));
    }
    if (data.containsKey('serving_size')) {
      context.handle(
          _servingSizeMeta,
          servingSize.isAcceptableOrUnknown(
              data['serving_size']!, _servingSizeMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('energy_kcal100')) {
      context.handle(
          _energyKcal100Meta,
          energyKcal100.isAcceptableOrUnknown(
              data['energy_kcal100']!, _energyKcal100Meta));
    }
    if (data.containsKey('carbohydrates100')) {
      context.handle(
          _carbohydrates100Meta,
          carbohydrates100.isAcceptableOrUnknown(
              data['carbohydrates100']!, _carbohydrates100Meta));
    }
    if (data.containsKey('fat100')) {
      context.handle(_fat100Meta,
          fat100.isAcceptableOrUnknown(data['fat100']!, _fat100Meta));
    }
    if (data.containsKey('proteins100')) {
      context.handle(
          _proteins100Meta,
          proteins100.isAcceptableOrUnknown(
              data['proteins100']!, _proteins100Meta));
    }
    if (data.containsKey('sugars100')) {
      context.handle(_sugars100Meta,
          sugars100.isAcceptableOrUnknown(data['sugars100']!, _sugars100Meta));
    }
    if (data.containsKey('saturated_fat100')) {
      context.handle(
          _saturatedFat100Meta,
          saturatedFat100.isAcceptableOrUnknown(
              data['saturated_fat100']!, _saturatedFat100Meta));
    }
    if (data.containsKey('fiber100')) {
      context.handle(_fiber100Meta,
          fiber100.isAcceptableOrUnknown(data['fiber100']!, _fiber100Meta));
    }
    if (data.containsKey('sodium100')) {
      context.handle(_sodium100Meta,
          sodium100.isAcceptableOrUnknown(data['sodium100']!, _sodium100Meta));
    }
    if (data.containsKey('potassium100')) {
      context.handle(
          _potassium100Meta,
          potassium100.isAcceptableOrUnknown(
              data['potassium100']!, _potassium100Meta));
    }
    if (data.containsKey('cholesterol100')) {
      context.handle(
          _cholesterol100Meta,
          cholesterol100.isAcceptableOrUnknown(
              data['cholesterol100']!, _cholesterol100Meta));
    }
    if (data.containsKey('vitamin_a100')) {
      context.handle(
          _vitaminA100Meta,
          vitaminA100.isAcceptableOrUnknown(
              data['vitamin_a100']!, _vitaminA100Meta));
    }
    if (data.containsKey('vitamin_c100')) {
      context.handle(
          _vitaminC100Meta,
          vitaminC100.isAcceptableOrUnknown(
              data['vitamin_c100']!, _vitaminC100Meta));
    }
    if (data.containsKey('vitamin_d100')) {
      context.handle(
          _vitaminD100Meta,
          vitaminD100.isAcceptableOrUnknown(
              data['vitamin_d100']!, _vitaminD100Meta));
    }
    if (data.containsKey('calcium100')) {
      context.handle(
          _calcium100Meta,
          calcium100.isAcceptableOrUnknown(
              data['calcium100']!, _calcium100Meta));
    }
    if (data.containsKey('iron100')) {
      context.handle(_iron100Meta,
          iron100.isAcceptableOrUnknown(data['iron100']!, _iron100Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      brands: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brands']),
      thumbnailImageUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}thumbnail_image_url']),
      mainImageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_image_url']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      mealQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_quantity']),
      mealUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_unit']),
      servingQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}serving_quantity']),
      servingUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serving_unit']),
      servingSize: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serving_size']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      energyKcal100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}energy_kcal100']),
      carbohydrates100: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}carbohydrates100']),
      fat100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat100']),
      proteins100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}proteins100']),
      sugars100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sugars100']),
      saturatedFat100: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}saturated_fat100']),
      fiber100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fiber100']),
      sodium100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sodium100']),
      potassium100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}potassium100']),
      cholesterol100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cholesterol100']),
      vitaminA100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_a100']),
      vitaminC100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_c100']),
      vitaminD100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vitamin_d100']),
      calcium100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calcium100']),
      iron100: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}iron100']),
    );
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(attachedDatabase, alias);
  }
}

class Meal extends DataClass implements Insertable<Meal> {
  final String id;
  final String? code;
  final String? name;
  final String? brands;
  final String? thumbnailImageUrl;
  final String? mainImageUrl;
  final String? url;
  final String? mealQuantity;
  final String? mealUnit;
  final double? servingQuantity;
  final String? servingUnit;
  final String? servingSize;
  final String source;
  final double? energyKcal100;
  final double? carbohydrates100;
  final double? fat100;
  final double? proteins100;
  final double? sugars100;
  final double? saturatedFat100;
  final double? fiber100;
  final double? sodium100;
  final double? potassium100;
  final double? cholesterol100;
  final double? vitaminA100;
  final double? vitaminC100;
  final double? vitaminD100;
  final double? calcium100;
  final double? iron100;
  const Meal(
      {required this.id,
      this.code,
      this.name,
      this.brands,
      this.thumbnailImageUrl,
      this.mainImageUrl,
      this.url,
      this.mealQuantity,
      this.mealUnit,
      this.servingQuantity,
      this.servingUnit,
      this.servingSize,
      required this.source,
      this.energyKcal100,
      this.carbohydrates100,
      this.fat100,
      this.proteins100,
      this.sugars100,
      this.saturatedFat100,
      this.fiber100,
      this.sodium100,
      this.potassium100,
      this.cholesterol100,
      this.vitaminA100,
      this.vitaminC100,
      this.vitaminD100,
      this.calcium100,
      this.iron100});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || brands != null) {
      map['brands'] = Variable<String>(brands);
    }
    if (!nullToAbsent || thumbnailImageUrl != null) {
      map['thumbnail_image_url'] = Variable<String>(thumbnailImageUrl);
    }
    if (!nullToAbsent || mainImageUrl != null) {
      map['main_image_url'] = Variable<String>(mainImageUrl);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || mealQuantity != null) {
      map['meal_quantity'] = Variable<String>(mealQuantity);
    }
    if (!nullToAbsent || mealUnit != null) {
      map['meal_unit'] = Variable<String>(mealUnit);
    }
    if (!nullToAbsent || servingQuantity != null) {
      map['serving_quantity'] = Variable<double>(servingQuantity);
    }
    if (!nullToAbsent || servingUnit != null) {
      map['serving_unit'] = Variable<String>(servingUnit);
    }
    if (!nullToAbsent || servingSize != null) {
      map['serving_size'] = Variable<String>(servingSize);
    }
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || energyKcal100 != null) {
      map['energy_kcal100'] = Variable<double>(energyKcal100);
    }
    if (!nullToAbsent || carbohydrates100 != null) {
      map['carbohydrates100'] = Variable<double>(carbohydrates100);
    }
    if (!nullToAbsent || fat100 != null) {
      map['fat100'] = Variable<double>(fat100);
    }
    if (!nullToAbsent || proteins100 != null) {
      map['proteins100'] = Variable<double>(proteins100);
    }
    if (!nullToAbsent || sugars100 != null) {
      map['sugars100'] = Variable<double>(sugars100);
    }
    if (!nullToAbsent || saturatedFat100 != null) {
      map['saturated_fat100'] = Variable<double>(saturatedFat100);
    }
    if (!nullToAbsent || fiber100 != null) {
      map['fiber100'] = Variable<double>(fiber100);
    }
    if (!nullToAbsent || sodium100 != null) {
      map['sodium100'] = Variable<double>(sodium100);
    }
    if (!nullToAbsent || potassium100 != null) {
      map['potassium100'] = Variable<double>(potassium100);
    }
    if (!nullToAbsent || cholesterol100 != null) {
      map['cholesterol100'] = Variable<double>(cholesterol100);
    }
    if (!nullToAbsent || vitaminA100 != null) {
      map['vitamin_a100'] = Variable<double>(vitaminA100);
    }
    if (!nullToAbsent || vitaminC100 != null) {
      map['vitamin_c100'] = Variable<double>(vitaminC100);
    }
    if (!nullToAbsent || vitaminD100 != null) {
      map['vitamin_d100'] = Variable<double>(vitaminD100);
    }
    if (!nullToAbsent || calcium100 != null) {
      map['calcium100'] = Variable<double>(calcium100);
    }
    if (!nullToAbsent || iron100 != null) {
      map['iron100'] = Variable<double>(iron100);
    }
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      id: Value(id),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      brands:
          brands == null && nullToAbsent ? const Value.absent() : Value(brands),
      thumbnailImageUrl: thumbnailImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailImageUrl),
      mainImageUrl: mainImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(mainImageUrl),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      mealQuantity: mealQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(mealQuantity),
      mealUnit: mealUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(mealUnit),
      servingQuantity: servingQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(servingQuantity),
      servingUnit: servingUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(servingUnit),
      servingSize: servingSize == null && nullToAbsent
          ? const Value.absent()
          : Value(servingSize),
      source: Value(source),
      energyKcal100: energyKcal100 == null && nullToAbsent
          ? const Value.absent()
          : Value(energyKcal100),
      carbohydrates100: carbohydrates100 == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrates100),
      fat100:
          fat100 == null && nullToAbsent ? const Value.absent() : Value(fat100),
      proteins100: proteins100 == null && nullToAbsent
          ? const Value.absent()
          : Value(proteins100),
      sugars100: sugars100 == null && nullToAbsent
          ? const Value.absent()
          : Value(sugars100),
      saturatedFat100: saturatedFat100 == null && nullToAbsent
          ? const Value.absent()
          : Value(saturatedFat100),
      fiber100: fiber100 == null && nullToAbsent
          ? const Value.absent()
          : Value(fiber100),
      sodium100: sodium100 == null && nullToAbsent
          ? const Value.absent()
          : Value(sodium100),
      potassium100: potassium100 == null && nullToAbsent
          ? const Value.absent()
          : Value(potassium100),
      cholesterol100: cholesterol100 == null && nullToAbsent
          ? const Value.absent()
          : Value(cholesterol100),
      vitaminA100: vitaminA100 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminA100),
      vitaminC100: vitaminC100 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminC100),
      vitaminD100: vitaminD100 == null && nullToAbsent
          ? const Value.absent()
          : Value(vitaminD100),
      calcium100: calcium100 == null && nullToAbsent
          ? const Value.absent()
          : Value(calcium100),
      iron100: iron100 == null && nullToAbsent
          ? const Value.absent()
          : Value(iron100),
    );
  }

  factory Meal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meal(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String?>(json['code']),
      name: serializer.fromJson<String?>(json['name']),
      brands: serializer.fromJson<String?>(json['brands']),
      thumbnailImageUrl:
          serializer.fromJson<String?>(json['thumbnailImageUrl']),
      mainImageUrl: serializer.fromJson<String?>(json['mainImageUrl']),
      url: serializer.fromJson<String?>(json['url']),
      mealQuantity: serializer.fromJson<String?>(json['mealQuantity']),
      mealUnit: serializer.fromJson<String?>(json['mealUnit']),
      servingQuantity: serializer.fromJson<double?>(json['servingQuantity']),
      servingUnit: serializer.fromJson<String?>(json['servingUnit']),
      servingSize: serializer.fromJson<String?>(json['servingSize']),
      source: serializer.fromJson<String>(json['source']),
      energyKcal100: serializer.fromJson<double?>(json['energyKcal100']),
      carbohydrates100: serializer.fromJson<double?>(json['carbohydrates100']),
      fat100: serializer.fromJson<double?>(json['fat100']),
      proteins100: serializer.fromJson<double?>(json['proteins100']),
      sugars100: serializer.fromJson<double?>(json['sugars100']),
      saturatedFat100: serializer.fromJson<double?>(json['saturatedFat100']),
      fiber100: serializer.fromJson<double?>(json['fiber100']),
      sodium100: serializer.fromJson<double?>(json['sodium100']),
      potassium100: serializer.fromJson<double?>(json['potassium100']),
      cholesterol100: serializer.fromJson<double?>(json['cholesterol100']),
      vitaminA100: serializer.fromJson<double?>(json['vitaminA100']),
      vitaminC100: serializer.fromJson<double?>(json['vitaminC100']),
      vitaminD100: serializer.fromJson<double?>(json['vitaminD100']),
      calcium100: serializer.fromJson<double?>(json['calcium100']),
      iron100: serializer.fromJson<double?>(json['iron100']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String?>(code),
      'name': serializer.toJson<String?>(name),
      'brands': serializer.toJson<String?>(brands),
      'thumbnailImageUrl': serializer.toJson<String?>(thumbnailImageUrl),
      'mainImageUrl': serializer.toJson<String?>(mainImageUrl),
      'url': serializer.toJson<String?>(url),
      'mealQuantity': serializer.toJson<String?>(mealQuantity),
      'mealUnit': serializer.toJson<String?>(mealUnit),
      'servingQuantity': serializer.toJson<double?>(servingQuantity),
      'servingUnit': serializer.toJson<String?>(servingUnit),
      'servingSize': serializer.toJson<String?>(servingSize),
      'source': serializer.toJson<String>(source),
      'energyKcal100': serializer.toJson<double?>(energyKcal100),
      'carbohydrates100': serializer.toJson<double?>(carbohydrates100),
      'fat100': serializer.toJson<double?>(fat100),
      'proteins100': serializer.toJson<double?>(proteins100),
      'sugars100': serializer.toJson<double?>(sugars100),
      'saturatedFat100': serializer.toJson<double?>(saturatedFat100),
      'fiber100': serializer.toJson<double?>(fiber100),
      'sodium100': serializer.toJson<double?>(sodium100),
      'potassium100': serializer.toJson<double?>(potassium100),
      'cholesterol100': serializer.toJson<double?>(cholesterol100),
      'vitaminA100': serializer.toJson<double?>(vitaminA100),
      'vitaminC100': serializer.toJson<double?>(vitaminC100),
      'vitaminD100': serializer.toJson<double?>(vitaminD100),
      'calcium100': serializer.toJson<double?>(calcium100),
      'iron100': serializer.toJson<double?>(iron100),
    };
  }

  Meal copyWith(
          {String? id,
          Value<String?> code = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> brands = const Value.absent(),
          Value<String?> thumbnailImageUrl = const Value.absent(),
          Value<String?> mainImageUrl = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> mealQuantity = const Value.absent(),
          Value<String?> mealUnit = const Value.absent(),
          Value<double?> servingQuantity = const Value.absent(),
          Value<String?> servingUnit = const Value.absent(),
          Value<String?> servingSize = const Value.absent(),
          String? source,
          Value<double?> energyKcal100 = const Value.absent(),
          Value<double?> carbohydrates100 = const Value.absent(),
          Value<double?> fat100 = const Value.absent(),
          Value<double?> proteins100 = const Value.absent(),
          Value<double?> sugars100 = const Value.absent(),
          Value<double?> saturatedFat100 = const Value.absent(),
          Value<double?> fiber100 = const Value.absent(),
          Value<double?> sodium100 = const Value.absent(),
          Value<double?> potassium100 = const Value.absent(),
          Value<double?> cholesterol100 = const Value.absent(),
          Value<double?> vitaminA100 = const Value.absent(),
          Value<double?> vitaminC100 = const Value.absent(),
          Value<double?> vitaminD100 = const Value.absent(),
          Value<double?> calcium100 = const Value.absent(),
          Value<double?> iron100 = const Value.absent()}) =>
      Meal(
        id: id ?? this.id,
        code: code.present ? code.value : this.code,
        name: name.present ? name.value : this.name,
        brands: brands.present ? brands.value : this.brands,
        thumbnailImageUrl: thumbnailImageUrl.present
            ? thumbnailImageUrl.value
            : this.thumbnailImageUrl,
        mainImageUrl:
            mainImageUrl.present ? mainImageUrl.value : this.mainImageUrl,
        url: url.present ? url.value : this.url,
        mealQuantity:
            mealQuantity.present ? mealQuantity.value : this.mealQuantity,
        mealUnit: mealUnit.present ? mealUnit.value : this.mealUnit,
        servingQuantity: servingQuantity.present
            ? servingQuantity.value
            : this.servingQuantity,
        servingUnit: servingUnit.present ? servingUnit.value : this.servingUnit,
        servingSize: servingSize.present ? servingSize.value : this.servingSize,
        source: source ?? this.source,
        energyKcal100:
            energyKcal100.present ? energyKcal100.value : this.energyKcal100,
        carbohydrates100: carbohydrates100.present
            ? carbohydrates100.value
            : this.carbohydrates100,
        fat100: fat100.present ? fat100.value : this.fat100,
        proteins100: proteins100.present ? proteins100.value : this.proteins100,
        sugars100: sugars100.present ? sugars100.value : this.sugars100,
        saturatedFat100: saturatedFat100.present
            ? saturatedFat100.value
            : this.saturatedFat100,
        fiber100: fiber100.present ? fiber100.value : this.fiber100,
        sodium100: sodium100.present ? sodium100.value : this.sodium100,
        potassium100:
            potassium100.present ? potassium100.value : this.potassium100,
        cholesterol100:
            cholesterol100.present ? cholesterol100.value : this.cholesterol100,
        vitaminA100: vitaminA100.present ? vitaminA100.value : this.vitaminA100,
        vitaminC100: vitaminC100.present ? vitaminC100.value : this.vitaminC100,
        vitaminD100: vitaminD100.present ? vitaminD100.value : this.vitaminD100,
        calcium100: calcium100.present ? calcium100.value : this.calcium100,
        iron100: iron100.present ? iron100.value : this.iron100,
      );
  Meal copyWithCompanion(MealsCompanion data) {
    return Meal(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      brands: data.brands.present ? data.brands.value : this.brands,
      thumbnailImageUrl: data.thumbnailImageUrl.present
          ? data.thumbnailImageUrl.value
          : this.thumbnailImageUrl,
      mainImageUrl: data.mainImageUrl.present
          ? data.mainImageUrl.value
          : this.mainImageUrl,
      url: data.url.present ? data.url.value : this.url,
      mealQuantity: data.mealQuantity.present
          ? data.mealQuantity.value
          : this.mealQuantity,
      mealUnit: data.mealUnit.present ? data.mealUnit.value : this.mealUnit,
      servingQuantity: data.servingQuantity.present
          ? data.servingQuantity.value
          : this.servingQuantity,
      servingUnit:
          data.servingUnit.present ? data.servingUnit.value : this.servingUnit,
      servingSize:
          data.servingSize.present ? data.servingSize.value : this.servingSize,
      source: data.source.present ? data.source.value : this.source,
      energyKcal100: data.energyKcal100.present
          ? data.energyKcal100.value
          : this.energyKcal100,
      carbohydrates100: data.carbohydrates100.present
          ? data.carbohydrates100.value
          : this.carbohydrates100,
      fat100: data.fat100.present ? data.fat100.value : this.fat100,
      proteins100:
          data.proteins100.present ? data.proteins100.value : this.proteins100,
      sugars100: data.sugars100.present ? data.sugars100.value : this.sugars100,
      saturatedFat100: data.saturatedFat100.present
          ? data.saturatedFat100.value
          : this.saturatedFat100,
      fiber100: data.fiber100.present ? data.fiber100.value : this.fiber100,
      sodium100: data.sodium100.present ? data.sodium100.value : this.sodium100,
      potassium100: data.potassium100.present
          ? data.potassium100.value
          : this.potassium100,
      cholesterol100: data.cholesterol100.present
          ? data.cholesterol100.value
          : this.cholesterol100,
      vitaminA100:
          data.vitaminA100.present ? data.vitaminA100.value : this.vitaminA100,
      vitaminC100:
          data.vitaminC100.present ? data.vitaminC100.value : this.vitaminC100,
      vitaminD100:
          data.vitaminD100.present ? data.vitaminD100.value : this.vitaminD100,
      calcium100:
          data.calcium100.present ? data.calcium100.value : this.calcium100,
      iron100: data.iron100.present ? data.iron100.value : this.iron100,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('brands: $brands, ')
          ..write('thumbnailImageUrl: $thumbnailImageUrl, ')
          ..write('mainImageUrl: $mainImageUrl, ')
          ..write('url: $url, ')
          ..write('mealQuantity: $mealQuantity, ')
          ..write('mealUnit: $mealUnit, ')
          ..write('servingQuantity: $servingQuantity, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('servingSize: $servingSize, ')
          ..write('source: $source, ')
          ..write('energyKcal100: $energyKcal100, ')
          ..write('carbohydrates100: $carbohydrates100, ')
          ..write('fat100: $fat100, ')
          ..write('proteins100: $proteins100, ')
          ..write('sugars100: $sugars100, ')
          ..write('saturatedFat100: $saturatedFat100, ')
          ..write('fiber100: $fiber100, ')
          ..write('sodium100: $sodium100, ')
          ..write('potassium100: $potassium100, ')
          ..write('cholesterol100: $cholesterol100, ')
          ..write('vitaminA100: $vitaminA100, ')
          ..write('vitaminC100: $vitaminC100, ')
          ..write('vitaminD100: $vitaminD100, ')
          ..write('calcium100: $calcium100, ')
          ..write('iron100: $iron100')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        code,
        name,
        brands,
        thumbnailImageUrl,
        mainImageUrl,
        url,
        mealQuantity,
        mealUnit,
        servingQuantity,
        servingUnit,
        servingSize,
        source,
        energyKcal100,
        carbohydrates100,
        fat100,
        proteins100,
        sugars100,
        saturatedFat100,
        fiber100,
        sodium100,
        potassium100,
        cholesterol100,
        vitaminA100,
        vitaminC100,
        vitaminD100,
        calcium100,
        iron100
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.brands == this.brands &&
          other.thumbnailImageUrl == this.thumbnailImageUrl &&
          other.mainImageUrl == this.mainImageUrl &&
          other.url == this.url &&
          other.mealQuantity == this.mealQuantity &&
          other.mealUnit == this.mealUnit &&
          other.servingQuantity == this.servingQuantity &&
          other.servingUnit == this.servingUnit &&
          other.servingSize == this.servingSize &&
          other.source == this.source &&
          other.energyKcal100 == this.energyKcal100 &&
          other.carbohydrates100 == this.carbohydrates100 &&
          other.fat100 == this.fat100 &&
          other.proteins100 == this.proteins100 &&
          other.sugars100 == this.sugars100 &&
          other.saturatedFat100 == this.saturatedFat100 &&
          other.fiber100 == this.fiber100 &&
          other.sodium100 == this.sodium100 &&
          other.potassium100 == this.potassium100 &&
          other.cholesterol100 == this.cholesterol100 &&
          other.vitaminA100 == this.vitaminA100 &&
          other.vitaminC100 == this.vitaminC100 &&
          other.vitaminD100 == this.vitaminD100 &&
          other.calcium100 == this.calcium100 &&
          other.iron100 == this.iron100);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<String> id;
  final Value<String?> code;
  final Value<String?> name;
  final Value<String?> brands;
  final Value<String?> thumbnailImageUrl;
  final Value<String?> mainImageUrl;
  final Value<String?> url;
  final Value<String?> mealQuantity;
  final Value<String?> mealUnit;
  final Value<double?> servingQuantity;
  final Value<String?> servingUnit;
  final Value<String?> servingSize;
  final Value<String> source;
  final Value<double?> energyKcal100;
  final Value<double?> carbohydrates100;
  final Value<double?> fat100;
  final Value<double?> proteins100;
  final Value<double?> sugars100;
  final Value<double?> saturatedFat100;
  final Value<double?> fiber100;
  final Value<double?> sodium100;
  final Value<double?> potassium100;
  final Value<double?> cholesterol100;
  final Value<double?> vitaminA100;
  final Value<double?> vitaminC100;
  final Value<double?> vitaminD100;
  final Value<double?> calcium100;
  final Value<double?> iron100;
  final Value<int> rowid;
  const MealsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.brands = const Value.absent(),
    this.thumbnailImageUrl = const Value.absent(),
    this.mainImageUrl = const Value.absent(),
    this.url = const Value.absent(),
    this.mealQuantity = const Value.absent(),
    this.mealUnit = const Value.absent(),
    this.servingQuantity = const Value.absent(),
    this.servingUnit = const Value.absent(),
    this.servingSize = const Value.absent(),
    this.source = const Value.absent(),
    this.energyKcal100 = const Value.absent(),
    this.carbohydrates100 = const Value.absent(),
    this.fat100 = const Value.absent(),
    this.proteins100 = const Value.absent(),
    this.sugars100 = const Value.absent(),
    this.saturatedFat100 = const Value.absent(),
    this.fiber100 = const Value.absent(),
    this.sodium100 = const Value.absent(),
    this.potassium100 = const Value.absent(),
    this.cholesterol100 = const Value.absent(),
    this.vitaminA100 = const Value.absent(),
    this.vitaminC100 = const Value.absent(),
    this.vitaminD100 = const Value.absent(),
    this.calcium100 = const Value.absent(),
    this.iron100 = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealsCompanion.insert({
    required String id,
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.brands = const Value.absent(),
    this.thumbnailImageUrl = const Value.absent(),
    this.mainImageUrl = const Value.absent(),
    this.url = const Value.absent(),
    this.mealQuantity = const Value.absent(),
    this.mealUnit = const Value.absent(),
    this.servingQuantity = const Value.absent(),
    this.servingUnit = const Value.absent(),
    this.servingSize = const Value.absent(),
    this.source = const Value.absent(),
    this.energyKcal100 = const Value.absent(),
    this.carbohydrates100 = const Value.absent(),
    this.fat100 = const Value.absent(),
    this.proteins100 = const Value.absent(),
    this.sugars100 = const Value.absent(),
    this.saturatedFat100 = const Value.absent(),
    this.fiber100 = const Value.absent(),
    this.sodium100 = const Value.absent(),
    this.potassium100 = const Value.absent(),
    this.cholesterol100 = const Value.absent(),
    this.vitaminA100 = const Value.absent(),
    this.vitaminC100 = const Value.absent(),
    this.vitaminD100 = const Value.absent(),
    this.calcium100 = const Value.absent(),
    this.iron100 = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Meal> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? brands,
    Expression<String>? thumbnailImageUrl,
    Expression<String>? mainImageUrl,
    Expression<String>? url,
    Expression<String>? mealQuantity,
    Expression<String>? mealUnit,
    Expression<double>? servingQuantity,
    Expression<String>? servingUnit,
    Expression<String>? servingSize,
    Expression<String>? source,
    Expression<double>? energyKcal100,
    Expression<double>? carbohydrates100,
    Expression<double>? fat100,
    Expression<double>? proteins100,
    Expression<double>? sugars100,
    Expression<double>? saturatedFat100,
    Expression<double>? fiber100,
    Expression<double>? sodium100,
    Expression<double>? potassium100,
    Expression<double>? cholesterol100,
    Expression<double>? vitaminA100,
    Expression<double>? vitaminC100,
    Expression<double>? vitaminD100,
    Expression<double>? calcium100,
    Expression<double>? iron100,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (brands != null) 'brands': brands,
      if (thumbnailImageUrl != null) 'thumbnail_image_url': thumbnailImageUrl,
      if (mainImageUrl != null) 'main_image_url': mainImageUrl,
      if (url != null) 'url': url,
      if (mealQuantity != null) 'meal_quantity': mealQuantity,
      if (mealUnit != null) 'meal_unit': mealUnit,
      if (servingQuantity != null) 'serving_quantity': servingQuantity,
      if (servingUnit != null) 'serving_unit': servingUnit,
      if (servingSize != null) 'serving_size': servingSize,
      if (source != null) 'source': source,
      if (energyKcal100 != null) 'energy_kcal100': energyKcal100,
      if (carbohydrates100 != null) 'carbohydrates100': carbohydrates100,
      if (fat100 != null) 'fat100': fat100,
      if (proteins100 != null) 'proteins100': proteins100,
      if (sugars100 != null) 'sugars100': sugars100,
      if (saturatedFat100 != null) 'saturated_fat100': saturatedFat100,
      if (fiber100 != null) 'fiber100': fiber100,
      if (sodium100 != null) 'sodium100': sodium100,
      if (potassium100 != null) 'potassium100': potassium100,
      if (cholesterol100 != null) 'cholesterol100': cholesterol100,
      if (vitaminA100 != null) 'vitamin_a100': vitaminA100,
      if (vitaminC100 != null) 'vitamin_c100': vitaminC100,
      if (vitaminD100 != null) 'vitamin_d100': vitaminD100,
      if (calcium100 != null) 'calcium100': calcium100,
      if (iron100 != null) 'iron100': iron100,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? code,
      Value<String?>? name,
      Value<String?>? brands,
      Value<String?>? thumbnailImageUrl,
      Value<String?>? mainImageUrl,
      Value<String?>? url,
      Value<String?>? mealQuantity,
      Value<String?>? mealUnit,
      Value<double?>? servingQuantity,
      Value<String?>? servingUnit,
      Value<String?>? servingSize,
      Value<String>? source,
      Value<double?>? energyKcal100,
      Value<double?>? carbohydrates100,
      Value<double?>? fat100,
      Value<double?>? proteins100,
      Value<double?>? sugars100,
      Value<double?>? saturatedFat100,
      Value<double?>? fiber100,
      Value<double?>? sodium100,
      Value<double?>? potassium100,
      Value<double?>? cholesterol100,
      Value<double?>? vitaminA100,
      Value<double?>? vitaminC100,
      Value<double?>? vitaminD100,
      Value<double?>? calcium100,
      Value<double?>? iron100,
      Value<int>? rowid}) {
    return MealsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      brands: brands ?? this.brands,
      thumbnailImageUrl: thumbnailImageUrl ?? this.thumbnailImageUrl,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      url: url ?? this.url,
      mealQuantity: mealQuantity ?? this.mealQuantity,
      mealUnit: mealUnit ?? this.mealUnit,
      servingQuantity: servingQuantity ?? this.servingQuantity,
      servingUnit: servingUnit ?? this.servingUnit,
      servingSize: servingSize ?? this.servingSize,
      source: source ?? this.source,
      energyKcal100: energyKcal100 ?? this.energyKcal100,
      carbohydrates100: carbohydrates100 ?? this.carbohydrates100,
      fat100: fat100 ?? this.fat100,
      proteins100: proteins100 ?? this.proteins100,
      sugars100: sugars100 ?? this.sugars100,
      saturatedFat100: saturatedFat100 ?? this.saturatedFat100,
      fiber100: fiber100 ?? this.fiber100,
      sodium100: sodium100 ?? this.sodium100,
      potassium100: potassium100 ?? this.potassium100,
      cholesterol100: cholesterol100 ?? this.cholesterol100,
      vitaminA100: vitaminA100 ?? this.vitaminA100,
      vitaminC100: vitaminC100 ?? this.vitaminC100,
      vitaminD100: vitaminD100 ?? this.vitaminD100,
      calcium100: calcium100 ?? this.calcium100,
      iron100: iron100 ?? this.iron100,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brands.present) {
      map['brands'] = Variable<String>(brands.value);
    }
    if (thumbnailImageUrl.present) {
      map['thumbnail_image_url'] = Variable<String>(thumbnailImageUrl.value);
    }
    if (mainImageUrl.present) {
      map['main_image_url'] = Variable<String>(mainImageUrl.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (mealQuantity.present) {
      map['meal_quantity'] = Variable<String>(mealQuantity.value);
    }
    if (mealUnit.present) {
      map['meal_unit'] = Variable<String>(mealUnit.value);
    }
    if (servingQuantity.present) {
      map['serving_quantity'] = Variable<double>(servingQuantity.value);
    }
    if (servingUnit.present) {
      map['serving_unit'] = Variable<String>(servingUnit.value);
    }
    if (servingSize.present) {
      map['serving_size'] = Variable<String>(servingSize.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (energyKcal100.present) {
      map['energy_kcal100'] = Variable<double>(energyKcal100.value);
    }
    if (carbohydrates100.present) {
      map['carbohydrates100'] = Variable<double>(carbohydrates100.value);
    }
    if (fat100.present) {
      map['fat100'] = Variable<double>(fat100.value);
    }
    if (proteins100.present) {
      map['proteins100'] = Variable<double>(proteins100.value);
    }
    if (sugars100.present) {
      map['sugars100'] = Variable<double>(sugars100.value);
    }
    if (saturatedFat100.present) {
      map['saturated_fat100'] = Variable<double>(saturatedFat100.value);
    }
    if (fiber100.present) {
      map['fiber100'] = Variable<double>(fiber100.value);
    }
    if (sodium100.present) {
      map['sodium100'] = Variable<double>(sodium100.value);
    }
    if (potassium100.present) {
      map['potassium100'] = Variable<double>(potassium100.value);
    }
    if (cholesterol100.present) {
      map['cholesterol100'] = Variable<double>(cholesterol100.value);
    }
    if (vitaminA100.present) {
      map['vitamin_a100'] = Variable<double>(vitaminA100.value);
    }
    if (vitaminC100.present) {
      map['vitamin_c100'] = Variable<double>(vitaminC100.value);
    }
    if (vitaminD100.present) {
      map['vitamin_d100'] = Variable<double>(vitaminD100.value);
    }
    if (calcium100.present) {
      map['calcium100'] = Variable<double>(calcium100.value);
    }
    if (iron100.present) {
      map['iron100'] = Variable<double>(iron100.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('brands: $brands, ')
          ..write('thumbnailImageUrl: $thumbnailImageUrl, ')
          ..write('mainImageUrl: $mainImageUrl, ')
          ..write('url: $url, ')
          ..write('mealQuantity: $mealQuantity, ')
          ..write('mealUnit: $mealUnit, ')
          ..write('servingQuantity: $servingQuantity, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('servingSize: $servingSize, ')
          ..write('source: $source, ')
          ..write('energyKcal100: $energyKcal100, ')
          ..write('carbohydrates100: $carbohydrates100, ')
          ..write('fat100: $fat100, ')
          ..write('proteins100: $proteins100, ')
          ..write('sugars100: $sugars100, ')
          ..write('saturatedFat100: $saturatedFat100, ')
          ..write('fiber100: $fiber100, ')
          ..write('sodium100: $sodium100, ')
          ..write('potassium100: $potassium100, ')
          ..write('cholesterol100: $cholesterol100, ')
          ..write('vitaminA100: $vitaminA100, ')
          ..write('vitaminC100: $vitaminC100, ')
          ..write('vitaminD100: $vitaminD100, ')
          ..write('calcium100: $calcium100, ')
          ..write('iron100: $iron100, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserActivitiesTable extends UserActivities
    with TableInfo<$UserActivitiesTable, UserActivity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<double> duration = GeneratedColumn<double>(
      'duration', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _burnedKcalMeta =
      const VerificationMeta('burnedKcal');
  @override
  late final GeneratedColumn<double> burnedKcal = GeneratedColumn<double>(
      'burned_kcal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _physicalActivityCodeMeta =
      const VerificationMeta('physicalActivityCode');
  @override
  late final GeneratedColumn<String> physicalActivityCode =
      GeneratedColumn<String>('physical_activity_code', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, duration, burnedKcal, date, physicalActivityCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_activities';
  @override
  VerificationContext validateIntegrity(Insertable<UserActivity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('burned_kcal')) {
      context.handle(
          _burnedKcalMeta,
          burnedKcal.isAcceptableOrUnknown(
              data['burned_kcal']!, _burnedKcalMeta));
    } else if (isInserting) {
      context.missing(_burnedKcalMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('physical_activity_code')) {
      context.handle(
          _physicalActivityCodeMeta,
          physicalActivityCode.isAcceptableOrUnknown(
              data['physical_activity_code']!, _physicalActivityCodeMeta));
    } else if (isInserting) {
      context.missing(_physicalActivityCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserActivity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserActivity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}duration'])!,
      burnedKcal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}burned_kcal'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      physicalActivityCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}physical_activity_code'])!,
    );
  }

  @override
  $UserActivitiesTable createAlias(String alias) {
    return $UserActivitiesTable(attachedDatabase, alias);
  }
}

class UserActivity extends DataClass implements Insertable<UserActivity> {
  final String id;
  final double duration;
  final double burnedKcal;
  final DateTime date;
  final String physicalActivityCode;
  const UserActivity(
      {required this.id,
      required this.duration,
      required this.burnedKcal,
      required this.date,
      required this.physicalActivityCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['duration'] = Variable<double>(duration);
    map['burned_kcal'] = Variable<double>(burnedKcal);
    map['date'] = Variable<DateTime>(date);
    map['physical_activity_code'] = Variable<String>(physicalActivityCode);
    return map;
  }

  UserActivitiesCompanion toCompanion(bool nullToAbsent) {
    return UserActivitiesCompanion(
      id: Value(id),
      duration: Value(duration),
      burnedKcal: Value(burnedKcal),
      date: Value(date),
      physicalActivityCode: Value(physicalActivityCode),
    );
  }

  factory UserActivity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserActivity(
      id: serializer.fromJson<String>(json['id']),
      duration: serializer.fromJson<double>(json['duration']),
      burnedKcal: serializer.fromJson<double>(json['burnedKcal']),
      date: serializer.fromJson<DateTime>(json['date']),
      physicalActivityCode:
          serializer.fromJson<String>(json['physicalActivityCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'duration': serializer.toJson<double>(duration),
      'burnedKcal': serializer.toJson<double>(burnedKcal),
      'date': serializer.toJson<DateTime>(date),
      'physicalActivityCode': serializer.toJson<String>(physicalActivityCode),
    };
  }

  UserActivity copyWith(
          {String? id,
          double? duration,
          double? burnedKcal,
          DateTime? date,
          String? physicalActivityCode}) =>
      UserActivity(
        id: id ?? this.id,
        duration: duration ?? this.duration,
        burnedKcal: burnedKcal ?? this.burnedKcal,
        date: date ?? this.date,
        physicalActivityCode: physicalActivityCode ?? this.physicalActivityCode,
      );
  UserActivity copyWithCompanion(UserActivitiesCompanion data) {
    return UserActivity(
      id: data.id.present ? data.id.value : this.id,
      duration: data.duration.present ? data.duration.value : this.duration,
      burnedKcal:
          data.burnedKcal.present ? data.burnedKcal.value : this.burnedKcal,
      date: data.date.present ? data.date.value : this.date,
      physicalActivityCode: data.physicalActivityCode.present
          ? data.physicalActivityCode.value
          : this.physicalActivityCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserActivity(')
          ..write('id: $id, ')
          ..write('duration: $duration, ')
          ..write('burnedKcal: $burnedKcal, ')
          ..write('date: $date, ')
          ..write('physicalActivityCode: $physicalActivityCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, duration, burnedKcal, date, physicalActivityCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserActivity &&
          other.id == this.id &&
          other.duration == this.duration &&
          other.burnedKcal == this.burnedKcal &&
          other.date == this.date &&
          other.physicalActivityCode == this.physicalActivityCode);
}

class UserActivitiesCompanion extends UpdateCompanion<UserActivity> {
  final Value<String> id;
  final Value<double> duration;
  final Value<double> burnedKcal;
  final Value<DateTime> date;
  final Value<String> physicalActivityCode;
  final Value<int> rowid;
  const UserActivitiesCompanion({
    this.id = const Value.absent(),
    this.duration = const Value.absent(),
    this.burnedKcal = const Value.absent(),
    this.date = const Value.absent(),
    this.physicalActivityCode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserActivitiesCompanion.insert({
    required String id,
    required double duration,
    required double burnedKcal,
    required DateTime date,
    required String physicalActivityCode,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        duration = Value(duration),
        burnedKcal = Value(burnedKcal),
        date = Value(date),
        physicalActivityCode = Value(physicalActivityCode);
  static Insertable<UserActivity> custom({
    Expression<String>? id,
    Expression<double>? duration,
    Expression<double>? burnedKcal,
    Expression<DateTime>? date,
    Expression<String>? physicalActivityCode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (duration != null) 'duration': duration,
      if (burnedKcal != null) 'burned_kcal': burnedKcal,
      if (date != null) 'date': date,
      if (physicalActivityCode != null)
        'physical_activity_code': physicalActivityCode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserActivitiesCompanion copyWith(
      {Value<String>? id,
      Value<double>? duration,
      Value<double>? burnedKcal,
      Value<DateTime>? date,
      Value<String>? physicalActivityCode,
      Value<int>? rowid}) {
    return UserActivitiesCompanion(
      id: id ?? this.id,
      duration: duration ?? this.duration,
      burnedKcal: burnedKcal ?? this.burnedKcal,
      date: date ?? this.date,
      physicalActivityCode: physicalActivityCode ?? this.physicalActivityCode,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (duration.present) {
      map['duration'] = Variable<double>(duration.value);
    }
    if (burnedKcal.present) {
      map['burned_kcal'] = Variable<double>(burnedKcal.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (physicalActivityCode.present) {
      map['physical_activity_code'] =
          Variable<String>(physicalActivityCode.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserActivitiesCompanion(')
          ..write('id: $id, ')
          ..write('duration: $duration, ')
          ..write('burnedKcal: $burnedKcal, ')
          ..write('date: $date, ')
          ..write('physicalActivityCode: $physicalActivityCode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrackedDaysTable extends TrackedDays
    with TableInfo<$TrackedDaysTable, TrackedDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackedDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<DateTime> day = GeneratedColumn<DateTime>(
      'day', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _calorieGoalMeta =
      const VerificationMeta('calorieGoal');
  @override
  late final GeneratedColumn<double> calorieGoal = GeneratedColumn<double>(
      'calorie_goal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _caloriesTrackedMeta =
      const VerificationMeta('caloriesTracked');
  @override
  late final GeneratedColumn<double> caloriesTracked = GeneratedColumn<double>(
      'calories_tracked', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _carbsGoalMeta =
      const VerificationMeta('carbsGoal');
  @override
  late final GeneratedColumn<double> carbsGoal = GeneratedColumn<double>(
      'carbs_goal', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _carbsTrackedMeta =
      const VerificationMeta('carbsTracked');
  @override
  late final GeneratedColumn<double> carbsTracked = GeneratedColumn<double>(
      'carbs_tracked', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fatGoalMeta =
      const VerificationMeta('fatGoal');
  @override
  late final GeneratedColumn<double> fatGoal = GeneratedColumn<double>(
      'fat_goal', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fatTrackedMeta =
      const VerificationMeta('fatTracked');
  @override
  late final GeneratedColumn<double> fatTracked = GeneratedColumn<double>(
      'fat_tracked', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _proteinGoalMeta =
      const VerificationMeta('proteinGoal');
  @override
  late final GeneratedColumn<double> proteinGoal = GeneratedColumn<double>(
      'protein_goal', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _proteinTrackedMeta =
      const VerificationMeta('proteinTracked');
  @override
  late final GeneratedColumn<double> proteinTracked = GeneratedColumn<double>(
      'protein_tracked', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        day,
        calorieGoal,
        caloriesTracked,
        carbsGoal,
        carbsTracked,
        fatGoal,
        fatTracked,
        proteinGoal,
        proteinTracked
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tracked_days';
  @override
  VerificationContext validateIntegrity(Insertable<TrackedDay> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('calorie_goal')) {
      context.handle(
          _calorieGoalMeta,
          calorieGoal.isAcceptableOrUnknown(
              data['calorie_goal']!, _calorieGoalMeta));
    } else if (isInserting) {
      context.missing(_calorieGoalMeta);
    }
    if (data.containsKey('calories_tracked')) {
      context.handle(
          _caloriesTrackedMeta,
          caloriesTracked.isAcceptableOrUnknown(
              data['calories_tracked']!, _caloriesTrackedMeta));
    }
    if (data.containsKey('carbs_goal')) {
      context.handle(_carbsGoalMeta,
          carbsGoal.isAcceptableOrUnknown(data['carbs_goal']!, _carbsGoalMeta));
    }
    if (data.containsKey('carbs_tracked')) {
      context.handle(
          _carbsTrackedMeta,
          carbsTracked.isAcceptableOrUnknown(
              data['carbs_tracked']!, _carbsTrackedMeta));
    }
    if (data.containsKey('fat_goal')) {
      context.handle(_fatGoalMeta,
          fatGoal.isAcceptableOrUnknown(data['fat_goal']!, _fatGoalMeta));
    }
    if (data.containsKey('fat_tracked')) {
      context.handle(
          _fatTrackedMeta,
          fatTracked.isAcceptableOrUnknown(
              data['fat_tracked']!, _fatTrackedMeta));
    }
    if (data.containsKey('protein_goal')) {
      context.handle(
          _proteinGoalMeta,
          proteinGoal.isAcceptableOrUnknown(
              data['protein_goal']!, _proteinGoalMeta));
    }
    if (data.containsKey('protein_tracked')) {
      context.handle(
          _proteinTrackedMeta,
          proteinTracked.isAcceptableOrUnknown(
              data['protein_tracked']!, _proteinTrackedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {day};
  @override
  TrackedDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackedDay(
      day: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}day'])!,
      calorieGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calorie_goal'])!,
      caloriesTracked: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}calories_tracked'])!,
      carbsGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbs_goal']),
      carbsTracked: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbs_tracked']),
      fatGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat_goal']),
      fatTracked: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat_tracked']),
      proteinGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein_goal']),
      proteinTracked: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein_tracked']),
    );
  }

  @override
  $TrackedDaysTable createAlias(String alias) {
    return $TrackedDaysTable(attachedDatabase, alias);
  }
}

class TrackedDay extends DataClass implements Insertable<TrackedDay> {
  final DateTime day;
  final double calorieGoal;
  final double caloriesTracked;
  final double? carbsGoal;
  final double? carbsTracked;
  final double? fatGoal;
  final double? fatTracked;
  final double? proteinGoal;
  final double? proteinTracked;
  const TrackedDay(
      {required this.day,
      required this.calorieGoal,
      required this.caloriesTracked,
      this.carbsGoal,
      this.carbsTracked,
      this.fatGoal,
      this.fatTracked,
      this.proteinGoal,
      this.proteinTracked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day'] = Variable<DateTime>(day);
    map['calorie_goal'] = Variable<double>(calorieGoal);
    map['calories_tracked'] = Variable<double>(caloriesTracked);
    if (!nullToAbsent || carbsGoal != null) {
      map['carbs_goal'] = Variable<double>(carbsGoal);
    }
    if (!nullToAbsent || carbsTracked != null) {
      map['carbs_tracked'] = Variable<double>(carbsTracked);
    }
    if (!nullToAbsent || fatGoal != null) {
      map['fat_goal'] = Variable<double>(fatGoal);
    }
    if (!nullToAbsent || fatTracked != null) {
      map['fat_tracked'] = Variable<double>(fatTracked);
    }
    if (!nullToAbsent || proteinGoal != null) {
      map['protein_goal'] = Variable<double>(proteinGoal);
    }
    if (!nullToAbsent || proteinTracked != null) {
      map['protein_tracked'] = Variable<double>(proteinTracked);
    }
    return map;
  }

  TrackedDaysCompanion toCompanion(bool nullToAbsent) {
    return TrackedDaysCompanion(
      day: Value(day),
      calorieGoal: Value(calorieGoal),
      caloriesTracked: Value(caloriesTracked),
      carbsGoal: carbsGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(carbsGoal),
      carbsTracked: carbsTracked == null && nullToAbsent
          ? const Value.absent()
          : Value(carbsTracked),
      fatGoal: fatGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(fatGoal),
      fatTracked: fatTracked == null && nullToAbsent
          ? const Value.absent()
          : Value(fatTracked),
      proteinGoal: proteinGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(proteinGoal),
      proteinTracked: proteinTracked == null && nullToAbsent
          ? const Value.absent()
          : Value(proteinTracked),
    );
  }

  factory TrackedDay.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackedDay(
      day: serializer.fromJson<DateTime>(json['day']),
      calorieGoal: serializer.fromJson<double>(json['calorieGoal']),
      caloriesTracked: serializer.fromJson<double>(json['caloriesTracked']),
      carbsGoal: serializer.fromJson<double?>(json['carbsGoal']),
      carbsTracked: serializer.fromJson<double?>(json['carbsTracked']),
      fatGoal: serializer.fromJson<double?>(json['fatGoal']),
      fatTracked: serializer.fromJson<double?>(json['fatTracked']),
      proteinGoal: serializer.fromJson<double?>(json['proteinGoal']),
      proteinTracked: serializer.fromJson<double?>(json['proteinTracked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'day': serializer.toJson<DateTime>(day),
      'calorieGoal': serializer.toJson<double>(calorieGoal),
      'caloriesTracked': serializer.toJson<double>(caloriesTracked),
      'carbsGoal': serializer.toJson<double?>(carbsGoal),
      'carbsTracked': serializer.toJson<double?>(carbsTracked),
      'fatGoal': serializer.toJson<double?>(fatGoal),
      'fatTracked': serializer.toJson<double?>(fatTracked),
      'proteinGoal': serializer.toJson<double?>(proteinGoal),
      'proteinTracked': serializer.toJson<double?>(proteinTracked),
    };
  }

  TrackedDay copyWith(
          {DateTime? day,
          double? calorieGoal,
          double? caloriesTracked,
          Value<double?> carbsGoal = const Value.absent(),
          Value<double?> carbsTracked = const Value.absent(),
          Value<double?> fatGoal = const Value.absent(),
          Value<double?> fatTracked = const Value.absent(),
          Value<double?> proteinGoal = const Value.absent(),
          Value<double?> proteinTracked = const Value.absent()}) =>
      TrackedDay(
        day: day ?? this.day,
        calorieGoal: calorieGoal ?? this.calorieGoal,
        caloriesTracked: caloriesTracked ?? this.caloriesTracked,
        carbsGoal: carbsGoal.present ? carbsGoal.value : this.carbsGoal,
        carbsTracked:
            carbsTracked.present ? carbsTracked.value : this.carbsTracked,
        fatGoal: fatGoal.present ? fatGoal.value : this.fatGoal,
        fatTracked: fatTracked.present ? fatTracked.value : this.fatTracked,
        proteinGoal: proteinGoal.present ? proteinGoal.value : this.proteinGoal,
        proteinTracked:
            proteinTracked.present ? proteinTracked.value : this.proteinTracked,
      );
  TrackedDay copyWithCompanion(TrackedDaysCompanion data) {
    return TrackedDay(
      day: data.day.present ? data.day.value : this.day,
      calorieGoal:
          data.calorieGoal.present ? data.calorieGoal.value : this.calorieGoal,
      caloriesTracked: data.caloriesTracked.present
          ? data.caloriesTracked.value
          : this.caloriesTracked,
      carbsGoal: data.carbsGoal.present ? data.carbsGoal.value : this.carbsGoal,
      carbsTracked: data.carbsTracked.present
          ? data.carbsTracked.value
          : this.carbsTracked,
      fatGoal: data.fatGoal.present ? data.fatGoal.value : this.fatGoal,
      fatTracked:
          data.fatTracked.present ? data.fatTracked.value : this.fatTracked,
      proteinGoal:
          data.proteinGoal.present ? data.proteinGoal.value : this.proteinGoal,
      proteinTracked: data.proteinTracked.present
          ? data.proteinTracked.value
          : this.proteinTracked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrackedDay(')
          ..write('day: $day, ')
          ..write('calorieGoal: $calorieGoal, ')
          ..write('caloriesTracked: $caloriesTracked, ')
          ..write('carbsGoal: $carbsGoal, ')
          ..write('carbsTracked: $carbsTracked, ')
          ..write('fatGoal: $fatGoal, ')
          ..write('fatTracked: $fatTracked, ')
          ..write('proteinGoal: $proteinGoal, ')
          ..write('proteinTracked: $proteinTracked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(day, calorieGoal, caloriesTracked, carbsGoal,
      carbsTracked, fatGoal, fatTracked, proteinGoal, proteinTracked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackedDay &&
          other.day == this.day &&
          other.calorieGoal == this.calorieGoal &&
          other.caloriesTracked == this.caloriesTracked &&
          other.carbsGoal == this.carbsGoal &&
          other.carbsTracked == this.carbsTracked &&
          other.fatGoal == this.fatGoal &&
          other.fatTracked == this.fatTracked &&
          other.proteinGoal == this.proteinGoal &&
          other.proteinTracked == this.proteinTracked);
}

class TrackedDaysCompanion extends UpdateCompanion<TrackedDay> {
  final Value<DateTime> day;
  final Value<double> calorieGoal;
  final Value<double> caloriesTracked;
  final Value<double?> carbsGoal;
  final Value<double?> carbsTracked;
  final Value<double?> fatGoal;
  final Value<double?> fatTracked;
  final Value<double?> proteinGoal;
  final Value<double?> proteinTracked;
  final Value<int> rowid;
  const TrackedDaysCompanion({
    this.day = const Value.absent(),
    this.calorieGoal = const Value.absent(),
    this.caloriesTracked = const Value.absent(),
    this.carbsGoal = const Value.absent(),
    this.carbsTracked = const Value.absent(),
    this.fatGoal = const Value.absent(),
    this.fatTracked = const Value.absent(),
    this.proteinGoal = const Value.absent(),
    this.proteinTracked = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrackedDaysCompanion.insert({
    required DateTime day,
    required double calorieGoal,
    this.caloriesTracked = const Value.absent(),
    this.carbsGoal = const Value.absent(),
    this.carbsTracked = const Value.absent(),
    this.fatGoal = const Value.absent(),
    this.fatTracked = const Value.absent(),
    this.proteinGoal = const Value.absent(),
    this.proteinTracked = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : day = Value(day),
        calorieGoal = Value(calorieGoal);
  static Insertable<TrackedDay> custom({
    Expression<DateTime>? day,
    Expression<double>? calorieGoal,
    Expression<double>? caloriesTracked,
    Expression<double>? carbsGoal,
    Expression<double>? carbsTracked,
    Expression<double>? fatGoal,
    Expression<double>? fatTracked,
    Expression<double>? proteinGoal,
    Expression<double>? proteinTracked,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (day != null) 'day': day,
      if (calorieGoal != null) 'calorie_goal': calorieGoal,
      if (caloriesTracked != null) 'calories_tracked': caloriesTracked,
      if (carbsGoal != null) 'carbs_goal': carbsGoal,
      if (carbsTracked != null) 'carbs_tracked': carbsTracked,
      if (fatGoal != null) 'fat_goal': fatGoal,
      if (fatTracked != null) 'fat_tracked': fatTracked,
      if (proteinGoal != null) 'protein_goal': proteinGoal,
      if (proteinTracked != null) 'protein_tracked': proteinTracked,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrackedDaysCompanion copyWith(
      {Value<DateTime>? day,
      Value<double>? calorieGoal,
      Value<double>? caloriesTracked,
      Value<double?>? carbsGoal,
      Value<double?>? carbsTracked,
      Value<double?>? fatGoal,
      Value<double?>? fatTracked,
      Value<double?>? proteinGoal,
      Value<double?>? proteinTracked,
      Value<int>? rowid}) {
    return TrackedDaysCompanion(
      day: day ?? this.day,
      calorieGoal: calorieGoal ?? this.calorieGoal,
      caloriesTracked: caloriesTracked ?? this.caloriesTracked,
      carbsGoal: carbsGoal ?? this.carbsGoal,
      carbsTracked: carbsTracked ?? this.carbsTracked,
      fatGoal: fatGoal ?? this.fatGoal,
      fatTracked: fatTracked ?? this.fatTracked,
      proteinGoal: proteinGoal ?? this.proteinGoal,
      proteinTracked: proteinTracked ?? this.proteinTracked,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (day.present) {
      map['day'] = Variable<DateTime>(day.value);
    }
    if (calorieGoal.present) {
      map['calorie_goal'] = Variable<double>(calorieGoal.value);
    }
    if (caloriesTracked.present) {
      map['calories_tracked'] = Variable<double>(caloriesTracked.value);
    }
    if (carbsGoal.present) {
      map['carbs_goal'] = Variable<double>(carbsGoal.value);
    }
    if (carbsTracked.present) {
      map['carbs_tracked'] = Variable<double>(carbsTracked.value);
    }
    if (fatGoal.present) {
      map['fat_goal'] = Variable<double>(fatGoal.value);
    }
    if (fatTracked.present) {
      map['fat_tracked'] = Variable<double>(fatTracked.value);
    }
    if (proteinGoal.present) {
      map['protein_goal'] = Variable<double>(proteinGoal.value);
    }
    if (proteinTracked.present) {
      map['protein_tracked'] = Variable<double>(proteinTracked.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackedDaysCompanion(')
          ..write('day: $day, ')
          ..write('calorieGoal: $calorieGoal, ')
          ..write('caloriesTracked: $caloriesTracked, ')
          ..write('carbsGoal: $carbsGoal, ')
          ..write('carbsTracked: $carbsTracked, ')
          ..write('fatGoal: $fatGoal, ')
          ..write('fatTracked: $fatTracked, ')
          ..write('proteinGoal: $proteinGoal, ')
          ..write('proteinTracked: $proteinTracked, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _servingsMeta =
      const VerificationMeta('servings');
  @override
  late final GeneratedColumn<String> servings = GeneratedColumn<String>(
      'servings', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('1'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, servings, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<Recipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('servings')) {
      context.handle(_servingsMeta,
          servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recipe(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      servings: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}servings'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final String id;
  final String name;
  final String servings;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Recipe(
      {required this.id,
      required this.name,
      required this.servings,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['servings'] = Variable<String>(servings);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      name: Value(name),
      servings: Value(servings),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      servings: serializer.fromJson<String>(json['servings']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'servings': serializer.toJson<String>(servings),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Recipe copyWith(
          {String? id,
          String? name,
          String? servings,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Recipe(
        id: id ?? this.id,
        name: name ?? this.name,
        servings: servings ?? this.servings,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Recipe copyWithCompanion(RecipesCompanion data) {
    return Recipe(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      servings: data.servings.present ? data.servings.value : this.servings,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('servings: $servings, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, servings, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.name == this.name &&
          other.servings == this.servings &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> servings;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.servings = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipesCompanion.insert({
    required String id,
    required String name,
    this.servings = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Recipe> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? servings,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (servings != null) 'servings': servings,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? servings,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return RecipesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      servings: servings ?? this.servings,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (servings.present) {
      map['servings'] = Variable<String>(servings.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('servings: $servings, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeItemsTable extends RecipeItems
    with TableInfo<$RecipeItemsTable, RecipeItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES recipes (id)'));
  static const VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  @override
  late final GeneratedColumn<String> mealId = GeneratedColumn<String>(
      'meal_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, recipeId, mealId, amount, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_items';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('meal_id')) {
      context.handle(_mealIdMeta,
          mealId.isAcceptableOrUnknown(data['meal_id']!, _mealIdMeta));
    } else if (isInserting) {
      context.missing(_mealIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
      mealId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
    );
  }

  @override
  $RecipeItemsTable createAlias(String alias) {
    return $RecipeItemsTable(attachedDatabase, alias);
  }
}

class RecipeItem extends DataClass implements Insertable<RecipeItem> {
  final String id;
  final String recipeId;
  final String mealId;
  final double amount;
  final String unit;
  const RecipeItem(
      {required this.id,
      required this.recipeId,
      required this.mealId,
      required this.amount,
      required this.unit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recipe_id'] = Variable<String>(recipeId);
    map['meal_id'] = Variable<String>(mealId);
    map['amount'] = Variable<double>(amount);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  RecipeItemsCompanion toCompanion(bool nullToAbsent) {
    return RecipeItemsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      mealId: Value(mealId),
      amount: Value(amount),
      unit: Value(unit),
    );
  }

  factory RecipeItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeItem(
      id: serializer.fromJson<String>(json['id']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      mealId: serializer.fromJson<String>(json['mealId']),
      amount: serializer.fromJson<double>(json['amount']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recipeId': serializer.toJson<String>(recipeId),
      'mealId': serializer.toJson<String>(mealId),
      'amount': serializer.toJson<double>(amount),
      'unit': serializer.toJson<String>(unit),
    };
  }

  RecipeItem copyWith(
          {String? id,
          String? recipeId,
          String? mealId,
          double? amount,
          String? unit}) =>
      RecipeItem(
        id: id ?? this.id,
        recipeId: recipeId ?? this.recipeId,
        mealId: mealId ?? this.mealId,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
      );
  RecipeItem copyWithCompanion(RecipeItemsCompanion data) {
    return RecipeItem(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      mealId: data.mealId.present ? data.mealId.value : this.mealId,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeItem(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('mealId: $mealId, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recipeId, mealId, amount, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeItem &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.mealId == this.mealId &&
          other.amount == this.amount &&
          other.unit == this.unit);
}

class RecipeItemsCompanion extends UpdateCompanion<RecipeItem> {
  final Value<String> id;
  final Value<String> recipeId;
  final Value<String> mealId;
  final Value<double> amount;
  final Value<String> unit;
  final Value<int> rowid;
  const RecipeItemsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.mealId = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeItemsCompanion.insert({
    required String id,
    required String recipeId,
    required String mealId,
    required double amount,
    required String unit,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        recipeId = Value(recipeId),
        mealId = Value(mealId),
        amount = Value(amount),
        unit = Value(unit);
  static Insertable<RecipeItem> custom({
    Expression<String>? id,
    Expression<String>? recipeId,
    Expression<String>? mealId,
    Expression<double>? amount,
    Expression<String>? unit,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (mealId != null) 'meal_id': mealId,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? recipeId,
      Value<String>? mealId,
      Value<double>? amount,
      Value<String>? unit,
      Value<int>? rowid}) {
    return RecipeItemsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      mealId: mealId ?? this.mealId,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (mealId.present) {
      map['meal_id'] = Variable<String>(mealId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeItemsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('mealId: $mealId, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeightsTable extends Weights with TableInfo<$WeightsTable, Weight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightKgMeta =
      const VerificationMeta('weightKg');
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
      'weight_kg', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, userId, weightKg, date, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weights';
  @override
  VerificationContext validateIntegrity(Insertable<Weight> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(_weightKgMeta,
          weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta));
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Weight map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Weight(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      weightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_kg'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $WeightsTable createAlias(String alias) {
    return $WeightsTable(attachedDatabase, alias);
  }
}

class Weight extends DataClass implements Insertable<Weight> {
  final int id;
  final int userId;
  final double weightKg;
  final DateTime date;
  final String? note;
  const Weight(
      {required this.id,
      required this.userId,
      required this.weightKg,
      required this.date,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['weight_kg'] = Variable<double>(weightKg);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  WeightsCompanion toCompanion(bool nullToAbsent) {
    return WeightsCompanion(
      id: Value(id),
      userId: Value(userId),
      weightKg: Value(weightKg),
      date: Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Weight.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Weight(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'weightKg': serializer.toJson<double>(weightKg),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String?>(note),
    };
  }

  Weight copyWith(
          {int? id,
          int? userId,
          double? weightKg,
          DateTime? date,
          Value<String?> note = const Value.absent()}) =>
      Weight(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        weightKg: weightKg ?? this.weightKg,
        date: date ?? this.date,
        note: note.present ? note.value : this.note,
      );
  Weight copyWithCompanion(WeightsCompanion data) {
    return Weight(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      date: data.date.present ? data.date.value : this.date,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Weight(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('weightKg: $weightKg, ')
          ..write('date: $date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, weightKg, date, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weight &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.weightKg == this.weightKg &&
          other.date == this.date &&
          other.note == this.note);
}

class WeightsCompanion extends UpdateCompanion<Weight> {
  final Value<int> id;
  final Value<int> userId;
  final Value<double> weightKg;
  final Value<DateTime> date;
  final Value<String?> note;
  const WeightsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
  });
  WeightsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required double weightKg,
    required DateTime date,
    this.note = const Value.absent(),
  })  : userId = Value(userId),
        weightKg = Value(weightKg),
        date = Value(date);
  static Insertable<Weight> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<double>? weightKg,
    Expression<DateTime>? date,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (weightKg != null) 'weight_kg': weightKg,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
    });
  }

  WeightsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<double>? weightKg,
      Value<DateTime>? date,
      Value<String?>? note}) {
    return WeightsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      weightKg: weightKg ?? this.weightKg,
      date: date ?? this.date,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('weightKg: $weightKg, ')
          ..write('date: $date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $NotificationSettingsTable extends NotificationSettings
    with TableInfo<$NotificationSettingsTable, NotificationSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _breakfastTimeMeta =
      const VerificationMeta('breakfastTime');
  @override
  late final GeneratedColumn<int> breakfastTime = GeneratedColumn<int>(
      'breakfast_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lunchTimeMeta =
      const VerificationMeta('lunchTime');
  @override
  late final GeneratedColumn<int> lunchTime = GeneratedColumn<int>(
      'lunch_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dinnerTimeMeta =
      const VerificationMeta('dinnerTime');
  @override
  late final GeneratedColumn<int> dinnerTime = GeneratedColumn<int>(
      'dinner_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _snackTimeMeta =
      const VerificationMeta('snackTime');
  @override
  late final GeneratedColumn<int> snackTime = GeneratedColumn<int>(
      'snack_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dailySummaryEnabledMeta =
      const VerificationMeta('dailySummaryEnabled');
  @override
  late final GeneratedColumn<bool> dailySummaryEnabled = GeneratedColumn<bool>(
      'daily_summary_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("daily_summary_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _dailySummaryTimeMeta =
      const VerificationMeta('dailySummaryTime');
  @override
  late final GeneratedColumn<int> dailySummaryTime = GeneratedColumn<int>(
      'daily_summary_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        breakfastTime,
        lunchTime,
        dinnerTime,
        snackTime,
        dailySummaryEnabled,
        dailySummaryTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_settings';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('breakfast_time')) {
      context.handle(
          _breakfastTimeMeta,
          breakfastTime.isAcceptableOrUnknown(
              data['breakfast_time']!, _breakfastTimeMeta));
    }
    if (data.containsKey('lunch_time')) {
      context.handle(_lunchTimeMeta,
          lunchTime.isAcceptableOrUnknown(data['lunch_time']!, _lunchTimeMeta));
    }
    if (data.containsKey('dinner_time')) {
      context.handle(
          _dinnerTimeMeta,
          dinnerTime.isAcceptableOrUnknown(
              data['dinner_time']!, _dinnerTimeMeta));
    }
    if (data.containsKey('snack_time')) {
      context.handle(_snackTimeMeta,
          snackTime.isAcceptableOrUnknown(data['snack_time']!, _snackTimeMeta));
    }
    if (data.containsKey('daily_summary_enabled')) {
      context.handle(
          _dailySummaryEnabledMeta,
          dailySummaryEnabled.isAcceptableOrUnknown(
              data['daily_summary_enabled']!, _dailySummaryEnabledMeta));
    }
    if (data.containsKey('daily_summary_time')) {
      context.handle(
          _dailySummaryTimeMeta,
          dailySummaryTime.isAcceptableOrUnknown(
              data['daily_summary_time']!, _dailySummaryTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      breakfastTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}breakfast_time']),
      lunchTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lunch_time']),
      dinnerTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dinner_time']),
      snackTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}snack_time']),
      dailySummaryEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}daily_summary_enabled'])!,
      dailySummaryTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}daily_summary_time']),
    );
  }

  @override
  $NotificationSettingsTable createAlias(String alias) {
    return $NotificationSettingsTable(attachedDatabase, alias);
  }
}

class NotificationSetting extends DataClass
    implements Insertable<NotificationSetting> {
  final int id;
  final int userId;
  final int? breakfastTime;
  final int? lunchTime;
  final int? dinnerTime;
  final int? snackTime;
  final bool dailySummaryEnabled;
  final int? dailySummaryTime;
  const NotificationSetting(
      {required this.id,
      required this.userId,
      this.breakfastTime,
      this.lunchTime,
      this.dinnerTime,
      this.snackTime,
      required this.dailySummaryEnabled,
      this.dailySummaryTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || breakfastTime != null) {
      map['breakfast_time'] = Variable<int>(breakfastTime);
    }
    if (!nullToAbsent || lunchTime != null) {
      map['lunch_time'] = Variable<int>(lunchTime);
    }
    if (!nullToAbsent || dinnerTime != null) {
      map['dinner_time'] = Variable<int>(dinnerTime);
    }
    if (!nullToAbsent || snackTime != null) {
      map['snack_time'] = Variable<int>(snackTime);
    }
    map['daily_summary_enabled'] = Variable<bool>(dailySummaryEnabled);
    if (!nullToAbsent || dailySummaryTime != null) {
      map['daily_summary_time'] = Variable<int>(dailySummaryTime);
    }
    return map;
  }

  NotificationSettingsCompanion toCompanion(bool nullToAbsent) {
    return NotificationSettingsCompanion(
      id: Value(id),
      userId: Value(userId),
      breakfastTime: breakfastTime == null && nullToAbsent
          ? const Value.absent()
          : Value(breakfastTime),
      lunchTime: lunchTime == null && nullToAbsent
          ? const Value.absent()
          : Value(lunchTime),
      dinnerTime: dinnerTime == null && nullToAbsent
          ? const Value.absent()
          : Value(dinnerTime),
      snackTime: snackTime == null && nullToAbsent
          ? const Value.absent()
          : Value(snackTime),
      dailySummaryEnabled: Value(dailySummaryEnabled),
      dailySummaryTime: dailySummaryTime == null && nullToAbsent
          ? const Value.absent()
          : Value(dailySummaryTime),
    );
  }

  factory NotificationSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationSetting(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      breakfastTime: serializer.fromJson<int?>(json['breakfastTime']),
      lunchTime: serializer.fromJson<int?>(json['lunchTime']),
      dinnerTime: serializer.fromJson<int?>(json['dinnerTime']),
      snackTime: serializer.fromJson<int?>(json['snackTime']),
      dailySummaryEnabled:
          serializer.fromJson<bool>(json['dailySummaryEnabled']),
      dailySummaryTime: serializer.fromJson<int?>(json['dailySummaryTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'breakfastTime': serializer.toJson<int?>(breakfastTime),
      'lunchTime': serializer.toJson<int?>(lunchTime),
      'dinnerTime': serializer.toJson<int?>(dinnerTime),
      'snackTime': serializer.toJson<int?>(snackTime),
      'dailySummaryEnabled': serializer.toJson<bool>(dailySummaryEnabled),
      'dailySummaryTime': serializer.toJson<int?>(dailySummaryTime),
    };
  }

  NotificationSetting copyWith(
          {int? id,
          int? userId,
          Value<int?> breakfastTime = const Value.absent(),
          Value<int?> lunchTime = const Value.absent(),
          Value<int?> dinnerTime = const Value.absent(),
          Value<int?> snackTime = const Value.absent(),
          bool? dailySummaryEnabled,
          Value<int?> dailySummaryTime = const Value.absent()}) =>
      NotificationSetting(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        breakfastTime:
            breakfastTime.present ? breakfastTime.value : this.breakfastTime,
        lunchTime: lunchTime.present ? lunchTime.value : this.lunchTime,
        dinnerTime: dinnerTime.present ? dinnerTime.value : this.dinnerTime,
        snackTime: snackTime.present ? snackTime.value : this.snackTime,
        dailySummaryEnabled: dailySummaryEnabled ?? this.dailySummaryEnabled,
        dailySummaryTime: dailySummaryTime.present
            ? dailySummaryTime.value
            : this.dailySummaryTime,
      );
  NotificationSetting copyWithCompanion(NotificationSettingsCompanion data) {
    return NotificationSetting(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      breakfastTime: data.breakfastTime.present
          ? data.breakfastTime.value
          : this.breakfastTime,
      lunchTime: data.lunchTime.present ? data.lunchTime.value : this.lunchTime,
      dinnerTime:
          data.dinnerTime.present ? data.dinnerTime.value : this.dinnerTime,
      snackTime: data.snackTime.present ? data.snackTime.value : this.snackTime,
      dailySummaryEnabled: data.dailySummaryEnabled.present
          ? data.dailySummaryEnabled.value
          : this.dailySummaryEnabled,
      dailySummaryTime: data.dailySummaryTime.present
          ? data.dailySummaryTime.value
          : this.dailySummaryTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSetting(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('breakfastTime: $breakfastTime, ')
          ..write('lunchTime: $lunchTime, ')
          ..write('dinnerTime: $dinnerTime, ')
          ..write('snackTime: $snackTime, ')
          ..write('dailySummaryEnabled: $dailySummaryEnabled, ')
          ..write('dailySummaryTime: $dailySummaryTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, breakfastTime, lunchTime,
      dinnerTime, snackTime, dailySummaryEnabled, dailySummaryTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationSetting &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.breakfastTime == this.breakfastTime &&
          other.lunchTime == this.lunchTime &&
          other.dinnerTime == this.dinnerTime &&
          other.snackTime == this.snackTime &&
          other.dailySummaryEnabled == this.dailySummaryEnabled &&
          other.dailySummaryTime == this.dailySummaryTime);
}

class NotificationSettingsCompanion
    extends UpdateCompanion<NotificationSetting> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int?> breakfastTime;
  final Value<int?> lunchTime;
  final Value<int?> dinnerTime;
  final Value<int?> snackTime;
  final Value<bool> dailySummaryEnabled;
  final Value<int?> dailySummaryTime;
  const NotificationSettingsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.breakfastTime = const Value.absent(),
    this.lunchTime = const Value.absent(),
    this.dinnerTime = const Value.absent(),
    this.snackTime = const Value.absent(),
    this.dailySummaryEnabled = const Value.absent(),
    this.dailySummaryTime = const Value.absent(),
  });
  NotificationSettingsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.breakfastTime = const Value.absent(),
    this.lunchTime = const Value.absent(),
    this.dinnerTime = const Value.absent(),
    this.snackTime = const Value.absent(),
    this.dailySummaryEnabled = const Value.absent(),
    this.dailySummaryTime = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<NotificationSetting> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? breakfastTime,
    Expression<int>? lunchTime,
    Expression<int>? dinnerTime,
    Expression<int>? snackTime,
    Expression<bool>? dailySummaryEnabled,
    Expression<int>? dailySummaryTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (breakfastTime != null) 'breakfast_time': breakfastTime,
      if (lunchTime != null) 'lunch_time': lunchTime,
      if (dinnerTime != null) 'dinner_time': dinnerTime,
      if (snackTime != null) 'snack_time': snackTime,
      if (dailySummaryEnabled != null)
        'daily_summary_enabled': dailySummaryEnabled,
      if (dailySummaryTime != null) 'daily_summary_time': dailySummaryTime,
    });
  }

  NotificationSettingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int?>? breakfastTime,
      Value<int?>? lunchTime,
      Value<int?>? dinnerTime,
      Value<int?>? snackTime,
      Value<bool>? dailySummaryEnabled,
      Value<int?>? dailySummaryTime}) {
    return NotificationSettingsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      breakfastTime: breakfastTime ?? this.breakfastTime,
      lunchTime: lunchTime ?? this.lunchTime,
      dinnerTime: dinnerTime ?? this.dinnerTime,
      snackTime: snackTime ?? this.snackTime,
      dailySummaryEnabled: dailySummaryEnabled ?? this.dailySummaryEnabled,
      dailySummaryTime: dailySummaryTime ?? this.dailySummaryTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (breakfastTime.present) {
      map['breakfast_time'] = Variable<int>(breakfastTime.value);
    }
    if (lunchTime.present) {
      map['lunch_time'] = Variable<int>(lunchTime.value);
    }
    if (dinnerTime.present) {
      map['dinner_time'] = Variable<int>(dinnerTime.value);
    }
    if (snackTime.present) {
      map['snack_time'] = Variable<int>(snackTime.value);
    }
    if (dailySummaryEnabled.present) {
      map['daily_summary_enabled'] = Variable<bool>(dailySummaryEnabled.value);
    }
    if (dailySummaryTime.present) {
      map['daily_summary_time'] = Variable<int>(dailySummaryTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSettingsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('breakfastTime: $breakfastTime, ')
          ..write('lunchTime: $lunchTime, ')
          ..write('dinnerTime: $dinnerTime, ')
          ..write('snackTime: $snackTime, ')
          ..write('dailySummaryEnabled: $dailySummaryEnabled, ')
          ..write('dailySummaryTime: $dailySummaryTime')
          ..write(')'))
        .toString();
  }
}

class $WaterEntriesTable extends WaterEntries
    with TableInfo<$WaterEntriesTable, WaterEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaterEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountMlMeta =
      const VerificationMeta('amountMl');
  @override
  late final GeneratedColumn<int> amountMl = GeneratedColumn<int>(
      'amount_ml', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, amountMl, date, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'water_entries';
  @override
  VerificationContext validateIntegrity(Insertable<WaterEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('amount_ml')) {
      context.handle(_amountMlMeta,
          amountMl.isAcceptableOrUnknown(data['amount_ml']!, _amountMlMeta));
    } else if (isInserting) {
      context.missing(_amountMlMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaterEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaterEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      amountMl: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_ml'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $WaterEntriesTable createAlias(String alias) {
    return $WaterEntriesTable(attachedDatabase, alias);
  }
}

class WaterEntry extends DataClass implements Insertable<WaterEntry> {
  final int id;
  final int userId;
  final int amountMl;
  final DateTime date;
  final DateTime timestamp;
  const WaterEntry(
      {required this.id,
      required this.userId,
      required this.amountMl,
      required this.date,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['amount_ml'] = Variable<int>(amountMl);
    map['date'] = Variable<DateTime>(date);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  WaterEntriesCompanion toCompanion(bool nullToAbsent) {
    return WaterEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      amountMl: Value(amountMl),
      date: Value(date),
      timestamp: Value(timestamp),
    );
  }

  factory WaterEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaterEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      amountMl: serializer.fromJson<int>(json['amountMl']),
      date: serializer.fromJson<DateTime>(json['date']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'amountMl': serializer.toJson<int>(amountMl),
      'date': serializer.toJson<DateTime>(date),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  WaterEntry copyWith(
          {int? id,
          int? userId,
          int? amountMl,
          DateTime? date,
          DateTime? timestamp}) =>
      WaterEntry(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        amountMl: amountMl ?? this.amountMl,
        date: date ?? this.date,
        timestamp: timestamp ?? this.timestamp,
      );
  WaterEntry copyWithCompanion(WaterEntriesCompanion data) {
    return WaterEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      amountMl: data.amountMl.present ? data.amountMl.value : this.amountMl,
      date: data.date.present ? data.date.value : this.date,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaterEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amountMl: $amountMl, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, amountMl, date, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaterEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.amountMl == this.amountMl &&
          other.date == this.date &&
          other.timestamp == this.timestamp);
}

class WaterEntriesCompanion extends UpdateCompanion<WaterEntry> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> amountMl;
  final Value<DateTime> date;
  final Value<DateTime> timestamp;
  const WaterEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.amountMl = const Value.absent(),
    this.date = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  WaterEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int amountMl,
    required DateTime date,
    required DateTime timestamp,
  })  : userId = Value(userId),
        amountMl = Value(amountMl),
        date = Value(date),
        timestamp = Value(timestamp);
  static Insertable<WaterEntry> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? amountMl,
    Expression<DateTime>? date,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (amountMl != null) 'amount_ml': amountMl,
      if (date != null) 'date': date,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  WaterEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? amountMl,
      Value<DateTime>? date,
      Value<DateTime>? timestamp}) {
    return WaterEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amountMl: amountMl ?? this.amountMl,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (amountMl.present) {
      map['amount_ml'] = Variable<int>(amountMl.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaterEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amountMl: $amountMl, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $FastsTable extends Fasts with TableInfo<$FastsTable, Fast> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FastsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _targetDurationMinutesMeta =
      const VerificationMeta('targetDurationMinutes');
  @override
  late final GeneratedColumn<int> targetDurationMinutes = GeneratedColumn<int>(
      'target_duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _presetTypeMeta =
      const VerificationMeta('presetType');
  @override
  late final GeneratedColumn<String> presetType = GeneratedColumn<String>(
      'preset_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('custom'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, startTime, endTime, targetDurationMinutes, presetType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fasts';
  @override
  VerificationContext validateIntegrity(Insertable<Fast> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('target_duration_minutes')) {
      context.handle(
          _targetDurationMinutesMeta,
          targetDurationMinutes.isAcceptableOrUnknown(
              data['target_duration_minutes']!, _targetDurationMinutesMeta));
    } else if (isInserting) {
      context.missing(_targetDurationMinutesMeta);
    }
    if (data.containsKey('preset_type')) {
      context.handle(
          _presetTypeMeta,
          presetType.isAcceptableOrUnknown(
              data['preset_type']!, _presetTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fast map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Fast(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      targetDurationMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}target_duration_minutes'])!,
      presetType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preset_type'])!,
    );
  }

  @override
  $FastsTable createAlias(String alias) {
    return $FastsTable(attachedDatabase, alias);
  }
}

class Fast extends DataClass implements Insertable<Fast> {
  final int id;
  final int userId;
  final DateTime startTime;
  final DateTime? endTime;
  final int targetDurationMinutes;
  final String presetType;
  const Fast(
      {required this.id,
      required this.userId,
      required this.startTime,
      this.endTime,
      required this.targetDurationMinutes,
      required this.presetType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['target_duration_minutes'] = Variable<int>(targetDurationMinutes);
    map['preset_type'] = Variable<String>(presetType);
    return map;
  }

  FastsCompanion toCompanion(bool nullToAbsent) {
    return FastsCompanion(
      id: Value(id),
      userId: Value(userId),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      targetDurationMinutes: Value(targetDurationMinutes),
      presetType: Value(presetType),
    );
  }

  factory Fast.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Fast(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      targetDurationMinutes:
          serializer.fromJson<int>(json['targetDurationMinutes']),
      presetType: serializer.fromJson<String>(json['presetType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'targetDurationMinutes': serializer.toJson<int>(targetDurationMinutes),
      'presetType': serializer.toJson<String>(presetType),
    };
  }

  Fast copyWith(
          {int? id,
          int? userId,
          DateTime? startTime,
          Value<DateTime?> endTime = const Value.absent(),
          int? targetDurationMinutes,
          String? presetType}) =>
      Fast(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        startTime: startTime ?? this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        targetDurationMinutes:
            targetDurationMinutes ?? this.targetDurationMinutes,
        presetType: presetType ?? this.presetType,
      );
  Fast copyWithCompanion(FastsCompanion data) {
    return Fast(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      targetDurationMinutes: data.targetDurationMinutes.present
          ? data.targetDurationMinutes.value
          : this.targetDurationMinutes,
      presetType:
          data.presetType.present ? data.presetType.value : this.presetType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Fast(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('targetDurationMinutes: $targetDurationMinutes, ')
          ..write('presetType: $presetType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, userId, startTime, endTime, targetDurationMinutes, presetType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fast &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.targetDurationMinutes == this.targetDurationMinutes &&
          other.presetType == this.presetType);
}

class FastsCompanion extends UpdateCompanion<Fast> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<int> targetDurationMinutes;
  final Value<String> presetType;
  const FastsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.targetDurationMinutes = const Value.absent(),
    this.presetType = const Value.absent(),
  });
  FastsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    required int targetDurationMinutes,
    this.presetType = const Value.absent(),
  })  : userId = Value(userId),
        startTime = Value(startTime),
        targetDurationMinutes = Value(targetDurationMinutes);
  static Insertable<Fast> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? targetDurationMinutes,
    Expression<String>? presetType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (targetDurationMinutes != null)
        'target_duration_minutes': targetDurationMinutes,
      if (presetType != null) 'preset_type': presetType,
    });
  }

  FastsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<DateTime>? startTime,
      Value<DateTime?>? endTime,
      Value<int>? targetDurationMinutes,
      Value<String>? presetType}) {
    return FastsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      targetDurationMinutes:
          targetDurationMinutes ?? this.targetDurationMinutes,
      presetType: presetType ?? this.presetType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (targetDurationMinutes.present) {
      map['target_duration_minutes'] =
          Variable<int>(targetDurationMinutes.value);
    }
    if (presetType.present) {
      map['preset_type'] = Variable<String>(presetType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FastsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('targetDurationMinutes: $targetDurationMinutes, ')
          ..write('presetType: $presetType')
          ..write(')'))
        .toString();
  }
}

class $AiModelMetadataEntriesTable extends AiModelMetadataEntries
    with TableInfo<$AiModelMetadataEntriesTable, AiModelMetadataEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiModelMetadataEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _modelVersionMeta =
      const VerificationMeta('modelVersion');
  @override
  late final GeneratedColumn<String> modelVersion = GeneratedColumn<String>(
      'model_version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assetPathMeta =
      const VerificationMeta('assetPath');
  @override
  late final GeneratedColumn<String> assetPath = GeneratedColumn<String>(
      'asset_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, modelVersion, assetPath, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_model_metadata_entries';
  @override
  VerificationContext validateIntegrity(
      Insertable<AiModelMetadataEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('model_version')) {
      context.handle(
          _modelVersionMeta,
          modelVersion.isAcceptableOrUnknown(
              data['model_version']!, _modelVersionMeta));
    } else if (isInserting) {
      context.missing(_modelVersionMeta);
    }
    if (data.containsKey('asset_path')) {
      context.handle(_assetPathMeta,
          assetPath.isAcceptableOrUnknown(data['asset_path']!, _assetPathMeta));
    } else if (isInserting) {
      context.missing(_assetPathMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiModelMetadataEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiModelMetadataEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      modelVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model_version'])!,
      assetPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_path'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $AiModelMetadataEntriesTable createAlias(String alias) {
    return $AiModelMetadataEntriesTable(attachedDatabase, alias);
  }
}

class AiModelMetadataEntry extends DataClass
    implements Insertable<AiModelMetadataEntry> {
  final int id;
  final String modelVersion;
  final String assetPath;
  final DateTime lastUpdated;
  const AiModelMetadataEntry(
      {required this.id,
      required this.modelVersion,
      required this.assetPath,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['model_version'] = Variable<String>(modelVersion);
    map['asset_path'] = Variable<String>(assetPath);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  AiModelMetadataEntriesCompanion toCompanion(bool nullToAbsent) {
    return AiModelMetadataEntriesCompanion(
      id: Value(id),
      modelVersion: Value(modelVersion),
      assetPath: Value(assetPath),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory AiModelMetadataEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiModelMetadataEntry(
      id: serializer.fromJson<int>(json['id']),
      modelVersion: serializer.fromJson<String>(json['modelVersion']),
      assetPath: serializer.fromJson<String>(json['assetPath']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'modelVersion': serializer.toJson<String>(modelVersion),
      'assetPath': serializer.toJson<String>(assetPath),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  AiModelMetadataEntry copyWith(
          {int? id,
          String? modelVersion,
          String? assetPath,
          DateTime? lastUpdated}) =>
      AiModelMetadataEntry(
        id: id ?? this.id,
        modelVersion: modelVersion ?? this.modelVersion,
        assetPath: assetPath ?? this.assetPath,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  AiModelMetadataEntry copyWithCompanion(AiModelMetadataEntriesCompanion data) {
    return AiModelMetadataEntry(
      id: data.id.present ? data.id.value : this.id,
      modelVersion: data.modelVersion.present
          ? data.modelVersion.value
          : this.modelVersion,
      assetPath: data.assetPath.present ? data.assetPath.value : this.assetPath,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiModelMetadataEntry(')
          ..write('id: $id, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('assetPath: $assetPath, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, modelVersion, assetPath, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiModelMetadataEntry &&
          other.id == this.id &&
          other.modelVersion == this.modelVersion &&
          other.assetPath == this.assetPath &&
          other.lastUpdated == this.lastUpdated);
}

class AiModelMetadataEntriesCompanion
    extends UpdateCompanion<AiModelMetadataEntry> {
  final Value<int> id;
  final Value<String> modelVersion;
  final Value<String> assetPath;
  final Value<DateTime> lastUpdated;
  const AiModelMetadataEntriesCompanion({
    this.id = const Value.absent(),
    this.modelVersion = const Value.absent(),
    this.assetPath = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  AiModelMetadataEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String modelVersion,
    required String assetPath,
    required DateTime lastUpdated,
  })  : modelVersion = Value(modelVersion),
        assetPath = Value(assetPath),
        lastUpdated = Value(lastUpdated);
  static Insertable<AiModelMetadataEntry> custom({
    Expression<int>? id,
    Expression<String>? modelVersion,
    Expression<String>? assetPath,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (modelVersion != null) 'model_version': modelVersion,
      if (assetPath != null) 'asset_path': assetPath,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  AiModelMetadataEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? modelVersion,
      Value<String>? assetPath,
      Value<DateTime>? lastUpdated}) {
    return AiModelMetadataEntriesCompanion(
      id: id ?? this.id,
      modelVersion: modelVersion ?? this.modelVersion,
      assetPath: assetPath ?? this.assetPath,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (modelVersion.present) {
      map['model_version'] = Variable<String>(modelVersion.value);
    }
    if (assetPath.present) {
      map['asset_path'] = Variable<String>(assetPath.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiModelMetadataEntriesCompanion(')
          ..write('id: $id, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('assetPath: $assetPath, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

class $MealPlansTable extends MealPlans
    with TableInfo<$MealPlansTable, MealPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _mealSlotMeta =
      const VerificationMeta('mealSlot');
  @override
  late final GeneratedColumn<String> mealSlot = GeneratedColumn<String>(
      'meal_slot', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  @override
  late final GeneratedColumn<String> mealId = GeneratedColumn<String>(
      'meal_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, date, mealSlot, recipeId, mealId, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_plans';
  @override
  VerificationContext validateIntegrity(Insertable<MealPlan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('meal_slot')) {
      context.handle(_mealSlotMeta,
          mealSlot.isAcceptableOrUnknown(data['meal_slot']!, _mealSlotMeta));
    } else if (isInserting) {
      context.missing(_mealSlotMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    }
    if (data.containsKey('meal_id')) {
      context.handle(_mealIdMeta,
          mealId.isAcceptableOrUnknown(data['meal_id']!, _mealIdMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPlan(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      mealSlot: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_slot'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id']),
      mealId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_id']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $MealPlansTable createAlias(String alias) {
    return $MealPlansTable(attachedDatabase, alias);
  }
}

class MealPlan extends DataClass implements Insertable<MealPlan> {
  final int id;
  final int userId;
  final DateTime date;
  final String mealSlot;
  final String? recipeId;
  final String? mealId;
  final String? note;
  const MealPlan(
      {required this.id,
      required this.userId,
      required this.date,
      required this.mealSlot,
      this.recipeId,
      this.mealId,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['date'] = Variable<DateTime>(date);
    map['meal_slot'] = Variable<String>(mealSlot);
    if (!nullToAbsent || recipeId != null) {
      map['recipe_id'] = Variable<String>(recipeId);
    }
    if (!nullToAbsent || mealId != null) {
      map['meal_id'] = Variable<String>(mealId);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  MealPlansCompanion toCompanion(bool nullToAbsent) {
    return MealPlansCompanion(
      id: Value(id),
      userId: Value(userId),
      date: Value(date),
      mealSlot: Value(mealSlot),
      recipeId: recipeId == null && nullToAbsent
          ? const Value.absent()
          : Value(recipeId),
      mealId:
          mealId == null && nullToAbsent ? const Value.absent() : Value(mealId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory MealPlan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealPlan(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
      mealSlot: serializer.fromJson<String>(json['mealSlot']),
      recipeId: serializer.fromJson<String?>(json['recipeId']),
      mealId: serializer.fromJson<String?>(json['mealId']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'date': serializer.toJson<DateTime>(date),
      'mealSlot': serializer.toJson<String>(mealSlot),
      'recipeId': serializer.toJson<String?>(recipeId),
      'mealId': serializer.toJson<String?>(mealId),
      'note': serializer.toJson<String?>(note),
    };
  }

  MealPlan copyWith(
          {int? id,
          int? userId,
          DateTime? date,
          String? mealSlot,
          Value<String?> recipeId = const Value.absent(),
          Value<String?> mealId = const Value.absent(),
          Value<String?> note = const Value.absent()}) =>
      MealPlan(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        mealSlot: mealSlot ?? this.mealSlot,
        recipeId: recipeId.present ? recipeId.value : this.recipeId,
        mealId: mealId.present ? mealId.value : this.mealId,
        note: note.present ? note.value : this.note,
      );
  MealPlan copyWithCompanion(MealPlansCompanion data) {
    return MealPlan(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      mealSlot: data.mealSlot.present ? data.mealSlot.value : this.mealSlot,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      mealId: data.mealId.present ? data.mealId.value : this.mealId,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealPlan(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('mealSlot: $mealSlot, ')
          ..write('recipeId: $recipeId, ')
          ..write('mealId: $mealId, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, date, mealSlot, recipeId, mealId, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealPlan &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.mealSlot == this.mealSlot &&
          other.recipeId == this.recipeId &&
          other.mealId == this.mealId &&
          other.note == this.note);
}

class MealPlansCompanion extends UpdateCompanion<MealPlan> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> date;
  final Value<String> mealSlot;
  final Value<String?> recipeId;
  final Value<String?> mealId;
  final Value<String?> note;
  const MealPlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.mealSlot = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.mealId = const Value.absent(),
    this.note = const Value.absent(),
  });
  MealPlansCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required DateTime date,
    required String mealSlot,
    this.recipeId = const Value.absent(),
    this.mealId = const Value.absent(),
    this.note = const Value.absent(),
  })  : userId = Value(userId),
        date = Value(date),
        mealSlot = Value(mealSlot);
  static Insertable<MealPlan> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<DateTime>? date,
    Expression<String>? mealSlot,
    Expression<String>? recipeId,
    Expression<String>? mealId,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (mealSlot != null) 'meal_slot': mealSlot,
      if (recipeId != null) 'recipe_id': recipeId,
      if (mealId != null) 'meal_id': mealId,
      if (note != null) 'note': note,
    });
  }

  MealPlansCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<DateTime>? date,
      Value<String>? mealSlot,
      Value<String?>? recipeId,
      Value<String?>? mealId,
      Value<String?>? note}) {
    return MealPlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      mealSlot: mealSlot ?? this.mealSlot,
      recipeId: recipeId ?? this.recipeId,
      mealId: mealId ?? this.mealId,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mealSlot.present) {
      map['meal_slot'] = Variable<String>(mealSlot.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (mealId.present) {
      map['meal_id'] = Variable<String>(mealId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('mealSlot: $mealSlot, ')
          ..write('recipeId: $recipeId, ')
          ..write('mealId: $mealId, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $PhotoProgressEntriesTable extends PhotoProgressEntries
    with TableInfo<$PhotoProgressEntriesTable, PhotoProgressEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoProgressEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, filePath, date, tags, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photo_progress_entries';
  @override
  VerificationContext validateIntegrity(Insertable<PhotoProgressEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotoProgressEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoProgressEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $PhotoProgressEntriesTable createAlias(String alias) {
    return $PhotoProgressEntriesTable(attachedDatabase, alias);
  }
}

class PhotoProgressEntry extends DataClass
    implements Insertable<PhotoProgressEntry> {
  final int id;
  final int userId;
  final String filePath;
  final DateTime date;
  final String tags;
  final String? note;
  const PhotoProgressEntry(
      {required this.id,
      required this.userId,
      required this.filePath,
      required this.date,
      required this.tags,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['file_path'] = Variable<String>(filePath);
    map['date'] = Variable<DateTime>(date);
    map['tags'] = Variable<String>(tags);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  PhotoProgressEntriesCompanion toCompanion(bool nullToAbsent) {
    return PhotoProgressEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      filePath: Value(filePath),
      date: Value(date),
      tags: Value(tags),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory PhotoProgressEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoProgressEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      date: serializer.fromJson<DateTime>(json['date']),
      tags: serializer.fromJson<String>(json['tags']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'filePath': serializer.toJson<String>(filePath),
      'date': serializer.toJson<DateTime>(date),
      'tags': serializer.toJson<String>(tags),
      'note': serializer.toJson<String?>(note),
    };
  }

  PhotoProgressEntry copyWith(
          {int? id,
          int? userId,
          String? filePath,
          DateTime? date,
          String? tags,
          Value<String?> note = const Value.absent()}) =>
      PhotoProgressEntry(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        filePath: filePath ?? this.filePath,
        date: date ?? this.date,
        tags: tags ?? this.tags,
        note: note.present ? note.value : this.note,
      );
  PhotoProgressEntry copyWithCompanion(PhotoProgressEntriesCompanion data) {
    return PhotoProgressEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      date: data.date.present ? data.date.value : this.date,
      tags: data.tags.present ? data.tags.value : this.tags,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoProgressEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('filePath: $filePath, ')
          ..write('date: $date, ')
          ..write('tags: $tags, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, filePath, date, tags, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoProgressEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.filePath == this.filePath &&
          other.date == this.date &&
          other.tags == this.tags &&
          other.note == this.note);
}

class PhotoProgressEntriesCompanion
    extends UpdateCompanion<PhotoProgressEntry> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> filePath;
  final Value<DateTime> date;
  final Value<String> tags;
  final Value<String?> note;
  const PhotoProgressEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.date = const Value.absent(),
    this.tags = const Value.absent(),
    this.note = const Value.absent(),
  });
  PhotoProgressEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String filePath,
    required DateTime date,
    required String tags,
    this.note = const Value.absent(),
  })  : userId = Value(userId),
        filePath = Value(filePath),
        date = Value(date),
        tags = Value(tags);
  static Insertable<PhotoProgressEntry> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? filePath,
    Expression<DateTime>? date,
    Expression<String>? tags,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (filePath != null) 'file_path': filePath,
      if (date != null) 'date': date,
      if (tags != null) 'tags': tags,
      if (note != null) 'note': note,
    });
  }

  PhotoProgressEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? filePath,
      Value<DateTime>? date,
      Value<String>? tags,
      Value<String?>? note}) {
    return PhotoProgressEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      filePath: filePath ?? this.filePath,
      date: date ?? this.date,
      tags: tags ?? this.tags,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoProgressEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('filePath: $filePath, ')
          ..write('date: $date, ')
          ..write('tags: $tags, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $BodyMeasurementsTable extends BodyMeasurements
    with TableInfo<$BodyMeasurementsTable, BodyMeasurement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyMeasurementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _waistCmMeta =
      const VerificationMeta('waistCm');
  @override
  late final GeneratedColumn<double> waistCm = GeneratedColumn<double>(
      'waist_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _neckCmMeta = const VerificationMeta('neckCm');
  @override
  late final GeneratedColumn<double> neckCm = GeneratedColumn<double>(
      'neck_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _hipCmMeta = const VerificationMeta('hipCm');
  @override
  late final GeneratedColumn<double> hipCm = GeneratedColumn<double>(
      'hip_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _chestCmMeta =
      const VerificationMeta('chestCm');
  @override
  late final GeneratedColumn<double> chestCm = GeneratedColumn<double>(
      'chest_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bicepCmMeta =
      const VerificationMeta('bicepCm');
  @override
  late final GeneratedColumn<double> bicepCm = GeneratedColumn<double>(
      'bicep_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _thighCmMeta =
      const VerificationMeta('thighCm');
  @override
  late final GeneratedColumn<double> thighCm = GeneratedColumn<double>(
      'thigh_cm', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        date,
        waistCm,
        neckCm,
        hipCm,
        chestCm,
        bicepCm,
        thighCm,
        note
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'body_measurements';
  @override
  VerificationContext validateIntegrity(Insertable<BodyMeasurement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('waist_cm')) {
      context.handle(_waistCmMeta,
          waistCm.isAcceptableOrUnknown(data['waist_cm']!, _waistCmMeta));
    }
    if (data.containsKey('neck_cm')) {
      context.handle(_neckCmMeta,
          neckCm.isAcceptableOrUnknown(data['neck_cm']!, _neckCmMeta));
    }
    if (data.containsKey('hip_cm')) {
      context.handle(
          _hipCmMeta, hipCm.isAcceptableOrUnknown(data['hip_cm']!, _hipCmMeta));
    }
    if (data.containsKey('chest_cm')) {
      context.handle(_chestCmMeta,
          chestCm.isAcceptableOrUnknown(data['chest_cm']!, _chestCmMeta));
    }
    if (data.containsKey('bicep_cm')) {
      context.handle(_bicepCmMeta,
          bicepCm.isAcceptableOrUnknown(data['bicep_cm']!, _bicepCmMeta));
    }
    if (data.containsKey('thigh_cm')) {
      context.handle(_thighCmMeta,
          thighCm.isAcceptableOrUnknown(data['thigh_cm']!, _thighCmMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyMeasurement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyMeasurement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      waistCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}waist_cm']),
      neckCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}neck_cm']),
      hipCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hip_cm']),
      chestCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}chest_cm']),
      bicepCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bicep_cm']),
      thighCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}thigh_cm']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $BodyMeasurementsTable createAlias(String alias) {
    return $BodyMeasurementsTable(attachedDatabase, alias);
  }
}

class BodyMeasurement extends DataClass implements Insertable<BodyMeasurement> {
  final int id;
  final int userId;
  final DateTime date;
  final double? waistCm;
  final double? neckCm;
  final double? hipCm;
  final double? chestCm;
  final double? bicepCm;
  final double? thighCm;
  final String? note;
  const BodyMeasurement(
      {required this.id,
      required this.userId,
      required this.date,
      this.waistCm,
      this.neckCm,
      this.hipCm,
      this.chestCm,
      this.bicepCm,
      this.thighCm,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || waistCm != null) {
      map['waist_cm'] = Variable<double>(waistCm);
    }
    if (!nullToAbsent || neckCm != null) {
      map['neck_cm'] = Variable<double>(neckCm);
    }
    if (!nullToAbsent || hipCm != null) {
      map['hip_cm'] = Variable<double>(hipCm);
    }
    if (!nullToAbsent || chestCm != null) {
      map['chest_cm'] = Variable<double>(chestCm);
    }
    if (!nullToAbsent || bicepCm != null) {
      map['bicep_cm'] = Variable<double>(bicepCm);
    }
    if (!nullToAbsent || thighCm != null) {
      map['thigh_cm'] = Variable<double>(thighCm);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  BodyMeasurementsCompanion toCompanion(bool nullToAbsent) {
    return BodyMeasurementsCompanion(
      id: Value(id),
      userId: Value(userId),
      date: Value(date),
      waistCm: waistCm == null && nullToAbsent
          ? const Value.absent()
          : Value(waistCm),
      neckCm:
          neckCm == null && nullToAbsent ? const Value.absent() : Value(neckCm),
      hipCm:
          hipCm == null && nullToAbsent ? const Value.absent() : Value(hipCm),
      chestCm: chestCm == null && nullToAbsent
          ? const Value.absent()
          : Value(chestCm),
      bicepCm: bicepCm == null && nullToAbsent
          ? const Value.absent()
          : Value(bicepCm),
      thighCm: thighCm == null && nullToAbsent
          ? const Value.absent()
          : Value(thighCm),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory BodyMeasurement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyMeasurement(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
      waistCm: serializer.fromJson<double?>(json['waistCm']),
      neckCm: serializer.fromJson<double?>(json['neckCm']),
      hipCm: serializer.fromJson<double?>(json['hipCm']),
      chestCm: serializer.fromJson<double?>(json['chestCm']),
      bicepCm: serializer.fromJson<double?>(json['bicepCm']),
      thighCm: serializer.fromJson<double?>(json['thighCm']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'date': serializer.toJson<DateTime>(date),
      'waistCm': serializer.toJson<double?>(waistCm),
      'neckCm': serializer.toJson<double?>(neckCm),
      'hipCm': serializer.toJson<double?>(hipCm),
      'chestCm': serializer.toJson<double?>(chestCm),
      'bicepCm': serializer.toJson<double?>(bicepCm),
      'thighCm': serializer.toJson<double?>(thighCm),
      'note': serializer.toJson<String?>(note),
    };
  }

  BodyMeasurement copyWith(
          {int? id,
          int? userId,
          DateTime? date,
          Value<double?> waistCm = const Value.absent(),
          Value<double?> neckCm = const Value.absent(),
          Value<double?> hipCm = const Value.absent(),
          Value<double?> chestCm = const Value.absent(),
          Value<double?> bicepCm = const Value.absent(),
          Value<double?> thighCm = const Value.absent(),
          Value<String?> note = const Value.absent()}) =>
      BodyMeasurement(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        waistCm: waistCm.present ? waistCm.value : this.waistCm,
        neckCm: neckCm.present ? neckCm.value : this.neckCm,
        hipCm: hipCm.present ? hipCm.value : this.hipCm,
        chestCm: chestCm.present ? chestCm.value : this.chestCm,
        bicepCm: bicepCm.present ? bicepCm.value : this.bicepCm,
        thighCm: thighCm.present ? thighCm.value : this.thighCm,
        note: note.present ? note.value : this.note,
      );
  BodyMeasurement copyWithCompanion(BodyMeasurementsCompanion data) {
    return BodyMeasurement(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      waistCm: data.waistCm.present ? data.waistCm.value : this.waistCm,
      neckCm: data.neckCm.present ? data.neckCm.value : this.neckCm,
      hipCm: data.hipCm.present ? data.hipCm.value : this.hipCm,
      chestCm: data.chestCm.present ? data.chestCm.value : this.chestCm,
      bicepCm: data.bicepCm.present ? data.bicepCm.value : this.bicepCm,
      thighCm: data.thighCm.present ? data.thighCm.value : this.thighCm,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurement(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('waistCm: $waistCm, ')
          ..write('neckCm: $neckCm, ')
          ..write('hipCm: $hipCm, ')
          ..write('chestCm: $chestCm, ')
          ..write('bicepCm: $bicepCm, ')
          ..write('thighCm: $thighCm, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, date, waistCm, neckCm, hipCm,
      chestCm, bicepCm, thighCm, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyMeasurement &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.waistCm == this.waistCm &&
          other.neckCm == this.neckCm &&
          other.hipCm == this.hipCm &&
          other.chestCm == this.chestCm &&
          other.bicepCm == this.bicepCm &&
          other.thighCm == this.thighCm &&
          other.note == this.note);
}

class BodyMeasurementsCompanion extends UpdateCompanion<BodyMeasurement> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> date;
  final Value<double?> waistCm;
  final Value<double?> neckCm;
  final Value<double?> hipCm;
  final Value<double?> chestCm;
  final Value<double?> bicepCm;
  final Value<double?> thighCm;
  final Value<String?> note;
  const BodyMeasurementsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.waistCm = const Value.absent(),
    this.neckCm = const Value.absent(),
    this.hipCm = const Value.absent(),
    this.chestCm = const Value.absent(),
    this.bicepCm = const Value.absent(),
    this.thighCm = const Value.absent(),
    this.note = const Value.absent(),
  });
  BodyMeasurementsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required DateTime date,
    this.waistCm = const Value.absent(),
    this.neckCm = const Value.absent(),
    this.hipCm = const Value.absent(),
    this.chestCm = const Value.absent(),
    this.bicepCm = const Value.absent(),
    this.thighCm = const Value.absent(),
    this.note = const Value.absent(),
  })  : userId = Value(userId),
        date = Value(date);
  static Insertable<BodyMeasurement> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<DateTime>? date,
    Expression<double>? waistCm,
    Expression<double>? neckCm,
    Expression<double>? hipCm,
    Expression<double>? chestCm,
    Expression<double>? bicepCm,
    Expression<double>? thighCm,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (waistCm != null) 'waist_cm': waistCm,
      if (neckCm != null) 'neck_cm': neckCm,
      if (hipCm != null) 'hip_cm': hipCm,
      if (chestCm != null) 'chest_cm': chestCm,
      if (bicepCm != null) 'bicep_cm': bicepCm,
      if (thighCm != null) 'thigh_cm': thighCm,
      if (note != null) 'note': note,
    });
  }

  BodyMeasurementsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<DateTime>? date,
      Value<double?>? waistCm,
      Value<double?>? neckCm,
      Value<double?>? hipCm,
      Value<double?>? chestCm,
      Value<double?>? bicepCm,
      Value<double?>? thighCm,
      Value<String?>? note}) {
    return BodyMeasurementsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      waistCm: waistCm ?? this.waistCm,
      neckCm: neckCm ?? this.neckCm,
      hipCm: hipCm ?? this.hipCm,
      chestCm: chestCm ?? this.chestCm,
      bicepCm: bicepCm ?? this.bicepCm,
      thighCm: thighCm ?? this.thighCm,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (waistCm.present) {
      map['waist_cm'] = Variable<double>(waistCm.value);
    }
    if (neckCm.present) {
      map['neck_cm'] = Variable<double>(neckCm.value);
    }
    if (hipCm.present) {
      map['hip_cm'] = Variable<double>(hipCm.value);
    }
    if (chestCm.present) {
      map['chest_cm'] = Variable<double>(chestCm.value);
    }
    if (bicepCm.present) {
      map['bicep_cm'] = Variable<double>(bicepCm.value);
    }
    if (thighCm.present) {
      map['thigh_cm'] = Variable<double>(thighCm.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('waistCm: $waistCm, ')
          ..write('neckCm: $neckCm, ')
          ..write('hipCm: $hipCm, ')
          ..write('chestCm: $chestCm, ')
          ..write('bicepCm: $bicepCm, ')
          ..write('thighCm: $thighCm, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $DailyNotesTable extends DailyNotes
    with TableInfo<$DailyNotesTable, DailyNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, date, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_notes';
  @override
  VerificationContext validateIntegrity(Insertable<DailyNote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyNote(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
    );
  }

  @override
  $DailyNotesTable createAlias(String alias) {
    return $DailyNotesTable(attachedDatabase, alias);
  }
}

class DailyNote extends DataClass implements Insertable<DailyNote> {
  final int id;
  final int userId;
  final DateTime date;
  final String note;
  const DailyNote(
      {required this.id,
      required this.userId,
      required this.date,
      required this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['date'] = Variable<DateTime>(date);
    map['note'] = Variable<String>(note);
    return map;
  }

  DailyNotesCompanion toCompanion(bool nullToAbsent) {
    return DailyNotesCompanion(
      id: Value(id),
      userId: Value(userId),
      date: Value(date),
      note: Value(note),
    );
  }

  factory DailyNote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyNote(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String>(note),
    };
  }

  DailyNote copyWith({int? id, int? userId, DateTime? date, String? note}) =>
      DailyNote(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        note: note ?? this.note,
      );
  DailyNote copyWithCompanion(DailyNotesCompanion data) {
    return DailyNote(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyNote(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, date, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyNote &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.note == this.note);
}

class DailyNotesCompanion extends UpdateCompanion<DailyNote> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> date;
  final Value<String> note;
  const DailyNotesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
  });
  DailyNotesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required DateTime date,
    required String note,
  })  : userId = Value(userId),
        date = Value(date),
        note = Value(note);
  static Insertable<DailyNote> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<DateTime>? date,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
    });
  }

  DailyNotesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<DateTime>? date,
      Value<String>? note}) {
    return DailyNotesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyNotesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $AutopilotEntriesTable extends AutopilotEntries
    with TableInfo<$AutopilotEntriesTable, AutopilotEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutopilotEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _baselineCalorieBudgetMeta =
      const VerificationMeta('baselineCalorieBudget');
  @override
  late final GeneratedColumn<int> baselineCalorieBudget = GeneratedColumn<int>(
      'baseline_calorie_budget', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _adjustedCalorieBudgetMeta =
      const VerificationMeta('adjustedCalorieBudget');
  @override
  late final GeneratedColumn<int> adjustedCalorieBudget = GeneratedColumn<int>(
      'adjusted_calorie_budget', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastAdjustmentDateMeta =
      const VerificationMeta('lastAdjustmentDate');
  @override
  late final GeneratedColumn<DateTime> lastAdjustmentDate =
      GeneratedColumn<DateTime>('last_adjustment_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isEnabledMeta =
      const VerificationMeta('isEnabled');
  @override
  late final GeneratedColumn<int> isEnabled = GeneratedColumn<int>(
      'is_enabled', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        baselineCalorieBudget,
        adjustedCalorieBudget,
        lastAdjustmentDate,
        isEnabled
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'autopilot_entries';
  @override
  VerificationContext validateIntegrity(Insertable<AutopilotEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('baseline_calorie_budget')) {
      context.handle(
          _baselineCalorieBudgetMeta,
          baselineCalorieBudget.isAcceptableOrUnknown(
              data['baseline_calorie_budget']!, _baselineCalorieBudgetMeta));
    } else if (isInserting) {
      context.missing(_baselineCalorieBudgetMeta);
    }
    if (data.containsKey('adjusted_calorie_budget')) {
      context.handle(
          _adjustedCalorieBudgetMeta,
          adjustedCalorieBudget.isAcceptableOrUnknown(
              data['adjusted_calorie_budget']!, _adjustedCalorieBudgetMeta));
    } else if (isInserting) {
      context.missing(_adjustedCalorieBudgetMeta);
    }
    if (data.containsKey('last_adjustment_date')) {
      context.handle(
          _lastAdjustmentDateMeta,
          lastAdjustmentDate.isAcceptableOrUnknown(
              data['last_adjustment_date']!, _lastAdjustmentDateMeta));
    } else if (isInserting) {
      context.missing(_lastAdjustmentDateMeta);
    }
    if (data.containsKey('is_enabled')) {
      context.handle(_isEnabledMeta,
          isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta));
    } else if (isInserting) {
      context.missing(_isEnabledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AutopilotEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutopilotEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      baselineCalorieBudget: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}baseline_calorie_budget'])!,
      adjustedCalorieBudget: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}adjusted_calorie_budget'])!,
      lastAdjustmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_adjustment_date'])!,
      isEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_enabled'])!,
    );
  }

  @override
  $AutopilotEntriesTable createAlias(String alias) {
    return $AutopilotEntriesTable(attachedDatabase, alias);
  }
}

class AutopilotEntry extends DataClass implements Insertable<AutopilotEntry> {
  final int id;
  final int userId;
  final int baselineCalorieBudget;
  final int adjustedCalorieBudget;
  final DateTime lastAdjustmentDate;
  final int isEnabled;
  const AutopilotEntry(
      {required this.id,
      required this.userId,
      required this.baselineCalorieBudget,
      required this.adjustedCalorieBudget,
      required this.lastAdjustmentDate,
      required this.isEnabled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['baseline_calorie_budget'] = Variable<int>(baselineCalorieBudget);
    map['adjusted_calorie_budget'] = Variable<int>(adjustedCalorieBudget);
    map['last_adjustment_date'] = Variable<DateTime>(lastAdjustmentDate);
    map['is_enabled'] = Variable<int>(isEnabled);
    return map;
  }

  AutopilotEntriesCompanion toCompanion(bool nullToAbsent) {
    return AutopilotEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      baselineCalorieBudget: Value(baselineCalorieBudget),
      adjustedCalorieBudget: Value(adjustedCalorieBudget),
      lastAdjustmentDate: Value(lastAdjustmentDate),
      isEnabled: Value(isEnabled),
    );
  }

  factory AutopilotEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutopilotEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      baselineCalorieBudget:
          serializer.fromJson<int>(json['baselineCalorieBudget']),
      adjustedCalorieBudget:
          serializer.fromJson<int>(json['adjustedCalorieBudget']),
      lastAdjustmentDate:
          serializer.fromJson<DateTime>(json['lastAdjustmentDate']),
      isEnabled: serializer.fromJson<int>(json['isEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'baselineCalorieBudget': serializer.toJson<int>(baselineCalorieBudget),
      'adjustedCalorieBudget': serializer.toJson<int>(adjustedCalorieBudget),
      'lastAdjustmentDate': serializer.toJson<DateTime>(lastAdjustmentDate),
      'isEnabled': serializer.toJson<int>(isEnabled),
    };
  }

  AutopilotEntry copyWith(
          {int? id,
          int? userId,
          int? baselineCalorieBudget,
          int? adjustedCalorieBudget,
          DateTime? lastAdjustmentDate,
          int? isEnabled}) =>
      AutopilotEntry(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        baselineCalorieBudget:
            baselineCalorieBudget ?? this.baselineCalorieBudget,
        adjustedCalorieBudget:
            adjustedCalorieBudget ?? this.adjustedCalorieBudget,
        lastAdjustmentDate: lastAdjustmentDate ?? this.lastAdjustmentDate,
        isEnabled: isEnabled ?? this.isEnabled,
      );
  AutopilotEntry copyWithCompanion(AutopilotEntriesCompanion data) {
    return AutopilotEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      baselineCalorieBudget: data.baselineCalorieBudget.present
          ? data.baselineCalorieBudget.value
          : this.baselineCalorieBudget,
      adjustedCalorieBudget: data.adjustedCalorieBudget.present
          ? data.adjustedCalorieBudget.value
          : this.adjustedCalorieBudget,
      lastAdjustmentDate: data.lastAdjustmentDate.present
          ? data.lastAdjustmentDate.value
          : this.lastAdjustmentDate,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutopilotEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('baselineCalorieBudget: $baselineCalorieBudget, ')
          ..write('adjustedCalorieBudget: $adjustedCalorieBudget, ')
          ..write('lastAdjustmentDate: $lastAdjustmentDate, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, baselineCalorieBudget,
      adjustedCalorieBudget, lastAdjustmentDate, isEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutopilotEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.baselineCalorieBudget == this.baselineCalorieBudget &&
          other.adjustedCalorieBudget == this.adjustedCalorieBudget &&
          other.lastAdjustmentDate == this.lastAdjustmentDate &&
          other.isEnabled == this.isEnabled);
}

class AutopilotEntriesCompanion extends UpdateCompanion<AutopilotEntry> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> baselineCalorieBudget;
  final Value<int> adjustedCalorieBudget;
  final Value<DateTime> lastAdjustmentDate;
  final Value<int> isEnabled;
  const AutopilotEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.baselineCalorieBudget = const Value.absent(),
    this.adjustedCalorieBudget = const Value.absent(),
    this.lastAdjustmentDate = const Value.absent(),
    this.isEnabled = const Value.absent(),
  });
  AutopilotEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int baselineCalorieBudget,
    required int adjustedCalorieBudget,
    required DateTime lastAdjustmentDate,
    required int isEnabled,
  })  : userId = Value(userId),
        baselineCalorieBudget = Value(baselineCalorieBudget),
        adjustedCalorieBudget = Value(adjustedCalorieBudget),
        lastAdjustmentDate = Value(lastAdjustmentDate),
        isEnabled = Value(isEnabled);
  static Insertable<AutopilotEntry> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? baselineCalorieBudget,
    Expression<int>? adjustedCalorieBudget,
    Expression<DateTime>? lastAdjustmentDate,
    Expression<int>? isEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (baselineCalorieBudget != null)
        'baseline_calorie_budget': baselineCalorieBudget,
      if (adjustedCalorieBudget != null)
        'adjusted_calorie_budget': adjustedCalorieBudget,
      if (lastAdjustmentDate != null)
        'last_adjustment_date': lastAdjustmentDate,
      if (isEnabled != null) 'is_enabled': isEnabled,
    });
  }

  AutopilotEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? baselineCalorieBudget,
      Value<int>? adjustedCalorieBudget,
      Value<DateTime>? lastAdjustmentDate,
      Value<int>? isEnabled}) {
    return AutopilotEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      baselineCalorieBudget:
          baselineCalorieBudget ?? this.baselineCalorieBudget,
      adjustedCalorieBudget:
          adjustedCalorieBudget ?? this.adjustedCalorieBudget,
      lastAdjustmentDate: lastAdjustmentDate ?? this.lastAdjustmentDate,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (baselineCalorieBudget.present) {
      map['baseline_calorie_budget'] =
          Variable<int>(baselineCalorieBudget.value);
    }
    if (adjustedCalorieBudget.present) {
      map['adjusted_calorie_budget'] =
          Variable<int>(adjustedCalorieBudget.value);
    }
    if (lastAdjustmentDate.present) {
      map['last_adjustment_date'] =
          Variable<DateTime>(lastAdjustmentDate.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<int>(isEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutopilotEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('baselineCalorieBudget: $baselineCalorieBudget, ')
          ..write('adjustedCalorieBudget: $adjustedCalorieBudget, ')
          ..write('lastAdjustmentDate: $lastAdjustmentDate, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }
}

class $CustomTrackersTable extends CustomTrackers
    with TableInfo<$CustomTrackersTable, CustomTracker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomTrackersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _minMeta = const VerificationMeta('min');
  @override
  late final GeneratedColumn<double> min = GeneratedColumn<double>(
      'min', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxMeta = const VerificationMeta('max');
  @override
  late final GeneratedColumn<double> max = GeneratedColumn<double>(
      'max', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, name, type, min, max, icon, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_trackers';
  @override
  VerificationContext validateIntegrity(Insertable<CustomTracker> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('min')) {
      context.handle(
          _minMeta, min.isAcceptableOrUnknown(data['min']!, _minMeta));
    } else if (isInserting) {
      context.missing(_minMeta);
    }
    if (data.containsKey('max')) {
      context.handle(
          _maxMeta, max.isAcceptableOrUnknown(data['max']!, _maxMeta));
    } else if (isInserting) {
      context.missing(_maxMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomTracker map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomTracker(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      min: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min'])!,
      max: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit']),
    );
  }

  @override
  $CustomTrackersTable createAlias(String alias) {
    return $CustomTrackersTable(attachedDatabase, alias);
  }
}

class CustomTracker extends DataClass implements Insertable<CustomTracker> {
  final int id;
  final int userId;
  final String name;
  final String type;
  final double min;
  final double max;
  final String icon;
  final String? unit;
  const CustomTracker(
      {required this.id,
      required this.userId,
      required this.name,
      required this.type,
      required this.min,
      required this.max,
      required this.icon,
      this.unit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['min'] = Variable<double>(min);
    map['max'] = Variable<double>(max);
    map['icon'] = Variable<String>(icon);
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    return map;
  }

  CustomTrackersCompanion toCompanion(bool nullToAbsent) {
    return CustomTrackersCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      type: Value(type),
      min: Value(min),
      max: Value(max),
      icon: Value(icon),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
    );
  }

  factory CustomTracker.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomTracker(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      min: serializer.fromJson<double>(json['min']),
      max: serializer.fromJson<double>(json['max']),
      icon: serializer.fromJson<String>(json['icon']),
      unit: serializer.fromJson<String?>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'min': serializer.toJson<double>(min),
      'max': serializer.toJson<double>(max),
      'icon': serializer.toJson<String>(icon),
      'unit': serializer.toJson<String?>(unit),
    };
  }

  CustomTracker copyWith(
          {int? id,
          int? userId,
          String? name,
          String? type,
          double? min,
          double? max,
          String? icon,
          Value<String?> unit = const Value.absent()}) =>
      CustomTracker(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        type: type ?? this.type,
        min: min ?? this.min,
        max: max ?? this.max,
        icon: icon ?? this.icon,
        unit: unit.present ? unit.value : this.unit,
      );
  CustomTracker copyWithCompanion(CustomTrackersCompanion data) {
    return CustomTracker(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      min: data.min.present ? data.min.value : this.min,
      max: data.max.present ? data.max.value : this.max,
      icon: data.icon.present ? data.icon.value : this.icon,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomTracker(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('min: $min, ')
          ..write('max: $max, ')
          ..write('icon: $icon, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, name, type, min, max, icon, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomTracker &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.type == this.type &&
          other.min == this.min &&
          other.max == this.max &&
          other.icon == this.icon &&
          other.unit == this.unit);
}

class CustomTrackersCompanion extends UpdateCompanion<CustomTracker> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<String> type;
  final Value<double> min;
  final Value<double> max;
  final Value<String> icon;
  final Value<String?> unit;
  const CustomTrackersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.min = const Value.absent(),
    this.max = const Value.absent(),
    this.icon = const Value.absent(),
    this.unit = const Value.absent(),
  });
  CustomTrackersCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String name,
    required String type,
    required double min,
    required double max,
    required String icon,
    this.unit = const Value.absent(),
  })  : userId = Value(userId),
        name = Value(name),
        type = Value(type),
        min = Value(min),
        max = Value(max),
        icon = Value(icon);
  static Insertable<CustomTracker> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<double>? min,
    Expression<double>? max,
    Expression<String>? icon,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (min != null) 'min': min,
      if (max != null) 'max': max,
      if (icon != null) 'icon': icon,
      if (unit != null) 'unit': unit,
    });
  }

  CustomTrackersCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? name,
      Value<String>? type,
      Value<double>? min,
      Value<double>? max,
      Value<String>? icon,
      Value<String?>? unit}) {
    return CustomTrackersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      type: type ?? this.type,
      min: min ?? this.min,
      max: max ?? this.max,
      icon: icon ?? this.icon,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (min.present) {
      map['min'] = Variable<double>(min.value);
    }
    if (max.present) {
      map['max'] = Variable<double>(max.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomTrackersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('min: $min, ')
          ..write('max: $max, ')
          ..write('icon: $icon, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

class $CustomTrackerEntriesTable extends CustomTrackerEntries
    with TableInfo<$CustomTrackerEntriesTable, CustomTrackerEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomTrackerEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _trackerIdMeta =
      const VerificationMeta('trackerId');
  @override
  late final GeneratedColumn<int> trackerId = GeneratedColumn<int>(
      'tracker_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _textValueMeta =
      const VerificationMeta('textValue');
  @override
  late final GeneratedColumn<String> textValue = GeneratedColumn<String>(
      'text_value', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, trackerId, date, value, textValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_tracker_entries';
  @override
  VerificationContext validateIntegrity(Insertable<CustomTrackerEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('tracker_id')) {
      context.handle(_trackerIdMeta,
          trackerId.isAcceptableOrUnknown(data['tracker_id']!, _trackerIdMeta));
    } else if (isInserting) {
      context.missing(_trackerIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('text_value')) {
      context.handle(_textValueMeta,
          textValue.isAcceptableOrUnknown(data['text_value']!, _textValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomTrackerEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomTrackerEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      trackerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tracker_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      textValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text_value']),
    );
  }

  @override
  $CustomTrackerEntriesTable createAlias(String alias) {
    return $CustomTrackerEntriesTable(attachedDatabase, alias);
  }
}

class CustomTrackerEntry extends DataClass
    implements Insertable<CustomTrackerEntry> {
  final int id;
  final int userId;
  final int trackerId;
  final DateTime date;
  final double value;
  final String? textValue;
  const CustomTrackerEntry(
      {required this.id,
      required this.userId,
      required this.trackerId,
      required this.date,
      required this.value,
      this.textValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['tracker_id'] = Variable<int>(trackerId);
    map['date'] = Variable<DateTime>(date);
    map['value'] = Variable<double>(value);
    if (!nullToAbsent || textValue != null) {
      map['text_value'] = Variable<String>(textValue);
    }
    return map;
  }

  CustomTrackerEntriesCompanion toCompanion(bool nullToAbsent) {
    return CustomTrackerEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      trackerId: Value(trackerId),
      date: Value(date),
      value: Value(value),
      textValue: textValue == null && nullToAbsent
          ? const Value.absent()
          : Value(textValue),
    );
  }

  factory CustomTrackerEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomTrackerEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      trackerId: serializer.fromJson<int>(json['trackerId']),
      date: serializer.fromJson<DateTime>(json['date']),
      value: serializer.fromJson<double>(json['value']),
      textValue: serializer.fromJson<String?>(json['textValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'trackerId': serializer.toJson<int>(trackerId),
      'date': serializer.toJson<DateTime>(date),
      'value': serializer.toJson<double>(value),
      'textValue': serializer.toJson<String?>(textValue),
    };
  }

  CustomTrackerEntry copyWith(
          {int? id,
          int? userId,
          int? trackerId,
          DateTime? date,
          double? value,
          Value<String?> textValue = const Value.absent()}) =>
      CustomTrackerEntry(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        trackerId: trackerId ?? this.trackerId,
        date: date ?? this.date,
        value: value ?? this.value,
        textValue: textValue.present ? textValue.value : this.textValue,
      );
  CustomTrackerEntry copyWithCompanion(CustomTrackerEntriesCompanion data) {
    return CustomTrackerEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      trackerId: data.trackerId.present ? data.trackerId.value : this.trackerId,
      date: data.date.present ? data.date.value : this.date,
      value: data.value.present ? data.value.value : this.value,
      textValue: data.textValue.present ? data.textValue.value : this.textValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomTrackerEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('trackerId: $trackerId, ')
          ..write('date: $date, ')
          ..write('value: $value, ')
          ..write('textValue: $textValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, trackerId, date, value, textValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomTrackerEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.trackerId == this.trackerId &&
          other.date == this.date &&
          other.value == this.value &&
          other.textValue == this.textValue);
}

class CustomTrackerEntriesCompanion
    extends UpdateCompanion<CustomTrackerEntry> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> trackerId;
  final Value<DateTime> date;
  final Value<double> value;
  final Value<String?> textValue;
  const CustomTrackerEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.trackerId = const Value.absent(),
    this.date = const Value.absent(),
    this.value = const Value.absent(),
    this.textValue = const Value.absent(),
  });
  CustomTrackerEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int trackerId,
    required DateTime date,
    required double value,
    this.textValue = const Value.absent(),
  })  : userId = Value(userId),
        trackerId = Value(trackerId),
        date = Value(date),
        value = Value(value);
  static Insertable<CustomTrackerEntry> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? trackerId,
    Expression<DateTime>? date,
    Expression<double>? value,
    Expression<String>? textValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (trackerId != null) 'tracker_id': trackerId,
      if (date != null) 'date': date,
      if (value != null) 'value': value,
      if (textValue != null) 'text_value': textValue,
    });
  }

  CustomTrackerEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? trackerId,
      Value<DateTime>? date,
      Value<double>? value,
      Value<String?>? textValue}) {
    return CustomTrackerEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      trackerId: trackerId ?? this.trackerId,
      date: date ?? this.date,
      value: value ?? this.value,
      textValue: textValue ?? this.textValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (trackerId.present) {
      map['tracker_id'] = Variable<int>(trackerId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (textValue.present) {
      map['text_value'] = Variable<String>(textValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomTrackerEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('trackerId: $trackerId, ')
          ..write('date: $date, ')
          ..write('value: $value, ')
          ..write('textValue: $textValue')
          ..write(')'))
        .toString();
  }
}

class $SymptomEntriesTable extends SymptomEntries
    with TableInfo<$SymptomEntriesTable, SymptomEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SymptomEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumn<int> severity = GeneratedColumn<int>(
      'severity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, date, timestamp, type, severity, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'symptom_entries';
  @override
  VerificationContext validateIntegrity(Insertable<SymptomEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(_severityMeta,
          severity.isAcceptableOrUnknown(data['severity']!, _severityMeta));
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SymptomEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SymptomEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      severity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}severity'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $SymptomEntriesTable createAlias(String alias) {
    return $SymptomEntriesTable(attachedDatabase, alias);
  }
}

class SymptomEntry extends DataClass implements Insertable<SymptomEntry> {
  final int id;
  final int userId;
  final DateTime date;
  final DateTime timestamp;
  final String type;
  final int severity;
  final String? notes;
  const SymptomEntry(
      {required this.id,
      required this.userId,
      required this.date,
      required this.timestamp,
      required this.type,
      required this.severity,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['date'] = Variable<DateTime>(date);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['type'] = Variable<String>(type);
    map['severity'] = Variable<int>(severity);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SymptomEntriesCompanion toCompanion(bool nullToAbsent) {
    return SymptomEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      date: Value(date),
      timestamp: Value(timestamp),
      type: Value(type),
      severity: Value(severity),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory SymptomEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SymptomEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      type: serializer.fromJson<String>(json['type']),
      severity: serializer.fromJson<int>(json['severity']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'date': serializer.toJson<DateTime>(date),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'type': serializer.toJson<String>(type),
      'severity': serializer.toJson<int>(severity),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  SymptomEntry copyWith(
          {int? id,
          int? userId,
          DateTime? date,
          DateTime? timestamp,
          String? type,
          int? severity,
          Value<String?> notes = const Value.absent()}) =>
      SymptomEntry(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type,
        severity: severity ?? this.severity,
        notes: notes.present ? notes.value : this.notes,
      );
  SymptomEntry copyWithCompanion(SymptomEntriesCompanion data) {
    return SymptomEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      type: data.type.present ? data.type.value : this.type,
      severity: data.severity.present ? data.severity.value : this.severity,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SymptomEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('severity: $severity, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, date, timestamp, type, severity, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SymptomEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.timestamp == this.timestamp &&
          other.type == this.type &&
          other.severity == this.severity &&
          other.notes == this.notes);
}

class SymptomEntriesCompanion extends UpdateCompanion<SymptomEntry> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> date;
  final Value<DateTime> timestamp;
  final Value<String> type;
  final Value<int> severity;
  final Value<String?> notes;
  const SymptomEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.type = const Value.absent(),
    this.severity = const Value.absent(),
    this.notes = const Value.absent(),
  });
  SymptomEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required DateTime date,
    required DateTime timestamp,
    required String type,
    required int severity,
    this.notes = const Value.absent(),
  })  : userId = Value(userId),
        date = Value(date),
        timestamp = Value(timestamp),
        type = Value(type),
        severity = Value(severity);
  static Insertable<SymptomEntry> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<DateTime>? date,
    Expression<DateTime>? timestamp,
    Expression<String>? type,
    Expression<int>? severity,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (timestamp != null) 'timestamp': timestamp,
      if (type != null) 'type': type,
      if (severity != null) 'severity': severity,
      if (notes != null) 'notes': notes,
    });
  }

  SymptomEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<DateTime>? date,
      Value<DateTime>? timestamp,
      Value<String>? type,
      Value<int>? severity,
      Value<String?>? notes}) {
    return SymptomEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      severity: severity ?? this.severity,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (severity.present) {
      map['severity'] = Variable<int>(severity.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SymptomEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('severity: $severity, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
      'dosage', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
      'frequency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('daily'));
  static const VerificationMeta _timesPerDayMeta =
      const VerificationMeta('timesPerDay');
  @override
  late final GeneratedColumn<int> timesPerDay = GeneratedColumn<int>(
      'times_per_day', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, name, dosage, frequency, timesPerDay, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(Insertable<Medication> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(_dosageMeta,
          dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta));
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    }
    if (data.containsKey('times_per_day')) {
      context.handle(
          _timesPerDayMeta,
          timesPerDay.isAcceptableOrUnknown(
              data['times_per_day']!, _timesPerDayMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dosage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dosage'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}frequency'])!,
      timesPerDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_per_day'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final int id;
  final int userId;
  final String name;
  final String dosage;
  final String frequency;
  final int timesPerDay;
  final String? notes;
  const Medication(
      {required this.id,
      required this.userId,
      required this.name,
      required this.dosage,
      required this.frequency,
      required this.timesPerDay,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['dosage'] = Variable<String>(dosage);
    map['frequency'] = Variable<String>(frequency);
    map['times_per_day'] = Variable<int>(timesPerDay);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      dosage: Value(dosage),
      frequency: Value(frequency),
      timesPerDay: Value(timesPerDay),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Medication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      dosage: serializer.fromJson<String>(json['dosage']),
      frequency: serializer.fromJson<String>(json['frequency']),
      timesPerDay: serializer.fromJson<int>(json['timesPerDay']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'dosage': serializer.toJson<String>(dosage),
      'frequency': serializer.toJson<String>(frequency),
      'timesPerDay': serializer.toJson<int>(timesPerDay),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Medication copyWith(
          {int? id,
          int? userId,
          String? name,
          String? dosage,
          String? frequency,
          int? timesPerDay,
          Value<String?> notes = const Value.absent()}) =>
      Medication(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        dosage: dosage ?? this.dosage,
        frequency: frequency ?? this.frequency,
        timesPerDay: timesPerDay ?? this.timesPerDay,
        notes: notes.present ? notes.value : this.notes,
      );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      timesPerDay:
          data.timesPerDay.present ? data.timesPerDay.value : this.timesPerDay,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('timesPerDay: $timesPerDay, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, name, dosage, frequency, timesPerDay, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.dosage == this.dosage &&
          other.frequency == this.frequency &&
          other.timesPerDay == this.timesPerDay &&
          other.notes == this.notes);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<String> dosage;
  final Value<String> frequency;
  final Value<int> timesPerDay;
  final Value<String?> notes;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.dosage = const Value.absent(),
    this.frequency = const Value.absent(),
    this.timesPerDay = const Value.absent(),
    this.notes = const Value.absent(),
  });
  MedicationsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String name,
    required String dosage,
    this.frequency = const Value.absent(),
    this.timesPerDay = const Value.absent(),
    this.notes = const Value.absent(),
  })  : userId = Value(userId),
        name = Value(name),
        dosage = Value(dosage);
  static Insertable<Medication> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? dosage,
    Expression<String>? frequency,
    Expression<int>? timesPerDay,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (dosage != null) 'dosage': dosage,
      if (frequency != null) 'frequency': frequency,
      if (timesPerDay != null) 'times_per_day': timesPerDay,
      if (notes != null) 'notes': notes,
    });
  }

  MedicationsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? name,
      Value<String>? dosage,
      Value<String>? frequency,
      Value<int>? timesPerDay,
      Value<String?>? notes}) {
    return MedicationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      timesPerDay: timesPerDay ?? this.timesPerDay,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (timesPerDay.present) {
      map['times_per_day'] = Variable<int>(timesPerDay.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('timesPerDay: $timesPerDay, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $MedicationLogsTable extends MedicationLogs
    with TableInfo<$MedicationLogsTable, MedicationLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _medicationIdMeta =
      const VerificationMeta('medicationId');
  @override
  late final GeneratedColumn<int> medicationId = GeneratedColumn<int>(
      'medication_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES medications (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _doseTakenMeta =
      const VerificationMeta('doseTaken');
  @override
  late final GeneratedColumn<bool> doseTaken = GeneratedColumn<bool>(
      'dose_taken', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dose_taken" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, medicationId, date, timestamp, doseTaken, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_logs';
  @override
  VerificationContext validateIntegrity(Insertable<MedicationLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('medication_id')) {
      context.handle(
          _medicationIdMeta,
          medicationId.isAcceptableOrUnknown(
              data['medication_id']!, _medicationIdMeta));
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('dose_taken')) {
      context.handle(_doseTakenMeta,
          doseTaken.isAcceptableOrUnknown(data['dose_taken']!, _doseTakenMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      medicationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}medication_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      doseTaken: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dose_taken'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $MedicationLogsTable createAlias(String alias) {
    return $MedicationLogsTable(attachedDatabase, alias);
  }
}

class MedicationLog extends DataClass implements Insertable<MedicationLog> {
  final int id;
  final int userId;
  final int medicationId;
  final DateTime date;
  final DateTime timestamp;
  final bool doseTaken;
  final String? notes;
  const MedicationLog(
      {required this.id,
      required this.userId,
      required this.medicationId,
      required this.date,
      required this.timestamp,
      required this.doseTaken,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['medication_id'] = Variable<int>(medicationId);
    map['date'] = Variable<DateTime>(date);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['dose_taken'] = Variable<bool>(doseTaken);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MedicationLogsCompanion toCompanion(bool nullToAbsent) {
    return MedicationLogsCompanion(
      id: Value(id),
      userId: Value(userId),
      medicationId: Value(medicationId),
      date: Value(date),
      timestamp: Value(timestamp),
      doseTaken: Value(doseTaken),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory MedicationLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationLog(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      medicationId: serializer.fromJson<int>(json['medicationId']),
      date: serializer.fromJson<DateTime>(json['date']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      doseTaken: serializer.fromJson<bool>(json['doseTaken']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'medicationId': serializer.toJson<int>(medicationId),
      'date': serializer.toJson<DateTime>(date),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'doseTaken': serializer.toJson<bool>(doseTaken),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  MedicationLog copyWith(
          {int? id,
          int? userId,
          int? medicationId,
          DateTime? date,
          DateTime? timestamp,
          bool? doseTaken,
          Value<String?> notes = const Value.absent()}) =>
      MedicationLog(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        medicationId: medicationId ?? this.medicationId,
        date: date ?? this.date,
        timestamp: timestamp ?? this.timestamp,
        doseTaken: doseTaken ?? this.doseTaken,
        notes: notes.present ? notes.value : this.notes,
      );
  MedicationLog copyWithCompanion(MedicationLogsCompanion data) {
    return MedicationLog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      date: data.date.present ? data.date.value : this.date,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      doseTaken: data.doseTaken.present ? data.doseTaken.value : this.doseTaken,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicationLog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('medicationId: $medicationId, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp, ')
          ..write('doseTaken: $doseTaken, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, medicationId, date, timestamp, doseTaken, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationLog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.medicationId == this.medicationId &&
          other.date == this.date &&
          other.timestamp == this.timestamp &&
          other.doseTaken == this.doseTaken &&
          other.notes == this.notes);
}

class MedicationLogsCompanion extends UpdateCompanion<MedicationLog> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> medicationId;
  final Value<DateTime> date;
  final Value<DateTime> timestamp;
  final Value<bool> doseTaken;
  final Value<String?> notes;
  const MedicationLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.date = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.doseTaken = const Value.absent(),
    this.notes = const Value.absent(),
  });
  MedicationLogsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int medicationId,
    required DateTime date,
    required DateTime timestamp,
    this.doseTaken = const Value.absent(),
    this.notes = const Value.absent(),
  })  : userId = Value(userId),
        medicationId = Value(medicationId),
        date = Value(date),
        timestamp = Value(timestamp);
  static Insertable<MedicationLog> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? medicationId,
    Expression<DateTime>? date,
    Expression<DateTime>? timestamp,
    Expression<bool>? doseTaken,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (medicationId != null) 'medication_id': medicationId,
      if (date != null) 'date': date,
      if (timestamp != null) 'timestamp': timestamp,
      if (doseTaken != null) 'dose_taken': doseTaken,
      if (notes != null) 'notes': notes,
    });
  }

  MedicationLogsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? medicationId,
      Value<DateTime>? date,
      Value<DateTime>? timestamp,
      Value<bool>? doseTaken,
      Value<String?>? notes}) {
    return MedicationLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      medicationId: medicationId ?? this.medicationId,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
      doseTaken: doseTaken ?? this.doseTaken,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<int>(medicationId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (doseTaken.present) {
      map['dose_taken'] = Variable<bool>(doseTaken.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('medicationId: $medicationId, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp, ')
          ..write('doseTaken: $doseTaken, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $BloodGlucoseEntriesTable extends BloodGlucoseEntries
    with TableInfo<$BloodGlucoseEntriesTable, BloodGlucoseEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BloodGlucoseEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _valueMgDlMeta =
      const VerificationMeta('valueMgDl');
  @override
  late final GeneratedColumn<int> valueMgDl = GeneratedColumn<int>(
      'value_mg_dl', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('fasting'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, date, timestamp, valueMgDl, label, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blood_glucose_entries';
  @override
  VerificationContext validateIntegrity(Insertable<BloodGlucoseEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('value_mg_dl')) {
      context.handle(
          _valueMgDlMeta,
          valueMgDl.isAcceptableOrUnknown(
              data['value_mg_dl']!, _valueMgDlMeta));
    } else if (isInserting) {
      context.missing(_valueMgDlMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BloodGlucoseEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BloodGlucoseEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      valueMgDl: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value_mg_dl'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $BloodGlucoseEntriesTable createAlias(String alias) {
    return $BloodGlucoseEntriesTable(attachedDatabase, alias);
  }
}

class BloodGlucoseEntry extends DataClass
    implements Insertable<BloodGlucoseEntry> {
  final int id;
  final int userId;
  final DateTime date;
  final DateTime timestamp;
  final int valueMgDl;
  final String label;
  final String? notes;
  const BloodGlucoseEntry(
      {required this.id,
      required this.userId,
      required this.date,
      required this.timestamp,
      required this.valueMgDl,
      required this.label,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['date'] = Variable<DateTime>(date);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['value_mg_dl'] = Variable<int>(valueMgDl);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  BloodGlucoseEntriesCompanion toCompanion(bool nullToAbsent) {
    return BloodGlucoseEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      date: Value(date),
      timestamp: Value(timestamp),
      valueMgDl: Value(valueMgDl),
      label: Value(label),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory BloodGlucoseEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BloodGlucoseEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      valueMgDl: serializer.fromJson<int>(json['valueMgDl']),
      label: serializer.fromJson<String>(json['label']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'date': serializer.toJson<DateTime>(date),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'valueMgDl': serializer.toJson<int>(valueMgDl),
      'label': serializer.toJson<String>(label),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  BloodGlucoseEntry copyWith(
          {int? id,
          int? userId,
          DateTime? date,
          DateTime? timestamp,
          int? valueMgDl,
          String? label,
          Value<String?> notes = const Value.absent()}) =>
      BloodGlucoseEntry(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        timestamp: timestamp ?? this.timestamp,
        valueMgDl: valueMgDl ?? this.valueMgDl,
        label: label ?? this.label,
        notes: notes.present ? notes.value : this.notes,
      );
  BloodGlucoseEntry copyWithCompanion(BloodGlucoseEntriesCompanion data) {
    return BloodGlucoseEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      valueMgDl: data.valueMgDl.present ? data.valueMgDl.value : this.valueMgDl,
      label: data.label.present ? data.label.value : this.label,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BloodGlucoseEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp, ')
          ..write('valueMgDl: $valueMgDl, ')
          ..write('label: $label, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, date, timestamp, valueMgDl, label, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BloodGlucoseEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.timestamp == this.timestamp &&
          other.valueMgDl == this.valueMgDl &&
          other.label == this.label &&
          other.notes == this.notes);
}

class BloodGlucoseEntriesCompanion extends UpdateCompanion<BloodGlucoseEntry> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> date;
  final Value<DateTime> timestamp;
  final Value<int> valueMgDl;
  final Value<String> label;
  final Value<String?> notes;
  const BloodGlucoseEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.valueMgDl = const Value.absent(),
    this.label = const Value.absent(),
    this.notes = const Value.absent(),
  });
  BloodGlucoseEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required DateTime date,
    required DateTime timestamp,
    required int valueMgDl,
    this.label = const Value.absent(),
    this.notes = const Value.absent(),
  })  : userId = Value(userId),
        date = Value(date),
        timestamp = Value(timestamp),
        valueMgDl = Value(valueMgDl);
  static Insertable<BloodGlucoseEntry> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<DateTime>? date,
    Expression<DateTime>? timestamp,
    Expression<int>? valueMgDl,
    Expression<String>? label,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (timestamp != null) 'timestamp': timestamp,
      if (valueMgDl != null) 'value_mg_dl': valueMgDl,
      if (label != null) 'label': label,
      if (notes != null) 'notes': notes,
    });
  }

  BloodGlucoseEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<DateTime>? date,
      Value<DateTime>? timestamp,
      Value<int>? valueMgDl,
      Value<String>? label,
      Value<String?>? notes}) {
    return BloodGlucoseEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
      valueMgDl: valueMgDl ?? this.valueMgDl,
      label: label ?? this.label,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (valueMgDl.present) {
      map['value_mg_dl'] = Variable<int>(valueMgDl.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BloodGlucoseEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('timestamp: $timestamp, ')
          ..write('valueMgDl: $valueMgDl, ')
          ..write('label: $label, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ConfigEntriesTable configEntries = $ConfigEntriesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $IntakesTable intakes = $IntakesTable(this);
  late final $MealsTable meals = $MealsTable(this);
  late final $UserActivitiesTable userActivities = $UserActivitiesTable(this);
  late final $TrackedDaysTable trackedDays = $TrackedDaysTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $RecipeItemsTable recipeItems = $RecipeItemsTable(this);
  late final $WeightsTable weights = $WeightsTable(this);
  late final $NotificationSettingsTable notificationSettings =
      $NotificationSettingsTable(this);
  late final $WaterEntriesTable waterEntries = $WaterEntriesTable(this);
  late final $FastsTable fasts = $FastsTable(this);
  late final $AiModelMetadataEntriesTable aiModelMetadataEntries =
      $AiModelMetadataEntriesTable(this);
  late final $MealPlansTable mealPlans = $MealPlansTable(this);
  late final $PhotoProgressEntriesTable photoProgressEntries =
      $PhotoProgressEntriesTable(this);
  late final $BodyMeasurementsTable bodyMeasurements =
      $BodyMeasurementsTable(this);
  late final $DailyNotesTable dailyNotes = $DailyNotesTable(this);
  late final $AutopilotEntriesTable autopilotEntries =
      $AutopilotEntriesTable(this);
  late final $CustomTrackersTable customTrackers = $CustomTrackersTable(this);
  late final $CustomTrackerEntriesTable customTrackerEntries =
      $CustomTrackerEntriesTable(this);
  late final $SymptomEntriesTable symptomEntries = $SymptomEntriesTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $MedicationLogsTable medicationLogs = $MedicationLogsTable(this);
  late final $BloodGlucoseEntriesTable bloodGlucoseEntries =
      $BloodGlucoseEntriesTable(this);
  late final ConfigDao configDao = ConfigDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final IntakeDao intakeDao = IntakeDao(this as AppDatabase);
  late final MealDao mealDao = MealDao(this as AppDatabase);
  late final UserActivityDao userActivityDao =
      UserActivityDao(this as AppDatabase);
  late final TrackedDayDao trackedDayDao = TrackedDayDao(this as AppDatabase);
  late final RecipeDao recipeDao = RecipeDao(this as AppDatabase);
  late final WeightDao weightDao = WeightDao(this as AppDatabase);
  late final NotificationSettingsDao notificationSettingsDao =
      NotificationSettingsDao(this as AppDatabase);
  late final WaterDao waterDao = WaterDao(this as AppDatabase);
  late final FastingDao fastingDao = FastingDao(this as AppDatabase);
  late final AiModelMetadataDao aiModelMetadataDao =
      AiModelMetadataDao(this as AppDatabase);
  late final MealPlanDao mealPlanDao = MealPlanDao(this as AppDatabase);
  late final PhotoProgressDao photoProgressDao =
      PhotoProgressDao(this as AppDatabase);
  late final BodyMeasurementDao bodyMeasurementDao =
      BodyMeasurementDao(this as AppDatabase);
  late final DailyNoteDao dailyNoteDao = DailyNoteDao(this as AppDatabase);
  late final AutopilotDao autopilotDao = AutopilotDao(this as AppDatabase);
  late final CustomTrackerDao customTrackerDao =
      CustomTrackerDao(this as AppDatabase);
  late final SymptomDao symptomDao = SymptomDao(this as AppDatabase);
  late final MedicationDao medicationDao = MedicationDao(this as AppDatabase);
  late final BloodGlucoseDao bloodGlucoseDao =
      BloodGlucoseDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        configEntries,
        users,
        intakes,
        meals,
        userActivities,
        trackedDays,
        recipes,
        recipeItems,
        weights,
        notificationSettings,
        waterEntries,
        fasts,
        aiModelMetadataEntries,
        mealPlans,
        photoProgressEntries,
        bodyMeasurements,
        dailyNotes,
        autopilotEntries,
        customTrackers,
        customTrackerEntries,
        symptomEntries,
        medications,
        medicationLogs,
        bloodGlucoseEntries
      ];
}

typedef $$ConfigEntriesTableCreateCompanionBuilder = ConfigEntriesCompanion
    Function({
  Value<int> id,
  Value<bool> hasAcceptedDisclaimer,
  Value<bool> hasAcceptedPolicy,
  Value<bool> hasAcceptedSendAnonymousData,
  Value<String> selectedAppTheme,
  Value<bool?> usesImperialUnits,
  Value<double?> userKcalAdjustment,
  Value<double?> userCarbGoalPct,
  Value<double?> userProteinGoalPct,
  Value<double?> userFatGoalPct,
  Value<int?> dailyWaterGoalMl,
  Value<String> tdeeMethod,
  Value<String> exerciseCalorieMode,
  Value<double> exerciseCreditPercent,
  Value<String?> calorieCycleJson,
  Value<int> calorieCyclingEnabled,
  Value<String> allergens,
  Value<int?> bloodGlucoseMinMgDl,
  Value<int?> bloodGlucoseMaxMgDl,
  Value<int> netCarbsEnabled,
  Value<int> stepBonusEnabled,
  Value<double> stepBonusPercent,
});
typedef $$ConfigEntriesTableUpdateCompanionBuilder = ConfigEntriesCompanion
    Function({
  Value<int> id,
  Value<bool> hasAcceptedDisclaimer,
  Value<bool> hasAcceptedPolicy,
  Value<bool> hasAcceptedSendAnonymousData,
  Value<String> selectedAppTheme,
  Value<bool?> usesImperialUnits,
  Value<double?> userKcalAdjustment,
  Value<double?> userCarbGoalPct,
  Value<double?> userProteinGoalPct,
  Value<double?> userFatGoalPct,
  Value<int?> dailyWaterGoalMl,
  Value<String> tdeeMethod,
  Value<String> exerciseCalorieMode,
  Value<double> exerciseCreditPercent,
  Value<String?> calorieCycleJson,
  Value<int> calorieCyclingEnabled,
  Value<String> allergens,
  Value<int?> bloodGlucoseMinMgDl,
  Value<int?> bloodGlucoseMaxMgDl,
  Value<int> netCarbsEnabled,
  Value<int> stepBonusEnabled,
  Value<double> stepBonusPercent,
});

class $$ConfigEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ConfigEntriesTable> {
  $$ConfigEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasAcceptedDisclaimer => $composableBuilder(
      column: $table.hasAcceptedDisclaimer,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasAcceptedPolicy => $composableBuilder(
      column: $table.hasAcceptedPolicy,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasAcceptedSendAnonymousData => $composableBuilder(
      column: $table.hasAcceptedSendAnonymousData,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get selectedAppTheme => $composableBuilder(
      column: $table.selectedAppTheme,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get usesImperialUnits => $composableBuilder(
      column: $table.usesImperialUnits,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get userKcalAdjustment => $composableBuilder(
      column: $table.userKcalAdjustment,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get userCarbGoalPct => $composableBuilder(
      column: $table.userCarbGoalPct,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get userProteinGoalPct => $composableBuilder(
      column: $table.userProteinGoalPct,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get userFatGoalPct => $composableBuilder(
      column: $table.userFatGoalPct,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dailyWaterGoalMl => $composableBuilder(
      column: $table.dailyWaterGoalMl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tdeeMethod => $composableBuilder(
      column: $table.tdeeMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseCalorieMode => $composableBuilder(
      column: $table.exerciseCalorieMode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get exerciseCreditPercent => $composableBuilder(
      column: $table.exerciseCreditPercent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get calorieCycleJson => $composableBuilder(
      column: $table.calorieCycleJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get calorieCyclingEnabled => $composableBuilder(
      column: $table.calorieCyclingEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get allergens => $composableBuilder(
      column: $table.allergens, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bloodGlucoseMinMgDl => $composableBuilder(
      column: $table.bloodGlucoseMinMgDl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bloodGlucoseMaxMgDl => $composableBuilder(
      column: $table.bloodGlucoseMaxMgDl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get netCarbsEnabled => $composableBuilder(
      column: $table.netCarbsEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stepBonusEnabled => $composableBuilder(
      column: $table.stepBonusEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get stepBonusPercent => $composableBuilder(
      column: $table.stepBonusPercent,
      builder: (column) => ColumnFilters(column));
}

class $$ConfigEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ConfigEntriesTable> {
  $$ConfigEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasAcceptedDisclaimer => $composableBuilder(
      column: $table.hasAcceptedDisclaimer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasAcceptedPolicy => $composableBuilder(
      column: $table.hasAcceptedPolicy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasAcceptedSendAnonymousData => $composableBuilder(
      column: $table.hasAcceptedSendAnonymousData,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get selectedAppTheme => $composableBuilder(
      column: $table.selectedAppTheme,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get usesImperialUnits => $composableBuilder(
      column: $table.usesImperialUnits,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get userKcalAdjustment => $composableBuilder(
      column: $table.userKcalAdjustment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get userCarbGoalPct => $composableBuilder(
      column: $table.userCarbGoalPct,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get userProteinGoalPct => $composableBuilder(
      column: $table.userProteinGoalPct,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get userFatGoalPct => $composableBuilder(
      column: $table.userFatGoalPct,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dailyWaterGoalMl => $composableBuilder(
      column: $table.dailyWaterGoalMl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tdeeMethod => $composableBuilder(
      column: $table.tdeeMethod, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseCalorieMode => $composableBuilder(
      column: $table.exerciseCalorieMode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get exerciseCreditPercent => $composableBuilder(
      column: $table.exerciseCreditPercent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get calorieCycleJson => $composableBuilder(
      column: $table.calorieCycleJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get calorieCyclingEnabled => $composableBuilder(
      column: $table.calorieCyclingEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get allergens => $composableBuilder(
      column: $table.allergens, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bloodGlucoseMinMgDl => $composableBuilder(
      column: $table.bloodGlucoseMinMgDl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bloodGlucoseMaxMgDl => $composableBuilder(
      column: $table.bloodGlucoseMaxMgDl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get netCarbsEnabled => $composableBuilder(
      column: $table.netCarbsEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stepBonusEnabled => $composableBuilder(
      column: $table.stepBonusEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get stepBonusPercent => $composableBuilder(
      column: $table.stepBonusPercent,
      builder: (column) => ColumnOrderings(column));
}

class $$ConfigEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConfigEntriesTable> {
  $$ConfigEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get hasAcceptedDisclaimer => $composableBuilder(
      column: $table.hasAcceptedDisclaimer, builder: (column) => column);

  GeneratedColumn<bool> get hasAcceptedPolicy => $composableBuilder(
      column: $table.hasAcceptedPolicy, builder: (column) => column);

  GeneratedColumn<bool> get hasAcceptedSendAnonymousData => $composableBuilder(
      column: $table.hasAcceptedSendAnonymousData, builder: (column) => column);

  GeneratedColumn<String> get selectedAppTheme => $composableBuilder(
      column: $table.selectedAppTheme, builder: (column) => column);

  GeneratedColumn<bool> get usesImperialUnits => $composableBuilder(
      column: $table.usesImperialUnits, builder: (column) => column);

  GeneratedColumn<double> get userKcalAdjustment => $composableBuilder(
      column: $table.userKcalAdjustment, builder: (column) => column);

  GeneratedColumn<double> get userCarbGoalPct => $composableBuilder(
      column: $table.userCarbGoalPct, builder: (column) => column);

  GeneratedColumn<double> get userProteinGoalPct => $composableBuilder(
      column: $table.userProteinGoalPct, builder: (column) => column);

  GeneratedColumn<double> get userFatGoalPct => $composableBuilder(
      column: $table.userFatGoalPct, builder: (column) => column);

  GeneratedColumn<int> get dailyWaterGoalMl => $composableBuilder(
      column: $table.dailyWaterGoalMl, builder: (column) => column);

  GeneratedColumn<String> get tdeeMethod => $composableBuilder(
      column: $table.tdeeMethod, builder: (column) => column);

  GeneratedColumn<String> get exerciseCalorieMode => $composableBuilder(
      column: $table.exerciseCalorieMode, builder: (column) => column);

  GeneratedColumn<double> get exerciseCreditPercent => $composableBuilder(
      column: $table.exerciseCreditPercent, builder: (column) => column);

  GeneratedColumn<String> get calorieCycleJson => $composableBuilder(
      column: $table.calorieCycleJson, builder: (column) => column);

  GeneratedColumn<int> get calorieCyclingEnabled => $composableBuilder(
      column: $table.calorieCyclingEnabled, builder: (column) => column);

  GeneratedColumn<String> get allergens =>
      $composableBuilder(column: $table.allergens, builder: (column) => column);

  GeneratedColumn<int> get bloodGlucoseMinMgDl => $composableBuilder(
      column: $table.bloodGlucoseMinMgDl, builder: (column) => column);

  GeneratedColumn<int> get bloodGlucoseMaxMgDl => $composableBuilder(
      column: $table.bloodGlucoseMaxMgDl, builder: (column) => column);

  GeneratedColumn<int> get netCarbsEnabled => $composableBuilder(
      column: $table.netCarbsEnabled, builder: (column) => column);

  GeneratedColumn<int> get stepBonusEnabled => $composableBuilder(
      column: $table.stepBonusEnabled, builder: (column) => column);

  GeneratedColumn<double> get stepBonusPercent => $composableBuilder(
      column: $table.stepBonusPercent, builder: (column) => column);
}

class $$ConfigEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConfigEntriesTable,
    ConfigEntry,
    $$ConfigEntriesTableFilterComposer,
    $$ConfigEntriesTableOrderingComposer,
    $$ConfigEntriesTableAnnotationComposer,
    $$ConfigEntriesTableCreateCompanionBuilder,
    $$ConfigEntriesTableUpdateCompanionBuilder,
    (
      ConfigEntry,
      BaseReferences<_$AppDatabase, $ConfigEntriesTable, ConfigEntry>
    ),
    ConfigEntry,
    PrefetchHooks Function()> {
  $$ConfigEntriesTableTableManager(_$AppDatabase db, $ConfigEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConfigEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConfigEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConfigEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> hasAcceptedDisclaimer = const Value.absent(),
            Value<bool> hasAcceptedPolicy = const Value.absent(),
            Value<bool> hasAcceptedSendAnonymousData = const Value.absent(),
            Value<String> selectedAppTheme = const Value.absent(),
            Value<bool?> usesImperialUnits = const Value.absent(),
            Value<double?> userKcalAdjustment = const Value.absent(),
            Value<double?> userCarbGoalPct = const Value.absent(),
            Value<double?> userProteinGoalPct = const Value.absent(),
            Value<double?> userFatGoalPct = const Value.absent(),
            Value<int?> dailyWaterGoalMl = const Value.absent(),
            Value<String> tdeeMethod = const Value.absent(),
            Value<String> exerciseCalorieMode = const Value.absent(),
            Value<double> exerciseCreditPercent = const Value.absent(),
            Value<String?> calorieCycleJson = const Value.absent(),
            Value<int> calorieCyclingEnabled = const Value.absent(),
            Value<String> allergens = const Value.absent(),
            Value<int?> bloodGlucoseMinMgDl = const Value.absent(),
            Value<int?> bloodGlucoseMaxMgDl = const Value.absent(),
            Value<int> netCarbsEnabled = const Value.absent(),
            Value<int> stepBonusEnabled = const Value.absent(),
            Value<double> stepBonusPercent = const Value.absent(),
          }) =>
              ConfigEntriesCompanion(
            id: id,
            hasAcceptedDisclaimer: hasAcceptedDisclaimer,
            hasAcceptedPolicy: hasAcceptedPolicy,
            hasAcceptedSendAnonymousData: hasAcceptedSendAnonymousData,
            selectedAppTheme: selectedAppTheme,
            usesImperialUnits: usesImperialUnits,
            userKcalAdjustment: userKcalAdjustment,
            userCarbGoalPct: userCarbGoalPct,
            userProteinGoalPct: userProteinGoalPct,
            userFatGoalPct: userFatGoalPct,
            dailyWaterGoalMl: dailyWaterGoalMl,
            tdeeMethod: tdeeMethod,
            exerciseCalorieMode: exerciseCalorieMode,
            exerciseCreditPercent: exerciseCreditPercent,
            calorieCycleJson: calorieCycleJson,
            calorieCyclingEnabled: calorieCyclingEnabled,
            allergens: allergens,
            bloodGlucoseMinMgDl: bloodGlucoseMinMgDl,
            bloodGlucoseMaxMgDl: bloodGlucoseMaxMgDl,
            netCarbsEnabled: netCarbsEnabled,
            stepBonusEnabled: stepBonusEnabled,
            stepBonusPercent: stepBonusPercent,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> hasAcceptedDisclaimer = const Value.absent(),
            Value<bool> hasAcceptedPolicy = const Value.absent(),
            Value<bool> hasAcceptedSendAnonymousData = const Value.absent(),
            Value<String> selectedAppTheme = const Value.absent(),
            Value<bool?> usesImperialUnits = const Value.absent(),
            Value<double?> userKcalAdjustment = const Value.absent(),
            Value<double?> userCarbGoalPct = const Value.absent(),
            Value<double?> userProteinGoalPct = const Value.absent(),
            Value<double?> userFatGoalPct = const Value.absent(),
            Value<int?> dailyWaterGoalMl = const Value.absent(),
            Value<String> tdeeMethod = const Value.absent(),
            Value<String> exerciseCalorieMode = const Value.absent(),
            Value<double> exerciseCreditPercent = const Value.absent(),
            Value<String?> calorieCycleJson = const Value.absent(),
            Value<int> calorieCyclingEnabled = const Value.absent(),
            Value<String> allergens = const Value.absent(),
            Value<int?> bloodGlucoseMinMgDl = const Value.absent(),
            Value<int?> bloodGlucoseMaxMgDl = const Value.absent(),
            Value<int> netCarbsEnabled = const Value.absent(),
            Value<int> stepBonusEnabled = const Value.absent(),
            Value<double> stepBonusPercent = const Value.absent(),
          }) =>
              ConfigEntriesCompanion.insert(
            id: id,
            hasAcceptedDisclaimer: hasAcceptedDisclaimer,
            hasAcceptedPolicy: hasAcceptedPolicy,
            hasAcceptedSendAnonymousData: hasAcceptedSendAnonymousData,
            selectedAppTheme: selectedAppTheme,
            usesImperialUnits: usesImperialUnits,
            userKcalAdjustment: userKcalAdjustment,
            userCarbGoalPct: userCarbGoalPct,
            userProteinGoalPct: userProteinGoalPct,
            userFatGoalPct: userFatGoalPct,
            dailyWaterGoalMl: dailyWaterGoalMl,
            tdeeMethod: tdeeMethod,
            exerciseCalorieMode: exerciseCalorieMode,
            exerciseCreditPercent: exerciseCreditPercent,
            calorieCycleJson: calorieCycleJson,
            calorieCyclingEnabled: calorieCyclingEnabled,
            allergens: allergens,
            bloodGlucoseMinMgDl: bloodGlucoseMinMgDl,
            bloodGlucoseMaxMgDl: bloodGlucoseMaxMgDl,
            netCarbsEnabled: netCarbsEnabled,
            stepBonusEnabled: stepBonusEnabled,
            stepBonusPercent: stepBonusPercent,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ConfigEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ConfigEntriesTable,
    ConfigEntry,
    $$ConfigEntriesTableFilterComposer,
    $$ConfigEntriesTableOrderingComposer,
    $$ConfigEntriesTableAnnotationComposer,
    $$ConfigEntriesTableCreateCompanionBuilder,
    $$ConfigEntriesTableUpdateCompanionBuilder,
    (
      ConfigEntry,
      BaseReferences<_$AppDatabase, $ConfigEntriesTable, ConfigEntry>
    ),
    ConfigEntry,
    PrefetchHooks Function()>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required DateTime birthday,
  required double heightCM,
  required double weightKG,
  required String gender,
  required String goal,
  required String pal,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<DateTime> birthday,
  Value<double> heightCM,
  Value<double> weightKG,
  Value<String> gender,
  Value<String> goal,
  Value<String> pal,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get birthday => $composableBuilder(
      column: $table.birthday, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get heightCM => $composableBuilder(
      column: $table.heightCM, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightKG => $composableBuilder(
      column: $table.weightKG, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goal => $composableBuilder(
      column: $table.goal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pal => $composableBuilder(
      column: $table.pal, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get birthday => $composableBuilder(
      column: $table.birthday, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get heightCM => $composableBuilder(
      column: $table.heightCM, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightKG => $composableBuilder(
      column: $table.weightKG, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goal => $composableBuilder(
      column: $table.goal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pal => $composableBuilder(
      column: $table.pal, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get birthday =>
      $composableBuilder(column: $table.birthday, builder: (column) => column);

  GeneratedColumn<double> get heightCM =>
      $composableBuilder(column: $table.heightCM, builder: (column) => column);

  GeneratedColumn<double> get weightKG =>
      $composableBuilder(column: $table.weightKG, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get goal =>
      $composableBuilder(column: $table.goal, builder: (column) => column);

  GeneratedColumn<String> get pal =>
      $composableBuilder(column: $table.pal, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> birthday = const Value.absent(),
            Value<double> heightCM = const Value.absent(),
            Value<double> weightKG = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<String> goal = const Value.absent(),
            Value<String> pal = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            birthday: birthday,
            heightCM: heightCM,
            weightKG: weightKG,
            gender: gender,
            goal: goal,
            pal: pal,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime birthday,
            required double heightCM,
            required double weightKG,
            required String gender,
            required String goal,
            required String pal,
          }) =>
              UsersCompanion.insert(
            id: id,
            birthday: birthday,
            heightCM: heightCM,
            weightKG: weightKG,
            gender: gender,
            goal: goal,
            pal: pal,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$IntakesTableCreateCompanionBuilder = IntakesCompanion Function({
  required String id,
  required String unit,
  required double amount,
  required String type,
  required String mealId,
  required DateTime date,
  Value<int?> timeMinutes,
  Value<int> rowid,
});
typedef $$IntakesTableUpdateCompanionBuilder = IntakesCompanion Function({
  Value<String> id,
  Value<String> unit,
  Value<double> amount,
  Value<String> type,
  Value<String> mealId,
  Value<DateTime> date,
  Value<int?> timeMinutes,
  Value<int> rowid,
});

class $$IntakesTableFilterComposer
    extends Composer<_$AppDatabase, $IntakesTable> {
  $$IntakesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mealId => $composableBuilder(
      column: $table.mealId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeMinutes => $composableBuilder(
      column: $table.timeMinutes, builder: (column) => ColumnFilters(column));
}

class $$IntakesTableOrderingComposer
    extends Composer<_$AppDatabase, $IntakesTable> {
  $$IntakesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealId => $composableBuilder(
      column: $table.mealId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeMinutes => $composableBuilder(
      column: $table.timeMinutes, builder: (column) => ColumnOrderings(column));
}

class $$IntakesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IntakesTable> {
  $$IntakesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get mealId =>
      $composableBuilder(column: $table.mealId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get timeMinutes => $composableBuilder(
      column: $table.timeMinutes, builder: (column) => column);
}

class $$IntakesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IntakesTable,
    Intake,
    $$IntakesTableFilterComposer,
    $$IntakesTableOrderingComposer,
    $$IntakesTableAnnotationComposer,
    $$IntakesTableCreateCompanionBuilder,
    $$IntakesTableUpdateCompanionBuilder,
    (Intake, BaseReferences<_$AppDatabase, $IntakesTable, Intake>),
    Intake,
    PrefetchHooks Function()> {
  $$IntakesTableTableManager(_$AppDatabase db, $IntakesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IntakesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IntakesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IntakesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> mealId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> timeMinutes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IntakesCompanion(
            id: id,
            unit: unit,
            amount: amount,
            type: type,
            mealId: mealId,
            date: date,
            timeMinutes: timeMinutes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String unit,
            required double amount,
            required String type,
            required String mealId,
            required DateTime date,
            Value<int?> timeMinutes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IntakesCompanion.insert(
            id: id,
            unit: unit,
            amount: amount,
            type: type,
            mealId: mealId,
            date: date,
            timeMinutes: timeMinutes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$IntakesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IntakesTable,
    Intake,
    $$IntakesTableFilterComposer,
    $$IntakesTableOrderingComposer,
    $$IntakesTableAnnotationComposer,
    $$IntakesTableCreateCompanionBuilder,
    $$IntakesTableUpdateCompanionBuilder,
    (Intake, BaseReferences<_$AppDatabase, $IntakesTable, Intake>),
    Intake,
    PrefetchHooks Function()>;
typedef $$MealsTableCreateCompanionBuilder = MealsCompanion Function({
  required String id,
  Value<String?> code,
  Value<String?> name,
  Value<String?> brands,
  Value<String?> thumbnailImageUrl,
  Value<String?> mainImageUrl,
  Value<String?> url,
  Value<String?> mealQuantity,
  Value<String?> mealUnit,
  Value<double?> servingQuantity,
  Value<String?> servingUnit,
  Value<String?> servingSize,
  Value<String> source,
  Value<double?> energyKcal100,
  Value<double?> carbohydrates100,
  Value<double?> fat100,
  Value<double?> proteins100,
  Value<double?> sugars100,
  Value<double?> saturatedFat100,
  Value<double?> fiber100,
  Value<double?> sodium100,
  Value<double?> potassium100,
  Value<double?> cholesterol100,
  Value<double?> vitaminA100,
  Value<double?> vitaminC100,
  Value<double?> vitaminD100,
  Value<double?> calcium100,
  Value<double?> iron100,
  Value<int> rowid,
});
typedef $$MealsTableUpdateCompanionBuilder = MealsCompanion Function({
  Value<String> id,
  Value<String?> code,
  Value<String?> name,
  Value<String?> brands,
  Value<String?> thumbnailImageUrl,
  Value<String?> mainImageUrl,
  Value<String?> url,
  Value<String?> mealQuantity,
  Value<String?> mealUnit,
  Value<double?> servingQuantity,
  Value<String?> servingUnit,
  Value<String?> servingSize,
  Value<String> source,
  Value<double?> energyKcal100,
  Value<double?> carbohydrates100,
  Value<double?> fat100,
  Value<double?> proteins100,
  Value<double?> sugars100,
  Value<double?> saturatedFat100,
  Value<double?> fiber100,
  Value<double?> sodium100,
  Value<double?> potassium100,
  Value<double?> cholesterol100,
  Value<double?> vitaminA100,
  Value<double?> vitaminC100,
  Value<double?> vitaminD100,
  Value<double?> calcium100,
  Value<double?> iron100,
  Value<int> rowid,
});

class $$MealsTableFilterComposer extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brands => $composableBuilder(
      column: $table.brands, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnailImageUrl => $composableBuilder(
      column: $table.thumbnailImageUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mainImageUrl => $composableBuilder(
      column: $table.mainImageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mealQuantity => $composableBuilder(
      column: $table.mealQuantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mealUnit => $composableBuilder(
      column: $table.mealUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get servingQuantity => $composableBuilder(
      column: $table.servingQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get energyKcal100 => $composableBuilder(
      column: $table.energyKcal100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carbohydrates100 => $composableBuilder(
      column: $table.carbohydrates100,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fat100 => $composableBuilder(
      column: $table.fat100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get proteins100 => $composableBuilder(
      column: $table.proteins100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sugars100 => $composableBuilder(
      column: $table.sugars100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get saturatedFat100 => $composableBuilder(
      column: $table.saturatedFat100,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fiber100 => $composableBuilder(
      column: $table.fiber100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sodium100 => $composableBuilder(
      column: $table.sodium100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get potassium100 => $composableBuilder(
      column: $table.potassium100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cholesterol100 => $composableBuilder(
      column: $table.cholesterol100,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get vitaminA100 => $composableBuilder(
      column: $table.vitaminA100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get vitaminC100 => $composableBuilder(
      column: $table.vitaminC100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get vitaminD100 => $composableBuilder(
      column: $table.vitaminD100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get calcium100 => $composableBuilder(
      column: $table.calcium100, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get iron100 => $composableBuilder(
      column: $table.iron100, builder: (column) => ColumnFilters(column));
}

class $$MealsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brands => $composableBuilder(
      column: $table.brands, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnailImageUrl => $composableBuilder(
      column: $table.thumbnailImageUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mainImageUrl => $composableBuilder(
      column: $table.mainImageUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealQuantity => $composableBuilder(
      column: $table.mealQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealUnit => $composableBuilder(
      column: $table.mealUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get servingQuantity => $composableBuilder(
      column: $table.servingQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get energyKcal100 => $composableBuilder(
      column: $table.energyKcal100,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carbohydrates100 => $composableBuilder(
      column: $table.carbohydrates100,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fat100 => $composableBuilder(
      column: $table.fat100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get proteins100 => $composableBuilder(
      column: $table.proteins100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sugars100 => $composableBuilder(
      column: $table.sugars100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get saturatedFat100 => $composableBuilder(
      column: $table.saturatedFat100,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fiber100 => $composableBuilder(
      column: $table.fiber100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sodium100 => $composableBuilder(
      column: $table.sodium100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get potassium100 => $composableBuilder(
      column: $table.potassium100,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cholesterol100 => $composableBuilder(
      column: $table.cholesterol100,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get vitaminA100 => $composableBuilder(
      column: $table.vitaminA100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get vitaminC100 => $composableBuilder(
      column: $table.vitaminC100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get vitaminD100 => $composableBuilder(
      column: $table.vitaminD100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get calcium100 => $composableBuilder(
      column: $table.calcium100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get iron100 => $composableBuilder(
      column: $table.iron100, builder: (column) => ColumnOrderings(column));
}

class $$MealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brands =>
      $composableBuilder(column: $table.brands, builder: (column) => column);

  GeneratedColumn<String> get thumbnailImageUrl => $composableBuilder(
      column: $table.thumbnailImageUrl, builder: (column) => column);

  GeneratedColumn<String> get mainImageUrl => $composableBuilder(
      column: $table.mainImageUrl, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get mealQuantity => $composableBuilder(
      column: $table.mealQuantity, builder: (column) => column);

  GeneratedColumn<String> get mealUnit =>
      $composableBuilder(column: $table.mealUnit, builder: (column) => column);

  GeneratedColumn<double> get servingQuantity => $composableBuilder(
      column: $table.servingQuantity, builder: (column) => column);

  GeneratedColumn<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => column);

  GeneratedColumn<String> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<double> get energyKcal100 => $composableBuilder(
      column: $table.energyKcal100, builder: (column) => column);

  GeneratedColumn<double> get carbohydrates100 => $composableBuilder(
      column: $table.carbohydrates100, builder: (column) => column);

  GeneratedColumn<double> get fat100 =>
      $composableBuilder(column: $table.fat100, builder: (column) => column);

  GeneratedColumn<double> get proteins100 => $composableBuilder(
      column: $table.proteins100, builder: (column) => column);

  GeneratedColumn<double> get sugars100 =>
      $composableBuilder(column: $table.sugars100, builder: (column) => column);

  GeneratedColumn<double> get saturatedFat100 => $composableBuilder(
      column: $table.saturatedFat100, builder: (column) => column);

  GeneratedColumn<double> get fiber100 =>
      $composableBuilder(column: $table.fiber100, builder: (column) => column);

  GeneratedColumn<double> get sodium100 =>
      $composableBuilder(column: $table.sodium100, builder: (column) => column);

  GeneratedColumn<double> get potassium100 => $composableBuilder(
      column: $table.potassium100, builder: (column) => column);

  GeneratedColumn<double> get cholesterol100 => $composableBuilder(
      column: $table.cholesterol100, builder: (column) => column);

  GeneratedColumn<double> get vitaminA100 => $composableBuilder(
      column: $table.vitaminA100, builder: (column) => column);

  GeneratedColumn<double> get vitaminC100 => $composableBuilder(
      column: $table.vitaminC100, builder: (column) => column);

  GeneratedColumn<double> get vitaminD100 => $composableBuilder(
      column: $table.vitaminD100, builder: (column) => column);

  GeneratedColumn<double> get calcium100 => $composableBuilder(
      column: $table.calcium100, builder: (column) => column);

  GeneratedColumn<double> get iron100 =>
      $composableBuilder(column: $table.iron100, builder: (column) => column);
}

class $$MealsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealsTable,
    Meal,
    $$MealsTableFilterComposer,
    $$MealsTableOrderingComposer,
    $$MealsTableAnnotationComposer,
    $$MealsTableCreateCompanionBuilder,
    $$MealsTableUpdateCompanionBuilder,
    (Meal, BaseReferences<_$AppDatabase, $MealsTable, Meal>),
    Meal,
    PrefetchHooks Function()> {
  $$MealsTableTableManager(_$AppDatabase db, $MealsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> brands = const Value.absent(),
            Value<String?> thumbnailImageUrl = const Value.absent(),
            Value<String?> mainImageUrl = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> mealQuantity = const Value.absent(),
            Value<String?> mealUnit = const Value.absent(),
            Value<double?> servingQuantity = const Value.absent(),
            Value<String?> servingUnit = const Value.absent(),
            Value<String?> servingSize = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<double?> energyKcal100 = const Value.absent(),
            Value<double?> carbohydrates100 = const Value.absent(),
            Value<double?> fat100 = const Value.absent(),
            Value<double?> proteins100 = const Value.absent(),
            Value<double?> sugars100 = const Value.absent(),
            Value<double?> saturatedFat100 = const Value.absent(),
            Value<double?> fiber100 = const Value.absent(),
            Value<double?> sodium100 = const Value.absent(),
            Value<double?> potassium100 = const Value.absent(),
            Value<double?> cholesterol100 = const Value.absent(),
            Value<double?> vitaminA100 = const Value.absent(),
            Value<double?> vitaminC100 = const Value.absent(),
            Value<double?> vitaminD100 = const Value.absent(),
            Value<double?> calcium100 = const Value.absent(),
            Value<double?> iron100 = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealsCompanion(
            id: id,
            code: code,
            name: name,
            brands: brands,
            thumbnailImageUrl: thumbnailImageUrl,
            mainImageUrl: mainImageUrl,
            url: url,
            mealQuantity: mealQuantity,
            mealUnit: mealUnit,
            servingQuantity: servingQuantity,
            servingUnit: servingUnit,
            servingSize: servingSize,
            source: source,
            energyKcal100: energyKcal100,
            carbohydrates100: carbohydrates100,
            fat100: fat100,
            proteins100: proteins100,
            sugars100: sugars100,
            saturatedFat100: saturatedFat100,
            fiber100: fiber100,
            sodium100: sodium100,
            potassium100: potassium100,
            cholesterol100: cholesterol100,
            vitaminA100: vitaminA100,
            vitaminC100: vitaminC100,
            vitaminD100: vitaminD100,
            calcium100: calcium100,
            iron100: iron100,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> code = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> brands = const Value.absent(),
            Value<String?> thumbnailImageUrl = const Value.absent(),
            Value<String?> mainImageUrl = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> mealQuantity = const Value.absent(),
            Value<String?> mealUnit = const Value.absent(),
            Value<double?> servingQuantity = const Value.absent(),
            Value<String?> servingUnit = const Value.absent(),
            Value<String?> servingSize = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<double?> energyKcal100 = const Value.absent(),
            Value<double?> carbohydrates100 = const Value.absent(),
            Value<double?> fat100 = const Value.absent(),
            Value<double?> proteins100 = const Value.absent(),
            Value<double?> sugars100 = const Value.absent(),
            Value<double?> saturatedFat100 = const Value.absent(),
            Value<double?> fiber100 = const Value.absent(),
            Value<double?> sodium100 = const Value.absent(),
            Value<double?> potassium100 = const Value.absent(),
            Value<double?> cholesterol100 = const Value.absent(),
            Value<double?> vitaminA100 = const Value.absent(),
            Value<double?> vitaminC100 = const Value.absent(),
            Value<double?> vitaminD100 = const Value.absent(),
            Value<double?> calcium100 = const Value.absent(),
            Value<double?> iron100 = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealsCompanion.insert(
            id: id,
            code: code,
            name: name,
            brands: brands,
            thumbnailImageUrl: thumbnailImageUrl,
            mainImageUrl: mainImageUrl,
            url: url,
            mealQuantity: mealQuantity,
            mealUnit: mealUnit,
            servingQuantity: servingQuantity,
            servingUnit: servingUnit,
            servingSize: servingSize,
            source: source,
            energyKcal100: energyKcal100,
            carbohydrates100: carbohydrates100,
            fat100: fat100,
            proteins100: proteins100,
            sugars100: sugars100,
            saturatedFat100: saturatedFat100,
            fiber100: fiber100,
            sodium100: sodium100,
            potassium100: potassium100,
            cholesterol100: cholesterol100,
            vitaminA100: vitaminA100,
            vitaminC100: vitaminC100,
            vitaminD100: vitaminD100,
            calcium100: calcium100,
            iron100: iron100,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MealsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealsTable,
    Meal,
    $$MealsTableFilterComposer,
    $$MealsTableOrderingComposer,
    $$MealsTableAnnotationComposer,
    $$MealsTableCreateCompanionBuilder,
    $$MealsTableUpdateCompanionBuilder,
    (Meal, BaseReferences<_$AppDatabase, $MealsTable, Meal>),
    Meal,
    PrefetchHooks Function()>;
typedef $$UserActivitiesTableCreateCompanionBuilder = UserActivitiesCompanion
    Function({
  required String id,
  required double duration,
  required double burnedKcal,
  required DateTime date,
  required String physicalActivityCode,
  Value<int> rowid,
});
typedef $$UserActivitiesTableUpdateCompanionBuilder = UserActivitiesCompanion
    Function({
  Value<String> id,
  Value<double> duration,
  Value<double> burnedKcal,
  Value<DateTime> date,
  Value<String> physicalActivityCode,
  Value<int> rowid,
});

class $$UserActivitiesTableFilterComposer
    extends Composer<_$AppDatabase, $UserActivitiesTable> {
  $$UserActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get burnedKcal => $composableBuilder(
      column: $table.burnedKcal, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get physicalActivityCode => $composableBuilder(
      column: $table.physicalActivityCode,
      builder: (column) => ColumnFilters(column));
}

class $$UserActivitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserActivitiesTable> {
  $$UserActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get burnedKcal => $composableBuilder(
      column: $table.burnedKcal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get physicalActivityCode => $composableBuilder(
      column: $table.physicalActivityCode,
      builder: (column) => ColumnOrderings(column));
}

class $$UserActivitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserActivitiesTable> {
  $$UserActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<double> get burnedKcal => $composableBuilder(
      column: $table.burnedKcal, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get physicalActivityCode => $composableBuilder(
      column: $table.physicalActivityCode, builder: (column) => column);
}

class $$UserActivitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserActivitiesTable,
    UserActivity,
    $$UserActivitiesTableFilterComposer,
    $$UserActivitiesTableOrderingComposer,
    $$UserActivitiesTableAnnotationComposer,
    $$UserActivitiesTableCreateCompanionBuilder,
    $$UserActivitiesTableUpdateCompanionBuilder,
    (
      UserActivity,
      BaseReferences<_$AppDatabase, $UserActivitiesTable, UserActivity>
    ),
    UserActivity,
    PrefetchHooks Function()> {
  $$UserActivitiesTableTableManager(
      _$AppDatabase db, $UserActivitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserActivitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<double> duration = const Value.absent(),
            Value<double> burnedKcal = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> physicalActivityCode = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserActivitiesCompanion(
            id: id,
            duration: duration,
            burnedKcal: burnedKcal,
            date: date,
            physicalActivityCode: physicalActivityCode,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required double duration,
            required double burnedKcal,
            required DateTime date,
            required String physicalActivityCode,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserActivitiesCompanion.insert(
            id: id,
            duration: duration,
            burnedKcal: burnedKcal,
            date: date,
            physicalActivityCode: physicalActivityCode,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserActivitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserActivitiesTable,
    UserActivity,
    $$UserActivitiesTableFilterComposer,
    $$UserActivitiesTableOrderingComposer,
    $$UserActivitiesTableAnnotationComposer,
    $$UserActivitiesTableCreateCompanionBuilder,
    $$UserActivitiesTableUpdateCompanionBuilder,
    (
      UserActivity,
      BaseReferences<_$AppDatabase, $UserActivitiesTable, UserActivity>
    ),
    UserActivity,
    PrefetchHooks Function()>;
typedef $$TrackedDaysTableCreateCompanionBuilder = TrackedDaysCompanion
    Function({
  required DateTime day,
  required double calorieGoal,
  Value<double> caloriesTracked,
  Value<double?> carbsGoal,
  Value<double?> carbsTracked,
  Value<double?> fatGoal,
  Value<double?> fatTracked,
  Value<double?> proteinGoal,
  Value<double?> proteinTracked,
  Value<int> rowid,
});
typedef $$TrackedDaysTableUpdateCompanionBuilder = TrackedDaysCompanion
    Function({
  Value<DateTime> day,
  Value<double> calorieGoal,
  Value<double> caloriesTracked,
  Value<double?> carbsGoal,
  Value<double?> carbsTracked,
  Value<double?> fatGoal,
  Value<double?> fatTracked,
  Value<double?> proteinGoal,
  Value<double?> proteinTracked,
  Value<int> rowid,
});

class $$TrackedDaysTableFilterComposer
    extends Composer<_$AppDatabase, $TrackedDaysTable> {
  $$TrackedDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get calorieGoal => $composableBuilder(
      column: $table.calorieGoal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get caloriesTracked => $composableBuilder(
      column: $table.caloriesTracked,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carbsGoal => $composableBuilder(
      column: $table.carbsGoal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carbsTracked => $composableBuilder(
      column: $table.carbsTracked, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fatGoal => $composableBuilder(
      column: $table.fatGoal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fatTracked => $composableBuilder(
      column: $table.fatTracked, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get proteinGoal => $composableBuilder(
      column: $table.proteinGoal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get proteinTracked => $composableBuilder(
      column: $table.proteinTracked,
      builder: (column) => ColumnFilters(column));
}

class $$TrackedDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $TrackedDaysTable> {
  $$TrackedDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get calorieGoal => $composableBuilder(
      column: $table.calorieGoal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get caloriesTracked => $composableBuilder(
      column: $table.caloriesTracked,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carbsGoal => $composableBuilder(
      column: $table.carbsGoal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carbsTracked => $composableBuilder(
      column: $table.carbsTracked,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fatGoal => $composableBuilder(
      column: $table.fatGoal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fatTracked => $composableBuilder(
      column: $table.fatTracked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get proteinGoal => $composableBuilder(
      column: $table.proteinGoal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get proteinTracked => $composableBuilder(
      column: $table.proteinTracked,
      builder: (column) => ColumnOrderings(column));
}

class $$TrackedDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrackedDaysTable> {
  $$TrackedDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<double> get calorieGoal => $composableBuilder(
      column: $table.calorieGoal, builder: (column) => column);

  GeneratedColumn<double> get caloriesTracked => $composableBuilder(
      column: $table.caloriesTracked, builder: (column) => column);

  GeneratedColumn<double> get carbsGoal =>
      $composableBuilder(column: $table.carbsGoal, builder: (column) => column);

  GeneratedColumn<double> get carbsTracked => $composableBuilder(
      column: $table.carbsTracked, builder: (column) => column);

  GeneratedColumn<double> get fatGoal =>
      $composableBuilder(column: $table.fatGoal, builder: (column) => column);

  GeneratedColumn<double> get fatTracked => $composableBuilder(
      column: $table.fatTracked, builder: (column) => column);

  GeneratedColumn<double> get proteinGoal => $composableBuilder(
      column: $table.proteinGoal, builder: (column) => column);

  GeneratedColumn<double> get proteinTracked => $composableBuilder(
      column: $table.proteinTracked, builder: (column) => column);
}

class $$TrackedDaysTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrackedDaysTable,
    TrackedDay,
    $$TrackedDaysTableFilterComposer,
    $$TrackedDaysTableOrderingComposer,
    $$TrackedDaysTableAnnotationComposer,
    $$TrackedDaysTableCreateCompanionBuilder,
    $$TrackedDaysTableUpdateCompanionBuilder,
    (TrackedDay, BaseReferences<_$AppDatabase, $TrackedDaysTable, TrackedDay>),
    TrackedDay,
    PrefetchHooks Function()> {
  $$TrackedDaysTableTableManager(_$AppDatabase db, $TrackedDaysTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrackedDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrackedDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrackedDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> day = const Value.absent(),
            Value<double> calorieGoal = const Value.absent(),
            Value<double> caloriesTracked = const Value.absent(),
            Value<double?> carbsGoal = const Value.absent(),
            Value<double?> carbsTracked = const Value.absent(),
            Value<double?> fatGoal = const Value.absent(),
            Value<double?> fatTracked = const Value.absent(),
            Value<double?> proteinGoal = const Value.absent(),
            Value<double?> proteinTracked = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrackedDaysCompanion(
            day: day,
            calorieGoal: calorieGoal,
            caloriesTracked: caloriesTracked,
            carbsGoal: carbsGoal,
            carbsTracked: carbsTracked,
            fatGoal: fatGoal,
            fatTracked: fatTracked,
            proteinGoal: proteinGoal,
            proteinTracked: proteinTracked,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required DateTime day,
            required double calorieGoal,
            Value<double> caloriesTracked = const Value.absent(),
            Value<double?> carbsGoal = const Value.absent(),
            Value<double?> carbsTracked = const Value.absent(),
            Value<double?> fatGoal = const Value.absent(),
            Value<double?> fatTracked = const Value.absent(),
            Value<double?> proteinGoal = const Value.absent(),
            Value<double?> proteinTracked = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrackedDaysCompanion.insert(
            day: day,
            calorieGoal: calorieGoal,
            caloriesTracked: caloriesTracked,
            carbsGoal: carbsGoal,
            carbsTracked: carbsTracked,
            fatGoal: fatGoal,
            fatTracked: fatTracked,
            proteinGoal: proteinGoal,
            proteinTracked: proteinTracked,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrackedDaysTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrackedDaysTable,
    TrackedDay,
    $$TrackedDaysTableFilterComposer,
    $$TrackedDaysTableOrderingComposer,
    $$TrackedDaysTableAnnotationComposer,
    $$TrackedDaysTableCreateCompanionBuilder,
    $$TrackedDaysTableUpdateCompanionBuilder,
    (TrackedDay, BaseReferences<_$AppDatabase, $TrackedDaysTable, TrackedDay>),
    TrackedDay,
    PrefetchHooks Function()>;
typedef $$RecipesTableCreateCompanionBuilder = RecipesCompanion Function({
  required String id,
  required String name,
  Value<String> servings,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$RecipesTableUpdateCompanionBuilder = RecipesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> servings,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$RecipesTableReferences
    extends BaseReferences<_$AppDatabase, $RecipesTable, Recipe> {
  $$RecipesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeItemsTable, List<RecipeItem>>
      _recipeItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recipeItems,
              aliasName:
                  $_aliasNameGenerator(db.recipes.id, db.recipeItems.recipeId));

  $$RecipeItemsTableProcessedTableManager get recipeItemsRefs {
    final manager = $$RecipeItemsTableTableManager($_db, $_db.recipeItems)
        .filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recipeItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get servings => $composableBuilder(
      column: $table.servings, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> recipeItemsRefs(
      Expression<bool> Function($$RecipeItemsTableFilterComposer f) f) {
    final $$RecipeItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recipeItems,
        getReferencedColumn: (t) => t.recipeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeItemsTableFilterComposer(
              $db: $db,
              $table: $db.recipeItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get servings => $composableBuilder(
      column: $table.servings, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> recipeItemsRefs<T extends Object>(
      Expression<T> Function($$RecipeItemsTableAnnotationComposer a) f) {
    final $$RecipeItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recipeItems,
        getReferencedColumn: (t) => t.recipeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.recipeItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecipesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipesTable,
    Recipe,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableAnnotationComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder,
    (Recipe, $$RecipesTableReferences),
    Recipe,
    PrefetchHooks Function({bool recipeItemsRefs})> {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> servings = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipesCompanion(
            id: id,
            name: name,
            servings: servings,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String> servings = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipesCompanion.insert(
            id: id,
            name: name,
            servings: servings,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RecipesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({recipeItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (recipeItemsRefs) db.recipeItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeItemsRefs)
                    await $_getPrefetchedData<Recipe, $RecipesTable,
                            RecipeItem>(
                        currentTable: table,
                        referencedTable:
                            $$RecipesTableReferences._recipeItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecipesTableReferences(db, table, p0)
                                .recipeItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.recipeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RecipesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipesTable,
    Recipe,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableAnnotationComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder,
    (Recipe, $$RecipesTableReferences),
    Recipe,
    PrefetchHooks Function({bool recipeItemsRefs})>;
typedef $$RecipeItemsTableCreateCompanionBuilder = RecipeItemsCompanion
    Function({
  required String id,
  required String recipeId,
  required String mealId,
  required double amount,
  required String unit,
  Value<int> rowid,
});
typedef $$RecipeItemsTableUpdateCompanionBuilder = RecipeItemsCompanion
    Function({
  Value<String> id,
  Value<String> recipeId,
  Value<String> mealId,
  Value<double> amount,
  Value<String> unit,
  Value<int> rowid,
});

final class $$RecipeItemsTableReferences
    extends BaseReferences<_$AppDatabase, $RecipeItemsTable, RecipeItem> {
  $$RecipeItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
          $_aliasNameGenerator(db.recipeItems.recipeId, db.recipes.id));

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager($_db, $_db.recipes)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RecipeItemsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeItemsTable> {
  $$RecipeItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mealId => $composableBuilder(
      column: $table.mealId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipesTableFilterComposer(
              $db: $db,
              $table: $db.recipes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeItemsTable> {
  $$RecipeItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealId => $composableBuilder(
      column: $table.mealId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipesTableOrderingComposer(
              $db: $db,
              $table: $db.recipes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeItemsTable> {
  $$RecipeItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mealId =>
      $composableBuilder(column: $table.mealId, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipesTableAnnotationComposer(
              $db: $db,
              $table: $db.recipes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipeItemsTable,
    RecipeItem,
    $$RecipeItemsTableFilterComposer,
    $$RecipeItemsTableOrderingComposer,
    $$RecipeItemsTableAnnotationComposer,
    $$RecipeItemsTableCreateCompanionBuilder,
    $$RecipeItemsTableUpdateCompanionBuilder,
    (RecipeItem, $$RecipeItemsTableReferences),
    RecipeItem,
    PrefetchHooks Function({bool recipeId})> {
  $$RecipeItemsTableTableManager(_$AppDatabase db, $RecipeItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> recipeId = const Value.absent(),
            Value<String> mealId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeItemsCompanion(
            id: id,
            recipeId: recipeId,
            mealId: mealId,
            amount: amount,
            unit: unit,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String recipeId,
            required String mealId,
            required double amount,
            required String unit,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeItemsCompanion.insert(
            id: id,
            recipeId: recipeId,
            mealId: mealId,
            amount: amount,
            unit: unit,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecipeItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (recipeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recipeId,
                    referencedTable:
                        $$RecipeItemsTableReferences._recipeIdTable(db),
                    referencedColumn:
                        $$RecipeItemsTableReferences._recipeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RecipeItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipeItemsTable,
    RecipeItem,
    $$RecipeItemsTableFilterComposer,
    $$RecipeItemsTableOrderingComposer,
    $$RecipeItemsTableAnnotationComposer,
    $$RecipeItemsTableCreateCompanionBuilder,
    $$RecipeItemsTableUpdateCompanionBuilder,
    (RecipeItem, $$RecipeItemsTableReferences),
    RecipeItem,
    PrefetchHooks Function({bool recipeId})>;
typedef $$WeightsTableCreateCompanionBuilder = WeightsCompanion Function({
  Value<int> id,
  required int userId,
  required double weightKg,
  required DateTime date,
  Value<String?> note,
});
typedef $$WeightsTableUpdateCompanionBuilder = WeightsCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<double> weightKg,
  Value<DateTime> date,
  Value<String?> note,
});

class $$WeightsTableFilterComposer
    extends Composer<_$AppDatabase, $WeightsTable> {
  $$WeightsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));
}

class $$WeightsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightsTable> {
  $$WeightsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));
}

class $$WeightsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightsTable> {
  $$WeightsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$WeightsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeightsTable,
    Weight,
    $$WeightsTableFilterComposer,
    $$WeightsTableOrderingComposer,
    $$WeightsTableAnnotationComposer,
    $$WeightsTableCreateCompanionBuilder,
    $$WeightsTableUpdateCompanionBuilder,
    (Weight, BaseReferences<_$AppDatabase, $WeightsTable, Weight>),
    Weight,
    PrefetchHooks Function()> {
  $$WeightsTableTableManager(_$AppDatabase db, $WeightsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<double> weightKg = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String?> note = const Value.absent(),
          }) =>
              WeightsCompanion(
            id: id,
            userId: userId,
            weightKg: weightKg,
            date: date,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required double weightKg,
            required DateTime date,
            Value<String?> note = const Value.absent(),
          }) =>
              WeightsCompanion.insert(
            id: id,
            userId: userId,
            weightKg: weightKg,
            date: date,
            note: note,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WeightsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WeightsTable,
    Weight,
    $$WeightsTableFilterComposer,
    $$WeightsTableOrderingComposer,
    $$WeightsTableAnnotationComposer,
    $$WeightsTableCreateCompanionBuilder,
    $$WeightsTableUpdateCompanionBuilder,
    (Weight, BaseReferences<_$AppDatabase, $WeightsTable, Weight>),
    Weight,
    PrefetchHooks Function()>;
typedef $$NotificationSettingsTableCreateCompanionBuilder
    = NotificationSettingsCompanion Function({
  Value<int> id,
  required int userId,
  Value<int?> breakfastTime,
  Value<int?> lunchTime,
  Value<int?> dinnerTime,
  Value<int?> snackTime,
  Value<bool> dailySummaryEnabled,
  Value<int?> dailySummaryTime,
});
typedef $$NotificationSettingsTableUpdateCompanionBuilder
    = NotificationSettingsCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<int?> breakfastTime,
  Value<int?> lunchTime,
  Value<int?> dinnerTime,
  Value<int?> snackTime,
  Value<bool> dailySummaryEnabled,
  Value<int?> dailySummaryTime,
});

class $$NotificationSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTable> {
  $$NotificationSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get breakfastTime => $composableBuilder(
      column: $table.breakfastTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lunchTime => $composableBuilder(
      column: $table.lunchTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dinnerTime => $composableBuilder(
      column: $table.dinnerTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get snackTime => $composableBuilder(
      column: $table.snackTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get dailySummaryEnabled => $composableBuilder(
      column: $table.dailySummaryEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dailySummaryTime => $composableBuilder(
      column: $table.dailySummaryTime,
      builder: (column) => ColumnFilters(column));
}

class $$NotificationSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTable> {
  $$NotificationSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get breakfastTime => $composableBuilder(
      column: $table.breakfastTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lunchTime => $composableBuilder(
      column: $table.lunchTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dinnerTime => $composableBuilder(
      column: $table.dinnerTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get snackTime => $composableBuilder(
      column: $table.snackTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get dailySummaryEnabled => $composableBuilder(
      column: $table.dailySummaryEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dailySummaryTime => $composableBuilder(
      column: $table.dailySummaryTime,
      builder: (column) => ColumnOrderings(column));
}

class $$NotificationSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTable> {
  $$NotificationSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get breakfastTime => $composableBuilder(
      column: $table.breakfastTime, builder: (column) => column);

  GeneratedColumn<int> get lunchTime =>
      $composableBuilder(column: $table.lunchTime, builder: (column) => column);

  GeneratedColumn<int> get dinnerTime => $composableBuilder(
      column: $table.dinnerTime, builder: (column) => column);

  GeneratedColumn<int> get snackTime =>
      $composableBuilder(column: $table.snackTime, builder: (column) => column);

  GeneratedColumn<bool> get dailySummaryEnabled => $composableBuilder(
      column: $table.dailySummaryEnabled, builder: (column) => column);

  GeneratedColumn<int> get dailySummaryTime => $composableBuilder(
      column: $table.dailySummaryTime, builder: (column) => column);
}

class $$NotificationSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationSettingsTable,
    NotificationSetting,
    $$NotificationSettingsTableFilterComposer,
    $$NotificationSettingsTableOrderingComposer,
    $$NotificationSettingsTableAnnotationComposer,
    $$NotificationSettingsTableCreateCompanionBuilder,
    $$NotificationSettingsTableUpdateCompanionBuilder,
    (
      NotificationSetting,
      BaseReferences<_$AppDatabase, $NotificationSettingsTable,
          NotificationSetting>
    ),
    NotificationSetting,
    PrefetchHooks Function()> {
  $$NotificationSettingsTableTableManager(
      _$AppDatabase db, $NotificationSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationSettingsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationSettingsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int?> breakfastTime = const Value.absent(),
            Value<int?> lunchTime = const Value.absent(),
            Value<int?> dinnerTime = const Value.absent(),
            Value<int?> snackTime = const Value.absent(),
            Value<bool> dailySummaryEnabled = const Value.absent(),
            Value<int?> dailySummaryTime = const Value.absent(),
          }) =>
              NotificationSettingsCompanion(
            id: id,
            userId: userId,
            breakfastTime: breakfastTime,
            lunchTime: lunchTime,
            dinnerTime: dinnerTime,
            snackTime: snackTime,
            dailySummaryEnabled: dailySummaryEnabled,
            dailySummaryTime: dailySummaryTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            Value<int?> breakfastTime = const Value.absent(),
            Value<int?> lunchTime = const Value.absent(),
            Value<int?> dinnerTime = const Value.absent(),
            Value<int?> snackTime = const Value.absent(),
            Value<bool> dailySummaryEnabled = const Value.absent(),
            Value<int?> dailySummaryTime = const Value.absent(),
          }) =>
              NotificationSettingsCompanion.insert(
            id: id,
            userId: userId,
            breakfastTime: breakfastTime,
            lunchTime: lunchTime,
            dinnerTime: dinnerTime,
            snackTime: snackTime,
            dailySummaryEnabled: dailySummaryEnabled,
            dailySummaryTime: dailySummaryTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotificationSettingsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $NotificationSettingsTable,
        NotificationSetting,
        $$NotificationSettingsTableFilterComposer,
        $$NotificationSettingsTableOrderingComposer,
        $$NotificationSettingsTableAnnotationComposer,
        $$NotificationSettingsTableCreateCompanionBuilder,
        $$NotificationSettingsTableUpdateCompanionBuilder,
        (
          NotificationSetting,
          BaseReferences<_$AppDatabase, $NotificationSettingsTable,
              NotificationSetting>
        ),
        NotificationSetting,
        PrefetchHooks Function()>;
typedef $$WaterEntriesTableCreateCompanionBuilder = WaterEntriesCompanion
    Function({
  Value<int> id,
  required int userId,
  required int amountMl,
  required DateTime date,
  required DateTime timestamp,
});
typedef $$WaterEntriesTableUpdateCompanionBuilder = WaterEntriesCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<int> amountMl,
  Value<DateTime> date,
  Value<DateTime> timestamp,
});

class $$WaterEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $WaterEntriesTable> {
  $$WaterEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountMl => $composableBuilder(
      column: $table.amountMl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));
}

class $$WaterEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WaterEntriesTable> {
  $$WaterEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountMl => $composableBuilder(
      column: $table.amountMl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));
}

class $$WaterEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WaterEntriesTable> {
  $$WaterEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get amountMl =>
      $composableBuilder(column: $table.amountMl, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$WaterEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WaterEntriesTable,
    WaterEntry,
    $$WaterEntriesTableFilterComposer,
    $$WaterEntriesTableOrderingComposer,
    $$WaterEntriesTableAnnotationComposer,
    $$WaterEntriesTableCreateCompanionBuilder,
    $$WaterEntriesTableUpdateCompanionBuilder,
    (WaterEntry, BaseReferences<_$AppDatabase, $WaterEntriesTable, WaterEntry>),
    WaterEntry,
    PrefetchHooks Function()> {
  $$WaterEntriesTableTableManager(_$AppDatabase db, $WaterEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WaterEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WaterEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WaterEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> amountMl = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              WaterEntriesCompanion(
            id: id,
            userId: userId,
            amountMl: amountMl,
            date: date,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required int amountMl,
            required DateTime date,
            required DateTime timestamp,
          }) =>
              WaterEntriesCompanion.insert(
            id: id,
            userId: userId,
            amountMl: amountMl,
            date: date,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WaterEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WaterEntriesTable,
    WaterEntry,
    $$WaterEntriesTableFilterComposer,
    $$WaterEntriesTableOrderingComposer,
    $$WaterEntriesTableAnnotationComposer,
    $$WaterEntriesTableCreateCompanionBuilder,
    $$WaterEntriesTableUpdateCompanionBuilder,
    (WaterEntry, BaseReferences<_$AppDatabase, $WaterEntriesTable, WaterEntry>),
    WaterEntry,
    PrefetchHooks Function()>;
typedef $$FastsTableCreateCompanionBuilder = FastsCompanion Function({
  Value<int> id,
  required int userId,
  required DateTime startTime,
  Value<DateTime?> endTime,
  required int targetDurationMinutes,
  Value<String> presetType,
});
typedef $$FastsTableUpdateCompanionBuilder = FastsCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<DateTime> startTime,
  Value<DateTime?> endTime,
  Value<int> targetDurationMinutes,
  Value<String> presetType,
});

class $$FastsTableFilterComposer extends Composer<_$AppDatabase, $FastsTable> {
  $$FastsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetDurationMinutes => $composableBuilder(
      column: $table.targetDurationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get presetType => $composableBuilder(
      column: $table.presetType, builder: (column) => ColumnFilters(column));
}

class $$FastsTableOrderingComposer
    extends Composer<_$AppDatabase, $FastsTable> {
  $$FastsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetDurationMinutes => $composableBuilder(
      column: $table.targetDurationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get presetType => $composableBuilder(
      column: $table.presetType, builder: (column) => ColumnOrderings(column));
}

class $$FastsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FastsTable> {
  $$FastsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get targetDurationMinutes => $composableBuilder(
      column: $table.targetDurationMinutes, builder: (column) => column);

  GeneratedColumn<String> get presetType => $composableBuilder(
      column: $table.presetType, builder: (column) => column);
}

class $$FastsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FastsTable,
    Fast,
    $$FastsTableFilterComposer,
    $$FastsTableOrderingComposer,
    $$FastsTableAnnotationComposer,
    $$FastsTableCreateCompanionBuilder,
    $$FastsTableUpdateCompanionBuilder,
    (Fast, BaseReferences<_$AppDatabase, $FastsTable, Fast>),
    Fast,
    PrefetchHooks Function()> {
  $$FastsTableTableManager(_$AppDatabase db, $FastsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FastsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FastsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FastsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<int> targetDurationMinutes = const Value.absent(),
            Value<String> presetType = const Value.absent(),
          }) =>
              FastsCompanion(
            id: id,
            userId: userId,
            startTime: startTime,
            endTime: endTime,
            targetDurationMinutes: targetDurationMinutes,
            presetType: presetType,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required DateTime startTime,
            Value<DateTime?> endTime = const Value.absent(),
            required int targetDurationMinutes,
            Value<String> presetType = const Value.absent(),
          }) =>
              FastsCompanion.insert(
            id: id,
            userId: userId,
            startTime: startTime,
            endTime: endTime,
            targetDurationMinutes: targetDurationMinutes,
            presetType: presetType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FastsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FastsTable,
    Fast,
    $$FastsTableFilterComposer,
    $$FastsTableOrderingComposer,
    $$FastsTableAnnotationComposer,
    $$FastsTableCreateCompanionBuilder,
    $$FastsTableUpdateCompanionBuilder,
    (Fast, BaseReferences<_$AppDatabase, $FastsTable, Fast>),
    Fast,
    PrefetchHooks Function()>;
typedef $$AiModelMetadataEntriesTableCreateCompanionBuilder
    = AiModelMetadataEntriesCompanion Function({
  Value<int> id,
  required String modelVersion,
  required String assetPath,
  required DateTime lastUpdated,
});
typedef $$AiModelMetadataEntriesTableUpdateCompanionBuilder
    = AiModelMetadataEntriesCompanion Function({
  Value<int> id,
  Value<String> modelVersion,
  Value<String> assetPath,
  Value<DateTime> lastUpdated,
});

class $$AiModelMetadataEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $AiModelMetadataEntriesTable> {
  $$AiModelMetadataEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get modelVersion => $composableBuilder(
      column: $table.modelVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assetPath => $composableBuilder(
      column: $table.assetPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$AiModelMetadataEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $AiModelMetadataEntriesTable> {
  $$AiModelMetadataEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get modelVersion => $composableBuilder(
      column: $table.modelVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assetPath => $composableBuilder(
      column: $table.assetPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$AiModelMetadataEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiModelMetadataEntriesTable> {
  $$AiModelMetadataEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get modelVersion => $composableBuilder(
      column: $table.modelVersion, builder: (column) => column);

  GeneratedColumn<String> get assetPath =>
      $composableBuilder(column: $table.assetPath, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$AiModelMetadataEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AiModelMetadataEntriesTable,
    AiModelMetadataEntry,
    $$AiModelMetadataEntriesTableFilterComposer,
    $$AiModelMetadataEntriesTableOrderingComposer,
    $$AiModelMetadataEntriesTableAnnotationComposer,
    $$AiModelMetadataEntriesTableCreateCompanionBuilder,
    $$AiModelMetadataEntriesTableUpdateCompanionBuilder,
    (
      AiModelMetadataEntry,
      BaseReferences<_$AppDatabase, $AiModelMetadataEntriesTable,
          AiModelMetadataEntry>
    ),
    AiModelMetadataEntry,
    PrefetchHooks Function()> {
  $$AiModelMetadataEntriesTableTableManager(
      _$AppDatabase db, $AiModelMetadataEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiModelMetadataEntriesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$AiModelMetadataEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiModelMetadataEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> modelVersion = const Value.absent(),
            Value<String> assetPath = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
          }) =>
              AiModelMetadataEntriesCompanion(
            id: id,
            modelVersion: modelVersion,
            assetPath: assetPath,
            lastUpdated: lastUpdated,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String modelVersion,
            required String assetPath,
            required DateTime lastUpdated,
          }) =>
              AiModelMetadataEntriesCompanion.insert(
            id: id,
            modelVersion: modelVersion,
            assetPath: assetPath,
            lastUpdated: lastUpdated,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AiModelMetadataEntriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $AiModelMetadataEntriesTable,
        AiModelMetadataEntry,
        $$AiModelMetadataEntriesTableFilterComposer,
        $$AiModelMetadataEntriesTableOrderingComposer,
        $$AiModelMetadataEntriesTableAnnotationComposer,
        $$AiModelMetadataEntriesTableCreateCompanionBuilder,
        $$AiModelMetadataEntriesTableUpdateCompanionBuilder,
        (
          AiModelMetadataEntry,
          BaseReferences<_$AppDatabase, $AiModelMetadataEntriesTable,
              AiModelMetadataEntry>
        ),
        AiModelMetadataEntry,
        PrefetchHooks Function()>;
typedef $$MealPlansTableCreateCompanionBuilder = MealPlansCompanion Function({
  Value<int> id,
  required int userId,
  required DateTime date,
  required String mealSlot,
  Value<String?> recipeId,
  Value<String?> mealId,
  Value<String?> note,
});
typedef $$MealPlansTableUpdateCompanionBuilder = MealPlansCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<DateTime> date,
  Value<String> mealSlot,
  Value<String?> recipeId,
  Value<String?> mealId,
  Value<String?> note,
});

class $$MealPlansTableFilterComposer
    extends Composer<_$AppDatabase, $MealPlansTable> {
  $$MealPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mealSlot => $composableBuilder(
      column: $table.mealSlot, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mealId => $composableBuilder(
      column: $table.mealId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));
}

class $$MealPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPlansTable> {
  $$MealPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealSlot => $composableBuilder(
      column: $table.mealSlot, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealId => $composableBuilder(
      column: $table.mealId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));
}

class $$MealPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPlansTable> {
  $$MealPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get mealSlot =>
      $composableBuilder(column: $table.mealSlot, builder: (column) => column);

  GeneratedColumn<String> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);

  GeneratedColumn<String> get mealId =>
      $composableBuilder(column: $table.mealId, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$MealPlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealPlansTable,
    MealPlan,
    $$MealPlansTableFilterComposer,
    $$MealPlansTableOrderingComposer,
    $$MealPlansTableAnnotationComposer,
    $$MealPlansTableCreateCompanionBuilder,
    $$MealPlansTableUpdateCompanionBuilder,
    (MealPlan, BaseReferences<_$AppDatabase, $MealPlansTable, MealPlan>),
    MealPlan,
    PrefetchHooks Function()> {
  $$MealPlansTableTableManager(_$AppDatabase db, $MealPlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> mealSlot = const Value.absent(),
            Value<String?> recipeId = const Value.absent(),
            Value<String?> mealId = const Value.absent(),
            Value<String?> note = const Value.absent(),
          }) =>
              MealPlansCompanion(
            id: id,
            userId: userId,
            date: date,
            mealSlot: mealSlot,
            recipeId: recipeId,
            mealId: mealId,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required DateTime date,
            required String mealSlot,
            Value<String?> recipeId = const Value.absent(),
            Value<String?> mealId = const Value.absent(),
            Value<String?> note = const Value.absent(),
          }) =>
              MealPlansCompanion.insert(
            id: id,
            userId: userId,
            date: date,
            mealSlot: mealSlot,
            recipeId: recipeId,
            mealId: mealId,
            note: note,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MealPlansTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealPlansTable,
    MealPlan,
    $$MealPlansTableFilterComposer,
    $$MealPlansTableOrderingComposer,
    $$MealPlansTableAnnotationComposer,
    $$MealPlansTableCreateCompanionBuilder,
    $$MealPlansTableUpdateCompanionBuilder,
    (MealPlan, BaseReferences<_$AppDatabase, $MealPlansTable, MealPlan>),
    MealPlan,
    PrefetchHooks Function()>;
typedef $$PhotoProgressEntriesTableCreateCompanionBuilder
    = PhotoProgressEntriesCompanion Function({
  Value<int> id,
  required int userId,
  required String filePath,
  required DateTime date,
  required String tags,
  Value<String?> note,
});
typedef $$PhotoProgressEntriesTableUpdateCompanionBuilder
    = PhotoProgressEntriesCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<String> filePath,
  Value<DateTime> date,
  Value<String> tags,
  Value<String?> note,
});

class $$PhotoProgressEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PhotoProgressEntriesTable> {
  $$PhotoProgressEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));
}

class $$PhotoProgressEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotoProgressEntriesTable> {
  $$PhotoProgressEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));
}

class $$PhotoProgressEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotoProgressEntriesTable> {
  $$PhotoProgressEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$PhotoProgressEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PhotoProgressEntriesTable,
    PhotoProgressEntry,
    $$PhotoProgressEntriesTableFilterComposer,
    $$PhotoProgressEntriesTableOrderingComposer,
    $$PhotoProgressEntriesTableAnnotationComposer,
    $$PhotoProgressEntriesTableCreateCompanionBuilder,
    $$PhotoProgressEntriesTableUpdateCompanionBuilder,
    (
      PhotoProgressEntry,
      BaseReferences<_$AppDatabase, $PhotoProgressEntriesTable,
          PhotoProgressEntry>
    ),
    PhotoProgressEntry,
    PrefetchHooks Function()> {
  $$PhotoProgressEntriesTableTableManager(
      _$AppDatabase db, $PhotoProgressEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotoProgressEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotoProgressEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotoProgressEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String?> note = const Value.absent(),
          }) =>
              PhotoProgressEntriesCompanion(
            id: id,
            userId: userId,
            filePath: filePath,
            date: date,
            tags: tags,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String filePath,
            required DateTime date,
            required String tags,
            Value<String?> note = const Value.absent(),
          }) =>
              PhotoProgressEntriesCompanion.insert(
            id: id,
            userId: userId,
            filePath: filePath,
            date: date,
            tags: tags,
            note: note,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PhotoProgressEntriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PhotoProgressEntriesTable,
        PhotoProgressEntry,
        $$PhotoProgressEntriesTableFilterComposer,
        $$PhotoProgressEntriesTableOrderingComposer,
        $$PhotoProgressEntriesTableAnnotationComposer,
        $$PhotoProgressEntriesTableCreateCompanionBuilder,
        $$PhotoProgressEntriesTableUpdateCompanionBuilder,
        (
          PhotoProgressEntry,
          BaseReferences<_$AppDatabase, $PhotoProgressEntriesTable,
              PhotoProgressEntry>
        ),
        PhotoProgressEntry,
        PrefetchHooks Function()>;
typedef $$BodyMeasurementsTableCreateCompanionBuilder
    = BodyMeasurementsCompanion Function({
  Value<int> id,
  required int userId,
  required DateTime date,
  Value<double?> waistCm,
  Value<double?> neckCm,
  Value<double?> hipCm,
  Value<double?> chestCm,
  Value<double?> bicepCm,
  Value<double?> thighCm,
  Value<String?> note,
});
typedef $$BodyMeasurementsTableUpdateCompanionBuilder
    = BodyMeasurementsCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<DateTime> date,
  Value<double?> waistCm,
  Value<double?> neckCm,
  Value<double?> hipCm,
  Value<double?> chestCm,
  Value<double?> bicepCm,
  Value<double?> thighCm,
  Value<String?> note,
});

class $$BodyMeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get waistCm => $composableBuilder(
      column: $table.waistCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get neckCm => $composableBuilder(
      column: $table.neckCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get hipCm => $composableBuilder(
      column: $table.hipCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get chestCm => $composableBuilder(
      column: $table.chestCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bicepCm => $composableBuilder(
      column: $table.bicepCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get thighCm => $composableBuilder(
      column: $table.thighCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));
}

class $$BodyMeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get waistCm => $composableBuilder(
      column: $table.waistCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get neckCm => $composableBuilder(
      column: $table.neckCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get hipCm => $composableBuilder(
      column: $table.hipCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get chestCm => $composableBuilder(
      column: $table.chestCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bicepCm => $composableBuilder(
      column: $table.bicepCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get thighCm => $composableBuilder(
      column: $table.thighCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));
}

class $$BodyMeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get waistCm =>
      $composableBuilder(column: $table.waistCm, builder: (column) => column);

  GeneratedColumn<double> get neckCm =>
      $composableBuilder(column: $table.neckCm, builder: (column) => column);

  GeneratedColumn<double> get hipCm =>
      $composableBuilder(column: $table.hipCm, builder: (column) => column);

  GeneratedColumn<double> get chestCm =>
      $composableBuilder(column: $table.chestCm, builder: (column) => column);

  GeneratedColumn<double> get bicepCm =>
      $composableBuilder(column: $table.bicepCm, builder: (column) => column);

  GeneratedColumn<double> get thighCm =>
      $composableBuilder(column: $table.thighCm, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$BodyMeasurementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BodyMeasurementsTable,
    BodyMeasurement,
    $$BodyMeasurementsTableFilterComposer,
    $$BodyMeasurementsTableOrderingComposer,
    $$BodyMeasurementsTableAnnotationComposer,
    $$BodyMeasurementsTableCreateCompanionBuilder,
    $$BodyMeasurementsTableUpdateCompanionBuilder,
    (
      BodyMeasurement,
      BaseReferences<_$AppDatabase, $BodyMeasurementsTable, BodyMeasurement>
    ),
    BodyMeasurement,
    PrefetchHooks Function()> {
  $$BodyMeasurementsTableTableManager(
      _$AppDatabase db, $BodyMeasurementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BodyMeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BodyMeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BodyMeasurementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double?> waistCm = const Value.absent(),
            Value<double?> neckCm = const Value.absent(),
            Value<double?> hipCm = const Value.absent(),
            Value<double?> chestCm = const Value.absent(),
            Value<double?> bicepCm = const Value.absent(),
            Value<double?> thighCm = const Value.absent(),
            Value<String?> note = const Value.absent(),
          }) =>
              BodyMeasurementsCompanion(
            id: id,
            userId: userId,
            date: date,
            waistCm: waistCm,
            neckCm: neckCm,
            hipCm: hipCm,
            chestCm: chestCm,
            bicepCm: bicepCm,
            thighCm: thighCm,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required DateTime date,
            Value<double?> waistCm = const Value.absent(),
            Value<double?> neckCm = const Value.absent(),
            Value<double?> hipCm = const Value.absent(),
            Value<double?> chestCm = const Value.absent(),
            Value<double?> bicepCm = const Value.absent(),
            Value<double?> thighCm = const Value.absent(),
            Value<String?> note = const Value.absent(),
          }) =>
              BodyMeasurementsCompanion.insert(
            id: id,
            userId: userId,
            date: date,
            waistCm: waistCm,
            neckCm: neckCm,
            hipCm: hipCm,
            chestCm: chestCm,
            bicepCm: bicepCm,
            thighCm: thighCm,
            note: note,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BodyMeasurementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BodyMeasurementsTable,
    BodyMeasurement,
    $$BodyMeasurementsTableFilterComposer,
    $$BodyMeasurementsTableOrderingComposer,
    $$BodyMeasurementsTableAnnotationComposer,
    $$BodyMeasurementsTableCreateCompanionBuilder,
    $$BodyMeasurementsTableUpdateCompanionBuilder,
    (
      BodyMeasurement,
      BaseReferences<_$AppDatabase, $BodyMeasurementsTable, BodyMeasurement>
    ),
    BodyMeasurement,
    PrefetchHooks Function()>;
typedef $$DailyNotesTableCreateCompanionBuilder = DailyNotesCompanion Function({
  Value<int> id,
  required int userId,
  required DateTime date,
  required String note,
});
typedef $$DailyNotesTableUpdateCompanionBuilder = DailyNotesCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<DateTime> date,
  Value<String> note,
});

class $$DailyNotesTableFilterComposer
    extends Composer<_$AppDatabase, $DailyNotesTable> {
  $$DailyNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));
}

class $$DailyNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyNotesTable> {
  $$DailyNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));
}

class $$DailyNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyNotesTable> {
  $$DailyNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$DailyNotesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyNotesTable,
    DailyNote,
    $$DailyNotesTableFilterComposer,
    $$DailyNotesTableOrderingComposer,
    $$DailyNotesTableAnnotationComposer,
    $$DailyNotesTableCreateCompanionBuilder,
    $$DailyNotesTableUpdateCompanionBuilder,
    (DailyNote, BaseReferences<_$AppDatabase, $DailyNotesTable, DailyNote>),
    DailyNote,
    PrefetchHooks Function()> {
  $$DailyNotesTableTableManager(_$AppDatabase db, $DailyNotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> note = const Value.absent(),
          }) =>
              DailyNotesCompanion(
            id: id,
            userId: userId,
            date: date,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required DateTime date,
            required String note,
          }) =>
              DailyNotesCompanion.insert(
            id: id,
            userId: userId,
            date: date,
            note: note,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyNotesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyNotesTable,
    DailyNote,
    $$DailyNotesTableFilterComposer,
    $$DailyNotesTableOrderingComposer,
    $$DailyNotesTableAnnotationComposer,
    $$DailyNotesTableCreateCompanionBuilder,
    $$DailyNotesTableUpdateCompanionBuilder,
    (DailyNote, BaseReferences<_$AppDatabase, $DailyNotesTable, DailyNote>),
    DailyNote,
    PrefetchHooks Function()>;
typedef $$AutopilotEntriesTableCreateCompanionBuilder
    = AutopilotEntriesCompanion Function({
  Value<int> id,
  required int userId,
  required int baselineCalorieBudget,
  required int adjustedCalorieBudget,
  required DateTime lastAdjustmentDate,
  required int isEnabled,
});
typedef $$AutopilotEntriesTableUpdateCompanionBuilder
    = AutopilotEntriesCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<int> baselineCalorieBudget,
  Value<int> adjustedCalorieBudget,
  Value<DateTime> lastAdjustmentDate,
  Value<int> isEnabled,
});

class $$AutopilotEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $AutopilotEntriesTable> {
  $$AutopilotEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get baselineCalorieBudget => $composableBuilder(
      column: $table.baselineCalorieBudget,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get adjustedCalorieBudget => $composableBuilder(
      column: $table.adjustedCalorieBudget,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAdjustmentDate => $composableBuilder(
      column: $table.lastAdjustmentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isEnabled => $composableBuilder(
      column: $table.isEnabled, builder: (column) => ColumnFilters(column));
}

class $$AutopilotEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $AutopilotEntriesTable> {
  $$AutopilotEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get baselineCalorieBudget => $composableBuilder(
      column: $table.baselineCalorieBudget,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get adjustedCalorieBudget => $composableBuilder(
      column: $table.adjustedCalorieBudget,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAdjustmentDate => $composableBuilder(
      column: $table.lastAdjustmentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isEnabled => $composableBuilder(
      column: $table.isEnabled, builder: (column) => ColumnOrderings(column));
}

class $$AutopilotEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AutopilotEntriesTable> {
  $$AutopilotEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get baselineCalorieBudget => $composableBuilder(
      column: $table.baselineCalorieBudget, builder: (column) => column);

  GeneratedColumn<int> get adjustedCalorieBudget => $composableBuilder(
      column: $table.adjustedCalorieBudget, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAdjustmentDate => $composableBuilder(
      column: $table.lastAdjustmentDate, builder: (column) => column);

  GeneratedColumn<int> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);
}

class $$AutopilotEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AutopilotEntriesTable,
    AutopilotEntry,
    $$AutopilotEntriesTableFilterComposer,
    $$AutopilotEntriesTableOrderingComposer,
    $$AutopilotEntriesTableAnnotationComposer,
    $$AutopilotEntriesTableCreateCompanionBuilder,
    $$AutopilotEntriesTableUpdateCompanionBuilder,
    (
      AutopilotEntry,
      BaseReferences<_$AppDatabase, $AutopilotEntriesTable, AutopilotEntry>
    ),
    AutopilotEntry,
    PrefetchHooks Function()> {
  $$AutopilotEntriesTableTableManager(
      _$AppDatabase db, $AutopilotEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutopilotEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AutopilotEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AutopilotEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> baselineCalorieBudget = const Value.absent(),
            Value<int> adjustedCalorieBudget = const Value.absent(),
            Value<DateTime> lastAdjustmentDate = const Value.absent(),
            Value<int> isEnabled = const Value.absent(),
          }) =>
              AutopilotEntriesCompanion(
            id: id,
            userId: userId,
            baselineCalorieBudget: baselineCalorieBudget,
            adjustedCalorieBudget: adjustedCalorieBudget,
            lastAdjustmentDate: lastAdjustmentDate,
            isEnabled: isEnabled,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required int baselineCalorieBudget,
            required int adjustedCalorieBudget,
            required DateTime lastAdjustmentDate,
            required int isEnabled,
          }) =>
              AutopilotEntriesCompanion.insert(
            id: id,
            userId: userId,
            baselineCalorieBudget: baselineCalorieBudget,
            adjustedCalorieBudget: adjustedCalorieBudget,
            lastAdjustmentDate: lastAdjustmentDate,
            isEnabled: isEnabled,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AutopilotEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AutopilotEntriesTable,
    AutopilotEntry,
    $$AutopilotEntriesTableFilterComposer,
    $$AutopilotEntriesTableOrderingComposer,
    $$AutopilotEntriesTableAnnotationComposer,
    $$AutopilotEntriesTableCreateCompanionBuilder,
    $$AutopilotEntriesTableUpdateCompanionBuilder,
    (
      AutopilotEntry,
      BaseReferences<_$AppDatabase, $AutopilotEntriesTable, AutopilotEntry>
    ),
    AutopilotEntry,
    PrefetchHooks Function()>;
typedef $$CustomTrackersTableCreateCompanionBuilder = CustomTrackersCompanion
    Function({
  Value<int> id,
  required int userId,
  required String name,
  required String type,
  required double min,
  required double max,
  required String icon,
  Value<String?> unit,
});
typedef $$CustomTrackersTableUpdateCompanionBuilder = CustomTrackersCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<String> name,
  Value<String> type,
  Value<double> min,
  Value<double> max,
  Value<String> icon,
  Value<String?> unit,
});

class $$CustomTrackersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomTrackersTable> {
  $$CustomTrackersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get min => $composableBuilder(
      column: $table.min, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get max => $composableBuilder(
      column: $table.max, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));
}

class $$CustomTrackersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomTrackersTable> {
  $$CustomTrackersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get min => $composableBuilder(
      column: $table.min, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get max => $composableBuilder(
      column: $table.max, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));
}

class $$CustomTrackersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomTrackersTable> {
  $$CustomTrackersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get min =>
      $composableBuilder(column: $table.min, builder: (column) => column);

  GeneratedColumn<double> get max =>
      $composableBuilder(column: $table.max, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);
}

class $$CustomTrackersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomTrackersTable,
    CustomTracker,
    $$CustomTrackersTableFilterComposer,
    $$CustomTrackersTableOrderingComposer,
    $$CustomTrackersTableAnnotationComposer,
    $$CustomTrackersTableCreateCompanionBuilder,
    $$CustomTrackersTableUpdateCompanionBuilder,
    (
      CustomTracker,
      BaseReferences<_$AppDatabase, $CustomTrackersTable, CustomTracker>
    ),
    CustomTracker,
    PrefetchHooks Function()> {
  $$CustomTrackersTableTableManager(
      _$AppDatabase db, $CustomTrackersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomTrackersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomTrackersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomTrackersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> min = const Value.absent(),
            Value<double> max = const Value.absent(),
            Value<String> icon = const Value.absent(),
            Value<String?> unit = const Value.absent(),
          }) =>
              CustomTrackersCompanion(
            id: id,
            userId: userId,
            name: name,
            type: type,
            min: min,
            max: max,
            icon: icon,
            unit: unit,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String name,
            required String type,
            required double min,
            required double max,
            required String icon,
            Value<String?> unit = const Value.absent(),
          }) =>
              CustomTrackersCompanion.insert(
            id: id,
            userId: userId,
            name: name,
            type: type,
            min: min,
            max: max,
            icon: icon,
            unit: unit,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomTrackersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomTrackersTable,
    CustomTracker,
    $$CustomTrackersTableFilterComposer,
    $$CustomTrackersTableOrderingComposer,
    $$CustomTrackersTableAnnotationComposer,
    $$CustomTrackersTableCreateCompanionBuilder,
    $$CustomTrackersTableUpdateCompanionBuilder,
    (
      CustomTracker,
      BaseReferences<_$AppDatabase, $CustomTrackersTable, CustomTracker>
    ),
    CustomTracker,
    PrefetchHooks Function()>;
typedef $$CustomTrackerEntriesTableCreateCompanionBuilder
    = CustomTrackerEntriesCompanion Function({
  Value<int> id,
  required int userId,
  required int trackerId,
  required DateTime date,
  required double value,
  Value<String?> textValue,
});
typedef $$CustomTrackerEntriesTableUpdateCompanionBuilder
    = CustomTrackerEntriesCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<int> trackerId,
  Value<DateTime> date,
  Value<double> value,
  Value<String?> textValue,
});

class $$CustomTrackerEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomTrackerEntriesTable> {
  $$CustomTrackerEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get trackerId => $composableBuilder(
      column: $table.trackerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get textValue => $composableBuilder(
      column: $table.textValue, builder: (column) => ColumnFilters(column));
}

class $$CustomTrackerEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomTrackerEntriesTable> {
  $$CustomTrackerEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get trackerId => $composableBuilder(
      column: $table.trackerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get textValue => $composableBuilder(
      column: $table.textValue, builder: (column) => ColumnOrderings(column));
}

class $$CustomTrackerEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomTrackerEntriesTable> {
  $$CustomTrackerEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get trackerId =>
      $composableBuilder(column: $table.trackerId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get textValue =>
      $composableBuilder(column: $table.textValue, builder: (column) => column);
}

class $$CustomTrackerEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomTrackerEntriesTable,
    CustomTrackerEntry,
    $$CustomTrackerEntriesTableFilterComposer,
    $$CustomTrackerEntriesTableOrderingComposer,
    $$CustomTrackerEntriesTableAnnotationComposer,
    $$CustomTrackerEntriesTableCreateCompanionBuilder,
    $$CustomTrackerEntriesTableUpdateCompanionBuilder,
    (
      CustomTrackerEntry,
      BaseReferences<_$AppDatabase, $CustomTrackerEntriesTable,
          CustomTrackerEntry>
    ),
    CustomTrackerEntry,
    PrefetchHooks Function()> {
  $$CustomTrackerEntriesTableTableManager(
      _$AppDatabase db, $CustomTrackerEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomTrackerEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomTrackerEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomTrackerEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> trackerId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<String?> textValue = const Value.absent(),
          }) =>
              CustomTrackerEntriesCompanion(
            id: id,
            userId: userId,
            trackerId: trackerId,
            date: date,
            value: value,
            textValue: textValue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required int trackerId,
            required DateTime date,
            required double value,
            Value<String?> textValue = const Value.absent(),
          }) =>
              CustomTrackerEntriesCompanion.insert(
            id: id,
            userId: userId,
            trackerId: trackerId,
            date: date,
            value: value,
            textValue: textValue,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomTrackerEntriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CustomTrackerEntriesTable,
        CustomTrackerEntry,
        $$CustomTrackerEntriesTableFilterComposer,
        $$CustomTrackerEntriesTableOrderingComposer,
        $$CustomTrackerEntriesTableAnnotationComposer,
        $$CustomTrackerEntriesTableCreateCompanionBuilder,
        $$CustomTrackerEntriesTableUpdateCompanionBuilder,
        (
          CustomTrackerEntry,
          BaseReferences<_$AppDatabase, $CustomTrackerEntriesTable,
              CustomTrackerEntry>
        ),
        CustomTrackerEntry,
        PrefetchHooks Function()>;
typedef $$SymptomEntriesTableCreateCompanionBuilder = SymptomEntriesCompanion
    Function({
  Value<int> id,
  required int userId,
  required DateTime date,
  required DateTime timestamp,
  required String type,
  required int severity,
  Value<String?> notes,
});
typedef $$SymptomEntriesTableUpdateCompanionBuilder = SymptomEntriesCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<DateTime> date,
  Value<DateTime> timestamp,
  Value<String> type,
  Value<int> severity,
  Value<String?> notes,
});

class $$SymptomEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SymptomEntriesTable> {
  $$SymptomEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$SymptomEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SymptomEntriesTable> {
  $$SymptomEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$SymptomEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SymptomEntriesTable> {
  $$SymptomEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$SymptomEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SymptomEntriesTable,
    SymptomEntry,
    $$SymptomEntriesTableFilterComposer,
    $$SymptomEntriesTableOrderingComposer,
    $$SymptomEntriesTableAnnotationComposer,
    $$SymptomEntriesTableCreateCompanionBuilder,
    $$SymptomEntriesTableUpdateCompanionBuilder,
    (
      SymptomEntry,
      BaseReferences<_$AppDatabase, $SymptomEntriesTable, SymptomEntry>
    ),
    SymptomEntry,
    PrefetchHooks Function()> {
  $$SymptomEntriesTableTableManager(
      _$AppDatabase db, $SymptomEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SymptomEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SymptomEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SymptomEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> severity = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              SymptomEntriesCompanion(
            id: id,
            userId: userId,
            date: date,
            timestamp: timestamp,
            type: type,
            severity: severity,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required DateTime date,
            required DateTime timestamp,
            required String type,
            required int severity,
            Value<String?> notes = const Value.absent(),
          }) =>
              SymptomEntriesCompanion.insert(
            id: id,
            userId: userId,
            date: date,
            timestamp: timestamp,
            type: type,
            severity: severity,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SymptomEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SymptomEntriesTable,
    SymptomEntry,
    $$SymptomEntriesTableFilterComposer,
    $$SymptomEntriesTableOrderingComposer,
    $$SymptomEntriesTableAnnotationComposer,
    $$SymptomEntriesTableCreateCompanionBuilder,
    $$SymptomEntriesTableUpdateCompanionBuilder,
    (
      SymptomEntry,
      BaseReferences<_$AppDatabase, $SymptomEntriesTable, SymptomEntry>
    ),
    SymptomEntry,
    PrefetchHooks Function()>;
typedef $$MedicationsTableCreateCompanionBuilder = MedicationsCompanion
    Function({
  Value<int> id,
  required int userId,
  required String name,
  required String dosage,
  Value<String> frequency,
  Value<int> timesPerDay,
  Value<String?> notes,
});
typedef $$MedicationsTableUpdateCompanionBuilder = MedicationsCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<String> name,
  Value<String> dosage,
  Value<String> frequency,
  Value<int> timesPerDay,
  Value<String?> notes,
});

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MedicationLogsTable, List<MedicationLog>>
      _medicationLogsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.medicationLogs,
              aliasName: $_aliasNameGenerator(
                  db.medications.id, db.medicationLogs.medicationId));

  $$MedicationLogsTableProcessedTableManager get medicationLogsRefs {
    final manager = $$MedicationLogsTableTableManager($_db, $_db.medicationLogs)
        .filter((f) => f.medicationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationLogsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dosage => $composableBuilder(
      column: $table.dosage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timesPerDay => $composableBuilder(
      column: $table.timesPerDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  Expression<bool> medicationLogsRefs(
      Expression<bool> Function($$MedicationLogsTableFilterComposer f) f) {
    final $$MedicationLogsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.medicationLogs,
        getReferencedColumn: (t) => t.medicationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationLogsTableFilterComposer(
              $db: $db,
              $table: $db.medicationLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dosage => $composableBuilder(
      column: $table.dosage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timesPerDay => $composableBuilder(
      column: $table.timesPerDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<int> get timesPerDay => $composableBuilder(
      column: $table.timesPerDay, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> medicationLogsRefs<T extends Object>(
      Expression<T> Function($$MedicationLogsTableAnnotationComposer a) f) {
    final $$MedicationLogsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.medicationLogs,
        getReferencedColumn: (t) => t.medicationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationLogsTableAnnotationComposer(
              $db: $db,
              $table: $db.medicationLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MedicationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicationsTable,
    Medication,
    $$MedicationsTableFilterComposer,
    $$MedicationsTableOrderingComposer,
    $$MedicationsTableAnnotationComposer,
    $$MedicationsTableCreateCompanionBuilder,
    $$MedicationsTableUpdateCompanionBuilder,
    (Medication, $$MedicationsTableReferences),
    Medication,
    PrefetchHooks Function({bool medicationLogsRefs})> {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> dosage = const Value.absent(),
            Value<String> frequency = const Value.absent(),
            Value<int> timesPerDay = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              MedicationsCompanion(
            id: id,
            userId: userId,
            name: name,
            dosage: dosage,
            frequency: frequency,
            timesPerDay: timesPerDay,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String name,
            required String dosage,
            Value<String> frequency = const Value.absent(),
            Value<int> timesPerDay = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              MedicationsCompanion.insert(
            id: id,
            userId: userId,
            name: name,
            dosage: dosage,
            frequency: frequency,
            timesPerDay: timesPerDay,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MedicationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({medicationLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (medicationLogsRefs) db.medicationLogs
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (medicationLogsRefs)
                    await $_getPrefetchedData<Medication, $MedicationsTable,
                            MedicationLog>(
                        currentTable: table,
                        referencedTable: $$MedicationsTableReferences
                            ._medicationLogsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MedicationsTableReferences(db, table, p0)
                                .medicationLogsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.medicationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MedicationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MedicationsTable,
    Medication,
    $$MedicationsTableFilterComposer,
    $$MedicationsTableOrderingComposer,
    $$MedicationsTableAnnotationComposer,
    $$MedicationsTableCreateCompanionBuilder,
    $$MedicationsTableUpdateCompanionBuilder,
    (Medication, $$MedicationsTableReferences),
    Medication,
    PrefetchHooks Function({bool medicationLogsRefs})>;
typedef $$MedicationLogsTableCreateCompanionBuilder = MedicationLogsCompanion
    Function({
  Value<int> id,
  required int userId,
  required int medicationId,
  required DateTime date,
  required DateTime timestamp,
  Value<bool> doseTaken,
  Value<String?> notes,
});
typedef $$MedicationLogsTableUpdateCompanionBuilder = MedicationLogsCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<int> medicationId,
  Value<DateTime> date,
  Value<DateTime> timestamp,
  Value<bool> doseTaken,
  Value<String?> notes,
});

final class $$MedicationLogsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationLogsTable, MedicationLog> {
  $$MedicationLogsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias($_aliasNameGenerator(
          db.medicationLogs.medicationId, db.medications.id));

  $$MedicationsTableProcessedTableManager get medicationId {
    final $_column = $_itemColumn<int>('medication_id')!;

    final manager = $$MedicationsTableTableManager($_db, $_db.medications)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MedicationLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationLogsTable> {
  $$MedicationLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get doseTaken => $composableBuilder(
      column: $table.doseTaken, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableFilterComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MedicationLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationLogsTable> {
  $$MedicationLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get doseTaken => $composableBuilder(
      column: $table.doseTaken, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableOrderingComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MedicationLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationLogsTable> {
  $$MedicationLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<bool> get doseTaken =>
      $composableBuilder(column: $table.doseTaken, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableAnnotationComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MedicationLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicationLogsTable,
    MedicationLog,
    $$MedicationLogsTableFilterComposer,
    $$MedicationLogsTableOrderingComposer,
    $$MedicationLogsTableAnnotationComposer,
    $$MedicationLogsTableCreateCompanionBuilder,
    $$MedicationLogsTableUpdateCompanionBuilder,
    (MedicationLog, $$MedicationLogsTableReferences),
    MedicationLog,
    PrefetchHooks Function({bool medicationId})> {
  $$MedicationLogsTableTableManager(
      _$AppDatabase db, $MedicationLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> medicationId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<bool> doseTaken = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              MedicationLogsCompanion(
            id: id,
            userId: userId,
            medicationId: medicationId,
            date: date,
            timestamp: timestamp,
            doseTaken: doseTaken,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required int medicationId,
            required DateTime date,
            required DateTime timestamp,
            Value<bool> doseTaken = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              MedicationLogsCompanion.insert(
            id: id,
            userId: userId,
            medicationId: medicationId,
            date: date,
            timestamp: timestamp,
            doseTaken: doseTaken,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MedicationLogsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({medicationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (medicationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.medicationId,
                    referencedTable:
                        $$MedicationLogsTableReferences._medicationIdTable(db),
                    referencedColumn: $$MedicationLogsTableReferences
                        ._medicationIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MedicationLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MedicationLogsTable,
    MedicationLog,
    $$MedicationLogsTableFilterComposer,
    $$MedicationLogsTableOrderingComposer,
    $$MedicationLogsTableAnnotationComposer,
    $$MedicationLogsTableCreateCompanionBuilder,
    $$MedicationLogsTableUpdateCompanionBuilder,
    (MedicationLog, $$MedicationLogsTableReferences),
    MedicationLog,
    PrefetchHooks Function({bool medicationId})>;
typedef $$BloodGlucoseEntriesTableCreateCompanionBuilder
    = BloodGlucoseEntriesCompanion Function({
  Value<int> id,
  required int userId,
  required DateTime date,
  required DateTime timestamp,
  required int valueMgDl,
  Value<String> label,
  Value<String?> notes,
});
typedef $$BloodGlucoseEntriesTableUpdateCompanionBuilder
    = BloodGlucoseEntriesCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<DateTime> date,
  Value<DateTime> timestamp,
  Value<int> valueMgDl,
  Value<String> label,
  Value<String?> notes,
});

class $$BloodGlucoseEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $BloodGlucoseEntriesTable> {
  $$BloodGlucoseEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get valueMgDl => $composableBuilder(
      column: $table.valueMgDl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$BloodGlucoseEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $BloodGlucoseEntriesTable> {
  $$BloodGlucoseEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get valueMgDl => $composableBuilder(
      column: $table.valueMgDl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$BloodGlucoseEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BloodGlucoseEntriesTable> {
  $$BloodGlucoseEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get valueMgDl =>
      $composableBuilder(column: $table.valueMgDl, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$BloodGlucoseEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BloodGlucoseEntriesTable,
    BloodGlucoseEntry,
    $$BloodGlucoseEntriesTableFilterComposer,
    $$BloodGlucoseEntriesTableOrderingComposer,
    $$BloodGlucoseEntriesTableAnnotationComposer,
    $$BloodGlucoseEntriesTableCreateCompanionBuilder,
    $$BloodGlucoseEntriesTableUpdateCompanionBuilder,
    (
      BloodGlucoseEntry,
      BaseReferences<_$AppDatabase, $BloodGlucoseEntriesTable,
          BloodGlucoseEntry>
    ),
    BloodGlucoseEntry,
    PrefetchHooks Function()> {
  $$BloodGlucoseEntriesTableTableManager(
      _$AppDatabase db, $BloodGlucoseEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BloodGlucoseEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BloodGlucoseEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BloodGlucoseEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<int> valueMgDl = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              BloodGlucoseEntriesCompanion(
            id: id,
            userId: userId,
            date: date,
            timestamp: timestamp,
            valueMgDl: valueMgDl,
            label: label,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required DateTime date,
            required DateTime timestamp,
            required int valueMgDl,
            Value<String> label = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              BloodGlucoseEntriesCompanion.insert(
            id: id,
            userId: userId,
            date: date,
            timestamp: timestamp,
            valueMgDl: valueMgDl,
            label: label,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BloodGlucoseEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BloodGlucoseEntriesTable,
    BloodGlucoseEntry,
    $$BloodGlucoseEntriesTableFilterComposer,
    $$BloodGlucoseEntriesTableOrderingComposer,
    $$BloodGlucoseEntriesTableAnnotationComposer,
    $$BloodGlucoseEntriesTableCreateCompanionBuilder,
    $$BloodGlucoseEntriesTableUpdateCompanionBuilder,
    (
      BloodGlucoseEntry,
      BaseReferences<_$AppDatabase, $BloodGlucoseEntriesTable,
          BloodGlucoseEntry>
    ),
    BloodGlucoseEntry,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ConfigEntriesTableTableManager get configEntries =>
      $$ConfigEntriesTableTableManager(_db, _db.configEntries);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$IntakesTableTableManager get intakes =>
      $$IntakesTableTableManager(_db, _db.intakes);
  $$MealsTableTableManager get meals =>
      $$MealsTableTableManager(_db, _db.meals);
  $$UserActivitiesTableTableManager get userActivities =>
      $$UserActivitiesTableTableManager(_db, _db.userActivities);
  $$TrackedDaysTableTableManager get trackedDays =>
      $$TrackedDaysTableTableManager(_db, _db.trackedDays);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$RecipeItemsTableTableManager get recipeItems =>
      $$RecipeItemsTableTableManager(_db, _db.recipeItems);
  $$WeightsTableTableManager get weights =>
      $$WeightsTableTableManager(_db, _db.weights);
  $$NotificationSettingsTableTableManager get notificationSettings =>
      $$NotificationSettingsTableTableManager(_db, _db.notificationSettings);
  $$WaterEntriesTableTableManager get waterEntries =>
      $$WaterEntriesTableTableManager(_db, _db.waterEntries);
  $$FastsTableTableManager get fasts =>
      $$FastsTableTableManager(_db, _db.fasts);
  $$AiModelMetadataEntriesTableTableManager get aiModelMetadataEntries =>
      $$AiModelMetadataEntriesTableTableManager(
          _db, _db.aiModelMetadataEntries);
  $$MealPlansTableTableManager get mealPlans =>
      $$MealPlansTableTableManager(_db, _db.mealPlans);
  $$PhotoProgressEntriesTableTableManager get photoProgressEntries =>
      $$PhotoProgressEntriesTableTableManager(_db, _db.photoProgressEntries);
  $$BodyMeasurementsTableTableManager get bodyMeasurements =>
      $$BodyMeasurementsTableTableManager(_db, _db.bodyMeasurements);
  $$DailyNotesTableTableManager get dailyNotes =>
      $$DailyNotesTableTableManager(_db, _db.dailyNotes);
  $$AutopilotEntriesTableTableManager get autopilotEntries =>
      $$AutopilotEntriesTableTableManager(_db, _db.autopilotEntries);
  $$CustomTrackersTableTableManager get customTrackers =>
      $$CustomTrackersTableTableManager(_db, _db.customTrackers);
  $$CustomTrackerEntriesTableTableManager get customTrackerEntries =>
      $$CustomTrackerEntriesTableTableManager(_db, _db.customTrackerEntries);
  $$SymptomEntriesTableTableManager get symptomEntries =>
      $$SymptomEntriesTableTableManager(_db, _db.symptomEntries);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$MedicationLogsTableTableManager get medicationLogs =>
      $$MedicationLogsTableTableManager(_db, _db.medicationLogs);
  $$BloodGlucoseEntriesTableTableManager get bloodGlucoseEntries =>
      $$BloodGlucoseEntriesTableTableManager(_db, _db.bloodGlucoseEntries);
}
