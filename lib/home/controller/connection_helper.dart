import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectionHelper {
  Future<Response<dynamic>?> getData(String url) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      // Request to API
      var response = await dio.get(url,
          options: Options(
            sendTimeout: 10000,
            receiveTimeout: 10000,
          ));

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      print(error);
      return error.response;
    }
  }

  Future<Response<dynamic>?> getDataWithQuery(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      // Request to API
      var response = await dio.get(url,
          queryParameters: query,
          options: Options(
            sendTimeout: 10000,
            receiveTimeout: 10000,
          ));

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      print(error);
      return error.response;
    }
  }

  Future<Response<dynamic>?> getDataWithHeaders(String url) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();
      Map<String, dynamic> headers = {
        "X-RapidAPI-Key": "536bde874cmsh538ffe828f4e822p1aec59jsn3e00016f7daf",
        "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com",
      };
      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      var response = await dio.get(
        url,
        options: Options(
          headers: headers,
          contentType: Headers.jsonContentType,
          sendTimeout: 10000,
          receiveTimeout: 10000,
        ),
      );
      // Ending Timer
      DateTime etime = DateTime.now();
      // Calculating Time
      Duration diff = etime.difference(stime);
      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");
      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 403) {
          final prefs = await SharedPreferences.getInstance();
          dynamic refreshHeaders = {
            "X-RapidAPI-Key":
                "536bde874cmsh538ffe828f4e822p1aec59jsn3e00016f7daf",
            "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com",
          };
        }
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }

  Future<Response<dynamic>?> getDataWithHeadersQuery(
    String url, {
    Map<String, dynamic>? queryData,
  }) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();
      final prefs = await SharedPreferences.getInstance();

      Map<String, dynamic> headers = {
        "X-RapidAPI-Key": "536bde874cmsh538ffe828f4e822p1aec59jsn3e00016f7daf",
        "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com",
      };

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.get(
        url,
        queryParameters: queryData,
        options: Options(
          headers: headers,
          contentType: Headers.jsonContentType,
          sendTimeout: 10000,
          receiveTimeout: 10000,
        ),
      );

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 403) {}
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }

  Future<Response<dynamic>?> postData(String url, dynamic data) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(url,
          data: data,
          options: Options(
              contentType: Headers.jsonContentType,
              sendTimeout: 10000,
              receiveTimeout: 10000));

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }

  Future<Response<dynamic>?>? postDataWithHeaders(
    String url,
    dynamic data,
  ) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();
      Map<String, dynamic> headers = {
        "X-RapidAPI-Key": "536bde874cmsh538ffe828f4e822p1aec59jsn3e00016f7daf",
        "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com",
      };

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: headers,
          contentType: Headers.jsonContentType,
          sendTimeout: 10000,
          receiveTimeout: 10000,
        ),
      );

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 403) {}
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }

  Future<Response<dynamic>?> putData(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
    String? userAuth,
  }) async {
    try {
      // Starting Timer
      DateTime sTime = DateTime.now();

      var response = await Dio().put(
        url,
        data: data,
        options: Options(
            contentType: Headers.jsonContentType,
            sendTimeout: 10000,
            receiveTimeout: 10000),
      );

      // Ending Timer
      DateTime eTime = DateTime.now();
      // Calculating Time
      Duration diff = eTime.difference(sTime);
      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }

  Future<Response<dynamic>?> transmitter(String url, dynamic data) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(
        url,
        data: data,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {"SECRET-KEY": "GYGWYERY58454FDS4FD8V487FF8WQ8EF11D88W1D"},
          sendTimeout: 10000,
          receiveTimeout: 10000,
        ),
      );

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }
}
