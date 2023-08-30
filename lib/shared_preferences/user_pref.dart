import 'package:shared_preferences/shared_preferences.dart';

class UserInfoDb {
  SharedPreferences? prefs;

  void setInfo(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(key, value);
  }

  Future<String?> getInfo(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.containsKey(key) ? prefs!.getString(key) : "";
  }

  void singIn() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool("auth", true);
  }

  void singOut() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool("auth", false);
    setInfo("uid", "");
    setInfo("email", "");
  }

  Future<bool?> isSingedUp() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool("auth");
  }
}
