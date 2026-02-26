enum BreakPoint {
  mobile(0), // Mobile (Portrait)
  small(640), // Mobile (Landscape)
  medium(768), // Tablets
  large(1024), // Laptops / Small Desktops
  extraLarge(1280), // Large Desktops
  twoExtraLarge(1536) // Ultra-wide Monitors
  ;

  const BreakPoint(this.minWidth);

  final double minWidth;
}
