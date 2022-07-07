class PaymentMethodResponse {
  PaymentMethodResponse({
    required this.data,
    required this.message,
    required this.rescode,
  });

  final List<PaymentMethod> data;
  final String? message;
  final int? rescode;

  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) {
    return PaymentMethodResponse(
      data: json["data"] == null
          ? []
          : List<PaymentMethod>.from(
              json["data"]!.map((x) => PaymentMethod.fromJson(x))),
      message: json["message"],
      rescode: json["rescode"],
    );
  }
}

class PaymentMethod {
  PaymentMethod({
    required this.id,
    required this.name,
    required this.accNumber,
    required this.accName,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? accNumber;
  final String? accName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json["id"],
      name: json["name"],
      accNumber: json["acc_number"],
      accName: json["acc_name"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
    );
  }
}
