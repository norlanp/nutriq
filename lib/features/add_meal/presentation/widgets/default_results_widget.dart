import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/recent_meal_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/meal_item_card.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/shimmer_loading.dart';
import 'package:nutriq/generated/l10n.dart';

class DefaultsResultsWidget extends StatelessWidget {
  final DateTime day;
  final AddMealType addMealType;

  const DefaultsResultsWidget({
    super.key,
    required this.day,
    required this.addMealType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentMealBloc, RecentMealState>(
      bloc: context.read<RecentMealBloc>(),
      builder: (context, state) {
        if (state is RecentMealInitial) {
          context
              .read<RecentMealBloc>()
              .add(const LoadRecentMealEvent(searchString: ""));
          return const SizedBox();
        } else if (state is RecentMealLoadingState) {
          return const Flexible(child: ShimmerList());
        } else if (state is RecentMealLoadedState) {
          if (state.recentMeals.isEmpty) {
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
                    itemCount: state.recentMeals.length,
                    itemBuilder: (context, index) {
                      return MealItemCard(
                        day: day,
                        mealEntity: state.recentMeals[index],
                        addMealType: addMealType,
                        usesImperialUnits: state.usesImperialUnits,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is RecentMealFailedState) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(S.of(context).searchDefaultLabel),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(S.of(context).searchDefaultLabel),
        );
      },
    );
  }
}
