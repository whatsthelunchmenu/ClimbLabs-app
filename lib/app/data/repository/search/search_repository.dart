import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/data/model/climbing_search_result.dart';
import 'package:climb_labs/app/data/provider/base_client.dart';
import 'package:dio/dio.dart';

class SearchRepository {
  late Dio _dio;

  SearchRepository() {
    _dio = Dio(BaseClient.baseOptions);
  }

  Future getKeywordSearch(String keyword, {int page = 1, int size = 10}) async {
    try {
      final Response response =
          await _dio.get('/search/posts', queryParameters: {
        'search': keyword,
        'page': page,
        'size': size,
      });
      if (response.statusCode == 200) {
        LoggerController.to
            .debug('[getKeywordSearch] Success to get search data for keyword');
        return ClimbingSearchResult.fromList(response.data);
      } else {
        LoggerController.to.error(
            '[getKeywordSearch] fail to get data : ${response.statusMessage}');
        return ClimbingSearchResult();
      }
    } on DioError catch (error) {
      LoggerController.to
          .error('[getKeywordSearch] dioError : ${error.message}');
    }
  }

  Future getLocationSearch(String city,
      {String sidos = "",
      String scaleType = "",
      int page = 1,
      int size = 10}) async {
    try {
      final Response response =
          await _dio.get('/search/$city/posts', queryParameters: {
        'sidos': sidos,
        'scaleTypes': scaleType,
        'page': page,
        'size': size,
      });

      if (response.statusCode == 200) {
        LoggerController.to.debug(
            '[getLocationSearch] Success to get search data for keyword');
        return ClimbingSearchResult.fromList(response.data);
      } else {
        LoggerController.to.error(
            '[getLocationSearch] fail to get data : ${response.statusMessage}');
        return ClimbingSearchResult();
      }
    } on DioError catch (error) {
      LoggerController.to
          .error('[getLocationSearch] dioError : ${error.message}');
    }
  }
}
