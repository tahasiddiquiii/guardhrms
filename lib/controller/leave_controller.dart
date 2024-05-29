import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/request_leave_model.dart';
import '../retrofit/network/api_services.dart';

class LeaveController extends GetxController {
  RxBool isLoading = false.obs;

  RequestLeaveModel? _requestLeaveModel;
  RequestLeaveModel? get requestLeaveModel => _requestLeaveModel;

  Future<RequestLeaveModel?> requestLeave(
    BuildContext context,
    String fromDate,
    String toDate,
    String reason,
  ) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().postLeaveRequest({
        "fromDate": fromDate,
        "toDate": toDate,
        "reason": reason,
      });

      _requestLeaveModel = RequestLeaveModel.fromJson(response);

      if (requestLeaveModel!.status == 200) {
        isLoading.value = false;

        return requestLeaveModel;
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
