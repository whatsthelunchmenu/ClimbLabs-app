import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NaverClient {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode",
    headers: {
      "X-NCP-APIGW-API-KEY-ID": dotenv.env['NAVER_GEOCODE_ID'].toString(),
      "X-NCP-APIGW-API-KEY": dotenv.env['NAVER_GEOCODE_KEY'].toString(),
    },
  );
}
