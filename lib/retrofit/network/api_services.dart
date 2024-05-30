import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../local/local_services.dart';
import 'api_endpoints.dart';
import '../../retrofit/network/dio_client.dart';

class ApiServices {
  DioClient dio = DioClient();

  var token = LocalServices.getToken();

  login(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.loginUrl,
        data: jsonEncode(data),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  verifyOtp(dynamic data, String loginId) async {
    try {
      var response = await dio.post(
        "${AppApiEndpoints.verifyOtpUrl}$loginId",
        data: jsonEncode(data),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  resendOtp(String loginId) async {
    try {
      var response = await dio.post(
        "${AppApiEndpoints.resendOtpUrl}$loginId",
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  postLeaveRequest(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.leaveRequestUrl,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response;
    } catch (error) {
      // Handle errors
      print("Error updating user profile: $error");
      rethrow;
    }
  }

  postaddEmployee(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.addUserUrl,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response;
    } catch (error) {
      // Handle errors
      print("Error updating user profile: $error");
      rethrow;
    }
  }

  getUserProfile() async {
    try {
      var response = await dio.get(
        AppApiEndpoints.getUserProfileUrl,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  postCheckIn(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.checkInUrl,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response;
    } catch (error) {
      // Handle errors
      print("Error updating user profile: $error");
      rethrow;
    }
  }

  postCheckOut(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.checkOutUrl,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response;
    } catch (error) {
      // Handle errors
      print("Error updating user profile: $error");
      rethrow;
    }
  }

  putRequestRegularization(dynamic data, attendanceId) async {
    try {
      var response = await dio.put(
        "${AppApiEndpoints.regularizationRequestUrl}$attendanceId",
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response;
    } catch (error) {
      // Handle errors
      print("Error updating user profile: $error");
      rethrow;
    }
  }

  getSiteVisitListReport() async {
    try {
      var response = await dio.get(
        AppApiEndpoints.getSiteVisitListReport,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

//   logout() async {
//     try {
//       var response = await dio.post(
//         AppApiEndpoints.logout,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       return response;
//     } catch (error) {
//       // Handle errors
//       print("Error updating user profile: $error");
//       rethrow;
//     }
//   }

//   getUserProfile() async {
//     try {
//       var response = await dio.get(
//         AppApiEndpoints.getUserProfile,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   updateUserProfile(dynamic data) async {
//     try {
//       var response = await dio.post(
//         AppApiEndpoints.updateUserProfile,
//         data: data,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       return response;
//     } catch (error) {
//       // Handle errors
//       print("Error updating user profile: $error");
//       rethrow;
//     }
//   }

//   Future getTestData() async {
//     try {
//       var response = await dio.get(
//         AppApiEndpoints.testapi,
//         // queryParameters: {"is_active": isActive},
//       );
//       if (response != null) {
//         // Programme responseModel = Programme.fromJson(response);
//         // return responseModel;
//         return response;
//       }
//     } catch (error) {
//       print("Error from test image");
//       rethrow;
//     }
//     return null;
//   }

//   getBookingRequest(int perPage, int page) async {
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getBookingRequest}$perPage&page=$page",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   getBookingRequestDetails(String id) async {
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getBookingRequestDetails}$id/details",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       print("${AppApiEndpoints.getBookingRequestDetails}$id/details");
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       print("OAOAOOAOAOAOOAOA");
//       print("${AppApiEndpoints.getBookingRequestDetails}$id/details");
//       rethrow;
//     }
//     return null;
//   }

//   updateBookingStatus(dynamic data) async {
//     try {
//       var response = await dio.post(
//         AppApiEndpoints.updateBookingStatus,
//         data: data,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       // if (response.status == 200) {
//       //   await getBookingRequest(4, 1);
//       // }
//       return response;
//     } catch (error) {
//       // Handle errors
//       print("Error updating user profile: $error");
//       rethrow;
//     }
//   }

//   getTotalOngoingBooking(int perPage, int page,
//       {List? car,
//       List? category,
//       List? rental,
//       String? startdate,
//       String? endDate}) async {
//     String filterCar = "";
//     String filterRental = "";
//     String filtercategory = "";
//     if (car != null) {
//       filterCar = car.join(', ');
//     }
//     if (category != null) {
//       filtercategory = category.join(', ');
//     }

//     if (rental != null) {
//       filterRental = rental.join(', ');
//     }
//     startdate ??= "";
//     endDate ??= "";
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getOngoingBooking}per_page=$perPage&page=$page&car_category=$filtercategory&rental_type=$filterRental&car_name=$filterCar&start_date=$startdate&end_date=$endDate",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   getTotalNewBooking(int perPage, int page,
//       {List? car,
//       List? category,
//       List? rental,
//       String? startdate,
//       String? endDate}) async {
//     String filterCar = "";
//     String filterRental = "";
//     String filtercategory = "";
//     if (car != null) {
//       filterCar = car.join(', ');
//     }
//     if (category != null) {
//       filtercategory = category.join(', ');
//     }

//     if (rental != null) {
//       filterRental = rental.join(', ');
//     }
//     startdate ??= "";
//     endDate ??= "";

//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getNewBooking}per_page=$perPage&page=$page&car_category=$filtercategory&rental_type=$filterRental&car_name=$filterCar&start_date=$startdate&end_date=$endDate",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   getTotalCompletedBooking(int perPage, int page,
//       {List? car,
//       List? category,
//       List? rental,
//       String? startdate,
//       String? endDate}) async {
//     String filterCar = "";
//     String filterRental = "";
//     String filtercategory = "";
//     if (car != null) {
//       filterCar = car.join(', ');
//     }
//     if (category != null) {
//       filtercategory = category.join(', ');
//     }

//     if (rental != null) {
//       filterRental = rental.join(', ');
//     }
//     startdate ??= "";
//     endDate ??= "";
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getCompletedBooking}per_page=$perPage&page=$page&car_category=$filtercategory&rental_type=$filterRental&car_name=$filterCar&start_date=$startdate&end_date=$endDate",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   filterCarList() async {
//     try {
//       var response = await dio.get(
//         AppApiEndpoints.carListFilter,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   filterCategoryList() async {
//     try {
//       var response = await dio.get(
//         AppApiEndpoints.categoryFilter,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   filterRentalList() async {
//     try {
//       var response = await dio.get(
//         AppApiEndpoints.rentalFilter,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   getVendorCarList(int perPage, int page) async {
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getVendorCarList}$perPage&page=$page",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   updateVendorCar(
//     // dynamic data,
//     int carId,
//     int isAvailable,
//     int quantity,
//   ) async {
//     try {
//       var response = await dio.put(
//         "${AppApiEndpoints.updateVendorCar}$carId/update",
//         // data: jsonEncode(data),
//         data: {"is_available": isAvailable, "quantity": quantity},
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       return response;
//     } catch (error) {
//       // Handle errors
//       print("Error updating user profile: $error");
//       rethrow;
//     }
//   }

//   getCarList(int perPage, int page) async {
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getCarList}$perPage&page=$page",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   getPendingReview(int perPage, int page,List? car,
//       List? category,
//       List? rental,) async {
//             String filterCar = "";
//     String filterRental = "";
//     String filtercategory = "";
//     if (car != null) {
//       filterCar = car.join(', ');
//     }
//     if (category != null) {
//       filtercategory = category.join(', ');
//     }

//     if (rental != null) {
//       filterRental = rental.join(', ');
//     }
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.pendingReview}?per_page=$perPage&page=$page&car_category=$filtercategory&rental_type=$filterRental&car_name=$filterCar",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   // getSales(
//   //   int type,
//   // ) async {
//   //   try {
//   //     var response = await dio.get(
//   //       "${AppApiEndpoints.getSales}$type",
//   //       options: Options(headers: {'Authorization': 'Bearer $token'}),
//   //     );
//   //     if (response != null) {
//   //       return response;
//   //     }
//   //   } catch (error) {
//   //     rethrow;
//   //   }
//   //   return null;
//   // }

//   getSales({
//     String? type,
//     String? startDate,
//     String? endDate,
//   }) async {
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getSales}start_date=$startDate&end_date=$endDate&type=$type",
//         // "${AppApiEndpoints.getSales}$type&start_date=2024-05-01&end_date=2024-05-31",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   getRecentSales({
//     String? perPage,
//     String? startDate,
//     String? endDate,
//   }) async {
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getRecentSales}start_date=$startDate&end_date=$endDate&per_page=$perPage",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   getDocumentsImages(String customerId, String imageName) async {
//     try {
//       var response = await dio.get(
//         "${AppApiEndpoints.getDocumentImages}/$customerId/$imageName",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

//   updateDocumentStatus(int documentId, int status) async {
//     try {
//       var response = await dio.put(
//         "${AppApiEndpoints.upadateDocumentStatus}$documentId",
//         data: {"status": status},
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//       print("P=ggggggggggggg");
//       print(response);
//     } catch (error) {
//       print("hhhhhhhhhhhhhh");
//       throw Exception(error);
//     }
//     return null;
//   }

//   updateCarDeliveryStatus(dynamic data) async {
//     try {
//       var response = await dio.post(
//         AppApiEndpoints.upadateCarDeliveryStatus,
//         data: data,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       // if (response.status == 200) {
//       //   await getBookingRequest(4, 1);
//       // }
//       print("Printing Car Deliver response");
//       print(response);
//       return response;
//     } catch (error) {
//       // Handle errors
//       print("Error updating user profile: $error");
//       rethrow;
//     }
//   }

//   rejectCarDeliveryStatus(dynamic data) async {
//     try {
//       var response = await dio.post(
//         AppApiEndpoints.upadateCarDeliveryStatus,
//         data: data,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       print("Printing Car Deliver response");
//       print(response);
//       return response;
//     } catch (error) {
//       print("Error updating user profile: $error");
//       rethrow;
//     }
//   }

//     getDashboardData() async {
//     try {
//       var response = await dio.get(
//         AppApiEndpoints.getDashboardData,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

// getBokingCount() async {
//     try {
//       var response = await dio.get(
//         AppApiEndpoints.getBookingCount,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       if (response != null) {
//         return response;
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return null;
//   }

  // Future<SignInResponseModel?> signIn(SignInRequestModel signInRequestModel) async {
  //   try {
  //     var response = await dio.post(
  //       AppApiEndpoints.loginUrl,
  //       data: signInRequestModel.toJson(),
  //     );

  //     if (response != null) {
  //       return SignInResponseModel.fromJson(response);
  //     }
  //     return null;
  //   } catch (error, stacktrace) {
  //     rethrow;
  //   }
  // }

  // updateUser(String imagePath) async {
  //   try {
  //     var response = await dio.post(
  //       AppApiEndpoints.updateUser,
  //       data: {
  //         'profile_pic': imagePath,
  //       },
  //     );

  //     if (response != null) {
  //       return response;
  //     }
  //     return "response is Null";
  //   } catch (error, stacktrace) {
  //     log("Error in Updating User :: " +
  //         error.toString() +
  //         "\nStacktrace :: " +
  //         stacktrace.toString());
  //     rethrow;
  //   }
  // }

  // Future<ResponseCommonModel?> revokeAndProvideAccess(
  //     String userId, bool is_revoke) async {
  //   try {
  //     var response = await dio.post(
  //       AppApiEndpoints.revokeAccess,
  //       data: {"user_id": "$userId", "is_rovoke": is_revoke},
  //     );
  //     if (response != null) {
  //       ResponseCommonModel responseModel =
  //           ResponseCommonModel.fromJson(response);
  //       return responseModel;
  //     }
  //   } catch (error, stacktrace) {
  //     log("Error while revoking access :: " +
  //         error.toString() +
  //         "\nStacktrace :: " +
  //         stacktrace.toString());
  //     rethrow;
  //   }
  //   return null;
  // }
}
