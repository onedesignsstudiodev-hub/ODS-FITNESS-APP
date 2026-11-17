class AppRouteNames {
  static const String onboarding = 'onboarding';
  static const String login = 'auth_login';

  static String feature(String module, String view) => '${module}_$view';
}
