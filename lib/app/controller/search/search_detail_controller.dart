import 'package:climb_labs/app/data/model/climbing_search_result.dart';
import 'package:climb_labs/app/data/repository/repositories.dart'
    show SearchRepository;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDetailController extends GetxController {
  static SearchDetailController get to => Get.find();
  final RxBool hasMoreLocation = false.obs;
  late ScrollController locationScrollController;
  late SearchRepository repository;
  Rx<ClimbingSearchResult> climbingSearchResult =
      ClimbingSearchResult(searchResults: []).obs;
  int pageCount = 1;

  SearchDetailController({required this.location});
  final String location;

  @override
  void onInit() {
    super.onInit();
    locationScrollController = ScrollController();
    repository = SearchRepository();
    getLocationSearch(location);
    locationSearchAddListner(location);
  }

  @override
  void onClose() {
    super.onClose();
    locationScrollController.dispose();
  }

  locationSearchAddListner(String location) {
    locationScrollController.addListener(() {
      if (locationScrollController.position.pixels ==
              locationScrollController.position.maxScrollExtent &&
          hasMoreLocation.value) {
        getLocationSearch(location);
      }
    });
  }

  locationSearchUpdateListner(String location,
      {String sido = "ALL", String scaleType = "ALL"}) async {
    locationScrollController.removeListener(() {
      pageCount = 0;
      hasMoreLocation.value = false;
    });
    locationScrollController.addListener(() {
      if (locationScrollController.position.pixels ==
              locationScrollController.position.maxScrollExtent &&
          hasMoreLocation.value) {
        getLocationSearch(location, sido: sido, scaleType: scaleType);
      }
    });
  }

  getLocationSearch(String location,
      {String sido = "ALL",
      String scaleType = "ALL",
      int page = 1,
      int size = 10}) async {
    final ClimbingSearchResult result =
        await repository.getLocationSearch(location, page: page, size: size);
    if (result.searchResults.isNotEmpty) {
      climbingSearchResult.update((climbing) {
        climbing!.searchResults.addAll(result.searchResults);
      });
      pageCount++;
      hasMoreLocation.value = true;
    } else {
      hasMoreLocation.value = false;
    }
  }
}
