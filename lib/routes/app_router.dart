import 'package:go_router/go_router.dart';
import 'package:fitness_app/routes/app_route_paths.dart';
import 'package:fitness_app/routes/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutePaths.onboarding,
    routes: appRoutes,
  );
}
