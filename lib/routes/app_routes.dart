import 'package:fitness_app/modules/auth/presentation/routes/register_route.dart';
import 'package:fitness_app/modules/onboarding/presentation/routes/onboarding_route.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/modules/auth/presentation/routes/login_route.dart';

final List<RouteBase> appRoutes = <RouteBase>[
  OnboardingRoute.route,
  LoginRoute.route,
  RegisterRoute.route,
];
