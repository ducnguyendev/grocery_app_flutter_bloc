import 'package:shared_preferences/shared_preferences.dart';

class LocalPref extends Pref {
  @override
  Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  @override
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    return Future.value(value ?? "");
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

class MemoryPref extends Pref {
  Map<String, Object> memoryMap = <String, Object>{};

  @override
  Future<String> getString(String key) {
    final value = memoryMap[key] as String?;
    return Future.value(value ?? "");
  }

  @override
  Future<bool> saveString(String key, String value) async {
    memoryMap[key] = value;
    return Future.value(true);
  }

  @override
  Future<void> clear() async {
    memoryMap = <String, Object>{};
  }
}

abstract class Pref {
  Future<bool> saveString(String key, String value);

  Future<String> getString(String key);

  Future<void> clear();
}

class DATA_CONST {
  static const String CACHE_SHOW = "CACHE_SHOW";
  static const String CACHE_CINE = "CACHE_CINE";
  static const String CACHE_BOOK_TIME_SLOT = "CACHE_BOOK_TIME_SLOT";
  static const String CACHE_SELECTED_TIME_SLOT = "CACHE_SELECTED_TIME_SLOT";
  static const String CACHE_OTHER_TIME_SLOT = "CACHE_OTHER_TIME_SLOT";
}
