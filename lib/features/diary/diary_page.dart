import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_state.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/diary/presentation/widgets/diary_table_calendar.dart';
import 'package:nutriq/features/diary/presentation/widgets/day_info_widget.dart';
import 'package:nutriq/features/meal_detail/presentation/bloc/meal_detail_bloc.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/generated/l10n.dart';

class DiaryPage extends ConsumerStatefulWidget {
  const DiaryPage({super.key});

  @override
  ConsumerState<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends ConsumerState<DiaryPage>
    with WidgetsBindingObserver {
  final log = Logger('DiaryPage');

  late MealDetailBloc _mealDetailBloc;

  static const _calendarDurationDays = Duration(days: 356);
  final _currentDate = DateTime.now();
  var _selectedDate = DateTime.now();
  var _focusedDate = DateTime.now();
  bool _diaryInitialized = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _mealDetailBloc = ref.read(mealDetailBlocProvider);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diaryAsync = ref.watch(diaryNotifierProvider);
    final calendarDayAsync = ref.watch(calendarDayNotifierProvider);

    if (!_diaryInitialized) {
      _diaryInitialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
      });
    }

    return diaryAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox(),
      data: (diaryState) {
        return _getLoadedContent(
          context,
          diaryState.trackedDayMap,
          diaryState.usesImperialUnits,
          calendarDayAsync,
        );
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      log.info('App resumed');
      _refreshPageOnDayChange();
    }
    super.didChangeAppLifecycleState(state);
  }

  Widget _getLoadedContent(
    BuildContext context,
    Map<String, TrackedDayEntity> trackedDaysMap,
    bool usesImperialUnits,
    AsyncValue<CalendarDayState> calendarDayAsync,
  ) {
    return ListView(
      children: [
        DiaryTableCalendar(
          trackedDaysMap: trackedDaysMap,
          onDateSelected: _onDateSelected,
          calendarDurationDays: _calendarDurationDays,
          currentDate: _currentDate,
          selectedDate: _selectedDate,
          focusedDate: _focusedDate,
        ),
        const SizedBox(height: 16.0),
        calendarDayAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const SizedBox(),
          data: (CalendarDayState calendarDayState) {
            if (calendarDayState.currentDay == null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref
                    .read(calendarDayNotifierProvider.notifier)
                    .loadCalendarDay(_selectedDate);
              });
              return const Center(child: CircularProgressIndicator());
            }
            return DayInfoWidget(
              trackedDayEntity: calendarDayState.trackedDayEntity,
              selectedDay: _selectedDate,
              userActivities: calendarDayState.userActivityList,
              breakfastIntake: calendarDayState.breakfastIntakeList,
              lunchIntake: calendarDayState.lunchIntakeList,
              dinnerIntake: calendarDayState.dinnerIntakeList,
              snackIntake: calendarDayState.snackIntakeList,
              burnedCalories: calendarDayState.burnedCalories,
              netCalories: calendarDayState.netCalories,
              onDeleteIntake: _onDeleteIntakeItem,
              onDeleteActivity: _onDeleteActivityItem,
              onCopyIntake: _onCopyIntakeItem,
              onCopyActivity: _onCopyActivityItem,
              usesImperialUnits: usesImperialUnits,
            );
          },
        )
      ],
    );
  }

  void _onDeleteIntakeItem(
      IntakeEntity intakeEntity, TrackedDayEntity? trackedDayEntity) async {
    await ref
        .read(calendarDayNotifierProvider.notifier)
        .deleteIntakeItem(intakeEntity, trackedDayEntity?.day ?? DateTime.now());
    await ref
        .read(calendarDayNotifierProvider.notifier)
        .updateDiaryPage(_selectedDate);
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(S.of(context).itemDeletedSnackbar)));
    }
  }

  void _onDeleteActivityItem(UserActivityEntity userActivityEntity,
      TrackedDayEntity? trackedDayEntity) async {
    await ref
        .read(calendarDayNotifierProvider.notifier)
        .deleteUserActivityItem(
            userActivityEntity, trackedDayEntity?.day ?? DateTime.now());
    await ref
        .read(calendarDayNotifierProvider.notifier)
        .updateDiaryPage(_selectedDate);
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(S.of(context).itemDeletedSnackbar)));
    }
  }

  void _onCopyIntakeItem(IntakeEntity intakeEntity,
      TrackedDayEntity? trackedDayEntity, AddMealType? type) async {
    IntakeTypeEntity finalType;
    if (type == null) {
      finalType = intakeEntity.type;
    } else {
      finalType = type.getIntakeType();
    }
    _mealDetailBloc.addIntake(
        context,
        intakeEntity.unit,
        intakeEntity.amount.toString(),
        finalType,
        intakeEntity.meal,
        DateTime.now());
    ref.read(diaryNotifierProvider.notifier).updateHomePage();
  }

  void _onCopyActivityItem(UserActivityEntity userActivityEntity,
      TrackedDayEntity? trackedDayEntity) async {
    log.info("Should copy activity");
  }

  void _onDateSelected(
      DateTime newDate, Map<String, TrackedDayEntity> trackedDaysMap) {
    setState(() {
      _selectedDate = newDate;
      _focusedDate = newDate;
      ref
          .read(calendarDayNotifierProvider.notifier)
          .loadCalendarDay(newDate);
    });
  }

  void _refreshPageOnDayChange() {
    if (DateUtils.isSameDay(_selectedDate, DateTime.now())) {
      ref.read(calendarDayNotifierProvider.notifier).loadCalendarDay(_selectedDate);
      ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
    }
  }
}