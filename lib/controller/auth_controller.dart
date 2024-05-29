import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_app/retrofit/local/local_services.dart';
import 'package:security_app/view/verify_otp/verifyOtp_screen1.dart';

import '../models/auth_model.dart';
import '../models/resend_otp_model.dart';
import '../models/verify_otp_model.dart';
import '../retrofit/local/local_db.dart';
import '../retrofit/network/api_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoginFail = false.obs;

  AuthModel? _authModel;
  AuthModel? get authModel => _authModel;

  VerifyOtpModel? _verifyOtpModel;
  VerifyOtpModel? get verifyOtpModel => _verifyOtpModel;

  ResendOtpModel? _resendOtpModel;
  ResendOtpModel? get resendOtpModel => _resendOtpModel;

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

  Future<VerifyOtpModel?> verifyOtp(
    BuildContext context,
    String otp,
  ) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().verifyOtp({
        "otp": otp,
      }, authModel!.id!);

      _verifyOtpModel = VerifyOtpModel.fromJson(response);

      if (verifyOtpModel!.status == 200) {
        LocalDB.saveString("token", verifyOtpModel!.data!);

        isLoading.value = false;

        return verifyOtpModel;
      } else {
        isLoading.value = false;

        return null;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
      return null;
    }
  }

  Future<ResendOtpModel?> resendOtp() async {
    isLoading.value = true;

    try {
      var response = await ApiServices().resendOtp(authModel!.id!);

      _resendOtpModel = ResendOtpModel.fromJson(response);

      if (resendOtpModel!.message == "OTP resent successfully") {
        isLoading.value = false;

        return resendOtpModel;
      } else {
        isLoading.value = false;

        return null;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
      return null;
    }
  }
}
