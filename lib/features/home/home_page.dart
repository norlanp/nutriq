import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/presentation/widgets/activity_vertial_list.dart';
import 'package:nutriq/core/presentation/widgets/delete_dialog.dart';
import 'package:nutriq/core/presentation/widgets/disclaimer_dialog.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/core/styles/nutriq_spacing.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/core/presentation/widgets/edit_dialog.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/features/home/presentation/notifier/home_state.dart';
import 'package:nutriq/features/home/presentation/widgets/dashboard_widget.dart';
import 'package:nutriq/features/home/presentation/widgets/intake_vertical_list.dart';
import 'package:nutriq/features/home/presentation/widgets/medication_summary_widget.dart';
import 'package:nutriq/features/water_tracking/presentation/widgets/water_tracker_summary_widget.dart';
import 'package:nutriq/generated/l10n.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with WidgetsBindingObserver {
  final log = Logger('HomePage');
  bool _isDragging = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeAsync = ref.watch(homeNotifierProvider);

    return homeAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(child: CircularProgressIndicator()),
      data: (state) => _buildLoadedContent(context, state),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      log.info('App resumed');
      ref.read(homeNotifierProvider.notifier).loadItems();
    }
    super.didChangeAppLifecycleState(state);
  }

  Widget _buildLoadedContent(BuildContext context, HomeState state) {
    if (state.showDisclaimerDialog) {
      _showDisclaimerDialog(context);
    }
    final sp = context.spacing;
    return Stack(children: [
      ListView(children: [
        DashboardWidget(
          totalKcalDaily: state.totalKcalDaily,
          totalKcalLeft: state.totalKcalLeft,
          totalKcalSupplied: state.totalKcalSupplied,
          totalKcalBurned: state.totalKcalBurned,
          totalCarbsIntake: state.totalCarbsIntake,
          totalNetCarbsIntake: state.totalNetCarbsIntake,
          totalFatsIntake: state.totalFatsIntake,
          totalProteinsIntake: state.totalProteinsIntake,
          totalCarbsGoal: state.totalCarbsGoal,
          totalFatsGoal: state.totalFatsGoal,
          totalProteinsGoal: state.totalProteinsGoal,
          netCarbsEnabled: state.netCarbsEnabled,
          stepBonusCredit: state.stepBonusCredit,
        ),
        SizedBox(height: sp.md),
        const WaterTrackerSummaryWidget(),
        SizedBox(height: sp.md),
        const MedicationSummaryWidget(),
        SizedBox(height: sp.section),
        ActivityVerticalList(
          day: DateTime.now(),
          title: S.of(context).activityLabel,
          userActivityList: state.userActivityList,
          onItemLongPressedCallback: onActivityItemLongPressed,
        ),
        IntakeVerticalList(
          day: DateTime.now(),
          title: S.of(context).breakfastLabel,
          listIcon: IntakeTypeEntity.breakfast.getIconData(),
          addMealType: AddMealType.breakfastType,
          intakeList: state.breakfastIntakeList,
          onDeleteIntakeCallback: onDeleteIntake,
          onItemDragCallback: onIntakeItemDrag,
          onItemTappedCallback: onIntakeItemTapped,
          usesImperialUnits: state.usesImperialUnits,
        ),
        IntakeVerticalList(
          day: DateTime.now(),
          title: S.of(context).lunchLabel,
          listIcon: IntakeTypeEntity.lunch.getIconData(),
          addMealType: AddMealType.lunchType,
          intakeList: state.lunchIntakeList,
          onDeleteIntakeCallback: onDeleteIntake,
          onItemDragCallback: onIntakeItemDrag,
          onItemTappedCallback: onIntakeItemTapped,
          usesImperialUnits: state.usesImperialUnits,
        ),
        IntakeVerticalList(
          day: DateTime.now(),
          title: S.of(context).dinnerLabel,
          addMealType: AddMealType.dinnerType,
          listIcon: IntakeTypeEntity.dinner.getIconData(),
          intakeList: state.dinnerIntakeList,
          onDeleteIntakeCallback: onDeleteIntake,
          onItemDragCallback: onIntakeItemDrag,
          onItemTappedCallback: onIntakeItemTapped,
          usesImperialUnits: state.usesImperialUnits,
        ),
        IntakeVerticalList(
          day: DateTime.now(),
          title: S.of(context).snackLabel,
          listIcon: IntakeTypeEntity.snack.getIconData(),
          addMealType: AddMealType.snackType,
          intakeList: state.snackIntakeList,
          onDeleteIntakeCallback: onDeleteIntake,
          onItemDragCallback: onIntakeItemDrag,
          onItemTappedCallback: onIntakeItemTapped,
          usesImperialUnits: state.usesImperialUnits,
        ),
        SizedBox(height: sp.section)
      ]),
      Align(
          alignment: Alignment.bottomCenter,
          child: Visibility(
              visible: _isDragging,
              child: Container(
                height: 70,
                color: Theme.of(context).colorScheme.error
                  ..withValues(alpha: 0.3),
                  child: DragTarget<IntakeEntity>(
                   onAcceptWithDetails: (data) {
                     _confirmDelete(context, data.data);
                   },
                   onLeave: (data) {
                     setState(() {
                       _isDragging = false;
                     });
                   },
                   builder: (context, candidateData, rejectedData) {
                     return Center(
                       child: Semantics(
                         label: S.of(context).deleteItemLabel,
                         child: Icon(
                           Icons.delete_outline,
                           size: 36,
                           color: context.nutriqColors.onOverlay,
                         ),
                       ),
                     );
                   },
                 ),
              )))
    ]);
  }

  void onActivityItemLongPressed(
      BuildContext context, UserActivityEntity activityEntity) async {
    final deleteIntake = await showDialog<bool>(
        context: context, builder: (context) => const DeleteDialog());

    if (deleteIntake != null) {
      ref.read(homeNotifierProvider.notifier).deleteUserActivityItem(activityEntity);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).itemDeletedSnackbar)));
      }
    }
  }

  void onIntakeItemLongPressed(
      BuildContext context, IntakeEntity intakeEntity) async {
    final deleteIntake = await showDialog<bool>(
        context: context, builder: (context) => const DeleteDialog());

    if (deleteIntake != null) {
      ref.read(homeNotifierProvider.notifier).deleteIntakeItem(intakeEntity);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).itemDeletedSnackbar)));
      }
    }
  }

  void onIntakeItemDrag(bool isDragging) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isDragging = isDragging;
      });
    });
  }

  void onIntakeItemTapped(BuildContext context, IntakeEntity intakeEntity,
      bool usesImperialUnits) async {
    final changeIntakeAmount = await showDialog<double>(
        context: context,
        builder: (context) => EditDialog(
            intakeEntity: intakeEntity, usesImperialUnits: usesImperialUnits));
    if (changeIntakeAmount != null) {
      ref
          .read(homeNotifierProvider.notifier)
          .updateIntakeItem(intakeEntity.id, {'amount': changeIntakeAmount});
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).itemUpdatedSnackbar)));
      }
    }
  }

  void onDeleteIntake(IntakeEntity intake, TrackedDayEntity? trackedDayEntity) {
    ref.read(homeNotifierProvider.notifier).deleteIntakeItem(intake);
  }

  void _confirmDelete(BuildContext context, IntakeEntity intake) async {
    bool? delete = await showDialog<bool>(
        context: context, builder: (context) => const DeleteDialog());

    if (delete == true) {
      onDeleteIntake(intake, null);
    }
    setState(() {
      _isDragging = false;
    });
  }

  void _showDisclaimerDialog(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dialogConfirmed = await showDialog<bool>(
          context: context,
          builder: (context) {
            return const DisclaimerDialog();
          });
      if (dialogConfirmed != null) {
        ref.read(homeNotifierProvider.notifier).saveConfigData(dialogConfirmed);
        ref.read(homeNotifierProvider.notifier).loadItems();
      }
    });
  }
}