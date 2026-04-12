import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/progress_charts/data/chart_export_service.dart';
import 'package:nutriq/features/progress_charts/presentation/progress_charts_bloc.dart';
import 'package:nutriq/features/progress_charts/presentation/widgets/macro_trend_chart.dart';
import 'package:nutriq/features/progress_charts/presentation/widgets/monthly_calorie_chart.dart';
import 'package:nutriq/features/progress_charts/presentation/widgets/weekly_calorie_chart.dart';
import 'package:nutriq/features/progress_charts/presentation/widgets/weight_trend_chart.dart';
import 'package:nutriq/generated/l10n.dart';
import 'package:screenshot/screenshot.dart';

class ProgressChartsScreen extends StatefulWidget {
  const ProgressChartsScreen({super.key});

  @override
  State<ProgressChartsScreen> createState() => _ProgressChartsScreenState();
}

class _ProgressChartsScreenState extends State<ProgressChartsScreen>
    with SingleTickerProviderStateMixin {
  late ProgressChartsBloc _bloc;
  late TabController _tabController;
  late ScreenshotController _screenshotController;
  late ChartExportService _exportService;
  ViewMode _viewMode = ViewMode.weekly;
  DateTime _startDate = _startOfWeek(DateTime.now());
  bool _isExporting = false;

  static DateTime _startOfWeek(DateTime date) {
    final weekday = date.weekday;
    return DateTime(date.year, date.month, date.day - (weekday - 1));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _screenshotController = ScreenshotController();
    _exportService = ChartExportService(_screenshotController);
    _bloc = locator<ProgressChartsBloc>();
    _bloc.add(LoadWeeklyData(startDate: _startDate));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _changeDateRange(int offset) {
    setState(() {
      if (_viewMode == ViewMode.weekly) {
        _startDate = _startDate.add(Duration(days: 7 * offset));
      } else {
        var month = _startDate.month + offset;
        var year = _startDate.year;
        if (month < 1) {
          month = 12;
          year--;
        } else if (month > 12) {
          month = 1;
          year++;
        }
        _startDate = DateTime(year, month, 1);
      }
    });
    if (_viewMode == ViewMode.weekly) {
      _bloc.add(LoadWeeklyData(startDate: _startDate));
    } else {
      _bloc
          .add(LoadMonthlyData(year: _startDate.year, month: _startDate.month));
    }
  }

  void _toggleViewMode(ViewMode mode) {
    setState(() {
      _viewMode = mode;
      if (_viewMode == ViewMode.weekly) {
        _startDate = _startOfWeek(DateTime.now());
        _bloc.add(LoadWeeklyData(startDate: _startDate));
      } else {
        final now = DateTime.now();
        _startDate = DateTime(now.year, now.month, 1);
        _bloc.add(LoadMonthlyData(year: now.year, month: now.month));
      }
    });
  }

  Future<void> _exportChart() async {
    if (_isExporting) return;
    setState(() => _isExporting = true);
    try {
      await _exportService.exportAndShare();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).chartExportErrorLabel)),
      );
    } finally {
      if (mounted) setState(() => _isExporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.progressChartsLabel),
        actions: [
          BlocBuilder<ProgressChartsBloc, ProgressChartsState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is! ProgressChartsLoaded) return const SizedBox();
              return IconButton(
                onPressed: _isExporting ? null : _exportChart,
                icon: _isExporting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.share),
                tooltip: l10n.exportChartLabel,
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.caloriesTab),
            Tab(text: l10n.macrosTab),
            Tab(text: l10n.weightTab),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => _changeDateRange(-1),
                  icon: const Icon(Icons.chevron_left),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      _formatDateRange(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _changeDateRange(1),
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SegmentedButton<ViewMode>(
              segments: [
                ButtonSegment(
                  value: ViewMode.weekly,
                  label: Text(l10n.weeklyLabel),
                ),
                ButtonSegment(
                  value: ViewMode.monthly,
                  label: Text(l10n.monthlyLabel),
                ),
              ],
              selected: {_viewMode},
              onSelectionChanged: (selected) => _toggleViewMode(selected.first),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<ProgressChartsBloc, ProgressChartsState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is ProgressChartsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProgressChartsError) {
                  return Center(child: Text(state.message));
                }
                if (state is ProgressChartsLoaded) {
                  return Screenshot(
                    controller: _screenshotController,
                    child: Material(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildCaloriesTab(context, state),
                          _buildMacrosTab(context, state),
                          _buildWeightTab(context, state),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateRange() {
    if (_viewMode == ViewMode.weekly) {
      final end = _startDate.add(const Duration(days: 6));
      return '${_startDate.day}.${_startDate.month} - ${end.day}.${end.month}.${end.year}';
    } else {
      final months = [
        '',
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      return '${months[_startDate.month]} ${_startDate.year}';
    }
  }

  Widget _buildCaloriesTab(BuildContext context, ProgressChartsLoaded state) {
    if (state.viewMode == ViewMode.weekly) {
      return SingleChildScrollView(
        child: WeeklyCalorieChart(
          trackedDays: state.trackedDays,
          startOfWeek: state.startDate,
        ),
      );
    } else {
      return SingleChildScrollView(
        child: MonthlyCalorieChart(
          trackedDays: state.trackedDays,
          year: state.startDate.year,
          month: state.startDate.month,
        ),
      );
    }
  }

  Widget _buildMacrosTab(BuildContext context, ProgressChartsLoaded state) {
    if (state.viewMode == ViewMode.weekly) {
      return SingleChildScrollView(
        child: MacroTrendChart.weekly(
          trackedDays: state.trackedDays,
          startOfWeek: state.startDate,
        ),
      );
    } else {
      return SingleChildScrollView(
        child: MacroTrendChart.monthly(
          trackedDays: state.trackedDays,
          year: state.startDate.year,
          month: state.startDate.month,
        ),
      );
    }
  }

  Widget _buildWeightTab(BuildContext context, ProgressChartsLoaded state) {
    return SingleChildScrollView(
      child: ProgressWeightTrendChart(weights: state.weights),
    );
  }
}
