import 'package:dio/dio.dart';
import 'package:shopware_6/core/api_provider/http_provider.dart';

class DioProvider implements HttpProvider {
  final Dio _dio;

  DioProvider()
      : _dio = Dio(
          BaseOptions(
            baseUrl: '',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

  @override
  Future<Response> get(String endpoint, {Map<String, dynamic>? params, String? path}) async {
    try {
      final url = _buildUrl(endpoint, path);
      return await _dio.get(url, queryParameters: params);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> post(String endpoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? params, String? path}) async {
    try {
      final url = _buildUrl(endpoint, path);
      return await _dio.post(url, data: body, queryParameters: params);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> put(String endpoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? params, String? path}) async {
    try {
      final url = _buildUrl(endpoint, path);
      return await _dio.put(url, data: body, queryParameters: params);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> delete(String endpoint, {Map<String, dynamic>? params, String? path}) async {
    try {
      final url = _buildUrl(endpoint, path);
      return await _dio.delete(url, queryParameters: params);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  // Helper to build full URL with optional path parameters
  String _buildUrl(String endpoint, String? path) {
    return path != null ? '$endpoint/$path' : endpoint;
  }

  // Helper to handle DioError and return a standardized response
  Response _handleDioError(DioException error) {
    return Response(
      requestOptions: error.requestOptions,
      statusCode: error.response?.statusCode,
      statusMessage: error.message,
    );
  }
}
