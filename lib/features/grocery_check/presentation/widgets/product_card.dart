import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/service/grocery_check_service.dart';
import 'package:nutriq/core/presentation/widgets/food_grade_badge.dart';
import 'package:nutriq/generated/l10n.dart';

class ProductCard extends StatefulWidget {
  final GroceryCheckItem item;
  final int index;
  final VoidCallback onRemove;

  const ProductCard({
    super.key,
    required this.item,
    required this.index,
    required this.onRemove,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final product = widget.item.product;
    final grade = widget.item.grade;
    final n = product.nutriments;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        children: [
          ListTile(
            leading: FoodGradeBadge(grade: grade),
            title: Text(
              product.name ?? s.notAvailableLabel,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              product.brands ?? '',
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (n.energyKcal100 != null)
                  Text(
                    '${n.energyKcal100?.toStringAsFixed(0) ?? '-'} ${s.kcalLabel}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: widget.onRemove,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _NutrientChip(
                  label: s.proteinLabel,
                  value: n.proteins100,
                  unit: 'g',
                ),
                const SizedBox(width: 8),
                _NutrientChip(
                  label: s.carbohydrateLabel,
                  value: n.carbohydrates100,
                  unit: 'g',
                ),
                const SizedBox(width: 8),
                _NutrientChip(
                  label: s.fatLabel,
                  value: n.fat100,
                  unit: 'g',
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _expanded ? s.hideNutritionLabel : s.showNutritionLabel,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  _NutrientRow(
                      label: s.caloriesLabel,
                      value: n.energyKcal100,
                      unit: s.kcalLabel),
                  _NutrientRow(
                      label: s.proteinLabel, value: n.proteins100, unit: 'g'),
                  _NutrientRow(
                      label: s.carbohydrateLabel,
                      value: n.carbohydrates100,
                      unit: 'g'),
                  _NutrientRow(
                      label: s.sugarLabel, value: n.sugars100, unit: 'g'),
                  _NutrientRow(
                      label: s.fiberLabel, value: n.fiber100, unit: 'g'),
                  _NutrientRow(label: s.fatLabel, value: n.fat100, unit: 'g'),
                  _NutrientRow(
                      label: s.saturatedFatLabel,
                      value: n.saturatedFat100,
                      unit: 'g'),
                  _NutrientRow(
                      label: s.sodiumPer100Label.trim(),
                      value: n.sodium100,
                      unit: 'mg'),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _NutrientChip extends StatelessWidget {
  final String label;
  final double? value;
  final String unit;

  const _NutrientChip({
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InputChip(
        label: Text(
          '$label: ${value?.toStringAsFixed(1) ?? '-'}$unit',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        onPressed: null,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

class _NutrientRow extends StatelessWidget {
  final String label;
  final double? value;
  final String unit;

  const _NutrientRow({
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          Text(
            value != null ? '${value!.toStringAsFixed(1)} $unit' : '-',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
