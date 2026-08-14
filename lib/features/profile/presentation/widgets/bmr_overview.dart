import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/bmr_calculation_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class BMROverview extends StatelessWidget {
  final BMRCalculationEntity bmrCalculation;
  final TDEEMethodEntity tdeeMethod;
  final ValueChanged<TDEEMethodEntity> onMethodChanged;

  const BMROverview({
    super.key,
    required this.bmrCalculation,
    required this.tdeeMethod,
    required this.onMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.local_fire_department_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    '${S.of(context).bmrLabel} & ${S.of(context).tdeeLabel}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            _buildRow(
              context,
              S.of(context).bmrKcal,
              '${bmrCalculation.bmr.round()} ${S.of(context).kcalLabel}',
            ),
            const SizedBox(height: 8.0),
            _buildRow(
              context,
              S.of(context).tdeeLabel,
              '${bmrCalculation.tdee.round()} ${S.of(context).kcalLabel}',
            ),
            const SizedBox(height: 8.0),
            _buildRow(
              context,
              S.of(context).activityMultiplierLabel,
              '${bmrCalculation.activityMultiplier.toStringAsFixed(2)}x',
            ),
            const Divider(height: 24.0),
            Text(
              S.of(context).calculationMethodLabel,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<TDEEMethodEntity>(
              initialValue: tdeeMethod,
              isExpanded: true,
              decoration: const InputDecoration(
                filled: false,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
              ),
              items: TDEEMethodEntity.values.map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(
                    method == TDEEMethodEntity.iom2005
                        ? '${method.getName(context)} ${S.of(context).calculationsRecommendedLabel}'
                        : method.getName(context),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null && value != tdeeMethod) {
                  onMethodChanged(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
