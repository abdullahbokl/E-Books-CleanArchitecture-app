import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/server_exception.dart';
import '../api_services.dart';

@LazySingleton(as: ApiServices)
class DioServices extends ApiServices {
  final Dio dio;

  DioServices(this.dio);

  @override
  Future<dynamic> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.get(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {
          ...?headers,
        }),
      );
      return res.data;
    } catch (e) {
      throw ServerException.handleException(e);
    }
  }

  @override
  Future post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {
          ...?headers,
        }),
      );
      return res.data;
    } catch (e) {
      throw ServerException.handleException(e);
    }
  }

  @override
  Future patch({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.patch(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      throw ServerException.handleException(e);
    }
  }

  @override
  Future delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var res = await dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      throw ServerException.handleException(e);
    }
  }
}
