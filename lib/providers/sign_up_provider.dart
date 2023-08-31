import 'package:flutter/material.dart';
import 'package:notes_web/shared_preferences/user_pref.dart';

class SignUpProvider extends ChangeNotifier {
  String _uid = "";
  String _email = "";
  bool _isSignedUp = false;

  void signIn() {
    _isSignedUp = true;
    UserInfoDb().singIn;
    notifyListeners();
  }

  void signOut() {
    _isSignedUp = false;
    UserInfoDb().singOut();
    UserInfoDb().setInfo("uid", "");
    UserInfoDb().setInfo("email", "");
    notifyListeners();
  }

  void setInfo(String uid, String email) {
    _uid = uid;
    _email = email;
    UserInfoDb().setInfo("uid", _uid);
    UserInfoDb().setInfo("email", _email);
    notifyListeners();
  }

  bool isAuthenticated() {
    return _isSignedUp;
  }

  String get uid => _uid;
  String get email => _email;
  bool get isSignedUp => _isSignedUp;
}
