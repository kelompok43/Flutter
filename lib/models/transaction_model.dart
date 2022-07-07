// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
    Transaction({
        required this.id,
        required this.usersId,
        required this.paymentMethodId,
        required this.status,
        required this.totalPrice,
        required this.paymentReceipt,
    });

    int id;
    int usersId;
    int paymentMethodId;
    String status;
    String totalPrice;
    String paymentReceipt;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        usersId: json["users_id"],
        paymentMethodId: json["payment_method_id"],
        status: json["status"],
        totalPrice: json["total_price"],
        paymentReceipt: json["payment_receipt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "payment_method_id": paymentMethodId,
        "status": status,
        "total_price": totalPrice,
        "payment_receipt": paymentReceipt,
    };
}
