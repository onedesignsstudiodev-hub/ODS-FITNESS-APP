import 'dart:async';

import 'package:fitness_app/component/image/app_network_image.dart';
import 'package:fitness_app/component/text_field/label_text_field.dart';
import 'package:fitness_app/core/resource/app_asset.dart';
import 'package:fitness_app/core/utils/app_system_ui_overlay.dart';
import 'package:fitness_app/core/utils/extension/app_edge_insets.dart';
import 'package:fitness_app/core/utils/extension/app_font_weight.dart';
import 'package:fitness_app/core/utils/extension/app_sized_box.dart';
import 'package:fitness_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/resource/app_color.dart';
import 'package:fitness_app/modules/auth/presentation/blocs/login/login_bloc.dart';

class LoginView extends StatefulWidget {
  final LoginBloc bloc;

  const LoginView({super.key, required this.bloc});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void dispose() {
    unawaited(widget.bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppSystemUiOverlay(
      iconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColor.base,
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            context.pagePadding.left,
            context.pagePadding.top,
            context.pagePadding.right,
            context.pagePadding.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: AppImage.asset(
                  assetPath: AppAsset.applogo,
                  size: 150,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              ContentFields(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentFields extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelTextField(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: AppImage.svg(svgPath: AppAsset.email, size: 24),
          ),
          hintStyle: context.bodyText.copyWith(
            color: AppColor.primaryText.withValues(alpha: 0.7),
            fontSize: 16,
            fontWeight: AppFontWeight.regular,
          ),
          hintText: 'Hristo@gmail.com',
          fillColor: AppColor.transparent,
          labelText: 'Your Email',
          labelStyle: context.bodyText.copyWith(
            color: AppColor.primaryText,
            fontSize: 16,
            fontWeight: AppFontWeight.semiBold,
          ),
          radius: 50,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          textStyle: context.bodyText.copyWith(
            color: AppColor.primaryText,
            fontSize: 16,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        20.heightBox,
        LabelTextField(
          
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: AppImage.svg(svgPath: AppAsset.email, size: 24),
          ),
          hintStyle: context.bodyText.copyWith(
            color: AppColor.primaryText.withValues(alpha: 0.7),
            fontSize: 16,
            fontWeight: AppFontWeight.regular,
          ),
          iconColor: AppColor.primaryText,
          hintText: '**********',
          fillColor: AppColor.transparent,
          labelText: 'Password',
          labelStyle: context.bodyText.copyWith(
            color: AppColor.primaryText,
            fontSize: 16,
            fontWeight: AppFontWeight.semiBold,
          ),
          radius: 50,
          obscureText: true,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          textStyle: context.bodyText.copyWith(
            color: AppColor.primaryText,
            fontSize: 16,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
      ],
    );
  }
}
