import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/features/meal_planning/presentation/meal_plan_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final Set<int> _checkedIndices = {};

  @override
  void initState() {
    super.initState();
    _generateList();
  }

  void _generateList() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    context.read<MealPlanBloc>().add(
          GenerateShoppingList(
            startDate: startOfWeek,
            endDate: endOfWeek,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).shoppingListLabel),
      ),
      body: BlocBuilder<MealPlanBloc, MealPlanState>(
        builder: (context, state) {
          if (state is MealPlanLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MealPlanError) {
            return Center(child: Text(state.message));
          }
          if (state is ShoppingListLoaded) {
            if (state.items.isEmpty) {
              return Center(
                child: Text(S.of(context).emptyShoppingListLabel),
              );
            }
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                final isChecked = _checkedIndices.contains(index);
                return CheckboxListTile(
                  value: isChecked,
                  title: Text(
                    item.name,
                    style: TextStyle(
                      decoration: isChecked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(
                    '${item.totalAmount.toStringAsFixed(1)} ${item.unit}',
                  ),
                  onChanged: (checked) {
                    setState(() {
                      if (checked == true) {
                        _checkedIndices.add(index);
                      } else {
                        _checkedIndices.remove(index);
                      }
                    });
                  },
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
