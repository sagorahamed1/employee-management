
import 'package:droke/views/screens/auth/login/login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../views/screens/auth/enable_location/enable_location_screen.dart';
import '../../views/screens/auth/forgot/forgot_screen.dart';
import '../../views/screens/auth/otp/opt_screen.dart';
import '../../views/screens/auth/reset/reset_password_screen.dart';
import '../../views/screens/auth/role/role_screen.dart';
import '../../views/screens/auth/sing_up/sign_up_screen.dart';
import '../../views/screens/neighbor/hub/hub_home_screen.dart';
import '../../views/screens/neighbor/neighbor_bottom_nav_bar/neighbor_bottom_nav_bar.dart';
import '../../views/screens/neighbor/neighbor_hub_search_screen/neighbor_hub_search_screen.dart';
import '../../views/screens/neighbor/service_details/service_details_screen.dart';
import '../../views/screens/notification/notification_screen.dart';
import '../../views/screens/onboarding/onboarding_screen.dart';
import '../../views/screens/splash/splash_screen.dart';


class AppRoutes {
  static const String splashScreen = "/SplashScreen";
  static const String onboardingScreen = "/OnboardingScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String logInScreen = "/LogInScreen";
  static const String forgotScreen = "/ForgotScreen";
  static const String roleScreen = "/RoleScreen";
  static const String optScreen = "/OptScreen";
  static const String resetPasswordScreen = "/ResetPasswordScreen";
  static const String enableLocationScreen = "/EnableLocationScreen";
  static const String neighborBottomNavBar = "/NeighborBottomNavBar";
  static const String neighborHubSearchScreen = "/NeighborHubSearchScreen";
  static const String serviceDetailsScreen = "/ServiceDetailsScreen";
  static const String notificationScreen = "/NotificationScreen";
  static const String hubHomeScreen = "/HubHomeScreen";



  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () =>  OnboardingScreen()),
    GetPage(name: signUpScreen, page: () =>  SignUpScreen()),
    GetPage(name: logInScreen, page: () =>  LogInScreen()),
    GetPage(name: forgotScreen, page: () =>  ForgotScreen()),
    GetPage(name: roleScreen, page: () =>  RoleScreen()),
    GetPage(name: optScreen, page: () =>  OptScreen()),
    GetPage(name: resetPasswordScreen, page: () =>  ResetPasswordScreen()),
    GetPage(name: enableLocationScreen, page: () =>  EnableLocationScreen()),
    GetPage(name: neighborBottomNavBar, page: () =>  NeighborBottomNavBar()),
    GetPage(name: neighborHubSearchScreen, page: () =>  NeighborHubSearchScreen()),
    GetPage(name: serviceDetailsScreen, page: () =>  ServiceDetailsScreen()),
    GetPage(name: notificationScreen, page: () =>  NotificationScreen()),
    GetPage(name: hubHomeScreen, page: () =>  HubHomeScreen()),

  ];
}
