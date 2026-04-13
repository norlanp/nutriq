import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/custom_trackers/presentation/custom_tracker_bloc.dart';
import 'package:nutriq/features/custom_trackers/presentation/widgets/scale_slider_widget.dart';
import 'package:nutriq/features/custom_trackers/presentation/widgets/boolean_toggle_widget.dart';
import 'package:nutriq/features/custom_trackers/presentation/widgets/text_input_widget.dart';
import 'package:nutriq/features/custom_trackers/presentation/widgets/tracker_trend_chart.dart';
import 'package:nutriq/generated/l10n.dart';

class CustomTrackerScreen extends StatefulWidget {
  const CustomTrackerScreen({super.key});

  @override
  State<CustomTrackerScreen> createState() => _CustomTrackerScreenState();
}

class _CustomTrackerScreenState extends State<CustomTrackerScreen> {
  late CustomTrackerBloc _bloc;

  @override
  void initState() {
    _bloc = locator<CustomTrackerBloc>();
    _bloc.add(const LoadTrackers(userId: 0));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _showCreateTrackerDialog() {
    final nameController = TextEditingController();
    final iconController = TextEditingController(text: '📊');
    final unitController = TextEditingController();
    TrackerType selectedType = TrackerType.scale;
    double minVal = 0;
    double maxVal = 10;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(S.of(context).createTracker),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: S.of(context).trackerName,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<TrackerType>(
                  value: selectedType,
                  decoration: InputDecoration(
                    labelText: S.of(context).trackerType,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: TrackerType.scale,
                      child: Text(S.of(context).scaleType),
                    ),
                    DropdownMenuItem(
                      value: TrackerType.boolean,
                      child: Text(S.of(context).booleanType),
                    ),
                    DropdownMenuItem(
                      value: TrackerType.text,
                      child: Text(S.of(context).textType),
                    ),
                  ],
                  onChanged: (v) {
                    setDialogState(() => selectedType = v!);
                  },
                ),
                if (selectedType == TrackerType.scale) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: S.of(context).minValue,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (v) => minVal = double.tryParse(v) ?? 0,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: S.of(context).maxValue,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (v) => maxVal = double.tryParse(v) ?? 10,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                TextField(
                  controller: iconController,
                  decoration: const InputDecoration(labelText: 'Icon'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: unitController,
                  decoration:
                      InputDecoration(labelText: S.of(context).unitLabel),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(S.of(context).dialogCancelLabel),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isEmpty) return;
                final entity = CustomTrackerEntity(
                  id: 0,
                  userId: 0,
                  name: nameController.text,
                  type: selectedType,
                  min: minVal,
                  max: maxVal,
                  icon: iconController.text,
                  unit:
                      unitController.text.isEmpty ? null : unitController.text,
                );
                _bloc.add(CreateTracker(entity: entity));
                Navigator.of(ctx).pop();
              },
              child: Text(S.of(context).buttonSaveLabel),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogEntryDialog(CustomTrackerEntity tracker) {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);

    if (tracker.type == TrackerType.scale) {
      double currentValue = tracker.min;
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(S.of(context).logEntry),
          content: StatefulBuilder(
            builder: (ctx, setDialogState) => ScaleSliderWidget(
              min: tracker.min,
              max: tracker.max,
              value: currentValue,
              unit: tracker.unit,
              onChanged: (v) => setDialogState(() => currentValue = v),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(S.of(context).dialogCancelLabel),
            ),
            TextButton(
              onPressed: () {
                final entry = CustomTrackerEntryEntity(
                  id: 0,
                  userId: 0,
                  trackerId: tracker.id,
                  date: date,
                  value: currentValue,
                );
                _bloc.add(LogEntry(entity: entry));
                Navigator.of(ctx).pop();
              },
              child: Text(S.of(context).buttonSaveLabel),
            ),
          ],
        ),
      );
    } else if (tracker.type == TrackerType.boolean) {
      bool currentValue = false;
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(S.of(context).logEntry),
          content: StatefulBuilder(
            builder: (ctx, setDialogState) => BooleanToggleWidget(
              value: currentValue,
              onChanged: (v) => setDialogState(() => currentValue = v),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(S.of(context).dialogCancelLabel),
            ),
            TextButton(
              onPressed: () {
                final entry = CustomTrackerEntryEntity(
                  id: 0,
                  userId: 0,
                  trackerId: tracker.id,
                  date: date,
                  value: currentValue ? 1.0 : 0.0,
                );
                _bloc.add(LogEntry(entity: entry));
                Navigator.of(ctx).pop();
              },
              child: Text(S.of(context).buttonSaveLabel),
            ),
          ],
        ),
      );
    } else {
      final controller = TextEditingController();
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(S.of(context).logEntry),
          content: TextInputWidget(
            value: null,
            onChanged: (_) {},
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(S.of(context).dialogCancelLabel),
            ),
            TextButton(
              onPressed: () {
                final entry = CustomTrackerEntryEntity(
                  id: 0,
                  userId: 0,
                  trackerId: tracker.id,
                  date: date,
                  value: 0,
                  textValue: controller.text,
                );
                _bloc.add(LogEntry(entity: entry));
                Navigator.of(ctx).pop();
              },
              child: Text(S.of(context).buttonSaveLabel),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).customTrackersLabel),
        ),
        body: BlocBuilder<CustomTrackerBloc, CustomTrackerState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is CustomTrackerLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CustomTrackerError) {
              return Center(child: Text(state.message));
            }
            if (state is CustomTrackerLoaded) {
              if (state.trackers.isEmpty) {
                return Center(
                  child: Text(S.of(context).createTracker),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.trackers.length,
                itemBuilder: (context, index) {
                  final tracker = state.trackers[index];
                  final trackerEntries = state.entries
                      .where((e) => e.trackerId == tracker.id)
                      .toList();
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => _showLogEntryDialog(tracker),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  tracker.icon,
                                  style: const TextStyle(fontSize: 24),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    tracker.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    _bloc.add(DeleteTracker(id: tracker.id));
                                  },
                                ),
                              ],
                            ),
                            if (trackerEntries.isNotEmpty)
                              TrackerTrendChart(
                                entries: trackerEntries,
                                trackerName: tracker.name,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showCreateTrackerDialog,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
