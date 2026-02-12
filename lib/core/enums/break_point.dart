enum BreakPoint {
  desktop(1200),
  desktopSmall(832),
  tablet(600),
  mobile(0);

  final double minWidth;
  const BreakPoint(this.minWidth);
}
