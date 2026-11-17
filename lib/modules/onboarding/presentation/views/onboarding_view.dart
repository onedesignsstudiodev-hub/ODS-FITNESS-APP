import 'dart:async';

import 'package:fitness_app/component/button/app_button.dart';
import 'package:fitness_app/core/resource/app_asset.dart';
import 'package:fitness_app/core/resource/app_color.dart';
import 'package:fitness_app/core/utils/extension/app_edge_insets.dart';
import 'package:fitness_app/modules/onboarding/domain/entities/onboarding_entity.dart';
import 'package:fitness_app/modules/onboarding/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:fitness_app/modules/onboarding/widgets/onboarding_pagination_widget.dart';
import 'package:fitness_app/modules/onboarding/widgets/onboarding_screen_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatefulWidget {
  final OnboardingBloc bloc;

  const OnboardingView({super.key, required this.bloc});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late int _currentPage;
  late StreamSubscription<OnboardingState> _blocSubscription;

  final List<OnboardingEntity> _pages = [
    OnboardingEntity(
      heading: 'Exercise\nlibrary',
      description: 'Welcome to the Elev8 Gym App, the ultimate resource for comprehensive exercise experience!',
      imageUrl: AppAsset.onboardingOne,
    ),
    OnboardingEntity(
      heading: 'NUTRITION\nTRACKING',
      description: 'To ensure adequate protein and calorie consumption to promote muscle growth.',
      imageUrl: AppAsset.onboardingTwo,
    ),
    OnboardingEntity(
      heading: 'Get - set\nstart',
      description: 'Embert on your Fitness transformation without Elite training programs and personalized coaching.',
      imageUrl: AppAsset.onboardingThree,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _subscribeToBloc();
  }

  void _subscribeToBloc() {
    _currentPage = widget.bloc.state.currentPage;
    _blocSubscription = widget.bloc.stream.listen((state) {
      if (!mounted) return;
      setState(() => _currentPage = state.currentPage);
    });
  }

  void _handleSwipe(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    final currentPage = widget.bloc.state.currentPage;

    if (velocity < 0 && currentPage < _pages.length - 1) {
      widget.bloc.add(OnboardingPageChangedEvent(currentPage + 1));
    } else if (velocity > 0 && currentPage > 0) {
      widget.bloc.add(OnboardingPageChangedEvent(currentPage - 1));
    }
  }

  @override
  void didUpdateWidget(covariant OnboardingView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.bloc != widget.bloc) {
      unawaited(_blocSubscription.cancel());
      unawaited(oldWidget.bloc.close());
      _subscribeToBloc();
    }
  }

  @override
  void dispose() {
    unawaited(_blocSubscription.cancel());
    unawaited(widget.bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColor.black,
        body: Stack(
          children: [
            Positioned.fill(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: GestureDetector(
                onHorizontalDragEnd: _handleSwipe,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: KeyedSubtree(
                    key: ValueKey(_currentPage),
                    child: OnboardingScreenSkeleton(data: _pages[_currentPage]),
                  ),
                ),
              ),
            ),
            BlocBuilder<OnboardingBloc, OnboardingState>(
              bloc: widget.bloc,
              builder: (context, state) {
                return Positioned(
                  bottom: 140,
                  left: context.pagePadding.left,
                  child: OnboardingPaginationWidget(
                    width: 18,
                    transform: -0.3,
                    totalPage: _pages.length,
                    currentPage: state.currentPage,
                  ),
                );
              },
            ),
            BlocBuilder<OnboardingBloc, OnboardingState>(
              bloc: widget.bloc,
              builder: (context, state) {
                return Positioned(
                  bottom: context.pagePadding.bottom + 10,
                  right: context.pagePadding.right,
                  child: AppButton.textButton(
                    radius: 50,
                    width: 150,
                    fontSize: 18,
                    isDisable: state.currentPage >= _pages.length - 1,
                    title: 'Next',
                    onTap: () => widget.bloc.add(
                      OnboardingPageChangedEvent(state.currentPage + 1),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
