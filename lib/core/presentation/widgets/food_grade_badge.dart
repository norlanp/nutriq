import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/presentation/extensions/food_grade_color.dart';
import 'package:nutriq/generated/l10n.dart';

class FoodGradeBadge extends StatelessWidget {
  final FoodGrade grade;
  final double size;

  const FoodGradeBadge({
    super.key,
    required this.grade,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: S.of(context).foodGradeLabelLong(grade.label),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: grade.color(context),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          grade.label,
          style: TextStyle(
            color: grade.onColor(context),
            fontSize: size * 0.45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}