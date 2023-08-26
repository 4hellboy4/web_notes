import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObsecuredPassword = false;

  bool get isObsecuredPassword => _isObsecuredPassword;

  void obsecurePassword() {
    _isObsecuredPassword = !_isObsecuredPassword;
    notifyListeners();
  }
}
