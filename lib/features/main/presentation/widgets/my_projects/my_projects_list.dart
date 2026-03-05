import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/projects_entity.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';

class MyProjectsList extends StatelessWidget {
  const MyProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    final aspectRatio = MediaQuery.devicePixelRatioOf(context);
    return BlocSelector<MainCubit, MainState, List<ProjectsEntity>?>(
      selector: (state) {
        return state.projects;
      },
      builder: (context, state) {
        if (state == null) {
          return const SizedBox.shrink();
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            spacing: 20,
            crossAxisAlignment: .start,
            children: state
                .map(
                  (e) => _MyProjectItem(
                    item: e,
                    aspectRatio: aspectRatio,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _MyProjectItem extends StatefulWidget {
  const _MyProjectItem({required this.aspectRatio, required this.item});

  final ProjectsEntity item;
  final double aspectRatio;

  @override
  State<_MyProjectItem> createState() => _MyProjectItemState();
}

class _MyProjectItemState extends State<_MyProjectItem> {
  final ValueNotifier<bool> _readMore = ValueNotifier(false);
  bool _isHovered = false;

  @override
  void dispose() {
    _readMore.dispose();
    super.dispose();
  }

  static const _width = 350.0;
  static const _height = 450.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: MouseRegion(
        onEnter: (details) => setState(() => _isHovered = true),
        onExit: (details) => setState(() => _isHovered = false),
        child: SizedBox(
          width: _width,
          child: Column(
            spacing: 24,
            crossAxisAlignment: .start,
            children: [
              // Top part
              AnimatedScale(
                scale: _isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: AnimatedSlide(
                  offset: _isHovered ? const Offset(0, -0.02) : Offset.zero,
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    height: _height,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          if (widget.item.imageUrl != null)
                            Positioned.fill(
                              child: Image.network(
                                widget.item.imageUrl!,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                                cacheWidth: (_width * widget.aspectRatio)
                                    .toInt(),
                              ),
                            ),

                          Positioned(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                gradient: _isHovered
                                    ? LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withValues(alpha: .6),
                                          Colors.transparent,
                                        ],
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom part
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: .start,
                  children: [
                    if (widget.item.title?.isNotEmpty == true)
                      _buildTitle(context),

                    if (widget.item.description?.isNotEmpty == true) ...[
                      _buildDescription(),

                      _buildreadMoreButton(),
                    ],

                    if (widget.item.tags?.isNotEmpty == true) ...[
                      const SizedBox(height: 8),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.item.tags!
                            .split(',')
                            .map(
                              (e) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primary,
                                  ),
                                  color: AppColors.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  e.trim(),
                                  style: AppTextStyle.smallMuted.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      widget.item.title!,
      style: AppTextStyle.projectTitle.copyWith(
        color: AppColors.getForeground(context),
      ),
    );
  }

  ValueListenableBuilder<bool> _buildreadMoreButton() {
    return ValueListenableBuilder(
      valueListenable: _readMore,
      builder: (context, value, _) {
        return TextButton.icon(
          onPressed: () {
            _readMore.value = !_readMore.value;
          },
          icon: Icon(
            value ? Icons.expand_less : Icons.expand_more,
            size: 16,
            color: AppColors.primary,
          ),
          iconAlignment: IconAlignment.end,
          label: Text(
            value ? 'Read Less' : 'Read More',
            style: AppTextStyle.smallMuted.copyWith(
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }

  ValueListenableBuilder<bool> _buildDescription() {
    return ValueListenableBuilder(
      valueListenable: _readMore,
      builder: (context, value, _) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: Text(
            widget.item.description!,
            style: AppTextStyle.smallMuted.copyWith(
              color: AppColors.getForeground(
                context,
              ).withValues(alpha: 0.7),
            ),
            maxLines: value ? null : 4,
            overflow: value ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
