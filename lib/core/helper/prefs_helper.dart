import 'dart:convert';

import 'package:noteflow/features/auth/data/models/user_model.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late SharedPreferences _prefs;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // =========================
  // User
  // =========================

  static Future<void> saveUser(Map<String, dynamic> user) async {
    await _prefs.setString(
      'user',
      jsonEncode(user),
    );
  }

  static UserEntity? getUser() {
    final user = _prefs.getString('user');

    if (user == null) {
      return null;
    }
    final ss = jsonDecode(user);
    return UserModel.fromMap(ss);
  }

  static Future<void> removeUser() async {
    await _prefs.remove('user');
  }

  // =========================
  // User ID
  // =========================

  static Future<void> saveUserId(String userId) async {
    await _prefs.setString('user_id', userId);
  }

  static String? getUserId() {
    return _prefs.getString('user_id');
  }

  static Future<void> removeUserId() async {
    await _prefs.remove('user_id');
  }

  // =========================
  // Login
  // =========================

  static Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool('is_logged_in', value);
  }

  static bool isLoggedIn() {
    return _prefs.getBool('is_logged_in') ?? false;
  }

  // =========================
  // Clear
  // =========================

  static Future<void> clear() async {
    await _prefs.clear();
  }
}
