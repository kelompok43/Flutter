import 'package:flutter/cupertino.dart';

class RegisterViewModel extends ChangeNotifier{
  bool _passIsHidden = false;
  bool get passIsHidden => _passIsHidden;
  set passisHidden(bool newValue) {
    _passIsHidden = newValue;
    notifyListeners();
  }
  bool _confirmPassIsHidden = false;
  bool get confirmPassIsHidden => _confirmPassIsHidden;
  set confirmPassIsHidden(bool newValue) {
    _confirmPassIsHidden = newValue;
    notifyListeners();
  }
}