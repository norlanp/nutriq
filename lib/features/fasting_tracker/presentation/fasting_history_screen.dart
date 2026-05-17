import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/features/fasting_tracker/presentation/notifier/fasting_notifier.dart';
import 'package:nutriq/features/fasting_tracker/presentation/notifier/fasting_state.dart';
import 'package:nutriq/generated/l10n.dart';

class FastingHistoryScreen extends ConsumerStatefulWidget {
  const FastingHistoryScreen({super.key});

  @override
  ConsumerState<FastingHistoryScreen> createState() => _FastingHistoryScreenState();
}

class _FastingHistoryScreenState extends ConsumerState<FastingHistoryScreen> {
  bool _initialLoadDone = false;

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  String _presetLabel(FastingPresetType type, S l10n) {
    switch (type) {
      case FastingPresetType.sixteenEight:
        return l10n.presetSixteenEight;
      case FastingPresetType.eighteenSix:
        return l10n.presetEighteenSix;
      case FastingPresetType.twentyFour:
        return l10n.presetTwentyFour;
      case FastingPresetType.omad:
        return l10n.presetOMAD;
      case FastingPresetType.custom:
        return l10n.presetCustom;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fastingState = ref.watch(fastingNotifierProvider);

    if (!_initialLoadDone) {
      _initialLoadDone = true;
      final now = DateTime.now();
      final startOfMonth = DateTime(now.year, now.month, 1);
      Future.microtask(() =>
          ref.read(fastingNotifierProvider.notifier).loadHistory(startOfMonth, now));
    }

    final l10n = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.fastingHistoryLabel),
      ),
      body: _buildBody(context, fastingState, l10n),
    );
  }

  Widget _buildBody(BuildContext context, FastingNotifierState state, S l10n) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.history.isEmpty) {
      return Center(child: Text(l10n.inactiveFastLabel));
    }

    return ListView.builder(
      itemCount: state.history.length,
      itemBuilder: (context, index) {
        final fast = state.history[index];
        final duration = fast.endTime != null
            ? fast.endTime!.difference(fast.startTime)
            : Duration.zero;
        final completed = fast.endTime != null &&
            duration.inMinutes >= fast.targetDurationMinutes;

        return ListTile(
          leading: Icon(
            completed ? Icons.check_circle : Icons.cancel_outlined,
            color: completed ? context.nutriqColors.success : Theme.of(context).colorScheme.error,
          ),
          title: Text(_presetLabel(fast.presetType, l10n)),
          subtitle: Text(
            '${_formatDuration(duration)} • ${fast.startTime.day}/${fast.startTime.month}/${fast.startTime.year}',
          ),
        );
      },
    );
  }
}