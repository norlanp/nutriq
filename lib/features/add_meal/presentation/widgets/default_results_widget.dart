import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/recent_meal_notifier.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/meal_item_card.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/shimmer_loading.dart';
import 'package:nutriq/generated/l10n.dart';

class DefaultsResultsWidget extends ConsumerStatefulWidget {
  final DateTime day;
  final AddMealType addMealType;

  const DefaultsResultsWidget({
    super.key,
    required this.day,
    required this.addMealType,
  });

  @override
  ConsumerState<DefaultsResultsWidget> createState() =>
      _DefaultsResultsWidgetState();
}

class _DefaultsResultsWidgetState
    extends ConsumerState<DefaultsResultsWidget> {
  bool _initialLoadTriggered = false;

  @override
  Widget build(BuildContext context) {
    final recentState = ref.watch(recentMealNotifierProvider);
    if (!_initialLoadTriggered) {
      _initialLoadTriggered = true;
      ref.read(recentMealNotifierProvider.notifier).loadRecentMeals("");
    }

    if (recentState.isLoading) {
      return const Flexible(child: ShimmerList());
    } else if (recentState.hasError) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(S.of(context).searchDefaultLabel),
      );
    } else if (recentState.recentMeals.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(S.of(context).searchDefaultLabel),
      );
    }
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              S.of(context).recentFoodsLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recentState.recentMeals.length,
              itemBuilder: (context, index) {
                return MealItemCard(
                  day: widget.day,
                  mealEntity: recentState.recentMeals[index],
                  addMealType: widget.addMealType,
                  usesImperialUnits: recentState.usesImperialUnits,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}