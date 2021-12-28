import 'package:climb_labs/app/data/model/climbing_search_result.dart';
import 'package:climb_labs/app/data/repository/search/search_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchKeywordController extends GetxController {
  final RxBool hasMoreKeyword = false.obs;
  late ScrollController keywordScrollController;
  late SearchRepository repository;
  Rx<ClimbingSearchResult> climbingSearchResult =
      ClimbingSearchResult(searchResults: []).obs;
  int pageCount = 1;

  SearchKeywordController({this.keyword = ""});
  final String keyword;

  @override
  void onInit() {
    super.onInit();
    repository = SearchRepository();
    keywordScrollController = ScrollController();
    getKeywordSearch(keyword);
    keywordSearchAddListner();
  }

  keywordSearchAddListner() {
    keywordScrollController.addListener(() {
      if (keywordScrollController.position.pixels ==
              keywordScrollController.position.maxScrollExtent &&
          hasMoreKeyword.value) {
        getKeywordSearch(keyword, page: pageCount);
      }
    });
  }

  getKeywordSearch(String keyword, {int page = 1, int size = 10}) async {
    final ClimbingSearchResult result =
        await repository.getKeywordSearch(keyword, page: page, size: size);

    if (result.searchResults.isNotEmpty) {
      climbingSearchResult.update((climbing) {
        climbing!.searchResults.addAll(result.searchResults);
      });
      pageCount++;
      hasMoreKeyword.value = true;
    } else {
      hasMoreKeyword.value = false;
    }
  }
}
