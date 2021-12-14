import 'package:dio/dio.dart';

class BaseClient {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl:
        "http://ec2-54-180-17-248.ap-northeast-2.compute.amazonaws.com:8080",
  );
}
