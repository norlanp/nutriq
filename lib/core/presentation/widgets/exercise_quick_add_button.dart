import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/add_activity/presentation/add_activity_screen.dart';
import 'package:nutriq/generated/l10n.dart';

class ExerciseQuickAddButton extends StatelessWidget {
  final DateTime day;

  const ExerciseQuickAddButton({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlinedButton.icon(
        onPressed: () => _onAddExerciseTapped(context),
        icon: const Icon(Icons.add_circle_outline),
        label: Text(S.of(context).addExerciseLabel),
      ),
    );
  }

  void _onAddExerciseTapped(BuildContext context) {
    context.push(
      AppRoutes.addActivity,
      extra: AddActivityScreenArguments(day: day),
    );
  }
}
