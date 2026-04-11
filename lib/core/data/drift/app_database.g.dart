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
        userFatGoalPct
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
      this.userFatGoalPct});
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
          Value<double?> userFatGoalPct = const Value.absent()}) =>
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
          ..write('userFatGoalPct: $userFatGoalPct')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      hasAcceptedDisclaimer,
      hasAcceptedPolicy,
      hasAcceptedSendAnonymousData,
      selectedAppTheme,
      usesImperialUnits,
      userKcalAdjustment,
      userCarbGoalPct,
      userProteinGoalPct,
      userFatGoalPct);
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
          other.userFatGoalPct == this.userFatGoalPct);
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
      Value<double?>? userFatGoalPct}) {
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
          ..write('userFatGoalPct: $userFatGoalPct')
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
  @override
  List<GeneratedColumn> get $columns => [id, unit, amount, type, mealId, date];
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
  const Intake(
      {required this.id,
      required this.unit,
      required this.amount,
      required this.type,
      required this.mealId,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['unit'] = Variable<String>(unit);
    map['amount'] = Variable<double>(amount);
    map['type'] = Variable<String>(type);
    map['meal_id'] = Variable<String>(mealId);
    map['date'] = Variable<DateTime>(date);
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
    };
  }

  Intake copyWith(
          {String? id,
          String? unit,
          double? amount,
          String? type,
          String? mealId,
          DateTime? date}) =>
      Intake(
        id: id ?? this.id,
        unit: unit ?? this.unit,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        mealId: mealId ?? this.mealId,
        date: date ?? this.date,
      );
  Intake copyWithCompanion(IntakesCompanion data) {
    return Intake(
      id: data.id.present ? data.id.value : this.id,
      unit: data.unit.present ? data.unit.value : this.unit,
      amount: data.amount.present ? data.amount.value : this.amount,
      type: data.type.present ? data.type.value : this.type,
      mealId: data.mealId.present ? data.mealId.value : this.mealId,
      date: data.date.present ? data.date.value : this.date,
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
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, unit, amount, type, mealId, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Intake &&
          other.id == this.id &&
          other.unit == this.unit &&
          other.amount == this.amount &&
          other.type == this.type &&
          other.mealId == this.mealId &&
          other.date == this.date);
}

class IntakesCompanion extends UpdateCompanion<Intake> {
  final Value<String> id;
  final Value<String> unit;
  final Value<double> amount;
  final Value<String> type;
  final Value<String> mealId;
  final Value<DateTime> date;
  final Value<int> rowid;
  const IntakesCompanion({
    this.id = const Value.absent(),
    this.unit = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.mealId = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IntakesCompanion.insert({
    required String id,
    required String unit,
    required double amount,
    required String type,
    required String mealId,
    required DateTime date,
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
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unit != null) 'unit': unit,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (mealId != null) 'meal_id': mealId,
      if (date != null) 'date': date,
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
      Value<int>? rowid}) {
    return IntakesCompanion(
      id: id ?? this.id,
      unit: unit ?? this.unit,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      mealId: mealId ?? this.mealId,
      date: date ?? this.date,
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
        fiber100
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
      this.fiber100});
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
          Value<double?> fiber100 = const Value.absent()}) =>
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
          ..write('fiber100: $fiber100')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      fiber100);
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
          other.fiber100 == this.fiber100);
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ConfigEntriesTable configEntries = $ConfigEntriesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $IntakesTable intakes = $IntakesTable(this);
  late final $MealsTable meals = $MealsTable(this);
  late final $UserActivitiesTable userActivities = $UserActivitiesTable(this);
  late final $TrackedDaysTable trackedDays = $TrackedDaysTable(this);
  late final ConfigDao configDao = ConfigDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final IntakeDao intakeDao = IntakeDao(this as AppDatabase);
  late final MealDao mealDao = MealDao(this as AppDatabase);
  late final UserActivityDao userActivityDao =
      UserActivityDao(this as AppDatabase);
  late final TrackedDayDao trackedDayDao = TrackedDayDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [configEntries, users, intakes, meals, userActivities, trackedDays];
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
  Value<int> rowid,
});
typedef $$IntakesTableUpdateCompanionBuilder = IntakesCompanion Function({
  Value<String> id,
  Value<String> unit,
  Value<double> amount,
  Value<String> type,
  Value<String> mealId,
  Value<DateTime> date,
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
            Value<int> rowid = const Value.absent(),
          }) =>
              IntakesCompanion(
            id: id,
            unit: unit,
            amount: amount,
            type: type,
            mealId: mealId,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String unit,
            required double amount,
            required String type,
            required String mealId,
            required DateTime date,
            Value<int> rowid = const Value.absent(),
          }) =>
              IntakesCompanion.insert(
            id: id,
            unit: unit,
            amount: amount,
            type: type,
            mealId: mealId,
            date: date,
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
}
