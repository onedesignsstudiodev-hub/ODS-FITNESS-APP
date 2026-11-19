import 'dart:async';

import 'package:fitness_app/component/button/app_button.dart';
import 'package:fitness_app/component/image/app_network_image.dart';
import 'package:fitness_app/component/text/content.dart';
import 'package:fitness_app/component/text_field/label_text_field.dart';
import 'package:fitness_app/core/resource/app_asset.dart';
import 'package:fitness_app/core/utils/app_system_ui_overlay.dart';
import 'package:fitness_app/core/utils/extension/app_edge_insets.dart';
import 'package:fitness_app/core/utils/extension/app_font_weight.dart';
import 'package:fitness_app/core/utils/extension/app_sized_box.dart';
import 'package:fitness_app/core/utils/extension/app_text_style.dart';
import 'package:fitness_app/modules/auth/widgets/check_box_widgets.dart';
import 'package:fitness_app/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/resource/app_color.dart';
import 'package:fitness_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  final LoginBloc bloc;

  const LoginView({super.key, required this.bloc});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool rememberMe = false;
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
              const SizedBox(height: 15),
              // * Remember me & Forget Password
              Row(
                children: [
                  Expanded(child: CheckBoxWidget(title: 'Remember Me')),
                  Content(
                    data: 'Forget Passsword',
                    textStyle: context.bodyText.copyWith(
                      color: AppColor.primary,
                      fontWeight: AppFontWeight.semiBold,
                    ),
                  ),
                ],
              ),
              50.heightBox,
              // * Button
              AppButton.iconWithText(
                title: 'Let’s Roll',
                iconPath: AppAsset.arrow,
                isLeft: false,
                iconSize: 12,
                fontSize: 16,
                fontWeight: AppFontWeight.semiBold,
                radius: 50,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(
            context.pagePadding.left,
            context.pagePadding.top,
            context.pagePadding.right,
            context.pagePadding.bottom + 20,
          ),
          child: GestureDetector(
            onTap: () => context.pushNamed(AppRouteNames.register),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.bodyText.copyWith(
                  color: AppColor.primaryText,
                  fontWeight: AppFontWeight.semiBold,
                ),
                children: [
                  const TextSpan(text: "Don't have an account?"),
                  const WidgetSpan(child: SizedBox(width: 7)),
                  TextSpan(
                    text: 'Sign up',
                    style: context.bodyText.copyWith(
                      color: AppColor.primary,
                      fontWeight: AppFontWeight.semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Fields Class
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
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }
}
