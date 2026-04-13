import 'package:flutter/material.dart';

class BooleanToggleWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BooleanToggleWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(value ? 'Yes' : 'No'),
      value: value,
      onChanged: (v) => onChanged(v),
    );
  }
}
