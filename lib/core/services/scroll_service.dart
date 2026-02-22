import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/const/app_size.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:injectable/injectable.dart';

@singleton
/// Service class for handling scroll operations to global keys
class ScrollService {
  ScrollService();

  final GlobalKey aboutKey = GlobalKey(debugLabel: 'aboutKey');
  final GlobalKey skillsKey = GlobalKey(debugLabel: 'skillsKey');

  /// Scroll to a widget using its GlobalKey
  ///
  /// [key] - The GlobalKey of the widget to scroll to
  /// [duration] - Animation duration (default: 500ms)
  /// [curve] - Animation curve (default: Curves.easeInOut)
  /// [alignment] - Alignment of the target widget after scrolling (default: 0.0 - top)
  Future<void> scrollToKey({
    required GlobalKey key,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
    double alignment = 64,
    bool isFromDrawer = false,
  }) async {
    final context = key.currentContext;
    if (context == null) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final scrollableContext = Scrollable.maybeOf(context);
    if (scrollableContext == null) return;

    final position = scrollableContext.position;

    final targetPosition = renderBox
        .localToGlobal(
          Offset.zero,
        )
        .dy;

    final isAlignment = position.pixels < alignment;

    final extraHeight = context.isMobileOrTablet && isFromDrawer
        ? AppSize.drawerHeight
        : 0.0;

    final scrollOffset =
        position.pixels +
        targetPosition -
        (isAlignment ? alignment : 0) -
        extraHeight;

    await position.animateTo(
      scrollOffset,
      duration: duration,
      curve: curve,
    );
  }
}
