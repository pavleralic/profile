import 'dart:convert';
import 'dart:math' as math;

import 'package:dio/dio.dart';

import 'http_response.dart';
import 'http_service_interface.dart';

class DioHttpService extends HttpServiceInterface {
  final String url;
  final int retryCount;
  final Duration initialPauseBetweenRetriesInSeconds;
  final int exponentialBackoffMultiplier;

  List<Function(Response)>? postRequest;

  late Dio _dio;

  DioHttpService(
    this.url, {
    this.postRequest,
    this.addHeaders: true,
    this.retryCount: 4,
    this.initialPauseBetweenRetriesInSeconds: const Duration(seconds: 1),
    this.exponentialBackoffMultiplier: 2,
  }) {
    if (postRequest == null) {
      postRequest = List.empty(growable: true);
    }
    _dio = _buildDio();
  }

  final bool addHeaders;

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, String>? query,
    Map<String, String>? headers,
    bool invalidateCache = false,
  }) async {
    try {
      return await _request(
        url,
        path,
        parameters,
        (fullPath) async => _dio.get(fullPath,
            options: Options(headers: headers), queryParameters: query),
      );
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<T> post<T>(String path,
      {dynamic data,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    return await _request(
        url,
        path,
        parameters,
        (fullPath) => _dio.post(fullPath,
            options: Options(headers: headers),
            queryParameters: query,
            data: parameters));
  }

  @override
  Future<T> put<T>(String path,
      {dynamic data,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    return await _request(
        url,
        path,
        parameters,
        (fullPath) => _dio.put(fullPath,
            options: Options(headers: headers),
            queryParameters: query,
            data: parameters));
  }

  @override
  Future<T> delete<T>(String path,
      {Map<String, String>? parameters,
      Map<String, String>? query,
      Map<String, String>? headers,
      required String baseUrl}) async {
    return await _request(
        baseUrl,
        path,
        parameters,
        (fullPath) async =>
            _dio.delete(fullPath, options: Options(headers: headers)));
  }

  String _generateFullPath(String baseUrl, String path, parameters) {
    return '$baseUrl$path';
  }

  Future<T?> _request<T>(String baseUrl, String path, parameters,
      Future<Response> Function(String) request) async {
    final fullPath = _generateFullPath(baseUrl, path, parameters);
    Response response = await _tryRequest(() => request(fullPath));
    return _postProcess<T>(response);
  }

  Dio _buildDio() {
    final dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    return dio;
  }

  Future<Response> _tryRequest(Future<Response> Function() request,
      [count = 0]) async {
    Response response = await request();
    if (response.statusCode != 200) {
      print('request: '
          '${response.requestOptions.method} ${response.requestOptions.baseUrl}${response.requestOptions.path} , '
          'statuscode: ${response.statusCode} \n query: ${response.requestOptions.queryParameters}');
    }
    if ((response.statusCode ?? 0) <= 500 || count >= retryCount) {
      return response;
    }
    final Duration pauseBetweenRetriesInSeconds =
        initialPauseBetweenRetriesInSeconds *
            math.pow(exponentialBackoffMultiplier, count);
    await new Future.delayed(pauseBetweenRetriesInSeconds);
    return await _tryRequest(request, count + 1);
  }

  T? _postProcess<T>(Response response) {
    int statusCode = response.statusCode ?? 0;
    if ((statusCode < 200 || statusCode >= 400) && statusCode != 404) {
      final Map<String, dynamic> error =
          json.decode(utf8.decode(response.data));
      if (error.containsKey('status') && error.containsKey('message')) {
        print(
            'HttpService error: status ${error['status']}, message: ${error['message']}');
      } else {
        print('HttpService error unknown: ${error.toString()}');
      }
      throw new Exception(error);
    } else if ((statusCode > 200 && statusCode < 400) || statusCode == 404) {
      return null;
    }
    return json.decode(utf8.decode(response.data)) as T;
  }

  @override
  Future<HttpResponse> request(String? path, REQUEST_TYPE requestType,
      {Map<String, String>? parameters,
      Map<String, String>? query,
      Map<String, String>? headers,
      required String baseUrl,
      dynamic data}) async {
    final fullPath = _generateFullPath(baseUrl, path!, parameters);
    var httpRequest;
    switch (requestType) {
      case REQUEST_TYPE.delete:
        httpRequest = (String path) => _dio.delete(
              fullPath,
              options: Options(headers: headers),
              queryParameters: query,
            );
        break;
      case REQUEST_TYPE.get:
        httpRequest = (String path) => _dio.get(
              fullPath,
              options: Options(headers: headers),
              queryParameters: query,
            );
        break;
      case REQUEST_TYPE.post:
        httpRequest = (String path) => _dio.post(
              fullPath,
              options: Options(headers: headers),
              queryParameters: query,
              data: data,
            );
        break;
      case REQUEST_TYPE.put:
        httpRequest = (String path) => _dio.put(
              fullPath,
              options: Options(headers: headers),
              queryParameters: query,
              data: data,
            );
        break;
    }
    Response response = await _tryRequest(() => httpRequest(fullPath));

    return HttpResponse(response.headers.map, response.statusCode ?? 0,
        response.statusMessage ?? '', _postProcess(response));
  }
}
