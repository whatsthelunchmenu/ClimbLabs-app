import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseClient {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: dotenv.env['API_BASE_URL'].toString(),
  );
}
