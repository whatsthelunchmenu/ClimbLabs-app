import 'package:climb_labs/app/controller/logger/logger_controller.dart';
import 'package:climb_labs/app/data/model/climbing_results_model.dart';
import 'package:climb_labs/app/data/provider/base_client.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  late Dio _dio;

  HomeRepository() {
    _dio = Dio(BaseClient.baseOptions);
  }

  Future getWhatAboutHere(int limit) async {
    try {
      final Response response = await _dio.get('/posts/random/$limit');

      if (response.statusCode == 200) {
        LoggerController.to.debug('[getWhatAboutHere] Success to get data');
        return ClimbingResults.fromListJson(response.data);
      } else {
        LoggerController.to.error(
            '[getWhatAboutHere] fail to get data : ${response.statusMessage}');
        return ClimbingResults();
      }
    } on DioError catch (error) {
      LoggerController.to
          .error('[getWhatAboutHere] dioError : ${error.message}');
    }
  }

  Future getItsThisBig(int limit, List<String> scaleType) async {
    try {
      final Response response =
          await _dio.get('/posts/random', queryParameters: {
        'limit': limit,
        'scaleType': scaleType.join(","),
      });

      if (response.statusCode == 200) {
        LoggerController.to.debug('[getItsThisBig] Success to get data');
        return ClimbingResults.fromMapJson(response.data);
      } else {
        LoggerController.to.error(
            '[getItsThisBig] fail to get data : ${response.statusMessage}');
        return ClimbingResults();
      }
    } on DioError catch (error) {
      LoggerController.to.error('[getItsThisBig] dioError : ${error.message}');
    }
  }
}
