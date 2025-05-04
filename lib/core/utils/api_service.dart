
import 'package:dio/dio.dart';


class ApiService {
  final Dio _dio;
  final baseUrl = 'http://openlibrary.org/';
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      var response = await _dio.get('$baseUrl$endPoint');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Error: Status code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
/* 
  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer$token'});
    }

   var response = await post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    print('url: $url, body: $body, token: $token');
    if (response.statusCode == 200) {
      print('body: $body');
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "there is error with status code ${response.statusCode} with body ${jsonDecode(response.body)}",
      );
    }
  }

  Future<dynamic> Put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer$token'});
    }

    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    print('url: $url, body: $body, token: $token');
    if (response.statusCode == 200) {
      print('body: $body');
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "there is error with status code ${response.statusCode} with body ${jsonDecode(response.body)}",
      );
    }
  } */
}
