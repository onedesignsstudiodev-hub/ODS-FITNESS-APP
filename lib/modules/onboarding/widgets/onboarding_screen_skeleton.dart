import 'package:fitness_app/component/image/app_network_image.dart';
import 'package:fitness_app/component/text/content.dart';
import 'package:fitness_app/core/resource/app_asset.dart';
import 'package:fitness_app/core/resource/app_color.dart';
import 'package:fitness_app/core/utils/extension/app_edge_insets.dart';
import 'package:fitness_app/core/utils/extension/app_font_weight.dart';
import 'package:fitness_app/core/utils/extension/app_text_style.dart';
import 'package:fitness_app/modules/onboarding/domain/entities/onboarding_entity.dart';
import 'package:flutter/material.dart';

class OnboardingScreenSkeleton extends StatelessWidget {
  final OnboardingEntity data;

  const OnboardingScreenSkeleton({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //* Image
        Positioned.fill(
          top: 0,
          right: 0,
          left: 0,
          child: Image.asset(
            data.imageUrl,
            fit: BoxFit.cover,
          ),
        ),

        //* Top Gradient
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.black,
                  AppColor.black.withValues(alpha: 0.6),
                  AppColor.black.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),

        //* Logo Shade
        Positioned(
          top: -50,
          left: -100,
          child: Transform.rotate(
            angle: -0.4,
            filterQuality: FilterQuality.high,
            child: Opacity(
              opacity: 0.1,
              child: AppImage.asset(
                fit: BoxFit.contain,
                assetPath: AppAsset.logoShade,
                size: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
          ),
        ),

        //* Bottom Contant
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              context.pagePadding.left,
              context.pagePadding.left,
              context.pagePadding.right,
              context.pagePadding.bottom,
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(gradient: AppColor.iconBgGradient),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Content(
                  data: data.heading.toUpperCase(),
                  textStyle: context.headingText.copyWith(
                    color: AppColor.white,
                    height: 1,
                  ),
                  weight: AppFontWeight.extraBold,
                  size: 64,
                ),
                Content(
                  data: data.description,
                  textStyle: context.bodyText.copyWith(
                    color: AppColor.secondaryText.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
