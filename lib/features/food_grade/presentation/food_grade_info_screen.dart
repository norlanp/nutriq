import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/presentation/widgets/food_grade_badge.dart';
import 'package:nutriq/generated/l10n.dart';

class FoodGradeInfoScreen extends StatelessWidget {
  const FoodGradeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.foodGradeLabel),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            s.foodGradeDescription,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          _GradeInfoTile(
            grade: FoodGrade.a,
            title: s.gradeA,
            explanation: s.gradeAExplain,
          ),
          _GradeInfoTile(
            grade: FoodGrade.b,
            title: s.gradeB,
            explanation: s.gradeBExplain,
          ),
          _GradeInfoTile(
            grade: FoodGrade.c,
            title: s.gradeC,
            explanation: s.gradeCExplain,
          ),
          _GradeInfoTile(
            grade: FoodGrade.d,
            title: s.gradeD,
            explanation: s.gradeDExplain,
          ),
        ],
      ),
    );
  }
}

class _GradeInfoTile extends StatelessWidget {
  final FoodGrade grade;
  final String title;
  final String explanation;

  const _GradeInfoTile({
    required this.grade,
    required this.title,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FoodGradeBadge(grade: grade),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  explanation,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
