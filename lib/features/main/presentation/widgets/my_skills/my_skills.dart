import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/enums/app_icon.dart';
import 'package:flutter_web_portfolio/core/services/scroll_service.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/core/utils/debounce.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/skills_entity.dart';

class MySkills extends StatefulWidget {
  const MySkills({required this.item, super.key});

  final List<SkillsEntity> item;

  @override
  State<MySkills> createState() => _MySkillsState();
}

class _MySkillsState extends State<MySkills>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  ScrollableState? scroll;

  Debounce debounce = Debounce(
    duration: const Duration(milliseconds: 50),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    scroll?.position.isScrollingNotifier.removeListener(_startAnimation);
    debounce.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initListen();
  }

  void _startAnimation() {
    if (_controller.isAnimating || _controller.isCompleted) return;
    
    debounce.call(() {
      final isVisible = getIt<ScrollService>().isKeyVisible(
        getIt<ScrollService>().skillsKey,
      );

      if (isVisible) {
        _controller.forward();
      }
    });
  }

  void _initListen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scroll != null) return;

      scroll = Scrollable.of(context);

      scroll?.position.isScrollingNotifier.addListener(_startAnimation);
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.item.length;
    final singleItemInterval = 1.0 / itemCount;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: widget.item.map((e) {
        final index = widget.item.indexOf(e);
        final start = index * singleItemInterval;
        final end = (index + 1) * singleItemInterval;

        final animation = CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: _MySkillsItem(
              item: e,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _MySkillsItem extends StatefulWidget {
  const _MySkillsItem({required this.item});

  final SkillsEntity item;

  @override
  State<_MySkillsItem> createState() => _MySkillsItemState();
}

class _MySkillsItemState extends State<_MySkillsItem> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        width: 150,
        height: 200,
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, isHovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        decoration: _decoration(context),
        foregroundDecoration: _foregroundDecoration(),

        child: Column(
          spacing: 16,
          mainAxisAlignment: .spaceBetween,
          children: [
            if (widget.item.icon != null) _iconCard(),

            Text(
              widget.item.title,

              style: AppTextStyle.smallMuted.copyWith(
                color: AppColors.getForeground(context),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconCard() {
    return AnimatedScale(
      scale: isHovered ? 1.08 : 1.0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.getBackground(context),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SvgPicture.asset(
          widget.item.icon!.path,
          width: 48,
          height: 48,
        ),
      ),
    );
  }

  BoxDecoration? _foregroundDecoration() {
    return isHovered
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary.withValues(alpha: 0.1),
                Colors.white.withValues(alpha: 0),
              ],
            ),
          )
        : null;
  }

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      color: AppColors.getCard(context).withValues(alpha: .7),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: isHovered ? AppColors.primary : AppColors.lightBorder,
      ),
      boxShadow: isHovered
          ? [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                blurRadius: 40,
                spreadRadius: 16,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 8,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.05),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 2),
              ),
            ]
          : null,
    );
  }
}
