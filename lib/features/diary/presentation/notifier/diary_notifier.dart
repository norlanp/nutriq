import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/utils/extensions.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_state.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';

class DiaryNotifier extends AsyncNotifier<DiaryState> {
  @override
  Future<DiaryState> build() async {
    return _loadDiaryYear();
  }

  Future<DiaryState> _loadDiaryYear() async {
    final usesImperialUnits =
        (await ref.read(getConfigUsecaseProvider).getConfig()).usesImperialUnits;

    final currentDay = DateTime.now();
    const yearDuration = Duration(days: 356);

    final trackedDays = await ref
        .read(getTrackedDayUsecaseProvider)
        .getTrackedDaysByRange(
            currentDay.subtract(yearDuration), currentDay.add(yearDuration));

    final trackedDaysMap = {
      for (var trackedDay in trackedDays)
        trackedDay.day.toParsedDay(): trackedDay
    };

    return DiaryState(
      trackedDayMap: trackedDaysMap,
      usesImperialUnits: usesImperialUnits,
    );
  }

  Future<void> loadDiaryYear() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadDiaryYear());
  }

  void updateHomePage() {
    ref.read(homeNotifierProvider.notifier).loadItems();
  }
}

final diaryNotifierProvider =
    AsyncNotifierProvider<DiaryNotifier, DiaryState>(DiaryNotifier.new);