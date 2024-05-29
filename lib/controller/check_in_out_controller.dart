import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_app/models/check_in_model.dart';

import '../models/check_out_model.dart';
import '../retrofit/network/api_services.dart';

class CheckInOutController extends GetxController {
  RxBool isLoading = false.obs;

  CheckInModel? _checkInModel;
  CheckInModel? get checkInModel => _checkInModel;

  CheckOutModel? _checkOutModel;
  CheckOutModel? get checkOutModel => _checkOutModel;

  Future<CheckInModel?> checkIn(
    BuildContext context,
    String shiftInNumber,
    bool checkInFaceMatch,
    String checkInQrLocation,
    String checkInLocation,
  ) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().postCheckIn({
        "shiftInNumber": shiftInNumber,
        "checkInFaceMatch": checkInFaceMatch,
        "checkInQrLocation": checkInQrLocation,
        "checkInLocation": checkInLocation,
      });

      _checkInModel = CheckInModel.fromJson(response);

      if (checkInModel!.sucess == true) {
        isLoading.value = false;

        return checkInModel;
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

  Future<CheckOutModel?> checkOut(
    BuildContext context,
    bool checkOutFaceMatch,
    String checkOutLocation,
    String checkOutQrLocation,
  ) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().postCheckOut({
        "checkOutFaceMatch": checkOutFaceMatch,
        "checkOutLocation": checkOutLocation,
        "checkOutQrLocation": checkOutQrLocation
      });

      _checkOutModel = CheckOutModel.fromJson(response);

      if (checkOutModel!.sucess == true) {
        isLoading.value = false;

        return checkOutModel;
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
