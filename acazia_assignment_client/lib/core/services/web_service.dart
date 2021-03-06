import 'dart:convert';
import 'package:acaziaassignmentclient/core/errors/exceptions.dart';
import 'package:acaziaassignmentclient/core/services/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class WebService {
  Dio setupDio() {
    Dio dio = Dio(BaseOptions(
      baseUrl: AppURL.baseURL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ));

    dio.interceptors
        .add(_setupLoggingInterceptor()); // setup logging interceptors

    return dio;
  }

  // writing logging
  Interceptor _setupLoggingInterceptor() {
    final interceptor =
        InterceptorsWrapper(onRequest: (RequestOptions options) {
      // do something before request is send
      debugPrint(
          "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
      debugPrint("Headers:");
      options.headers.forEach((k, v) => debugPrint('$k: $v'));
      if (options.queryParameters != null) {
        debugPrint("queryParameters:");
        options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      }
      if (options.data != null) {
        debugPrint("Body: ${options.data}");
      }
      debugPrint(
          "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
      return options;
    }, onResponse: (Response response) {
      // do something with data
      debugPrint(
          "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
      debugPrint("Headers:");
      response.headers?.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint("Response: ${response.data}");
      debugPrint("<-- END HTTP");

      _handleResponseException(response); // handling error in response

      return response;
    }, onError: (DioError err) async {
      // catch error
      debugPrint(
          "<-- ${err.message} ${(err.response?.request != null ? (err.response.request.baseUrl + err.response.request.path) : 'URL')}");
      debugPrint(
          "${err.response != null ? err.response.data : 'Unknown Error'}");
      debugPrint("<-- End error");

      throw _handleError(err); // handling error in dio
    });

    return interceptor;
  }

  // error of content's response
  _handleResponseException(response) {
    if (response != null && response.statusCode != 200) {
      String errorResponse = response.body;

      if (response.statusCode == 401) {
        if (errorResponse.contains('error')) {
          try {
            var errorJson = json.decode(errorResponse);

            String errorOut = errorJson['error'];

            throw ServerException(mess: errorOut);
          } on Exception catch (e, b) {
            throw ServerException(mess: e.toString());
          }
        }
      }

      if (errorResponse.contains('error')) {
        try {
          var errorJson = json.decode(errorResponse);

          String errorOut = errorJson['error'];

          throw Exception(errorOut);

          // throw errorOut;
        } on Exception catch (e, b) {
          print("$e \n $b");
          throw ServerException(mess: e.toString());
        }
      }
    }
  }

  // error of dio
  _handleError(var error) {
    var responseError;

    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          responseError = 'Request to API server was cancelled';
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          responseError = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          responseError =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          responseError = "Receive timeout in connection with API server";
          break;
        case DioErrorType.SEND_TIMEOUT:
          responseError = "Send timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          responseError =
              "Received invalid status code: ${error.response.statusCode}";
          break;
      }
    } else {
      responseError = 'Unexpected error occured: ${error.toString()}';
    }

    throw ServerException(mess: responseError);
  }
}
