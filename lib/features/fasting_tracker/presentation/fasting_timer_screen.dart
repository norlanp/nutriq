import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/fasting_tracker/presentation/notifier/fasting_notifier.dart';
import 'package:nutriq/features/fasting_tracker/presentation/notifier/fasting_state.dart';
import 'package:nutriq/features/fasting_tracker/presentation/widgets/preset_selector.dart';
import 'package:nutriq/features/fasting_tracker/presentation/widgets/streak_display.dart';
import 'package:nutriq/generated/l10n.dart';

class FastingTimerScreen extends ConsumerStatefulWidget {
  const FastingTimerScreen({super.key});

  @override
  ConsumerState<FastingTimerScreen> createState() => _FastingTimerScreenState();
}

class _FastingTimerScreenState extends ConsumerState<FastingTimerScreen> {
  bool _initialLoadDone = false;

  static const Map<FastingPresetType, int> _presetDurations = {
    FastingPresetType.sixteenEight: 960,
    FastingPresetType.eighteenSix: 1080,
    FastingPresetType.twentyFour: 1200,
    FastingPresetType.omad: 1440,
    FastingPresetType.custom: 0,
  };

  @override
  Widget build(BuildContext context) {
    final fastingState = ref.watch(fastingNotifierProvider);

    if (!_initialLoadDone) {
      _initialLoadDone = true;
      Future.microtask(() {
        ref.read(fastingNotifierProvider.notifier).loadActive();
        ref.read(fastingNotifierProvider.notifier).loadStreak();
      });
    }

    final l10n = S.of(context);
    return Scaffold(
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
      body: _buildBody(context, fastingState, l10n),
    );
  }

  Widget _buildBody(BuildContext context, FastingNotifierState state, S l10n) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }
    if (state.isActive) {
      return _buildActiveView(context, state, l10n);
    }
    return _buildInactiveView(context, l10n, state);
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
    ref.read(fastingNotifierProvider.notifier).startFast(entity);
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
              ref.read(fastingNotifierProvider.notifier).startFast(entity);
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

  Widget _buildActiveView(
    BuildContext context,
    FastingNotifierState state,
    S l10n,
  ) {
    final fast = state.activeFast!;
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
              ref.read(fastingNotifierProvider.notifier).endFast(
                    fast.id,
                    DateTime.now(),
                  );
            },
            icon: const Icon(Icons.stop),
            label: Text(l10n.endFastLabel),
          ),
          const SizedBox(height: 24),
          StreakDisplay(streak: state.streak),
        ],
      ),
    );
  }

  Widget _buildInactiveView(BuildContext context, S l10n, FastingNotifierState state) {
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
          StreakDisplay(streak: state.streak),
        ],
      ),
    );
  }
}