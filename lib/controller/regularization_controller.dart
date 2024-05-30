import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/request_regularization_model.dart';
import '../retrofit/network/api_services.dart';

class RegularizationController extends GetxController {
  RxBool isLoading = false.obs;

  RequestRegularizationModel? _requestRegularizationModel;
  RequestRegularizationModel? get requestRegularizationModel =>
      _requestRegularizationModel;

  Future<RequestRegularizationModel?> requestRegularization(
    BuildContext context,
    String regularizationCheckIn,
    String regularizationCheckOut,
    String attendanceId,
  ) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().putRequestRegularization(
        {
          "regularizationCheckIn": regularizationCheckIn,
          "regularizationCheckOut": regularizationCheckOut,
        },
        attendanceId,
      );

      _requestRegularizationModel =
          RequestRegularizationModel.fromJson(response);

      if (requestRegularizationModel!.status == 200) {
        isLoading.value = false;

        return requestRegularizationModel;
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
