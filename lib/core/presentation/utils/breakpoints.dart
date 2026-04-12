import 'package:flutter/material.dart';

enum LayoutType { mobile, tablet, desktop }

class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1200;

  static LayoutType getLayoutType(double width) {
    if (width >= tablet) return LayoutType.desktop;
    if (width >= mobile) return LayoutType.tablet;
    return LayoutType.mobile;
  }

  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < tablet;
  static bool isDesktop(double width) => width >= tablet;

  static LayoutType layoutTypeOf(BuildContext context) {
    return getLayoutType(MediaQuery.sizeOf(context).width);
  }

  static bool isMobileOf(BuildContext context) =>
      isMobile(MediaQuery.sizeOf(context).width);
  static bool isTabletOf(BuildContext context) =>
      isTablet(MediaQuery.sizeOf(context).width);
  static bool isDesktopOf(BuildContext context) =>
      isDesktop(MediaQuery.sizeOf(context).width);
}
