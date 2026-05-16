import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/activity_detail/presentation/notifier/activity_detail_notifier.dart';
import 'package:nutriq/features/activity_detail/presentation/notifier/activity_detail_state.dart';
import 'package:nutriq/features/activity_detail/presentation/widget/activity_detail_bottom_sheet.dart';
import 'package:nutriq/features/activity_detail/presentation/widget/activity_info_button.dart';
import 'package:nutriq/features/activity_detail/presentation/widget/activity_title_expanded.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class ActivityDetailScreen extends ConsumerStatefulWidget {
  final ActivityDetailScreenArguments arguments;

  const ActivityDetailScreen({super.key, required this.arguments});

  @override
  ConsumerState<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends ConsumerState<ActivityDetailScreen> {
  static const _containerSize = 250.0;

  final log = Logger('ItemDetailScreen');
  final _scrollController = ScrollController();

  late PhysicalActivityEntity activityEntity;
  late DateTime _day;
  late TextEditingController quantityTextController;

  late double totalQuantity;
  late double totalKcal;

  @override
  void initState() {
    activityEntity = widget.arguments.activityEntity;
    _day = widget.arguments.day;
    quantityTextController = TextEditingController();
    quantityTextController.text = "0";
    totalQuantity = 0;
    totalKcal = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(activityDetailNotifierProvider);
    final notifier = ref.read(activityDetailNotifierProvider.notifier);

    return Scaffold(
      body: _buildBody(context, state, notifier),
      bottomSheet: ActivityDetailBottomSheet(
        onAddButtonPressed: onAddButtonPressed,
        quantityTextController: quantityTextController,
        activityEntity: activityEntity,
        notifier: notifier,
      ),
    );
  }

  Widget _buildBody(BuildContext context, ActivityDetailState state, ActivityDetailNotifier notifier) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }
    if (state.isLoaded && state.userEntity != null) {
      quantityTextController.addListener(() {
        _onQuantityChanged(quantityTextController.text, state.userEntity!, notifier);
      });
      return getLoadedContent(state.totalKcalBurned, state.userEntity!);
    }
    return const SizedBox();
  }

  Widget getLoadedContent(double totalKcalBurned, UserEntity userEntity) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final top = constraints.biggest.height;
                final barsHeight =
                    MediaQuery.of(context).padding.top + kToolbarHeight;
                const offset = 10;
                return FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  background: ActivityTitleExpanded(activity: activityEntity),
                  title: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 300),
                    child:
                        top > barsHeight - offset && top < barsHeight + offset
                            ? Text(activityEntity.getName(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface))
                            : const SizedBox(),
                  ),
                );
              },
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Container(
                width: _containerSize,
                height: _containerSize,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer),
                child: Icon(
                  activityEntity.displayIcon,
                  size: 48,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('~${totalKcal.toInt()} ${S.of(context).kcalLabel}',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text(' / ${totalQuantity.toInt()} min')
                  ],
                ),
                const SizedBox(height: 8.0),
                const Divider(),
                const SizedBox(height: 48.0),
                const ActivityInfoButton(),
                const SizedBox(height: 200.0)
              ],
            ),
          )
        ]))
      ],
    );
  }

  void _onQuantityChanged(String quantityString, UserEntity userEntity, ActivityDetailNotifier notifier) async {
    try {
      final newQuantity = double.parse(quantityString);
      final newTotalKcal = notifier.getTotalKcalBurned(userEntity, activityEntity, newQuantity);
      setState(() {
        totalQuantity = newQuantity;
        totalKcal = newTotalKcal;
        scrollToCalorieText();
      });
    } on FormatException catch (e) {
      log.warning('Error parsing quantity "$quantityString": $e');
    }
  }

  void scrollToCalorieText() {
    _scrollController.animateTo(_containerSize,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void onAddButtonPressed(BuildContext context) {
    ref.read(activityDetailNotifierProvider.notifier).persistActivity(
        quantityTextController.text, totalKcal, activityEntity, _day);

    ref.read(homeNotifierProvider.notifier).loadItems();
    ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
    ref.read(calendarDayNotifierProvider.notifier).refreshCalendarDay();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).infoAddedActivityLabel)));
    context.go(AppRoutes.main);
  }
}

class ActivityDetailScreenArguments {
  final PhysicalActivityEntity activityEntity;
  final DateTime day;

  ActivityDetailScreenArguments(this.activityEntity, this.day);
}