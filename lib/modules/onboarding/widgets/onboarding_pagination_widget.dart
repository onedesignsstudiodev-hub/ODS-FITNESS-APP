import 'package:fitness_app/core/resource/app_color.dart';
import 'package:flutter/material.dart';

class OnboardingPaginationWidget extends StatelessWidget {
  final double? width;
  final Color? color;
  final double transform;
  final int totalPage;
  final int currentPage;
  const OnboardingPaginationWidget({
    super.key,
    this.width,
    this.color,
    required this.transform,
    required this.totalPage,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPage <= 0) return const SizedBox.shrink();

    final segmentWidth = width ?? 32;
    final activeIndex = currentPage.clamp(0, totalPage - 1);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(totalPage, (index) {
        final isActive = index == activeIndex;

        return Padding(
          padding: EdgeInsets.only(right: index == totalPage - 1 ? 0 : 6),
          child: Transform(
            transform: Matrix4.skewX(transform),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              opacity: isActive ? 1 : 0.8,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOutCubic,
                width: isActive ? segmentWidth * 3 : segmentWidth,
                height: 8,
                color: isActive ? color ?? AppColor.primary : const Color(0xFFD6D6D6),
              ),
            ),
          ),
        );
      }),
    );
  }
}
