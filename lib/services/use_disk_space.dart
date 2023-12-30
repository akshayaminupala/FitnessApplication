import 'package:shared_preferences/shared_preferences.dart';

class UseDisk {
  static Future<String> readData(key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey(key)) {
      final result = _prefs.getString(key);
      return result;
    } else {
      return "no-level-selected";
    }
  }

  static Future<void> writeData(key, value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final result = _prefs.getString(key);
    if (result != value) {
      await _prefs.setString(key, value);
    }
  }
}
