// import 'package:uae_driving/models/auth/auth_model.dart';
// import 'package:uae_driving/retrofit/local/local_db.dart';

// class LocalServices {
//   static String getToken() {
//     return LocalDB.getString("token");
//   }

//   static Future removeToken() {
//     return LocalDB.removeString("token");
//   }


//   static bool isUserLoggedIn() {
//     if (LocalDB.getString("token").isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   static AuthModelResponse getUserInfo() {
//     return AuthModelResponse.fromJson(LocalDB.getJson("userInfo"));
//   }

//   static Future<void> removeUserInfo(){
//     return LocalDB.removeJson("userInfo");
//   }
// }
