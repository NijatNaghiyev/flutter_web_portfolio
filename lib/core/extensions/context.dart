import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/enums/break_point.dart';

extension ContextBreakPoints on BuildContext {
  BreakPoint get breakPoint {
    final width = MediaQuery.sizeOf(this).width;

    if (width >= BreakPoint.twoExtraLarge.minWidth) {
      return BreakPoint.twoExtraLarge;
    } else if (width >= BreakPoint.extraLarge.minWidth) {
      return BreakPoint.extraLarge;
    } else if (width >= BreakPoint.large.minWidth) {
      return BreakPoint.large;
    } else if (width >= BreakPoint.medium.minWidth) {
      return BreakPoint.medium;
    } else if (width >= BreakPoint.small.minWidth) {
      return BreakPoint.small;
    } else {
      return BreakPoint.mobile;
    }
  }

  bool get isMobile => breakPoint == BreakPoint.mobile;
  bool get isSmall => breakPoint == BreakPoint.small;
  bool get isMedium => breakPoint == BreakPoint.medium;
  bool get isLarge => breakPoint == BreakPoint.large;
  bool get isExtraLarge => breakPoint == BreakPoint.extraLarge;
  bool get isTwoExtraLarge => breakPoint == BreakPoint.twoExtraLarge;

  // Combined helpers
  bool get isMobileOrTablet => isMobile || isSmall || isMedium;
  bool get isDesktopSmallOrDesktop =>
      isLarge || isExtraLarge || isTwoExtraLarge;
}
