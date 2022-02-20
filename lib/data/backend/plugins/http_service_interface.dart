import 'http_response.dart';

enum REQUEST_TYPE { get, post, put, delete }

abstract class HttpServiceInterface {
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, String>? query,
    Map<String, String>? headers,
    bool invalidateCache,
  });

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<T> delete<T>(
    String path, {
    Map<String, String>? parameters,
    Map<String, String>? query,
    Map<String, String>? headers,
    required String baseUrl,
  });

  Future<HttpResponse> request(
    String path,
    REQUEST_TYPE requestType, {
    Map<String, String>? parameters,
    Map<String, String>? query,
    Map<String, String>? headers,
    required String baseUrl,
    dynamic data,
  });
}
