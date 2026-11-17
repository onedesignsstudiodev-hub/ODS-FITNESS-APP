class OnboardingViewInitialParams {
  const OnboardingViewInitialParams();

  factory OnboardingViewInitialParams.fromUri(Uri uri) {
    return OnboardingViewInitialParams(
      // Parse the URI parameters as needed
    );
  }

  factory OnboardingViewInitialParams.fromExtra(Object? extra) {
    return OnboardingViewInitialParams(
      // Parse the extra data as needed
    );
  }

  factory OnboardingViewInitialParams.fromQuery(
    Map<String, String> queryParameters,
  ) {
    return OnboardingViewInitialParams(
      // Parse the query parameters as needed
    );
  }
}
