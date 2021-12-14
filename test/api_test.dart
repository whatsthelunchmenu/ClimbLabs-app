import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await FlutterConfig.loadValueForTesting({
    'API_BASE_URL':
        'http://ec2-54-180-17-248.ap-northeast-2.compute.amazonaws.com:8080'
  });

  group('[API TEST Group]', () {
    test("WhatAboutHere API Test", () async {
      try {
        final Dio dio = Dio(
          BaseOptions(baseUrl: FlutterConfig.get('API_BASE_URL')),
        );
        final Response response = await dio.get('/posts/random/2');
        if (response.statusCode == 200) {
          debugPrint('Success get data');
          print(response.data);
        } else {
          debugPrint(response.statusMessage);
        }
      } on DioError catch (error) {
        debugPrint(error.message);
      }
    });

    test("ItsThisBIg API Test", () async {
      try {
        final Dio dio = Dio(
          BaseOptions(baseUrl: FlutterConfig.get('API_BASE_URL') as String),
        );
        final Response response =
            await dio.get('/posts/random', queryParameters: {
          'limit': 5,
          'scaleTypes': ['BIG', 'MIDDLE'],
        });
        if (response.statusCode == 200) {
          debugPrint('Success get data');
          debugPrint(response.data);
        } else {
          debugPrint(response.statusMessage);
        }
      } on DioError catch (error) {
        debugPrint(error.message);
      }
    });
  });
}
