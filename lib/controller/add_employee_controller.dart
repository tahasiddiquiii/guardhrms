import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/add_employee_model.dart';
import '../retrofit/network/api_services.dart';

class AddEmployeeController extends GetxController {
  RxBool isLoading = false.obs;

  AddEmployeeModel? _addEmployeeModel;
  AddEmployeeModel? get addEmployeeModel => _addEmployeeModel;

  Future<AddEmployeeModel?> addNewEmployee(
    BuildContext context,
    String mobileNumber,
    String userType,
    String fullName,
    String fatherHusbandName,
    String email,
    String aadhaar,
    String bankAccount,
    String ifscCode,
  ) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().postaddEmployee({
        "mobileNumber": mobileNumber,
        "userType": userType,
        "fullName": fullName,
        "fatherHusbandName": fatherHusbandName,
        "email": email,
        "aadhaar": aadhaar,
        "bankAccount": bankAccount,
        "ifscCode": ifscCode,
      });

      _addEmployeeModel = AddEmployeeModel.fromJson(response);

      if (addEmployeeModel!.status == 200) {
        isLoading.value = false;

        return addEmployeeModel;
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
