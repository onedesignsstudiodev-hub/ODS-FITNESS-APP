class AppAsset {
  AppAsset._internal();
  static final AppAsset _instance = AppAsset._internal();

  factory AppAsset() {
    return _instance;
  }
  static const String imageUrl = 'assets/images';
  static const String iconUrl = 'assets/icons';
  
  
  //Images
  static const String applogo = '$imageUrl/onboarding.png';
  static const String logoShade = '$imageUrl/logo_shade.png';
  static const String onboardingOne = '$imageUrl/onboarding_one.jpg';
  static const String onboardingTwo = '$imageUrl/onboarding_two.jpg';
  static const String onboardingThree = '$imageUrl/onboarding_three.jpg';

  
  //Icons
  static String back = '$iconUrl/back.svg';
  static String eye = '$iconUrl/eye.svg';
  static String eyeOff = '$iconUrl/eye_off.svg';
  static String image = '$iconUrl/image.svg';

}
