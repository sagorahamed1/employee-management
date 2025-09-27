class ApiConstants{


  static const String baseUrl = "http://10.10.11.38:8080/api/v1";
  static const String imageBaseUrl = "http://10.10.11.38:8080";
  static const String socketBaseUrl = "http://10.10.11.38:8080";


  static const String signUpEndPoint = "/auth/register";
  static const String signInEndPoint = "/auth/login";
  static const String accountDelete = "/users/delete";
  static const String verifyEmailEndPoint = "/auth/verify-otp";
  static const String updateMoreInformationEndPoint = "/employee/update-employee-profile";
  static const String forgotPasswordPoint = "/auth/forgot-password";
  static const String resendOtpEndPoint = "/auth/resend-otp";
  static const String setPasswordEndPoint = "/auth/reset-password";
  static const String changePassword = "/auth/change-password";
  static const String profileUpdate = "/auth/profile-update";


  static const String services = "/services";
  static const String servicesDetails = "/services/details";
  static const String deshBoard = "/hubs/dashboard-neighbor";
  static const String hubAdd = "/hubs/add";
  static const String gigAdd = "/gigs/add";
  static const String gig = "/gigs";
  static const String joinHub = "/hubs/join-request";
  static const String freelancerApply = "/hubs/apply";
  static const String invite = "/hubs/invite-member";
  static const String notification = "/notification";
  static const String myHubs = "/hubs/neighbor-hubs";
  static const String freelancerAssignedHub = "/hubs/assigned";
  static const String nearNeighbors = "/hubs/view-near-members";
  static const String member = "/hubs/view-members";
  static const String getJoin = "/hubs/join-request";
  static const String invitedRequest = "/hubs/hubs-invite-list";
  static const String application = "/hubs/applications";
  static const String poll = "/hubs/poll";
  static const String startHub = "/hubs/start-poll";
  static const String inviteAcceptOrReject = "/hubs/update-request";


  static const String hub = "/hubs/hub-view-near?latitude=23.790934543802027&longitude=90.4139501156808";
  static const String freelancerHub = "/hubs/view-near?latitude=23.790934543802027&longitude=90.4139501156808";


}