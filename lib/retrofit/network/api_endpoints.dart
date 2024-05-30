class AppApiEndpoints {
  //Base URL:
  static const String baseUrl = "https://royal-security-backend.vercel.app";

  //Login Module
  static const String _authResource = "/api/v1/";
  static const String loginUrl = "$baseUrl${_authResource}app/signin";
  static const String verifyOtpUrl = "$baseUrl${_authResource}app/verifyOTP/";
  static const String resendOtpUrl = "$baseUrl${_authResource}app/resendOtp/";

  // Regularization Module
  static const String regularizationRequestUrl =
      "$baseUrl${_authResource}requestForRegularization/";

  // LEAVE request
  static const String leaveRequestUrl =
      "$baseUrl${_authResource}app/applyLeave";

  // Checkin Checkout
  static const String checkInUrl = "$baseUrl${_authResource}app/checkIn";
  static const String checkOutUrl = "$baseUrl${_authResource}app/checkOut";

  // Add User
  static const String addUserUrl = "$baseUrl${_authResource}admin/addUser";

  // profile details
  static const String getUserProfileUrl =
      "$baseUrl${_authResource}app/getProfile";

// site visir list report
  static const String getSiteVisitListReport =
      "$baseUrl${_authResource}admin/getAllSite";
}
