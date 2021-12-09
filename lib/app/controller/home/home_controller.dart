import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:climb_labs/app/data/dummy/about_hear.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  final RxList<AboutHear> aboutDummyList = <AboutHear>[].obs;
  final RxDouble carouselIndex = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    carouselController = CarouselController();

    aboutDummyList.addAll(aboutHearDummyList);
  }
}
