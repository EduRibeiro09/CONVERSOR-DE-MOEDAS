import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class MyHttpClient {
  static const String baseUrl = "https://api.hgbrasil.com/finance?key=86a6a079";

  static Map<String, String> getHeaders() {
    return {
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  static Future<http.Response> get({
    required String url,
    required Map<String, String> headers,
    required Map<String, String> queryParameters,
  }) async {
    final uri = Uri.parse(baseUrl + url).replace(queryParameters: queryParameters);
    final response = await http.get(uri, headers: headers);
    return response;
  }

  static Future<http.Response> post({
    required String url,
    required Map<String, String> headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> postString({
    required String url,
    required Map<String, String> headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: json.encode(body),
    );
    return response;
  }

  static Future<http.Response> put({
    required String url,
    required Map<String, String> headers,
    Map<String, String>? body,
  }) async {
    final response = await http.put(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> delete({
    required String url,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.delete(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: json.encode(body),
    );
    return response;
  }
}
