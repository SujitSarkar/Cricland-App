import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'api_endpoints.dart';

class ApiService {
  ApiService._privateConstructor();

  static final ApiService instance = ApiService._privateConstructor();
  factory ApiService() {
    return instance;
  }

  final GetConnect getConnect = GetConnect();

  Future<void> apiCall(
      {required Function execute,
      required Function(dynamic) onSuccess,
      Function(dynamic)? onError,
      Function? onLoading}) async {
    try {
      if (onLoading != null) onLoading();
      var response = await execute();

      onSuccess(response);
      return;
    } catch (error) {
      if (onError == null) return;
      onError(error);
      return;
    }
  }

  ///get api request
  Future<dynamic> get(String url) async {
    print("Score URL: ${ApiEndpoints.baseURL + url}");
    print("Score Headers: ${ApiEndpoints.headers}");
    var response = await getConnect.httpClient.get(
      ApiEndpoints.baseURL + url,
      headers: ApiEndpoints.headers,
    );
    print(response.body);
    return _processResponse(response);
  }

  ///post api request
  Future<dynamic> post(String url,
      {dynamic body, Map<String, dynamic>? query}) async {
    var response = await getConnect.httpClient.post(ApiEndpoints.baseURL + url,
        body: jsonEncode(body), headers: ApiEndpoints.headers, query: query);
    return _processResponse(response);
  }

  ///delete api request
  Future<dynamic> delete(String url, {Map<String, dynamic>? query}) async {
    var response = await getConnect.httpClient.delete(
        ApiEndpoints.baseURL + url,
        headers: ApiEndpoints.headers,
        query: query);
    return _processResponse(response);
  }

  //patch request
  Future<dynamic> patch(String url,
      {dynamic body, Map<String, dynamic>? query}) async {
    var response = await getConnect.httpClient.patch(ApiEndpoints.baseURL + url,
        body: body, headers: ApiEndpoints.headers, query: query);
    return _processResponse(response);
  }

  ///check if the response is valid (everything went fine) / else throw error
  dynamic _processResponse(Response response) {
    print('statusCode:- ${response.statusCode}');
    // print('response:- ${response.body}');
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return response.body;
      case 400:
        throw Exception('Invalid api call');
      case 404:
        throw Exception('Url not founded');
      case 401:
      case 403:
        throw Exception('Unauthorized request');
      case 500:
      default:
        throw Exception('Something went wrong');
    }
  }
}
