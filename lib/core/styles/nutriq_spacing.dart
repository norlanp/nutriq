import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class NutriqSpacing extends ThemeExtension<NutriqSpacing> {
  const NutriqSpacing({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.section,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double section;

  static const NutriqSpacing standard = NutriqSpacing(
    xs: 4,
    sm: 8,
    md: 12,
    lg: 16,
    xl: 24,
    xxl: 32,
    section: 48,
  );

  @override
  NutriqSpacing copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? section,
  }) {
    return NutriqSpacing(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      section: section ?? this.section,
    );
  }

  @override
  NutriqSpacing lerp(NutriqSpacing? other, double t) {
    if (other is! NutriqSpacing) return this;
    return NutriqSpacing(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      xxl: lerpDouble(xxl, other.xxl, t)!,
      section: lerpDouble(section, other.section, t)!,
    );
  }
}

extension NutriqSpacingX on BuildContext {
  NutriqSpacing get spacing => Theme.of(this).extension<NutriqSpacing>() ?? NutriqSpacing.standard;
}