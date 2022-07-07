class ApiErrorResponse {
  ApiErrorResponse({
    required this.message,
    required this.rescode,
  });

  final String? message;
  final int? rescode;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      message: json["message"],
      rescode: json["rescode"],
    );
  }
}
