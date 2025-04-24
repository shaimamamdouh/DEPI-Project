import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences; //declare the variable
  static final secureStorage = FlutterSecureStorage();


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

  //save data to secure storage
  static Future<void> setSecureData({
    required String key,
    required String value,
  }) async {
    await secureStorage.write(key: key, value: value);
  }

  //get data from secure storage
  static Future<String?> getSecureData({required String key}) async {
    return await secureStorage.read(key: key);
  }

  //remove data from secure storage
  static Future<void> removeSecureData({required String key}) async {
    await secureStorage.delete(key: key);
  }

  //clear all data from secure storage
  static Future<void> clearSecureData() async {
    await secureStorage.deleteAll();
  }
}
