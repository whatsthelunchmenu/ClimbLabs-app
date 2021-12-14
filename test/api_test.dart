import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: 'assets/.env');
  });

  group('API TEST Group', () {
    test("WhatAboutHere API Test", () async {
      final Dio dio = Dio(
        BaseOptions(baseUrl: dotenv.env['API_BASE_URL'] as String),
      );
      final Response response = await dio.get('/posts/random/2');
      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print(response.statusMessage);
      }
    });

    test("ItsThisBIg API Test", () async {
      final Dio dio = Dio(
        BaseOptions(baseUrl: dotenv.env['API_BASE_URL'] as String),
      );
      final Response response =
          await dio.get('/posts/random', queryParameters: {
        'limit': 5,
        'scaleTypes': ['BIG', 'MIDDLE'],
      });
      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print(response.statusMessage);
      }
    });
  });
}
