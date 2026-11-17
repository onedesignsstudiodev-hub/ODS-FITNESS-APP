import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/core/failures/repo_failure.dart';
import 'package:fitness_app/modules/app/domain/entitties/base_entity.dart';
import 'package:fitness_app/modules/onboarding/data/datasource/onboarding_remote_data_source.dart';
import 'package:fitness_app/modules/onboarding/domain/entities/onboarding_entity.dart';
import 'package:fitness_app/modules/onboarding/domain/params/onboarding_param.dart';
import 'package:fitness_app/modules/onboarding/domain/repository/onboarding_repo.dart';

class OnboardingRestApiRepo implements OnboardingRepo {
  final OnboardingRemoteDataSource dataSource;

  OnboardingRestApiRepo(this.dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<OnboardingEntity>>> 
      onboarding(
    OnboardingParam param,
  ) =>
      dataSource.onboarding(param).then(
        (value) => value.fold(
          (l) => left(RepoFailure(error: l.error)),
          (response) {
            try {
              return right(
                response.toDomain(
                  (val) => val!.toEntity(),
                ),
              );
            } catch (e) {
              return left(RepoFailure(error: e.toString()));
            }
          },
        ),
      );
}

