import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fitness_app/core/resource/app_color.dart';
import 'package:fitness_app/modules/auth/presentation/blocs/register/register_bloc.dart';


class RegisterView extends StatefulWidget {
  final RegisterBloc bloc;
  const RegisterView({
    super.key,
    required this.bloc,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void dispose() {
    unawaited(widget.bloc.close());
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.base,

      
    );
  
  }
}

