import 'package:flutter/cupertino.dart';

class RegisterViewModel extends ChangeNotifier{
  var isHidden = false;
  void obscureText(bool isHidden){
    isHidden != isHidden;
    notifyListeners();
  }
}