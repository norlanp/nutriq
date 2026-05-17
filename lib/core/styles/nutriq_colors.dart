import 'package:flutter/material.dart';

@immutable
class NutriqColors extends ThemeExtension<NutriqColors> {
  const NutriqColors({
    required this.success,
    required this.successContainer,
    required this.onSuccess,
    required this.warning,
    required this.warningContainer,
    required this.onWarning,
    required this.carbsColor,
    required this.proteinColor,
    required this.fatColor,
    required this.onOverlay,
    required this.overlayBackground,
    required this.measurementWaist,
    required this.measurementNeck,
    required this.measurementHip,
    required this.measurementChest,
    required this.measurementBicep,
    required this.measurementThigh,
    required this.inactive,
  });

  final Color success;
  final Color successContainer;
  final Color onSuccess;
  final Color warning;
  final Color warningContainer;
  final Color onWarning;
  final Color carbsColor;
  final Color proteinColor;
  final Color fatColor;
  final Color onOverlay;
  final Color overlayBackground;
  final Color measurementWaist;
  final Color measurementNeck;
  final Color measurementHip;
  final Color measurementChest;
  final Color measurementBicep;
  final Color measurementThigh;
  final Color inactive;

  @override
  NutriqColors copyWith({
    Color? success,
    Color? successContainer,
    Color? onSuccess,
    Color? warning,
    Color? warningContainer,
    Color? onWarning,
    Color? carbsColor,
    Color? proteinColor,
    Color? fatColor,
    Color? onOverlay,
    Color? overlayBackground,
    Color? measurementWaist,
    Color? measurementNeck,
    Color? measurementHip,
    Color? measurementChest,
    Color? measurementBicep,
    Color? measurementThigh,
    Color? inactive,
  }) {
    return NutriqColors(
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarning: onWarning ?? this.onWarning,
      carbsColor: carbsColor ?? this.carbsColor,
      proteinColor: proteinColor ?? this.proteinColor,
      fatColor: fatColor ?? this.fatColor,
      onOverlay: onOverlay ?? this.onOverlay,
      overlayBackground: overlayBackground ?? this.overlayBackground,
      measurementWaist: measurementWaist ?? this.measurementWaist,
      measurementNeck: measurementNeck ?? this.measurementNeck,
      measurementHip: measurementHip ?? this.measurementHip,
      measurementChest: measurementChest ?? this.measurementChest,
      measurementBicep: measurementBicep ?? this.measurementBicep,
      measurementThigh: measurementThigh ?? this.measurementThigh,
      inactive: inactive ?? this.inactive,
    );
  }

  @override
  NutriqColors lerp(NutriqColors? other, double t) {
    if (other is! NutriqColors) return this;
    return NutriqColors(
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      carbsColor: Color.lerp(carbsColor, other.carbsColor, t)!,
      proteinColor: Color.lerp(proteinColor, other.proteinColor, t)!,
      fatColor: Color.lerp(fatColor, other.fatColor, t)!,
      onOverlay: Color.lerp(onOverlay, other.onOverlay, t)!,
      overlayBackground: Color.lerp(overlayBackground, other.overlayBackground, t)!,
      measurementWaist: Color.lerp(measurementWaist, other.measurementWaist, t)!,
      measurementNeck: Color.lerp(measurementNeck, other.measurementNeck, t)!,
      measurementHip: Color.lerp(measurementHip, other.measurementHip, t)!,
      measurementChest: Color.lerp(measurementChest, other.measurementChest, t)!,
      measurementBicep: Color.lerp(measurementBicep, other.measurementBicep, t)!,
      measurementThigh: Color.lerp(measurementThigh, other.measurementThigh, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
    );
  }
}

const lightNutriqColors = NutriqColors(
  success: Color(0xFF2E7D32),
  successContainer: Color(0xFFC8E6C9),
  onSuccess: Color(0xFFFFFFFF),
  warning: Color(0xFFE65100),
  warningContainer: Color(0xFFFFE0B2),
  onWarning: Color(0xFF3E2723),
  carbsColor: Color(0xFFE65100),
  proteinColor: Color(0xFF1565C0),
  fatColor: Color(0xFFF9A825),
  onOverlay: Color(0xFFFFFFFF),
  overlayBackground: Color(0xB3000000),
  measurementWaist: Color(0xFF1565C0),
  measurementNeck: Color(0xFFE65100),
  measurementHip: Color(0xFF7B1FA2),
  measurementChest: Color(0xFF2E7D32),
  measurementBicep: Color(0xFFC62828),
  measurementThigh: Color(0xFF00796B),
  inactive: Color(0xFF9E9E9E),
);

const darkNutriqColors = NutriqColors(
  success: Color(0xFF66BB6A),
  successContainer: Color(0xFF2E7D32),
  onSuccess: Color(0xFF1B2E1B),
  warning: Color(0xFFFFB74D),
  warningContainer: Color(0xFFBF360C),
  onWarning: Color(0xFF1A1208),
  carbsColor: Color(0xFFFFB74D),
  proteinColor: Color(0xFF64B5F6),
  fatColor: Color(0xFFFFD54F),
  onOverlay: Color(0xFFFFFFFF),
  overlayBackground: Color(0xB3000000),
  measurementWaist: Color(0xFF64B5F6),
  measurementNeck: Color(0xFFFFB74D),
  measurementHip: Color(0xFFCE93D8),
  measurementChest: Color(0xFF81C784),
  measurementBicep: Color(0xFFEF9A9A),
  measurementThigh: Color(0xFF80CBC4),
  inactive: Color(0xFF757575),
);

extension NutriqColorsX on BuildContext {
  NutriqColors get nutriqColors => Theme.of(this).extension<NutriqColors>()!;
}