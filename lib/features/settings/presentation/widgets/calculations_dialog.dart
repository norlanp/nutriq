import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:nutriq/features/settings/presentation/notifier/settings_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class CalculationsDialog extends ConsumerStatefulWidget {
  const CalculationsDialog({super.key});

  @override
  ConsumerState<CalculationsDialog> createState() => _CalculationsDialogState();
}

class _CalculationsDialogState extends ConsumerState<CalculationsDialog> {
  static const double _maxKcalAdjustment = 1000;
  static const double _minKcalAdjustment = -1000;
  static const int _kcalDivisions = 200;
  double _kcalAdjustmentSelection = 0;

  static const double _defaultCarbsPctSelection = 0.6;
  static const double _defaultFatPctSelection = 0.25;
  static const double _defaultProteinPctSelection = 0.15;

  double _carbsPctSelection = _defaultCarbsPctSelection * 100;
  double _proteinPctSelection = _defaultProteinPctSelection * 100;
  double _fatPctSelection = _defaultFatPctSelection * 100;
  TDEEMethodEntity _tdeeMethodSelection = TDEEMethodEntity.iom2005;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeKcalAdjustment();
  }

  void _initializeKcalAdjustment() async {
    final settingsNotifier = ref.read(settingsNotifierProvider.notifier);
    final kcalAdjustment = await settingsNotifier.getKcalAdjustment() * 1.0;
    final userCarbsPct = await settingsNotifier.getUserCarbGoalPct();
    final userProteinPct = await settingsNotifier.getUserProteinGoalPct();
    final userFatPct = await settingsNotifier.getUserFatGoalPct();
    final tdeeMethod = await ref.read(addConfigUsecaseProvider).getConfigTDEEMethod();

    setState(() {
      _kcalAdjustmentSelection = kcalAdjustment;
      _carbsPctSelection = (userCarbsPct ?? _defaultCarbsPctSelection) * 100;
      _proteinPctSelection =
          (userProteinPct ?? _defaultProteinPctSelection) * 100;
      _fatPctSelection = (userFatPct ?? _defaultFatPctSelection) * 100;
      _tdeeMethodSelection = tdeeMethod;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              S.of(context).settingsCalculationsLabel,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            child: Text(S.of(context).buttonResetLabel),
            onPressed: () {
              setState(() {
                _kcalAdjustmentSelection = 0;
                _carbsPctSelection = _defaultCarbsPctSelection * 100;
                _proteinPctSelection = _defaultProteinPctSelection * 100;
                _fatPctSelection = _defaultFatPctSelection * 100;
                _tdeeMethodSelection = TDEEMethodEntity.iom2005;
              });
            },
          ),
        ],
      ),
      content: Wrap(
        children: [
          DropdownButtonFormField<TDEEMethodEntity>(
              isExpanded: true,
              decoration: InputDecoration(
                filled: false,
                labelText: S.of(context).calculationsTDEELabel,
              ),
              value: _tdeeMethodSelection,
              items: TDEEMethodEntity.values.map((method) {
                return DropdownMenuItem(
                    value: method,
                    child: Text(
                      method == TDEEMethodEntity.iom2005
                          ? '${method.getName(context)} ${S.of(context).calculationsRecommendedLabel}'
                          : method.getName(context),
                      overflow: TextOverflow.ellipsis,
                    ));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _tdeeMethodSelection = value;
                  });
                }
              }),
          const SizedBox(height: 64),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).dailyKcalAdjustmentLabel} ${!_kcalAdjustmentSelection.isNegative ? "+" : ""}${_kcalAdjustmentSelection.round()} ${S.of(context).kcalLabel}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 280,
              child: Slider(
                min: _minKcalAdjustment,
                max: _maxKcalAdjustment,
                divisions: _kcalDivisions,
                value: _kcalAdjustmentSelection,
                label:
                    '${_kcalAdjustmentSelection.round()} ${S.of(context).kcalLabel}',
                onChanged: (value) {
                  setState(() {
                    _kcalAdjustmentSelection = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            S.of(context).macroDistributionLabel,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 32),
          _buildMacroSlider(
            S.of(context).carbsLabel,
            _carbsPctSelection,
            context.nutriqColors.carbsColor,
            (value) {
              setState(() {
                double delta = value - _carbsPctSelection;
                _carbsPctSelection = value;

                double proteinRatio = _proteinPctSelection /
                    (_proteinPctSelection + _fatPctSelection);
                double fatRatio = _fatPctSelection /
                    (_proteinPctSelection + _fatPctSelection);

                _proteinPctSelection -= delta * proteinRatio;
                _fatPctSelection -= delta * fatRatio;

                if (_proteinPctSelection < 5) {
                  double overflow = 5 - _proteinPctSelection;
                  _proteinPctSelection = 5;
                  _fatPctSelection -= overflow;
                }
                if (_fatPctSelection < 5) {
                  double overflow = 5 - _fatPctSelection;
                  _fatPctSelection = 5;
                  _proteinPctSelection -= overflow;
                }
              });
            },
          ),
          _buildMacroSlider(
            S.of(context).proteinLabel,
            _proteinPctSelection,
            context.nutriqColors.proteinColor,
            (value) {
              setState(() {
                double delta = value - _proteinPctSelection;
                _proteinPctSelection = value;

                double carbsRatio = _carbsPctSelection /
                    (_carbsPctSelection + _fatPctSelection);
                double fatRatio =
                    _fatPctSelection / (_carbsPctSelection + _fatPctSelection);

                _carbsPctSelection -= delta * carbsRatio;
                _fatPctSelection -= delta * fatRatio;

                if (_carbsPctSelection < 5) {
                  double overflow = 5 - _carbsPctSelection;
                  _carbsPctSelection = 5;
                  _fatPctSelection -= overflow;
                }
                if (_fatPctSelection < 5) {
                  double overflow = 5 - _fatPctSelection;
                  _fatPctSelection = 5;
                  _carbsPctSelection -= overflow;
                }
              });
            },
          ),
          _buildMacroSlider(
            S.of(context).fatLabel,
            _fatPctSelection,
            context.nutriqColors.fatColor,
            (value) {
              setState(() {
                double delta = value - _fatPctSelection;
                _fatPctSelection = value;

                double carbsRatio = _carbsPctSelection /
                    (_carbsPctSelection + _proteinPctSelection);
                double proteinRatio = _proteinPctSelection /
                    (_carbsPctSelection + _proteinPctSelection);

                _carbsPctSelection -= delta * carbsRatio;
                _proteinPctSelection -= delta * proteinRatio;

                if (_carbsPctSelection < 5) {
                  double overflow = 5 - _carbsPctSelection;
                  _carbsPctSelection = 5;
                  _proteinPctSelection -= overflow;
                }
                if (_proteinPctSelection < 5) {
                  double overflow = 5 - _proteinPctSelection;
                  _proteinPctSelection = 5;
                  _carbsPctSelection -= overflow;
                }
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).dialogCancelLabel)),
        TextButton(
            onPressed: () {
              _saveCalculationSettings();
            },
            child: Text(S.of(context).dialogOKLabel))
      ],
    );
  }

  Widget _buildMacroSlider(
    String label,
    double value,
    Color color,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text('${value.round()}%'),
          ],
        ),
        SizedBox(
          width: 280,
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: color,
              thumbColor: color,
              inactiveTrackColor: color.withValues(alpha: 0.2),
            ),
            child: Slider(
              min: 5,
              max: 90,
              value: value,
              divisions: 85,
              onChanged: (value) {
                final newValue = value.round().toDouble();
                if (100 - newValue >= 10) {
                  onChanged(newValue);
                  _normalizeMacros();
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  void _normalizeMacros() {
    setState(() {
      _carbsPctSelection = _carbsPctSelection.roundToDouble();
      _proteinPctSelection = _proteinPctSelection.roundToDouble();
      _fatPctSelection = _fatPctSelection.roundToDouble();

      double total =
          _carbsPctSelection + _proteinPctSelection + _fatPctSelection;

      if (total != 100) {
        double factor = 100 / total;

        _carbsPctSelection = (_carbsPctSelection * factor).roundToDouble();
        _proteinPctSelection = (_proteinPctSelection * factor).roundToDouble();

        _fatPctSelection = 100 - _carbsPctSelection - _proteinPctSelection;

        if (_fatPctSelection < 5) {
          _fatPctSelection = 5;
          double remaining = 95;
          double ratio =
              _carbsPctSelection / (_carbsPctSelection + _proteinPctSelection);
          _carbsPctSelection = (remaining * ratio).roundToDouble();
          _proteinPctSelection = remaining - _carbsPctSelection;
        }
      }

      assert(
          _carbsPctSelection + _proteinPctSelection + _fatPctSelection == 100,
          'Macros must total 100%');
    });
  }

  void _saveCalculationSettings() async {
    final settingsNotifier = ref.read(settingsNotifierProvider.notifier);
    await settingsNotifier
        .setKcalAdjustment(_kcalAdjustmentSelection.toInt().toDouble());
    await settingsNotifier.setMacroGoals(
        _carbsPctSelection, _proteinPctSelection, _fatPctSelection);
    await ref.read(addConfigUsecaseProvider).setConfigTDEEMethod(_tdeeMethodSelection);

    await settingsNotifier.updateTrackedDay(DateTime.now());
    ref.read(profileNotifierProvider.notifier).loadProfile();
    ref.read(homeNotifierProvider.notifier).loadItems();
    ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
    ref.read(calendarDayNotifierProvider.notifier).refreshCalendarDay();

    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}