import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/modules/app/domain/entitties/base_entity.dart';
import 'package:fitness_app/modules/onboarding/domain/entities/onboarding_entity.dart';
import 'package:fitness_app/modules/onboarding/domain/failures/onboarding_failure.dart';
import 'package:fitness_app/modules/onboarding/domain/params/onboarding_param.dart';
import 'package:fitness_app/modules/onboarding/domain/repository/onboarding_repo.dart';

class OnboardingUseCase {
  final OnboardingRepo repo;

  OnboardingUseCase(this.repo);

  Future<
      Either<
          OnboardingFailure,
          BaseEntity<OnboardingEntity>>> execute(
    OnboardingParam data,
  ) async {
    return await repo.onboarding(data).then(
          (value) => value.fold(
            (err) => left(
              OnboardingFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}

