
import 'package:droke/views/screens/auth/login/login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../views/screens/auth/enable_location/enable_location_screen.dart';
import '../../views/screens/auth/forgot/forgot_screen.dart';
import '../../views/screens/auth/otp/opt_screen.dart';
import '../../views/screens/auth/reset/reset_password_screen.dart';
import '../../views/screens/auth/role/role_screen.dart';
import '../../views/screens/auth/sing_up/sign_up_screen.dart';
import '../../views/screens/freelancer/freelancer_bottom_nav_bar/freelancer_bottom_nav_bar.dart';
import '../../views/screens/freelancer/freelancer_gig/set_schedule_screen.dart';
import '../../views/screens/freelancer/freelancer_home/freelancer_hub_search_screen.dart';
import '../../views/screens/freelancer/service/service_screen.dart';
import '../../views/screens/message/message_screen.dart';
import '../../views/screens/neighbor/hub/application_screen.dart';
import '../../views/screens/neighbor/hub/freelancer_profile_screen.dart';
import '../../views/screens/neighbor/hub/hub_home_screen.dart';
import '../../views/screens/neighbor/hub/invite_screen.dart';
import '../../views/screens/neighbor/hub/invited_request_screen.dart';
import '../../views/screens/neighbor/hub/join_request_screen.dart';
import '../../views/screens/neighbor/hub/member_screen.dart';
import '../../views/screens/neighbor/hub/pull_screen.dart';
import '../../views/screens/neighbor/hub/schedule_screen.dart';
import '../../views/screens/neighbor/hub/task_sreen.dart';
import '../../views/screens/neighbor/neighbor_bottom_nav_bar/neighbor_bottom_nav_bar.dart';
import '../../views/screens/neighbor/neighbor_hub_search_screen/neighbor_hub_search_screen.dart';
import '../../views/screens/neighbor/payment/payment_details_screen.dart';
import '../../views/screens/neighbor/payment/payment_screen.dart';
import '../../views/screens/neighbor/service_details/service_details_screen.dart';
import '../../views/screens/notification/notification_screen.dart';
import '../../views/screens/onboarding/onboarding_screen.dart';
import '../../views/screens/profile/edit_profile_screen.dart';
import '../../views/screens/profile/profile_information_screen.dart';
import '../../views/screens/profile/wallet_screen.dart';
import '../../views/screens/setting/change_password_screen.dart';
import '../../views/screens/setting/privacy_policy_all_screen.dart';
import '../../views/screens/setting/setting_screen.dart';
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
  static const String pullScreen = "/PullScreen";
  static const String applicationScreen = "/ApplicationScreen";
  static const String memberScreen = "/MemberScreen";
  static const String messageScreen = "/MessageScreen";
  static const String paymentScreen = "/PaymentScreen";
  static const String paymentDetailsScreen = "/PaymentDetailsScreen";
  static const String taskScreen = "/TaskScreen";
  static const String inviteScreen = "/InviteScreen";
  static const String scheduleScreen = "/ScheduleScreen";
  static const String profileInformationScreen = "/ProfileInformationScreen";
  static const String editProfileScreen = "/EditProfileScreen";
  static const String settingScreen = "/SettingScreen";
  static const String privacyPolicyAllScreen = "/PrivacyPolicyAllScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String freelancerBottomNavBar = "/FreelancerBottomNavBar";
  static const String setScheduleScreen = "/SetScheduleScreen";
  static const String serviceScreen = "/ServiceScreen";
  static const String walletScreen = "/WalletScreen";
  static const String joinRequestScreen = "/JoinRequestScreen";
  static const String invitedRequestScreen = "/InvitedRequestScreen";
  static const String freelancerHubSearchScreen = "/FreelancerHubSearchScreen";
  static const String freelancerProfileScreen = "/FreelancerProfileScreen";



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
    GetPage(name: pullScreen, page: () =>  PullScreen()),
    GetPage(name: applicationScreen, page: () =>  ApplicationScreen()),
    GetPage(name: memberScreen, page: () =>  MemberScreen()),
    GetPage(name: messageScreen, page: () =>  MessageScreen()),
    GetPage(name: paymentScreen, page: () =>  PaymentScreen()),
    GetPage(name: paymentDetailsScreen, page: () =>  PaymentDetailsScreen()),
    GetPage(name: taskScreen, page: () =>  TaskScreen()),
    GetPage(name: inviteScreen, page: () =>  InviteScreen()),
    GetPage(name: scheduleScreen, page: () =>  ScheduleScreen()),
    GetPage(name: profileInformationScreen, page: () =>  ProfileInformationScreen()),
    GetPage(name: editProfileScreen, page: () =>  EditProfileScreen()),
    GetPage(name: settingScreen, page: () =>  SettingScreen()),
    GetPage(name: privacyPolicyAllScreen, page: () =>  PrivacyPolicyAllScreen()),
    GetPage(name: changePasswordScreen, page: () =>  ChangePasswordScreen()),
    GetPage(name: freelancerBottomNavBar, page: () =>  FreelancerBottomNavBar()),
    GetPage(name: setScheduleScreen, page: () =>  SetScheduleScreen()),
    GetPage(name: serviceScreen, page: () =>  ServiceScreen()),
    GetPage(name: walletScreen, page: () =>  WalletScreen()),
    GetPage(name: joinRequestScreen, page: () =>  JoinRequestScreen()),
    GetPage(name: invitedRequestScreen, page: () =>  InvitedRequestScreen()),
    GetPage(name: freelancerHubSearchScreen, page: () =>  FreelancerHubSearchScreen()),
    GetPage(name: freelancerProfileScreen, page: () =>  FreelancerProfileScreen()),
  ];
}
