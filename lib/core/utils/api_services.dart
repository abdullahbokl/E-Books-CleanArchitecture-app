import 'package:dio/dio.dart';

class ApiServices {
  String baseUrl = 'https://www.googleapis.com/books/v1/';

  Dio dio;

  ApiServices(this.dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
