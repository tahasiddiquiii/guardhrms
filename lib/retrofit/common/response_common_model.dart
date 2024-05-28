import 'dart:developer';

/// this model will be used in each and every apis
/// all common fields are here, i.e status, message, link, meta, exceptions.
/// so in every api just add this model

class ResponseCommonModel {
  bool? status;
  String? message;
  String? exceptionMessage;

  ResponseCommonModel({
    this.status,
    this.message,
    this.exceptionMessage,
  });

  /// pass parent json directly here, instead of passing from data
  ResponseCommonModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    message = json['message'] ?? "";

    try {
      if (json['errors'] != null) {
        // log("Data runtime type ::: " + (jsonDecode(json['data']).runtimeType is Map).toString());
        if (json['errors'].runtimeType == List &&
            (json['errors'] as List).isNotEmpty) {
          if (json['errors'][0]['message'] != null) {
            exceptionMessage = json['errors'][0]['message'];
          }
        } else if (json['errors'].runtimeType is Map) {
          if (json['errors']['message'] != null) {
            exceptionMessage = json['errors']['message'];
          }
        } else if (json['errors'] == String) {
          exceptionMessage = json['errors'];
        }
      }
    } catch (error) {
      log("Error in converting json to response common model:: $error");
    }
  }
}
