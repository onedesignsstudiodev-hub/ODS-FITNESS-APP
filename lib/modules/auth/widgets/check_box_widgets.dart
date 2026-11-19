import 'package:fitness_app/component/text/content.dart';
import 'package:fitness_app/core/resource/app_color.dart';
import 'package:fitness_app/core/utils/extension/app_font_weight.dart';
import 'package:fitness_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  final String title;

  const CheckBoxWidget({super.key, required this.title});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          side: BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: AppColor.primaryText,
          ),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          activeColor: AppColor.primary,
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value ?? false;
            });
          },
        ),
        Content(
          data: widget.title,
          textStyle: context.bodyText.copyWith(
            color: AppColor.primaryText,
            fontWeight: AppFontWeight.semiBold,
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }
}
