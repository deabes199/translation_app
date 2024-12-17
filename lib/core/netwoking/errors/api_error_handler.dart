import 'package:dio/dio.dart';
import 'package:google_translation_app/core/netwoking/errors/error_model.dart';

class ApiErrorHandler extends ErrorModel {
  ApiErrorHandler(super.message);
  factory ApiErrorHandler.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorHandler(
            'Connection timed out. Please check your internet connection and try again.');

      case DioExceptionType.sendTimeout:
        return ApiErrorHandler(
            'Request timed out while sending data to the server. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ApiErrorHandler(
            'Response timed out while waiting for server. Please try again.');
      case DioExceptionType.badCertificate:
        return ApiErrorHandler(
            "The server's certificate could not be verified. Please contact support.");
      case DioExceptionType.badResponse:
        return ApiErrorHandler.fromResponse(
            dioException.response?.statusCode, dioException.response?.data);
      case DioExceptionType.cancel:
        return ApiErrorHandler("The request was canceled. Please try again.");
      case DioExceptionType.connectionError:
        return ApiErrorHandler(
            "No internet connection. Please check your connection and try again.");
      case DioExceptionType.unknown:
      default:
        return ApiErrorHandler(
            "An unexpected error occurred: ${dioException.message ?? 'Please try again later.'}");
    }
  }
  factory ApiErrorHandler.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ApiErrorHandler(
            "Bad request. Please check your input and try again.");
      case 401:
        return ApiErrorHandler(
            "Unauthorized access. Please log in to continue.");
      case 403:
        return ApiErrorHandler(
            'Access forbidden. You do not have permission to access this resource.');
      case 404:
        return ApiErrorHandler(
            "Resource not found. Please check the requested data.");
      case 500:
        return ApiErrorHandler(
            "Internal server error. Please try again later.");
      case 503:
        return ApiErrorHandler(
            "Service unavailable. The server is currently unreachable. Please try again later.");
      default:
        return ApiErrorHandler(
            "Network error. Status code: $statusCode. ${response ?? 'Please try again later.'}");
    }
  }
}
