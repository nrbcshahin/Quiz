class ApiResponse {
  bool success;
  String message;
  dynamic data;

  ApiResponse(
    this.success,
    this.message,
    this.data,
  );
}
