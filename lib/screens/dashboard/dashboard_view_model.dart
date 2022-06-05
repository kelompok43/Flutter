import 'package:flutter/cupertino.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex =>_selectedIndex;
  void update(int index){
    _selectedIndex = index;
    notifyListeners();
  }
}
