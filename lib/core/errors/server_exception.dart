import 'package:dio/dio.dart';

import 'base_app_exception.dart';

class ServerException extends BaseAppException {
  ServerException(super.message);

  static ServerException handleException(dynamic e) {
    if (e is DioError) {
      return _fromDiorError(e);
    }
    return ServerException('UnKnow Error!');
  }

  static ServerException _fromDiorError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return ServerException('Connection timeout with api server');
      case DioErrorType.sendTimeout:
        return ServerException('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerException('Receive timeout with ApiServer');
      case DioErrorType.badCertificate:
        return ServerException('badCertificate with api server');
      case DioErrorType.badResponse:
        return _fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioErrorType.cancel:
        return ServerException('Request to ApiServer was canceled');
      case DioErrorType.connectionError:
        return ServerException('No Internet Connection');
      case DioErrorType.unknown:
        return ServerException('Opps There was an Error, Please try again');
    }
  }

  static ServerException _fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerException('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerException(
          'There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerException(response['error']['message']);
    } else {
      return ServerException('There was an error , please try again');
    }
  }
}
