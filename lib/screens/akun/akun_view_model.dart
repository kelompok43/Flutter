import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_gym/models/api/user_service.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/responses/api_error_response.dart';
import '../../utils/constants.dart';

class AkunViewModel extends ChangeNotifier {
  File? _imagePath;
  File? get imagePath => _imagePath;
  TextEditingController? nameCtrl;
  TextEditingController? tglLahirCtrl;
  TextEditingController? alamatCtrl;
  TextEditingController? emailCtrl;
  TextEditingController? phoneCtrl;
  var addDetailState = AddDetailUserState.initial;
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

  Future<TextEditingController> fetchName() async {
    nameCtrl = TextEditingController(text: user.name! == "" ? "" : user.name!);
    return nameCtrl!;
  }

  Future<TextEditingController> fetchTanggalLahir() async {
    tglLahirCtrl =
        TextEditingController(text: user.dob! == "" ? "" : user.dob!);
    return tglLahirCtrl!;
  }

  Future<TextEditingController> fetchAlamat() async {
    alamatCtrl =
        TextEditingController(text: user.address! == "" ? "" : user.address!);
    return alamatCtrl!;
  }

  Future<TextEditingController> fetchEmail() async {
    emailCtrl =
        TextEditingController(text: user.email! == "" ? "" : user.email!);
    return emailCtrl!;
  }

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

  void changePhone(TextEditingController phone) {
    phoneCtrl = phone;
    notifyListeners();
  }

  set imagePath(File? newValue) {
    _imagePath = newValue;
    notifyListeners();
  }

  void addDetailUser(
      String email, String password, BuildContext context) async {
    try {
      await UserApi().postLogin(email, password);
      addDetailState = AddDetailUserState.loading;
      notifyListeners();
      //Jika tidak ada foto
      if (_imagePath == null) {
        Navigator.pop(context);
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: const Text('Belum mengambil foto'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        addDetailState = AddDetailUserState.initial;
        notifyListeners();
        return;
      }

      var userId = UserPreferences().getUser().id;
      var token = UserPreferences().getToken();
      try {
        var response = await UserApi().editDetailProfile(
            imagePath!,
            nameCtrl!.text,
            tglLahirCtrl!.text,
            alamatCtrl!.text,
            emailCtrl!.text,
            phoneCtrl!.text,
            token!,
            userId);
      } on DioError catch (e) {
        if (e.response != null) {
          var errorResponse = ApiErrorResponse.fromJson(e.response!.data);
          SnackBar snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: primary5,
            duration: const Duration(seconds: 2),
            content: Text('Gagal Menambahbakan Detail User ' +
                (errorResponse.message ?? "")),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          SnackBar snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: primary5,
            duration: const Duration(seconds: 2),
            content: const Text('Gagal Menambahbakan Detail User'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        addDetailState = AddDetailUserState.initial;
        notifyListeners();
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
          (route) => false);
      addDetailState = AddDetailUserState.initial;
      notifyListeners();
    } on DioError catch (e) {
      if (e.response?.data != null) {
        var errorResponse = ApiErrorResponse.fromJson(e.response!.data);
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: Text(errorResponse.message ?? ""),
        );
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}

enum AddDetailUserState {
  initial,
  loading,
}
