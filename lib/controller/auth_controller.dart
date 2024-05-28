import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/auth_model.dart';
import '../retrofit/network/api_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoginFail = false.obs;
  AuthModel? _authModel;
  AuthModel? get authModel => _authModel;

  Future<AuthModel?> loginApi(
      BuildContext context, String mobileNumber, String userType) async {
    isLoading.value = true;
    isLoginFail.value =
        false; // Reset the login fail status before making the request
    try {
      var response = await ApiServices().login(
        {"mobileNumber": mobileNumber, "userType": userType},
      );

      _authModel = AuthModel.fromJson(response);
      if (authModel!.status == true) {
        isLoading.value = false;
        isLoginFail.value = false; // Login was successful
        return authModel;
      } else {
        isLoading.value = false;
        isLoginFail.value = true; // Login failed
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      isLoginFail.value = true; // Login failed due to an exception
      print(e);
      return null;
    }
  }
}
