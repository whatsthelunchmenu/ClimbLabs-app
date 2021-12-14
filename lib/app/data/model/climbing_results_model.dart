import 'package:climb_labs/app/data/model/center_model.dart';

class ClimbingResults {
  ClimbingResults({
    this.whatAbuoutHere = const [],
    this.bigSize = const [],
    this.middleSize = const [],
    this.smallSize = const [],
  });

  final List<CenterModel> whatAbuoutHere;
  final List<CenterModel> bigSize;
  final List<CenterModel> middleSize;
  final List<CenterModel> smallSize;

  factory ClimbingResults.fromJson(dynamic response) {
    if (response is Map<String, dynamic>) {
      return ClimbingResults(
        bigSize: (response['bigs'] as List)
            .map((e) => CenterModel.fromJson(e))
            .toList(),
        middleSize: (response['middles'] as List)
            .map((e) => CenterModel.fromJson(e))
            .toList(),
      );
    } else if (response is List<Map<String, dynamic>>) {
      return ClimbingResults(
        whatAbuoutHere: List<CenterModel>.from(
          response.map(
            (data) => CenterModel.fromJson(data),
          ),
        ),
      );
    } else {
      return ClimbingResults();
    }
  }
}
