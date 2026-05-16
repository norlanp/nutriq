import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/add_activity/presentation/notifier/recent_activities_state.dart';

class RecentActivitiesNotifier extends Notifier<RecentActivitiesState> {
  final _log = Logger('RecentActivitiesNotifier');

  @override
  RecentActivitiesState build() {
    return const RecentActivitiesState();
  }

  Future<void> loadRecentActivities() async {
    state = state.copyWith(isLoading: true, hasError: false);
    try {
      final userActivities = await ref
          .read(getUserActivityUsecaseProvider)
          .getRecentUserActivity();
      final recentActivities = userActivities
          .map((activity) => activity.physicalActivityEntity)
          .toList();
      state = RecentActivitiesState(recentActivities: recentActivities);
    } catch (error) {
      _log.severe(error);
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }
}

final recentActivitiesNotifierProvider =
    NotifierProvider<RecentActivitiesNotifier, RecentActivitiesState>(
  RecentActivitiesNotifier.new,
);