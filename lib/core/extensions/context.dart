import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/enums/break_point.dart';

extension ContextBreakPoints on BuildContext {
  BreakPoint get breakPoint {
    final width = MediaQuery.sizeOf(this).width;

    if (width >= BreakPoint.desktop.minWidth) {
      return BreakPoint.desktop;
    } else if (width >= BreakPoint.desktopSmall.minWidth) {
      return BreakPoint.desktopSmall;
    } else if (width >= BreakPoint.tablet.minWidth) {
      return BreakPoint.tablet;
    } else {
      return BreakPoint.mobile;
    }
  }

  bool get isMobile => breakPoint == BreakPoint.mobile;
  bool get isTablet => breakPoint == BreakPoint.tablet;
  bool get isDesktopSmall => breakPoint == BreakPoint.desktopSmall;
  bool get isDesktop => breakPoint == BreakPoint.desktop;
}
