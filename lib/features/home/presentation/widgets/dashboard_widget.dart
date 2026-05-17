import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/features/home/presentation/widgets/macro_nutriments_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:nutriq/generated/l10n.dart';

class DashboardWidget extends StatefulWidget {
  final double totalKcalDaily;
  final double totalKcalLeft;
  final double totalKcalSupplied;
  final double totalKcalBurned;
  final double totalCarbsIntake;
  final double totalFatsIntake;
  final double totalProteinsIntake;
  final double totalCarbsGoal;
  final double totalFatsGoal;
  final double totalProteinsGoal;
  final bool netCarbsEnabled;
  final double totalNetCarbsIntake;
  final double stepBonusCredit;

  const DashboardWidget(
      {super.key,
      required this.totalKcalSupplied,
      required this.totalKcalBurned,
      required this.totalKcalDaily,
      required this.totalKcalLeft,
      required this.totalCarbsIntake,
      required this.totalFatsIntake,
      required this.totalProteinsIntake,
      required this.totalCarbsGoal,
      required this.totalFatsGoal,
      required this.totalProteinsGoal,
      required this.netCarbsEnabled,
      required this.totalNetCarbsIntake,
      this.stepBonusCredit = 0});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.nutriqColors;
    double kcalLeftLabel = 0;
    double gaugeValue = 0;
    if (widget.totalKcalLeft > widget.totalKcalDaily) {
      kcalLeftLabel = widget.totalKcalDaily;
      gaugeValue = 0;
    } else if (widget.totalKcalLeft < 0) {
      kcalLeftLabel = 0;
      gaugeValue = 1;
    } else {
      kcalLeftLabel = widget.totalKcalLeft;
      gaugeValue = (widget.totalKcalDaily - widget.totalKcalLeft) /
          widget.totalKcalDaily;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        color: theme.colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _StatPill(
                    icon: Icons.arrow_upward_rounded,
                    value: '${widget.totalKcalSupplied.toInt()}',
                    label: S.of(context).suppliedLabel,
                    accentColor: colors.proteinColor,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 100.0,
                      lineWidth: 14.0,
                      animation: true,
                      animationDuration: 1200,
                      percent: gaugeValue,
                      arcType: ArcType.FULL,
                      progressColor: theme.colorScheme.primary,
                      arcBackgroundColor:
                          theme.colorScheme.primary.withAlpha(40),
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedFlipCounter(
                            duration: const Duration(milliseconds: 1000),
                            value: kcalLeftLabel.toInt(),
                            textStyle: theme.textTheme.displayLarge?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w900,
                              fontSize: 56,
                              letterSpacing: -2,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            S.of(context).kcalLeftLabel,
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  _StatPill(
                    icon: Icons.arrow_downward_rounded,
                    value: '${widget.totalKcalBurned.toInt()}',
                    label: S.of(context).burnedLabel,
                    accentColor: colors.warning,
                  ),
                ],
              ),
              if (widget.stepBonusCredit > 0) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.directions_walk,
                          size: 18, color: theme.colorScheme.primary),
                      const SizedBox(width: 6),
                      Text(
                        '${S.of(context).stepBonusCreditLabel}: +${widget.stepBonusCredit.round()} kcal',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 24),
              MacroNutrientsView(
                  totalCarbsIntake: widget.netCarbsEnabled
                      ? widget.totalNetCarbsIntake
                      : widget.totalCarbsIntake,
                  totalFatsIntake: widget.totalFatsIntake,
                  totalProteinsIntake: widget.totalProteinsIntake,
                  totalCarbsGoal: widget.totalCarbsGoal,
                  totalFatsGoal: widget.totalFatsGoal,
                  totalProteinsGoal: widget.totalProteinsGoal,
                  netCarbsEnabled: widget.netCarbsEnabled),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color accentColor;

  const _StatPill({
    required this.icon,
    required this.value,
    required this.label,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: accentColor),
          const SizedBox(height: 2),
          Text(value,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              )),
          Text(label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              )),
        ],
      ),
    );
  }
}
