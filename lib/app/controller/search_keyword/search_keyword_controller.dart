import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchKeywordController extends GetxController {
  static SearchKeywordController get to => Get.find();
  late TextEditingController textEditingController;

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
  }
}
