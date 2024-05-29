class AppApiEndpoints {
  //Base URL:
  static const String baseUrl = "https://royal-security-backend.vercel.app";

  //Login Module
  static const String _authResource = "/api/v1/";
  static const String loginUrl = "$baseUrl${_authResource}app/signin";
  static const String verifyOtpUrl = "$baseUrl${_authResource}app/verifyOTP/";
  static const String resendOtpUrl = "$baseUrl${_authResource}app/resendOtp/";

  // LEAVE request
  static const String leaveRequestUrl =
      "$baseUrl${_authResource}app/applyLeave";

  // Checkin Checkout
  static const String checkInUrl = "$baseUrl${_authResource}app/checkIn";
  static const String checkOutUrl = "$baseUrl${_authResource}app/checkOut";

  // profile details
  static const String getUserProfile = "$baseUrl${_authResource}app/getProfile";

  static const String updateUserProfile =
      "$baseUrl${_authResource}user/update-profile";
  static const String logout = "$baseUrl${_authResource}logout";

  //Booking request

  static const String getBookingRequest =
      "$baseUrl${_authResource}bookings/requests?per_page=";
  static const String getBookingRequestDetails =
      "$baseUrl${_authResource}bookings/";
  static const String getOngoingBooking =
      "$baseUrl${_authResource}bookings/ongoing/list?";
  static const String getNewBooking =
      "$baseUrl${_authResource}bookings/confirmed/list?";
  static const String getCompletedBooking =
      "$baseUrl${_authResource}bookings/completed/list?";
  static const String updateBookingStatus =
      "$baseUrl${_authResource}bookings/update-status";
  static const String carListFilter =
      "$baseUrl${_authResource}filters/cars/list?per_page=20&page=1";
  static const String categoryFilter =
      "$baseUrl${_authResource}filters/category/list";
  static const String rentalFilter =
      "$baseUrl${_authResource}filters/rental-type/list";
  static const String pendingReview =
      "$baseUrl${_authResource}bookings/pending-reviews";

  //Car List

  static const String getVendorCarList =
      "$baseUrl${_authResource}vendors/cars/list?per_page=";

  static const String getCarList =
      "$baseUrl${_authResource}cars/list?per_page=";

  static const String updateVendorCar = "$baseUrl${_authResource}vendors/cars/";

  // Sales
  static const String getSales = "$baseUrl${_authResource}sales/graph?";
  static const String getRecentSales = "$baseUrl${_authResource}sales/list?";

  // documents images
  static const String getDocumentImages =
      "$baseUrl${_authResource}bookings/booking-user-document";
  static const String upadateDocumentStatus =
      "$baseUrl${_authResource}bookings/update-document-status/";
  static const String upadateCarDeliveryStatus =
      "$baseUrl${_authResource}bookings/update-delivery-status";
  static const String getDashboardData =
      "$baseUrl${_authResource}dashboard/cards";
  static const String getBookingCount =
      "$baseUrl${_authResource}bookings/count";
}
