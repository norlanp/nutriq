import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/presentation/widgets/error_dialog.dart';
import 'package:nutriq/features/add_activity/presentation/notifier/activities_notifier.dart';
import 'package:nutriq/features/add_activity/presentation/notifier/activities_state.dart';
import 'package:nutriq/features/add_activity/presentation/notifier/recent_activities_notifier.dart';
import 'package:nutriq/features/add_activity/presentation/notifier/recent_activities_state.dart';
import 'package:nutriq/features/add_activity/presentation/widgets/activity_item_card.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/no_results_widget.dart';
import 'package:nutriq/generated/l10n.dart';

class AddActivityScreen extends ConsumerStatefulWidget {
  const AddActivityScreen({super.key});

  @override
  ConsumerState<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends ConsumerState<AddActivityScreen>
    with SingleTickerProviderStateMixin {
  late DateTime _day;
  late TabController _tabController;
  bool _activitiesLoaded = false;
  bool _recentLoaded = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments
        as AddActivityScreenArguments;
    _day = args.day;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activitiesState = ref.watch(activitiesNotifierProvider);
    final recentState = ref.watch(recentActivitiesNotifierProvider);

    if (!_activitiesLoaded) {
      _activitiesLoaded = true;
      Future.microtask(() => ref.read(activitiesNotifierProvider.notifier).loadActivities());
    }
    if (!_recentLoaded) {
      _recentLoaded = true;
      Future.microtask(() => ref.read(recentActivitiesNotifierProvider.notifier).loadRecentActivities());
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).activityLabel),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: S.of(context).searchLabel,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onChanged: (String searchString) {
                  ref
                      .read(activitiesNotifierProvider.notifier)
                      .searchActivities(context, searchString);
                },
              ),
              const SizedBox(height: 16.0),
              TabBar(
                  tabs: [
                    Tab(text: S.of(context).allItemsLabel),
                    Tab(text: S.of(context).recentlyAddedLabel)
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab),
              const SizedBox(height: 16),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: [
                  _buildActivitiesTab(activitiesState),
                  _buildRecentTab(recentState),
                ],
              )),
            ],
          ),
        ));
  }

  Widget _buildActivitiesTab(ActivitiesState state) {
    if (state.isLoading) {
      return const Padding(
        padding: EdgeInsets.only(top: 32),
        child: CircularProgressIndicator(),
      );
    }
    if (state.hasError) {
      return ErrorDialog(
        errorText: S.of(context).errorLoadingActivities,
        onRefreshPressed: () =>
            ref.read(activitiesNotifierProvider.notifier).loadActivities(),
      );
    }
    return Flexible(
      child: ListView.builder(
          itemCount: state.activities.length,
          itemBuilder: (context, index) {
            return ActivityItemCard(
                physicalActivityEntity: state.activities[index], day: _day);
          }),
    );
  }

  Widget _buildRecentTab(RecentActivitiesState state) {
    if (state.isLoading) {
      return const Padding(
        padding: EdgeInsets.only(top: 32),
        child: CircularProgressIndicator(),
      );
    }
    if (state.hasError) {
      return ErrorDialog(
        errorText: S.of(context).errorLoadingActivities,
        onRefreshPressed: () =>
            ref.read(recentActivitiesNotifierProvider.notifier).loadRecentActivities(),
      );
    }
    if (state.recentActivities.isEmpty) {
      return const NoResultsWidget();
    }
    return Flexible(
      child: ListView.builder(
          itemCount: state.recentActivities.length,
          itemBuilder: (context, index) {
            return ActivityItemCard(
              physicalActivityEntity: state.recentActivities[index],
              day: _day,
            );
          }),
    );
  }
}

class AddActivityScreenArguments {
  final DateTime day;

  AddActivityScreenArguments({required this.day});
}