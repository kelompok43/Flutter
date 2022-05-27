import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isHidden = true;

  bool get isHidden => _isHidden;
  set isHidden(bool newValue) {
    _isHidden = newValue;
    notifyListeners();
  }
}
