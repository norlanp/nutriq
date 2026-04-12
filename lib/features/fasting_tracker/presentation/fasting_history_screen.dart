import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/fasting_tracker/presentation/fasting_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class FastingHistoryScreen extends StatefulWidget {
  const FastingHistoryScreen({super.key});

  @override
  State<FastingHistoryScreen> createState() => _FastingHistoryScreenState();
}

class _FastingHistoryScreenState extends State<FastingHistoryScreen> {
  late FastingBloc _fastingBloc;

  @override
  void initState() {
    _fastingBloc = locator<FastingBloc>();
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    _fastingBloc.add(LoadHistory(startDate: startOfMonth, endDate: now));
    super.initState();
  }

  @override
  void dispose() {
    _fastingBloc.close();
    super.dispose();
  }

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
    final l10n = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.fastingHistoryLabel),
      ),
      body: BlocBuilder<FastingBloc, FastingState>(
        bloc: _fastingBloc,
        builder: (context, state) {
          if (state is FastingHistoryLoaded) {
            if (state.fasts.isEmpty) {
              return Center(
                child: Text(l10n.inactiveFastLabel),
              );
            }
            return ListView.builder(
              itemCount: state.fasts.length,
              itemBuilder: (context, index) {
                final fast = state.fasts[index];
                final duration = fast.endTime != null
                    ? fast.endTime!.difference(fast.startTime)
                    : Duration.zero;
                final completed = fast.endTime != null &&
                    duration.inMinutes >= fast.targetDurationMinutes;

                return ListTile(
                  leading: Icon(
                    completed ? Icons.check_circle : Icons.cancel_outlined,
                    color: completed ? Colors.green : Colors.red,
                  ),
                  title: Text(_presetLabel(fast.presetType, l10n)),
                  subtitle: Text(
                    '${_formatDuration(duration)} • ${fast.startTime.day}/${fast.startTime.month}/${fast.startTime.year}',
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
