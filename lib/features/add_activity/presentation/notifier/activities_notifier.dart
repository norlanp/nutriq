import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/add_activity/presentation/notifier/activities_state.dart';

class ActivitiesNotifier extends Notifier<ActivitiesState> {
  final _log = Logger('ActivitiesNotifier');

  @override
  ActivitiesState build() {
    return const ActivitiesState();
  }

  Future<void> loadActivities() async {
    state = state.copyWith(isLoading: true, hasError: false);
    try {
      final activities = await ref
          .read(getPhysicalActivityUsecaseProvider)
          .getAllPhysicalActivities();
      state = ActivitiesState(activities: activities);
    } catch (error) {
      _log.severe(error);
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  void searchActivities(BuildContext context, String searchString) {
    final allActivities = state.activities;
    if (searchString.isEmpty) {
      state = ActivitiesState(activities: allActivities);
      return;
    }
    final formattedQuery = searchString.toLowerCase();
    final results = allActivities.where((activity) {
      final name = activity.getName(context).toLowerCase();
      final desc = activity.getDescription(context).toLowerCase();
      return name.contains(formattedQuery) || desc.contains(formattedQuery);
    }).toList();
    state = ActivitiesState(activities: results);
  }
}

final activitiesNotifierProvider =
    NotifierProvider<ActivitiesNotifier, ActivitiesState>(
  ActivitiesNotifier.new,
);