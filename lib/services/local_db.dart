import 'package:shared_preferences/shared_preferences.dart';

class LocaleDB {
  static String userCollege = 'college';
  static String userBranch = 'branch';
  static String userStd = 'std';
  static String userDiv = 'div';

  static Future<bool> saveUserCollege(String college) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userCollege, college);
  }

  static Future<String> getUserCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userCollege);
  }

  static Future<bool> saveUserBranch(String branch) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userBranch, branch);
  }

  static Future<String> getUserBranch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userBranch);
  }

  static Future<bool> saveUserStd(String std) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userStd, std);
  }

  static Future<String> getUserStd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userStd);
  }

  static Future<bool> saveUserDiv(String div) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userDiv, div);
  }

  static Future<String> getUserDiv() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userDiv);
  }
}
