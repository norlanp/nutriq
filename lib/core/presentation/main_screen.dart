import 'package:flutter/material.dart';
import 'package:nutriq/core/presentation/utils/keyboard_shortcuts.dart';
import 'package:nutriq/core/presentation/widgets/adaptive_scaffold.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const KeyboardShortcuts(
      child: AdaptiveScaffold(),
    );
  }
}
