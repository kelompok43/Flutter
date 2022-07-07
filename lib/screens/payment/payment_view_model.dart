import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_gym/models/api/payment_service.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:fitness_gym/models/responses/api_error_response.dart';
import 'package:fitness_gym/models/responses/payment_method_response.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class PaymentViewModel extends ChangeNotifier {
  String _value = "1 Bulan";
  String _selectedValue = "1 Bulan";
  String get value => _value;
  String get selectedValue => _selectedValue;
  File? _imagePath;
  File? get imagePath => _imagePath;
  var uploadState = TransactionState.initial;
  set imagePath(File? newValue) {
    _imagePath = newValue;
    notifyListeners();
  }

  void setRadio(String newValue, String newSelectedValue) {
    _value = newValue;
    _selectedValue = newSelectedValue;
    notifyListeners();
  }

  void uploadBukti(BuildContext context) async {
    uploadState = TransactionState.loading;
    notifyListeners();

    //Jika tidak ada foto
    if (_imagePath == null) {
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: primary5,
        duration: const Duration(seconds: 2),
        content: const Text('Belum mengambil foto bukti'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      uploadState = TransactionState.initial;
      notifyListeners();
      return;
    }

    if (paymentMethod.isEmpty) {
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: primary5,
        duration: const Duration(seconds: 2),
        content: const Text('Tidak ada metode pembayaran untuk saat ini'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      uploadState = TransactionState.initial;
      notifyListeners();
      return;
    }

    var totalPrice = 0;
    if (selectedValue == '1 Bulan') {
      totalPrice = 400000;
    }
    if (selectedValue == '3 Bulan') {
      totalPrice = 1000000;
    }
    if (selectedValue == '6 Bulan') {
      totalPrice = 1800000;
    }
    if (selectedValue == '1 Tahun') {
      totalPrice = 3500000;
    }

    var userId = UserPreferences().getUser().id;
    var token = UserPreferences().getToken();
    try {
      var response = await PaymentService().uploadBuktiPembayaran(_imagePath!,
          paymentMethod.first.id ?? 0, userId, totalPrice, token ?? "");

      var responseData = uploadState = TransactionState.done;
      notifyListeners();
    } on DioError catch (e) {
      if (e.response != null) {
        var errorResponse = ApiErrorResponse.fromJson(e.response!.data);
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: Text('Gagal mengirim bukti pembayaran: ' +
              (errorResponse.message ?? "")),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: const Text('Gagal mengirim bukti pembayaran'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      uploadState = TransactionState.initial;
      notifyListeners();
    }
  }

  var paymentMethodState = TransactionState.initial;
  List<PaymentMethod> paymentMethod = [];

  void getPaymentMethod(BuildContext context) async {
    paymentMethodState = TransactionState.loading;
    var token = UserPreferences().getToken();
    try {
      var response = await PaymentService().getAllPaymentMethod(token ?? "");
      var responseData = PaymentMethodResponse.fromJson(response);
      paymentMethod.addAll(responseData.data);
      paymentMethodState = TransactionState.done;
      notifyListeners();
    } on DioError catch (e) {
      var errorResponse = ApiErrorResponse.fromJson(e.response!.data);

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text('Gagal mengambil metode pembayaran: ' +
                (errorResponse.message ?? ""))));
      paymentMethodState = TransactionState.done;
      notifyListeners();
    }
  }
}

enum TransactionState {
  initial,
  loading,
  done,
}
