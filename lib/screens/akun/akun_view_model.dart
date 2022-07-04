import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AkunViewModel extends ChangeNotifier {
  void datePicker(
      BuildContext context, TextEditingController tglLahirCtrl) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            1980), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      tglLahirCtrl.text = formattedDate; //set output date to TextField value.
    } else {}
    notifyListeners();
  }
  void namaLengkap(BuildContext context, TextEditingController namaCtrl) {
    namaCtrl.text;
    notifyListeners();
  }
}
