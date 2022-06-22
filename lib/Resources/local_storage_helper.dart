import 'dart:convert';

import 'package:interviewtask/Models/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalStorageManger {
  
  final String user = "user";

  Future setUserData(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    pref.setString(this.user, userJson);
  }

  Future<UserModel?> getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(this.user) != null) {
      var userMap = jsonDecode(pref.getString(this.user)!);
      var user = UserModel.fromJson(userMap);
      return user;
    } else {
      return null;
    }
  }

  Future clearUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(this.user);
  }
}