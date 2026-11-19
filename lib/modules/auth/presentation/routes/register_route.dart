import 'package:fitness_app/routes/app_route_paths.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/routes/app_route_names.dart';
import 'package:fitness_app/modules/auth/presentation/blocs/register/register_bloc.dart';
import 'package:fitness_app/modules/auth/presentation/routes/register_view_initial_params.dart';
import 'package:fitness_app/modules/auth/presentation/views/register_view.dart';

class RegisterRoute {
  static final String name = AppRouteNames.register;
  static const String path = AppRoutePaths.register;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (_, state) {
      final params = RegisterViewInitialParams.fromUri(state.uri);
      final bloc = getIt<RegisterBloc>(param1: params);

      return RegisterView(bloc: bloc);
    },
  );
}

