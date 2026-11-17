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

import 'package:fitness_app/modules/auth/data/datasource/login_remote_data_source.dart';
import 'package:fitness_app/modules/auth/data/datasource/login_remote_data_source_impl.dart';
import 'package:fitness_app/modules/auth/data/rest_api/login_rest_api_repo.dart';
import 'package:fitness_app/modules/auth/domain/repository/login_repo.dart';
import 'package:fitness_app/modules/auth/domain/usecase/login_use_case.dart';
import 'package:fitness_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:fitness_app/modules/auth/presentation/routes/login_view_initial_params.dart';
import 'package:fitness_app/modules/auth/presentation/validator/login_validator.dart';

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

  // <<<<<<<<<<<<<<<<<<<<<<<  Login  >>>>>>>>>>>>>>>>>>>>>>>
  if (!getIt.isRegistered<LoginRemoteDataSource>()) {
    getIt.registerSingleton<LoginRemoteDataSource>(
      LoginRemoteDataSourceImpl(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<LoginValidator>()) {
    getIt.registerSingleton<LoginValidator>(LoginValidator());
  }

  if (!getIt.isRegistered<LoginRepo>()) {
    getIt.registerSingleton<LoginRepo>(LoginRestApiRepo(getIt()));
  }

  if (!getIt.isRegistered<LoginUseCase>()) {
    getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt(), getIt()));
  }

  if (!getIt.isRegistered<LoginBloc>()) {
    getIt.registerFactoryParam<LoginBloc, LoginViewInitialParams, dynamic>(
      (params, _) => LoginBloc(params, getIt()),
    );
  }
}
