import 'package:go_router/go_router.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/routes/app_route_names.dart';
import 'package:fitness_app/routes/app_route_paths.dart';
import 'package:fitness_app/modules/onboarding/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:fitness_app/modules/onboarding/presentation/routes/onboarding_view_initial_params.dart';
import 'package:fitness_app/modules/onboarding/presentation/views/onboarding_view.dart';

class OnboardingRoute {
  static const String name = AppRouteNames.onboarding;
  static const String path = AppRoutePaths.onboarding;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (_, state) {
      final params = OnboardingViewInitialParams.fromUri(state.uri);
      final bloc = getIt<OnboardingBloc>(param1: params);

      return OnboardingView(bloc: bloc);
    },
  );
}

