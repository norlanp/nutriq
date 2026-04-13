import 'package:flutter/material.dart';

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
      decoration: const InputDecoration(
        labelText: 'Value',
        border: OutlineInputBorder(),
      ),
      onSubmitted: onChanged,
    );
  }
}
