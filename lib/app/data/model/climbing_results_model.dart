import 'package:climb_labs/app/controller/logger/logger_controller.dart';
import 'package:climb_labs/app/data/model/center_model.dart';

class ClimbingResults {
  ClimbingResults({
    this.whatAbuoutHere = const [],
    this.bigSize = const [],
    this.middleSize = const [],
    this.smallSize = const [],
  });

  List<CenterModel> whatAbuoutHere;
  List<CenterModel> bigSize;
  List<CenterModel> middleSize;
  List<CenterModel> smallSize;

  factory ClimbingResults.fromMapJson(Map<String, dynamic> response) {
    LoggerController.to
        .debug('[ClimbingResult] response dataType is Map<String, dynamic>');

    return ClimbingResults(
      // response['bigs' or 'middles'] => List<Map<dynamic>>
      bigSize: List.from(response['bigs'])
          .map((e) => CenterModel.fromJson(e))
          .toList(),
      middleSize: List.from(response['middles'])
          .map((e) => CenterModel.fromJson(e))
          .toList(),
    );
  }

  factory ClimbingResults.fromListJson(List<dynamic> response) {
    LoggerController.to.debug(
        '[ClimbingResult] response dataType is List<Map<String, dynamic>>');
    return ClimbingResults(
      whatAbuoutHere: List<CenterModel>.from(
        response.map(
          (data) => CenterModel.fromJson(data),
        ),
      ),
    );
  }
}
