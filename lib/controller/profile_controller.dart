import 'package:get/get.dart';

import '../models/profile_detail_model.dart';
import '../retrofit/network/api_services.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

  ProfileDetailsModel? _profileDetailsModel;
  ProfileDetailsModel? get profileDetailsModel => _profileDetailsModel;

  getProfileDetails() async {
    isLoading.value = true;
    try {
      var response = await ApiServices().getUserProfile();

      _profileDetailsModel = ProfileDetailsModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
