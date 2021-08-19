import 'package:shared_preferences/shared_preferences.dart';

import '../../error/driver_exception.dart';
import '../protocols/i_local_store_external.dart';

class SharedPreferencesDriver implements ILocalStoreExternal {
  @override
  Future<Object?>? take(String key) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (sharedPreferences.containsKey(key)) {
        return sharedPreferences.get(key);
      }
      return null;
    } catch (e) {
      throw DriverException();
    }
  }

  @override
  Future<void> save(String key, dynamic value) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (value is bool) {
        await sharedPreferences.setBool(key, value);
      }
      if (value is double) {
        await sharedPreferences.setDouble(key, value);
      }
      if (value is int) {
        await sharedPreferences.setInt(key, value);
      }
      if (value is String) {
        await sharedPreferences.setString(key, value);
      }
    } catch (e) {
      throw DriverException();
    }
  }

  @override
  Future<bool> remove(String key) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      return await sharedPreferences.remove(key);
    } catch (e) {
      throw DriverException();
    }
  }
}
