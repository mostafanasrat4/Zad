import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'package:zad/models/classes/user.dart';

class LocalUserData {

  /// Save [userData] to local storage
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    try {
      final jsonString = jsonEncode(userData);
      localStorage.setItem('userData', jsonString);
    } catch (e) {
      print('Error saving user data: $e');
    }
  }


  /// Load user data from local storage to be used across the app whether for fetching or presentation, saves api calls
  Future<User?> loadUserData() async {
    try {
      final jsonString = await localStorage.getItem('userData');
      if (jsonString != null) {
        User myUser = User.fromMap(jsonDecode(jsonString));
        return myUser;
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
    return null;
  }

  /// Clear local storage to be invoked with signouts or session timeouts if exists
  Future<void> clear() async {
    localStorage.clear();
  }
}