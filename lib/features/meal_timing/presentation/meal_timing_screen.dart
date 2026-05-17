import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/features/meal_timing/presentation/notifier/meal_timing_notifier.dart';
import 'package:nutriq/features/meal_timing/presentation/notifier/meal_timing_state.dart';
import 'package:nutriq/generated/l10n.dart';

class MealTimingScreen extends ConsumerStatefulWidget {
  const MealTimingScreen({super.key});

  @override
  ConsumerState<MealTimingScreen> createState() => _MealTimingScreenState();
}

class _MealTimingScreenState extends ConsumerState<MealTimingScreen> {
  DateTime _startDate = _startOfWeek(DateTime.now());

  static DateTime _startOfWeek(DateTime date) {
    final weekday = date.weekday;
    return DateTime(date.year, date.month, date.day - (weekday - 1));
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(mealTimingNotifierProvider.notifier).loadMealTimingWeek(_startDate);
    });
  }

  void _changeWeek(int offset) {
    setState(() {
      _startDate = _startDate.add(Duration(days: 7 * offset));
    });
    ref.read(mealTimingNotifierProvider.notifier).loadMealTimingWeek(_startDate);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(mealTimingNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mealTimingLabel),
      ),
      body: _buildBody(context, l10n, state),
    );
  }

  Widget _buildBody(BuildContext context, S l10n, MealTimingState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }
    if (state.isLoaded) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeekNavigator(context),
            const SizedBox(height: 16),
            _buildAvgMealTimesCard(context, state),
            const SizedBox(height: 16),
            _buildDistributionChart(context, state),
            const SizedBox(height: 16),
            _buildIntakeList(context, state),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  Widget _buildWeekNavigator(BuildContext context) {
    final endDate = _startDate.add(const Duration(days: 6));
    return Row(
      children: [
        IconButton(
          onPressed: () => _changeWeek(-1),
          icon: const Icon(Icons.chevron_left),
        ),
        Expanded(
          child: Center(
            child: Text(
              '${_startDate.day}.${_startDate.month} - ${endDate.day}.${endDate.month}.${endDate.year}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
        IconButton(
          onPressed: () => _changeWeek(1),
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildAvgMealTimesCard(BuildContext context, MealTimingState state) {
    final l10n = S.of(context);
    if (state.avgMealTimes.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(l10n.mealTimingNoDataLabel),
        ),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.mealTimingAvgTimesLabel,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ...state.avgMealTimes.entries.map((entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(_getTypeIcon(entry.key),
                          size: 20,
                          color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(_getTypeName(context, entry.key),
                          style: Theme.of(context).textTheme.bodyLarge),
                      const Spacer(),
                      Text(entry.value.format(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildDistributionChart(BuildContext context, MealTimingState state) {
    final l10n = S.of(context);
    if (state.intakes.where((i) => i.time != null).isEmpty) {
      return const SizedBox();
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.mealTimingDistributionLabel,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: _MealTimingScatterChart(state: state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntakeList(BuildContext context, MealTimingState state) {
    final l10n = S.of(context);
    final intakesWithTime = state.intakes.where((i) => i.time != null).toList();
    if (intakesWithTime.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(l10n.mealTimingNoDataLabel),
        ),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.mealTimingEntriesLabel,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ...intakesWithTime.map((intake) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(_getTypeIcon(intake.type), size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          intake.meal.name ?? '?',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(intake.time!.format(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.7))),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  IconData _getTypeIcon(IntakeTypeEntity type) {
    switch (type) {
      case IntakeTypeEntity.breakfast:
        return Icons.bakery_dining_outlined;
      case IntakeTypeEntity.lunch:
        return Icons.lunch_dining_outlined;
      case IntakeTypeEntity.dinner:
        return Icons.dinner_dining_outlined;
      case IntakeTypeEntity.snack:
        return Icons.apple;
    }
  }

  String _getTypeName(BuildContext context, IntakeTypeEntity type) {
    switch (type) {
      case IntakeTypeEntity.breakfast:
        return S.of(context).breakfastLabel;
      case IntakeTypeEntity.lunch:
        return S.of(context).lunchLabel;
      case IntakeTypeEntity.dinner:
        return S.of(context).dinnerLabel;
      case IntakeTypeEntity.snack:
        return S.of(context).snackLabel;
    }
  }
}

class _MealTimingScatterChart extends StatelessWidget {
  final MealTimingState state;

  const _MealTimingScatterChart({required this.state});

  @override
  Widget build(BuildContext context) {
    final spots = <ScatterSpot>[];

    for (final intake in state.intakes) {
      if (intake.time != null && state.startDate != null) {
        final dayOffset = intake.dateTime.difference(state.startDate!).inDays;
        if (dayOffset >= 0 && dayOffset < 7) {
          spots.add(ScatterSpot(
            dayOffset.toDouble(),
            (intake.time!.hour + intake.time!.minute / 60),
          ));
        }
      }
    }

    return ScatterChart(
      ScatterChartData(
        scatterSpots: spots,
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 24,
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                if (value.toInt() < 7) {
                  return Text(days[value.toInt()],
                      style: Theme.of(context).textTheme.labelSmall);
                }
                return const SizedBox();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 4,
              getTitlesWidget: (value, _) {
                return Text('${value.toInt()}:00',
                    style: Theme.of(context).textTheme.labelSmall);
              },
            ),
          ),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: true),
      ),
    );
  }
}