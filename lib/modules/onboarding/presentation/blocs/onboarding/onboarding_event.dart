part of 'onboarding_bloc.dart';

sealed class OnboardingEvent {}

class LoadOnboardingEvent extends OnboardingEvent {
  final OnboardingParam param;

  LoadOnboardingEvent(this.param);
}

class OnboardingPageChangedEvent extends OnboardingEvent {
  final int page;

  OnboardingPageChangedEvent(this.page);
}

