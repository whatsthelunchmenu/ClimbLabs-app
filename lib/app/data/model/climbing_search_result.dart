import 'package:climb_labs/app/data/model/center_model.dart';

class ClimbingSearchResult {
  ClimbingSearchResult({
    this.searchResults = const [],
  });

  List<CenterModel> searchResults;

  factory ClimbingSearchResult.fromList(List<dynamic> jsonList) {
    return ClimbingSearchResult(
      searchResults:
          List.from(jsonList).map((e) => CenterModel.fromJson(e)).toList(),
    );
  }
}
