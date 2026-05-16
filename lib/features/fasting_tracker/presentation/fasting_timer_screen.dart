import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/fasting_tracker/presentation/fasting_bloc.dart';
import 'package:nutriq/features/fasting_tracker/presentation/widgets/preset_selector.dart';
import 'package:nutriq/features/fasting_tracker/presentation/widgets/streak_display.dart';
import 'package:nutriq/generated/l10n.dart';

class FastingTimerScreen extends ConsumerStatefulWidget {
  const FastingTimerScreen({super.key});

  @override
  ConsumerState<FastingTimerScreen> createState() => _FastingTimerScreenState();
}

class _FastingTimerScreenState extends ConsumerState<FastingTimerScreen> {
  late FastingBloc _fastingBloc;
  int _currentStreak = 0;

  static const Map<FastingPresetType, int> _presetDurations = {
    FastingPresetType.sixteenEight: 960,
    FastingPresetType.eighteenSix: 1080,
    FastingPresetType.twentyFour: 1200,
    FastingPresetType.omad: 1440,
    FastingPresetType.custom: 0,
  };

  @override
  void initState() {
    _fastingBloc = ref.read(fastingBlocProvider);
    _fastingBloc.add(const LoadActive());
    _fastingBloc.add(const LoadStreak());
    super.initState();
  }

  @override
  void dispose() {
    _fastingBloc.close();
    super.dispose();
  }

  void _onPresetSelected(FastingPresetType type) {
    if (type == FastingPresetType.custom) {
      _showCustomDurationDialog();
      return;
    }
    final duration = _presetDurations[type]!;
    final entity = FastingEntity(
      id: 0,
      userId: 0,
      startTime: DateTime.now(),
      targetDurationMinutes: duration,
      presetType: type,
    );
    _fastingBloc.add(StartFast(entity: entity));
  }

  void _showCustomDurationDialog() {
    final hoursController = TextEditingController(text: '16');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.of(context).startFastLabel),
        content: Row(
          children: [
            Expanded(
              child: TextField(
                controller: hoursController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: S.of(context).hoursLabel,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(S.of(context).dialogCancelLabel),
          ),
          TextButton(
            onPressed: () {
              final hours = int.tryParse(hoursController.text) ?? 16;
              Navigator.of(ctx).pop();
              final entity = FastingEntity(
                id: 0,
                userId: 0,
                startTime: DateTime.now(),
                targetDurationMinutes: hours * 60,
                presetType: FastingPresetType.custom,
              );
              _fastingBloc.add(StartFast(entity: entity));
            },
            child: Text(S.of(context).startFastLabel),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (d.inHours >= 24) {
      final days = d.inDays;
      final hrs = d.inHours.remainder(24);
      return '${days}d ${hrs.toString().padLeft(2, '0')}:$minutes:$seconds';
    }
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocProvider.value(
      value: _fastingBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.fastingTrackerLabel),
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              tooltip: l10n.fastingHistoryLabel,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(NavigationOptions.fastingHistoryRoute);
              },
            ),
          ],
        ),
        body: BlocBuilder<FastingBloc, FastingState>(
          bloc: _fastingBloc,
          builder: (context, state) {
            if (state is FastingStreakLoaded) {
              _currentStreak = state.streak;
            }
            if (state is FastingLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FastingError) {
              return Center(child: Text(state.message));
            }
            if (state is FastingActive) {
              return _buildActiveView(context, state, l10n);
            }
            return _buildInactiveView(context, l10n);
          },
        ),
      ),
    );
  }

  Widget _buildActiveView(
    BuildContext context,
    FastingActive state,
    S l10n,
  ) {
    final fast = state.fast;
    final elapsed = state.elapsed;
    final target = Duration(minutes: fast.targetDurationMinutes);
    final remaining = target - elapsed;
    final progress = fast.progressPercent;
    final isNegative = remaining.isNegative;
    final displayRemaining = isNegative ? Duration.zero : remaining;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            l10n.activeFastLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 220,
            height: 220,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                  color: Theme.of(context).colorScheme.primary,
                  strokeWidth: 12,
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatDuration(elapsed),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.elapsedTimeLabel,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.remainingTimeLabel,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '${displayRemaining.inHours}h ${displayRemaining.inMinutes.remainder(60)}m',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: () {
              _fastingBloc.add(
                EndFast(id: fast.id, endTime: DateTime.now()),
              );
            },
            icon: const Icon(Icons.stop),
            label: Text(l10n.endFastLabel),
          ),
          const SizedBox(height: 24),
          StreakDisplay(streak: _currentStreak),
        ],
      ),
    );
  }

  Widget _buildInactiveView(BuildContext context, S l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(
            Icons.timer_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.inactiveFastLabel,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 32),
          PresetSelector(
            onPresetSelected: _onPresetSelected,
          ),
          const SizedBox(height: 24),
          StreakDisplay(streak: _currentStreak),
        ],
      ),
    );
  }
}
