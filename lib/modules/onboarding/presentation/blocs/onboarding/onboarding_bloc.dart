import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/network/api_response.dart';
import 'package:fitness_app/modules/app/domain/entitties/base_entity.dart';
import 'package:fitness_app/modules/onboarding/domain/entities/onboarding_entity.dart';
import 'package:fitness_app/modules/onboarding/domain/params/onboarding_param.dart';
import 'package:fitness_app/modules/onboarding/domain/usecase/onboarding_use_case.dart';
import 'package:fitness_app/modules/onboarding/presentation/routes/onboarding_view_initial_params.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  static const int pageCount = 3;

  final OnboardingViewInitialParams initialParams;
  final OnboardingUseCase _useCase;

  OnboardingBloc(this.initialParams, this._useCase)
      : super(OnboardingState(initialParams: initialParams)) {
    on<LoadOnboardingEvent>(_loadOnboardingAction);
    on<OnboardingPageChangedEvent>(_changePage);
  }

  void _changePage(
    OnboardingPageChangedEvent event,
    Emitter<OnboardingState> emit,
  ) {
    if (event.page < 0 || event.page >= pageCount) return;
    emit(state.copyWith(currentPage: event.page));
  }

  Future<void> _loadOnboardingAction(
    LoadOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(onboardingResponse: ApiResponse.loading()));

    final result = await _useCase.execute(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(onboardingResponse: ApiResponse.error(failure.error)),
      ),
      (response) => emit(
        state.copyWith(onboardingResponse: ApiResponse.completed(response)),
      ),
    );
  }
}
