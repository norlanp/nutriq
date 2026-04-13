import 'package:flutter/material.dart';

class NoteIndicator extends StatelessWidget {
  final bool hasNote;
  final double size;

  const NoteIndicator({
    super.key,
    required this.hasNote,
    this.size = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasNote) return const SizedBox.shrink();
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}
