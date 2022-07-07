// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

PaymentMethod transactionFromJson(String str) =>
    PaymentMethod.fromJson(json.decode(str));

String transactionToJson(PaymentMethod data) => json.encode(data.toJson());

class PaymentMethod {
  PaymentMethod({
    required this.id,
    required this.name,
    required this.accNumber,
    required this.accName,
  });

  int id;
  String name;
  double accNumber;
  String accName;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        name: json["name"],
        accNumber: json["acc_number"].toDouble(),
        accName: json["acc_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "acc_number": accNumber,
        "acc_name": accName,
      };
}
