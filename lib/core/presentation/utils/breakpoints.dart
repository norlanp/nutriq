import 'package:flutter/material.dart';

enum LayoutType { mobile, tablet }

class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1200;

  static LayoutType getLayoutType(double width) {
    if (width >= mobile) return LayoutType.tablet;
    return LayoutType.mobile;
  }

  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile;

  static LayoutType layoutTypeOf(BuildContext context) {
    return getLayoutType(MediaQuery.sizeOf(context).width);
  }

  static bool isMobileOf(BuildContext context) =>
      isMobile(MediaQuery.sizeOf(context).width);
  static bool isTabletOf(BuildContext context) =>
      isTablet(MediaQuery.sizeOf(context).width);
}
