import 'package:flutter/material.dart';
import 'package:notes_web/shared_preferences/user_pref.dart';

class SignUpProvider extends ChangeNotifier {
  String _uid = "";
  String _email = "";

  void setInfo(String uid, String email) {
    _uid = uid;
    _email = email;
    UserInfoDb().setInfo("uid", _uid);
    UserInfoDb().setInfo("email", _email);
    notifyListeners();
  }

  String get uid => _uid;
  String get email => _email;
}
