import 'package:get/get.dart';

import '../models/site_list_report_model.dart';
import '../retrofit/network/api_services.dart';

class SiteListReportController extends GetxController {
  RxBool isLoading = false.obs;

  SiteListReportModel? _siteListReportModel;
  SiteListReportModel? get siteListReportModel => _siteListReportModel;

  getSiteVisitListReport() async {
    isLoading.value = true;
    try {
      var response = await ApiServices().getSiteVisitListReport();

      _siteListReportModel = SiteListReportModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
