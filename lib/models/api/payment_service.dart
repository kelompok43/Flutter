import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_gym/models/responses/payment_method_response.dart';

import '../../utils/constants.dart';

class PaymentService {
  Future getAllPaymentMethod(String token) async {
    final _response = await Dio().get(baseUrl + "payment/method",
        options: Options(headers: {
          'Authorization': 'Bearer ' + token,
        }));
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Gagal Login");
    }
  }

  Future uploadBuktiPembayaran(File file, int paymentMethodId, int userId,
      int totalPrice, String token) async {
    var body = FormData.fromMap({
      'payment_receipt': await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
      'user_id': userId,
      'payment_method_id': paymentMethodId,
      'total_price': totalPrice,
    });

    var response = await Dio().post(
      baseUrl + "/transaction",
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer ' + token,
        },
      ),
    );

    return response;
  }
}
