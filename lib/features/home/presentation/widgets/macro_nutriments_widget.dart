import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/generated/l10n.dart';

class MacroNutrientsView extends StatefulWidget {
  final double totalCarbsIntake;
  final double totalFatsIntake;
  final double totalProteinsIntake;
  final double totalCarbsGoal;
  final double totalFatsGoal;
  final double totalProteinsGoal;
  final bool netCarbsEnabled;

  const MacroNutrientsView(
      {super.key,
      required this.totalCarbsIntake,
      required this.totalFatsIntake,
      required this.totalProteinsIntake,
      required this.totalCarbsGoal,
      required this.totalFatsGoal,
      required this.totalProteinsGoal,
      this.netCarbsEnabled = false});

  @override
  State<MacroNutrientsView> createState() => _MacroNutrientsViewState();
}

class _MacroNutrientsViewState extends State<MacroNutrientsView> {
  @override
  Widget build(BuildContext context) {
    final colors = context.nutriqColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _MacroRing(
          value: widget.totalCarbsIntake,
          goal: widget.totalCarbsGoal,
          label: widget.netCarbsEnabled
              ? S.of(context).netCarbsLabel
              : S.of(context).carbsLabel,
          color: colors.carbsColor,
        ),
        _MacroRing(
          value: widget.totalFatsIntake,
          goal: widget.totalFatsGoal,
          label: S.of(context).fatLabel,
          color: colors.fatColor,
        ),
        _MacroRing(
          value: widget.totalProteinsIntake,
          goal: widget.totalProteinsGoal,
          label: S.of(context).proteinLabel,
          color: colors.proteinColor,
        ),
      ],
    );
  }

  double getGoalPercentage(double goal, double supplied) {
    if (supplied <= 0 || goal <= 0) {
      return 0;
    } else if (supplied > goal) {
      return 1;
    } else {
      return supplied / goal;
    }
  }
}

class _MacroRing extends StatelessWidget {
  final double value;
  final double goal;
  final String label;
  final Color color;

  const _MacroRing({
    required this.value,
    required this.goal,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent = _getPercent(goal, value);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularPercentIndicator(
          radius: 24.0,
          lineWidth: 5.0,
          animation: true,
          animationDuration: 800,
          percent: percent,
          progressColor: color,
          backgroundColor: color.withValues(alpha: 0.15),
          circularStrokeCap: CircularStrokeCap.round,
        ),
        const SizedBox(height: 8),
        Text(
          '${value.toInt()}/${goal.toInt()} g',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  double _getPercent(double goal, double supplied) {
    if (supplied <= 0 || goal <= 0) return 0;
    if (supplied > goal) return 1;
    return supplied / goal;
  }
}
