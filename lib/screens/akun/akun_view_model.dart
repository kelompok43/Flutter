import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_gym/models/api/user_service.dart';
import 'package:fitness_gym/models/entities/user_entity.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/responses/api_error_response.dart';
import '../../models/responses/login_response.dart';
import '../../utils/constants.dart';

class AkunViewModel extends ChangeNotifier {
  File? _imagePath;
  File? get imagePath => _imagePath;
  TextEditingController? nameCtrl;
  TextEditingController? tglLahirCtrl;
  TextEditingController? alamatCtrl;
  TextEditingController? emailCtrl;
  TextEditingController? phoneCtrl;

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

  var user = UserPreferences().getUser();

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

  void getData() {
    user = UserPreferences().getUser();
  }

  void addDetailUser(
      String email, String password, BuildContext context) async {
    try {
      await UserApi().postLogin(email, password);
      if (_imagePath == null) {
        Navigator.pop(context);
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: const Text('Foto Belum Diambil'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
        return;
      }
      var userId = UserPreferences().getUser().id;

      var token = UserPreferences().getToken();
      try {
        Map<String, dynamic> editProfile = await UserApi().editDetailProfile(
            _imagePath!,
            nameCtrl!.text,
            tglLahirCtrl!.text,
            alamatCtrl!.text,
            emailCtrl!.text,
            phoneCtrl!.text,
            token ?? "",
            userId);
        var response = LoginResponse.fromJson(editProfile);

        UserPreferences().setUser(UserEntity(
            id: response.data?.id ?? 0,
            name: response.data?.name ?? "",
            dob: response.data?.dob ?? "",
            email: response.data?.email ?? "",
            phone: response.data?.phone ?? "",
            address: response.data?.address ?? "",
            gender: response.data?.gender ?? "",
            status: response.data?.status ?? "",
            picture: response.data?.picture ?? ""));
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: const Text('Edit Profile Berhasil'),
        );
        var user = UserPreferences().getUser();
        print(user.dob);
        print(user.address);
        print(user.email);
        print(user.phone);
        print(user.picture);
        _imagePath!.delete();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
            (route) => false);
      } on DioError catch (e) {
        if (e.response?.statusCode != 200) {
          print(e);
        }
      }
    } on DioError catch (e) {
      if (e.response!.statusCode != 200) {
        print(e);
      }
    }
  }
}
