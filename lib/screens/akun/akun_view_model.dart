import 'package:fitness_gym/models/preferences/user_preferences.dart';
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

  final user = UserPreferences().getUser();
  TextEditingController? nameCtrl;
  Future<TextEditingController> fetchName() async {
    nameCtrl = TextEditingController(text: user.name! == "" ? "" : user.name!);
    return nameCtrl!;
  }

  TextEditingController? tglLahirCtrl;
  Future<TextEditingController> fetchTanggalLahir() async {
    tglLahirCtrl =
        TextEditingController(text: user.dob! == "" ? "" : user.dob!);
    return tglLahirCtrl!;
  }

  TextEditingController? alamatCtrl;
  Future<TextEditingController> fetchAlamat() async {
    alamatCtrl =
        TextEditingController(text: user.address! == "" ? "" : user.address!);
    return alamatCtrl!;
  }

  TextEditingController? emailCtrl;
  Future<TextEditingController> fetchEmail() async {
    emailCtrl =
        TextEditingController(text: user.email! == "" ? "" : user.email!);
    return emailCtrl!;
  }

  TextEditingController? phoneCtrl;
  Future<TextEditingController> fetchPhone() async {
    phoneCtrl =
        TextEditingController(text: user.phone! == "" ? "" : user.phone!);
    return phoneCtrl!;
  }

  void fetchData() {
    fetchPhone();
    fetchEmail();
    fetchAlamat();
    fetchTanggalLahir();
    fetchName();
  }

  void changeEmail(TextEditingController email) {
    emailCtrl = email;
    notifyListeners();
  }
}
