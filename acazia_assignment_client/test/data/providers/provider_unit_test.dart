import 'dart:convert';

import 'package:acaziaassignmentclient/core/services/web_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

/// This is unaccomplished ....

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockResponse extends Mock implements http.Response {}

void main() {
  Dio dio;
  DioAdapterMock dioAdapterMock;
  WebService webService;
  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    webService = WebService();
  });

  test('Get ten random user from Api', () async {
    dio = webService.setupDio();

    final response = await dio.get("?results=10");

    expect(response.statusCode, equals(200));
  });
}
