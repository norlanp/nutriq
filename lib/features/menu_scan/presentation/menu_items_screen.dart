import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/menu_scan/domain/entity/scanned_menu_item.dart';
import 'package:nutriq/features/menu_scan/presentation/menu_scan_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class MenuItemsScreen extends ConsumerWidget {
  final List<ScannedMenuItem> items;

  const MenuItemsScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = S.of(context);
    final bloc = ref.read(menuScanBlocProvider);
    final selectedCount = items.where((i) => i.isSelected).length;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.menuScanResultsTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                l10n.menuScanItemCount(items.length),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _MenuItemCard(
                item: item,
                onTap: () {
                  if (item.isSelected) {
                    bloc.add(DeselectItem(item: item));
                  } else {
                    bloc.add(SelectItem(item: item));
                  }
                },
              );
            },
          ),
        ),
        if (selectedCount > 0)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilledButton.icon(
                onPressed: () => bloc.add(const AddSelected()),
                icon: const Icon(Icons.add_shopping_cart),
                label: Text(l10n.menuScanAddSelected(selectedCount)),
              ),
            ),
          ),
      ],
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  final ScannedMenuItem item;
  final VoidCallback onTap;

  const _MenuItemCard({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: item.isSelected
            ? BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (item.menuPrice != null) ...[
                    Text(
                      '\$${item.menuPrice!.toStringAsFixed(2)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  Checkbox(
                    value: item.isSelected,
                    onChanged: (_) => onTap(),
                  ),
                ],
              ),
              if (item.foodGrade != null) ...[
                const SizedBox(height: 4),
                _buildGradeBadge(context, item.foodGrade!),
              ],
              if (item.hasNutritionInfo) ...[
                const SizedBox(height: 8),
                _buildNutritionRow(context, l10n),
              ] else ...[
                const SizedBox(height: 4),
                Text(
                  l10n.menuScanNoNutritionInfo,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradeBadge(BuildContext context, FoodGrade grade) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Color.fromRGBO(
          (grade.color.r * 255).round(),
          (grade.color.g * 255).round(),
          (grade.color.b * 255).round(),
          0.2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        grade.label,
        style: TextStyle(
          color: grade.color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildNutritionRow(BuildContext context, S l10n) {
    final theme = Theme.of(context);
    final calories = item.calories;
    final protein = item.protein;
    final carbs = item.carbs;
    final fat = item.fat;

    return Wrap(
      spacing: 12,
      runSpacing: 4,
      children: [
        if (calories != null)
          _buildNutrientChip(
            context,
            label: l10n.menuScanCalories,
            value: '${calories.toStringAsFixed(0)} kcal',
            color: theme.colorScheme.primary,
          ),
        if (protein != null)
          _buildNutrientChip(
            context,
            label: l10n.menuScanProtein,
            value: '${protein.toStringAsFixed(1)}g',
            color: Colors.blue,
          ),
        if (carbs != null)
          _buildNutrientChip(
            context,
            label: l10n.menuScanCarbs,
            value: '${carbs.toStringAsFixed(1)}g',
            color: Colors.orange,
          ),
        if (fat != null)
          _buildNutrientChip(
            context,
            label: l10n.menuScanFat,
            value: '${fat.toStringAsFixed(1)}g',
            color: Colors.yellow.shade800,
          ),
      ],
    );
  }

  Widget _buildNutrientChip(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Color.fromRGBO(
          (color.r * 255).round(),
          (color.g * 255).round(),
          (color.b * 255).round(),
          0.1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
