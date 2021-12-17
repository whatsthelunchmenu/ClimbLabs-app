import 'package:climb_labs/app/controller/logger/logger_controller.dart';
import 'package:climb_labs/app/data/model/geocode_model.dart';
import 'package:climb_labs/app/data/provider/naver_client.dart';
import 'package:dio/dio.dart';

class DetailRepository {
  late Dio _dio;

  DetailRepository() {
    _dio = Dio(NaverClient.baseOptions);
  }

  Future getGeocode(String address) async {
    try {
      final Response response = await _dio.get(
        '',
        queryParameters: {'query': address},
      );

      if (response.statusCode == 200) {
        LoggerController.to.debug('[getGeocode] Success to get geo-data');
        return GeocodeModel.fromJson(response.data);
      } else {
        LoggerController.to
            .error('[getGeocode] fail to get geo-data ${response.statusCode}');
      }
    } on DioError catch (error) {
      LoggerController.to.error(error.message);
    }
  }
}
