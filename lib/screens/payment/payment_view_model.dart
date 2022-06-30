import 'dart:io';

import 'package:flutter/cupertino.dart';

class PaymentViewModel extends ChangeNotifier {
  String _value = "1 Bulan";
  String _selectedValue = "1 Bulan";
  String get value => _value;
  String get selectedValue => _selectedValue;
  File? _imagePath;
  File? get imagePath => _imagePath;
  var uploadState = UploadBuktiState.initial;
  set imagePath(File? newValue) {
    _imagePath = newValue;
    notifyListeners();
  }

  void setRadio(String newValue, String newSelectedValue) {
    _value = newValue;
    _selectedValue = newSelectedValue;
    notifyListeners();
  }

  void uploadBukti() async {
    uploadState = UploadBuktiState.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    uploadState = UploadBuktiState.done;
    notifyListeners();
  }
}

enum UploadBuktiState { initial, loading, done }
