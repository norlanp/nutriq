import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/meal_planning/presentation/notifier/meal_plan_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class ShoppingListScreen extends ConsumerStatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  ConsumerState<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends ConsumerState<ShoppingListScreen> {
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
    ref.read(mealPlanNotifierProvider.notifier).generateShoppingList(startOfWeek, endOfWeek);
  }

  @override
  Widget build(BuildContext context) {
    final mealPlanState = ref.watch(mealPlanNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).shoppingListLabel),
      ),
      body: mealPlanState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : mealPlanState.hasError
              ? Center(child: Text(mealPlanState.errorMessage!))
              : mealPlanState.isShoppingListLoaded
                  ? mealPlanState.shoppingItems.isEmpty
                      ? Center(
                          child: Text(S.of(context).emptyShoppingListLabel),
                        )
                      : ListView.builder(
                          itemCount: mealPlanState.shoppingItems.length,
                          itemBuilder: (context, index) {
                            final item = mealPlanState.shoppingItems[index];
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
                        )
                  : const SizedBox.shrink(),
    );
  }
}