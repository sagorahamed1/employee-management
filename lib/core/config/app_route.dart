
import 'package:droke/views/screens/auth/login/login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../views/screens/auth/forgot/forgot_screen.dart';
import '../../views/screens/auth/sing_up/sign_up_screen.dart';
import '../../views/screens/onboarding/onboarding_screen.dart';
import '../../views/screens/splash/splash_screen.dart';


class AppRoutes {
  static const String splashScreen = "/SplashScreen";
  static const String onboardingScreen = "/OnboardingScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String logInScreen = "/LogInScreen";
  static const String forgotScreen = "/ForgotScreen";



  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () =>  OnboardingScreen()),
    GetPage(name: signUpScreen, page: () =>  SignUpScreen()),
    GetPage(name: logInScreen, page: () =>  LogInScreen()),
    GetPage(name: forgotScreen, page: () =>  ForgotScreen()),

  ];
}
