import 'package:fitness_app/routes/app_route_paths.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/routes/app_route_names.dart';
import 'package:fitness_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:fitness_app/modules/auth/presentation/routes/login_view_initial_params.dart';
import 'package:fitness_app/modules/auth/presentation/views/login_view.dart';

class LoginRoute {
  static const String name = AppRouteNames.login;
  static const String path = AppRoutePaths.login;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (_, state) {
      final params = LoginViewInitialParams.fromUri(state.uri);
      final bloc = getIt<LoginBloc>(param1: params);

      return LoginView(bloc: bloc);
    },
  );
}

