import 'package:hive_flutter/hive_flutter.dart';

class LocalDB {
  static Future saveString(String key, String value) async {
    var box = Hive.box("mainBox");
    return box.put(key, value);
  }

  static String getString(String key) {
    var box = Hive.box("mainBox");
    String value = "";
    if (box.containsKey(key)) {
      value = box.get(key);
    }
    return value;
  }

  static Future removeString(String value) async {
    var box = Hive.box("mainBox");
    return box.delete(value);
  }

  // static Future saveJson(String key, Map<String, dynamic> value) async {
  //   var box = Hive.box("mainBox");
  //   JsonEncoder encoder = const JsonEncoder.withIndent(' ');
  //   return box.put(key, encoder.convert(value));
  // }

  // static Map<String, dynamic> getJson(String key) {
  //   var box = Hive.box("mainBox");
  //   Map<String, dynamic> value = {};
  //   if (box.containsKey(key)) {
  //     value = const JsonDecoder().convert(box.get(key));
  //   }
  //   return value;
  // }

  // static Future<void> removeJson(String key) {
  //   var box = Hive.box("mainBox");
  //   return box.delete(key);
  // }

  // static Future saveList(String key, String value) async {
  //   var box = await Hive.openBox('mainBox');
  //   List newValue = [];
  //   newValue.addAll(getList("WaitingBooking"));
  //   newValue.add(value);
  //   await box.put(key, newValue);
  // }

  // static List getList(String key) {
  //   var box = Hive.box("mainBox");
  //   List value = [];
  //   if (box.containsKey(key)) {
  //     value = box.get(key);
  //   }
  //   return value;
  // }

  // static Future removeListdata(String key, String value) async {
  //   var box = await Hive.openBox('mainBox');
  //   List storedIds = box.get('WaitingBooking', defaultValue: []);
  //   storedIds.remove(value);
  //   await box.put('WaitingBooking', storedIds);
  // }

  // static Future cleanListdata() async {
  //   var box = Hive.box("mainBox");
  //   box.put("WaitingBooking", []);
  // }

  static Future cleanBoxdata() async {
    var box = Hive.box("mainBox");
    box.clear();
    // box.put("WaitingBooking", []);
  }
}
