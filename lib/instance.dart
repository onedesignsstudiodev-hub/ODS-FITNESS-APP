import 'package:get_it/get_it.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/core/constant/app_url.dart';
import 'package:fitness_app/core/network/network_service.dart';

import 'package:fitness_app/modules/onboarding/data/datasource/onboarding_remote_data_source.dart';
import 'package:fitness_app/modules/onboarding/data/datasource/onboarding_remote_data_source_impl.dart';
import 'package:fitness_app/modules/onboarding/data/rest_api/onboarding_rest_api_repo.dart';
import 'package:fitness_app/modules/onboarding/domain/repository/onboarding_repo.dart';
import 'package:fitness_app/modules/onboarding/domain/usecase/onboarding_use_case.dart';
import 'package:fitness_app/modules/onboarding/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:fitness_app/modules/onboarding/presentation/routes/onboarding_view_initial_params.dart';


void getInstance() {
  getIt = GetIt.instance;
  if (!getIt.isRegistered<NetworkService>()) {
    getIt.registerSingleton<NetworkService>(NetworkService());
  }
  if (!getIt.isRegistered<AppUrl>()) {
    getIt.registerSingleton<AppUrl>(AppUrl());
  }
// <<<<<<<<<<<<<<<<<<<<<<<  Onboarding  >>>>>>>>>>>>>>>>>>>>>>>
  if (!getIt.isRegistered<OnboardingRemoteDataSource>()) {
    getIt.registerSingleton<OnboardingRemoteDataSource>(
      OnboardingRemoteDataSourceImpl(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<OnboardingRepo>()) {
    getIt.registerSingleton<OnboardingRepo>(OnboardingRestApiRepo(getIt()));
  }

  if (!getIt.isRegistered<OnboardingUseCase>()) {
    getIt.registerSingleton<OnboardingUseCase>(OnboardingUseCase(getIt()));
  }

  if (!getIt.isRegistered<OnboardingBloc>()) {
    getIt.registerFactoryParam<
      OnboardingBloc,
      OnboardingViewInitialParams,
      dynamic
    >((params, _) => OnboardingBloc(params, getIt()));
  }

  
}
