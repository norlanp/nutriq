import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/generated/l10n.dart';

class BMIDisplay extends ConsumerWidget {
  final double latestWeightKg;

  const BMIDisplay({super.key, required this.latestWeightKg});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<double?>(
      future: _getHeightCm(ref),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox();
        }

        final heightM = snapshot.data! / 100;
        final bmi = latestWeightKg / pow(heightM, 2);
        final status = _getCategory(bmi);
        final color = _getCategoryColor(context, status);

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).bmi,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _getCategoryLabel(context, status),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<double?> _getHeightCm(WidgetRef ref) async {
    try {
      final user = await ref.read(getUserUsecaseProvider).getUserData();
      return user.heightCM;
    } catch (_) {
      return null;
    }
  }

  _BMICategory _getCategory(double bmi) {
    if (bmi < 18.5) return _BMICategory.underweight;
    if (bmi < 25.0) return _BMICategory.normal;
    if (bmi < 30.0) return _BMICategory.overweight;
    return _BMICategory.obese;
  }

  String _getCategoryLabel(BuildContext context, _BMICategory category) {
    switch (category) {
      case _BMICategory.underweight:
        return S.of(context).bmiUnderweight;
      case _BMICategory.normal:
        return S.of(context).bmiNormal;
      case _BMICategory.overweight:
        return S.of(context).bmiOverweight;
      case _BMICategory.obese:
        return S.of(context).bmiObese;
    }
  }

  Color _getCategoryColor(BuildContext context, _BMICategory category) {
    final nc = context.nutriqColors;
    switch (category) {
      case _BMICategory.underweight:
        return nc.warning;
      case _BMICategory.normal:
        return Theme.of(context).colorScheme.primary;
      case _BMICategory.overweight:
        return nc.warning;
      case _BMICategory.obese:
        return Theme.of(context).colorScheme.error;
    }
  }
}

enum _BMICategory { underweight, normal, overweight, obese }
