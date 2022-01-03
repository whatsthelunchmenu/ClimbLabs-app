import 'package:climb_labs/app/data/model/center_model.dart';
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

  RxBool isLoading = false.obs;
  int pageCount = 1;

  SearchDetailController({required this.location});
  final String location;

  List<CenterModel> get climbingResultList =>
      climbingSearchResult.value.searchResults;

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
      {String sidos = "", String scaleType = ""}) async {
    locationScrollController.removeListener(() {});
    pageCount = 1;
    hasMoreLocation.value = false;
    climbingSearchResult.update((climbing) {
      climbing!.searchResults.clear();
    });
    getLocationSearch(location, sidos: sidos, scaleType: scaleType);
    locationScrollController.addListener(() {
      if (locationScrollController.position.pixels ==
              locationScrollController.position.maxScrollExtent &&
          hasMoreLocation.value) {
        getLocationSearch(location, sidos: sidos, scaleType: scaleType);
      }
    });
  }

  getLocationSearch(String location,
      {String sidos = "",
      String scaleType = "ALL",
      int page = 1,
      int size = 10}) async {
    isLoading.value = true;
    final ClimbingSearchResult result = await repository.getLocationSearch(
        location,
        sidos: sidos,
        scaleType: scaleType,
        page: pageCount);

    if (result.searchResults.isNotEmpty) {
      climbingSearchResult.update((climbing) {
        climbing!.searchResults.addAll(result.searchResults);
      });
      pageCount++;
      hasMoreLocation.value = true;
    } else {
      hasMoreLocation.value = false;
    }
    isLoading.value = false;
  }
}
