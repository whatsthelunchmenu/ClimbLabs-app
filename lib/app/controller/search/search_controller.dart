import 'package:climb_labs/app/data/dummy/location_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.find();
  final RxList<LocationItem> locationItems = <LocationItem>[].obs;
  final RxBool hasMoreKeyword = false.obs;
  late TextEditingController textEditingController;

  @override
  void onInit() {
    super.onInit();
    locationItemGenerator();
    textEditingController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }

  locationItemGenerator() {
    locationDummyList.forEach((key, value) {
      locationItems.add(LocationItem(name: key, imageUrl: value));
    });
  }
}
