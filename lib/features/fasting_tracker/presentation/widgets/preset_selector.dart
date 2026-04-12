import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class PresetSelector extends StatelessWidget {
  final ValueChanged<FastingPresetType> onPresetSelected;

  const PresetSelector({super.key, required this.onPresetSelected});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        _PresetChip(
          label: l10n.presetSixteenEight,
          icon: Icons.timer_outlined,
          onTap: () => onPresetSelected(FastingPresetType.sixteenEight),
        ),
        _PresetChip(
          label: l10n.presetEighteenSix,
          icon: Icons.timer_outlined,
          onTap: () => onPresetSelected(FastingPresetType.eighteenSix),
        ),
        _PresetChip(
          label: l10n.presetTwentyFour,
          icon: Icons.timer_outlined,
          onTap: () => onPresetSelected(FastingPresetType.twentyFour),
        ),
        _PresetChip(
          label: l10n.presetOMAD,
          icon: Icons.restaurant_outlined,
          onTap: () => onPresetSelected(FastingPresetType.omad),
        ),
        _PresetChip(
          label: l10n.presetCustom,
          icon: Icons.edit_outlined,
          onTap: () => onPresetSelected(FastingPresetType.custom),
        ),
      ],
    );
  }
}

class _PresetChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _PresetChip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onTap,
      avatar: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}
