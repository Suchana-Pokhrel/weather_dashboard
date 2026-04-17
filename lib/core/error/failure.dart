import "package:dio/dio.dart";

class Failure implements Exception {
  final String errorMessage;

  Failure({required this.errorMessage});

  static Failure fromDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      throw Failure(errorMessage: "Connection Timeout");
    } else if (e.type == DioExceptionType.connectionError) {
      throw Failure(errorMessage: "No Internet Connection");
    } else if (e.response?.statusCode == 400) {
      throw Failure(errorMessage: "Bad Request");
    } else if (e.response?.statusCode == 404) {
      throw Failure(errorMessage: "Resource Not Found");
    } else {
      throw Failure(errorMessage: "Something went wrong");
    }
  }

  @override
  String toString() {
    return errorMessage;
  }
}
