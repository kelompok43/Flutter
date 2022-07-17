import 'package:flutter/material.dart';

class AktivitasViewModel extends ChangeNotifier {
  String _selectedValue = "Terbaru";
  String get selectValue => _selectedValue;
  void setRadio(String newValue, String newSelectedValue) {
    _selectedValue = newSelectedValue;
    notifyListeners();
  }
  
}
