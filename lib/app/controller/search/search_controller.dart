import 'package:climb_labs/app/data/dummy/location_model.dart';
import 'package:climb_labs/app/data/model/climbing_search_result.dart';
import 'package:climb_labs/app/data/repository/search/search_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.find();
  final RxList<LocationItem> locationItems = <LocationItem>[].obs;
  final RxBool hasMoreKeyword = false.obs;
  late TextEditingController textEditingController;
  late ScrollController keywordScrollController;
  late SearchRepository repository;
  final Rx<ClimbingSearchResult> _climbingSearchResult =
      ClimbingSearchResult().obs;
  int pageCount = 1;

  @override
  void onInit() {
    super.onInit();
    locationItemGenerator();
    repository = SearchRepository();
    textEditingController = TextEditingController();
    keywordScrollController = ScrollController();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
    keywordScrollController.dispose();
  }

  ClimbingSearchResult get climbingSearchResult => _climbingSearchResult.value;

  locationItemGenerator() {
    locationDummyList.forEach((key, value) {
      locationItems.add(LocationItem(name: key, imageUrl: value));
    });
  }

  keywordSearchAddListner(String keyword) {
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
      _climbingSearchResult.update((searchResult) {
        searchResult!.searchResults.addAll(result.searchResults);
      });
      pageCount++;
      hasMoreKeyword.value = true;
    } else {
      hasMoreKeyword.value = false;
    }
  }
}
