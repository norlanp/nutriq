import 'package:flutter/material.dart';
import 'package:nutriq/generated/l10n.dart';

class TextInputWidget extends StatelessWidget {
  final String? value;
  final ValueChanged<String> onChanged;

  const TextInputWidget({
    super.key,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: S.of(context).trackerValueLabel,
        border: const OutlineInputBorder(),
      ),
      onSubmitted: onChanged,
    );
  }
}
