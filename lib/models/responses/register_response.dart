class RegisterResponse {
  RegisterResponse({
    required this.message,
    required this.rescode,
  });

  final String? message;
  final int? rescode;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json["message"],
      rescode: json["rescode"],
    );
  }
}
