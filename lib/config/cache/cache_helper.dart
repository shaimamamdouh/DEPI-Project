import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences; //declare the variable

  static init() async {
    _sharedPreferences =
        await SharedPreferences.getInstance(); //initialize the variable
  }


   //save data to shared preferences
  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
    if (value is List<String>) {
      return await _sharedPreferences.setStringList(key, value);
    }
    return false;
  }
   


    //get data from shared preferences
  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }



    //remove data from shared preferences
  static Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }


     //clear all data from shared preferences
  static Future<bool> clearData() async {
    return await _sharedPreferences.clear();
  }
}
