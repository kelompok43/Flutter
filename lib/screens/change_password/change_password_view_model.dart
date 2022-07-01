import 'package:flutter/material.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  bool _newPassHidden = true;
  bool get newPassHidden => _newPassHidden;
  set newPassHidden(bool newValue) {
    _newPassHidden = newValue;
    notifyListeners();
  }

  bool _confirmNewPassHidden = true;
  bool get confirmNewPassHidden => _confirmNewPassHidden;
  set confirmNewPassHidden(bool newValue) {
    _confirmNewPassHidden = newValue;
    notifyListeners();
  }
}
