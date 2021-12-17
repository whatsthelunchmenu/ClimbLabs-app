import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:climb_labs/app/data/dummy/about_hear.dart';
import 'package:climb_labs/app/data/model/climbing_results_model.dart';
import 'package:climb_labs/app/data/repository/home/home_repository.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late CarouselController carouselController;
  late HomeRepository repository;
  final RxList<AboutHear> aboutDummyList = <AboutHear>[].obs;
  final RxDouble carouselIndex = 0.0.obs;
  final Rx<ClimbingResults> _climbingResults = ClimbingResults().obs;

  @override
  void onInit() {
    super.onInit();
    repository = HomeRepository();
    carouselController = CarouselController();
    getWhatAboutHere();
    setPermission();
    aboutDummyList.addAll(aboutHearDummyList);
  }

  ClimbingResults get climbingResults => _climbingResults.value;

  setPermission() async {
    var status = await Permission.location.status;

    if (status.isDenied) {
      await [
        Permission.location,
      ].request();
    }
  }

  getWhatAboutHere({int limit = 4}) async {
    final ClimbingResults? result = await repository.getWhatAboutHere(limit);

    if (result != null && result.whatAbuoutHere.isNotEmpty) {
      _climbingResults.update((climbing) {
        climbing!.whatAbuoutHere = result.whatAbuoutHere;
      });
    }
  }

  getItsThisBig({
    int limit = 5,
    List<String> scaleType = const ['BIG', 'MIDDLE'],
  }) async {
    final ClimbingResults? result =
        await repository.getItsThisBig(limit, scaleType);

    if (result != null &&
        (result.bigSize.isNotEmpty && result.middleSize.isNotEmpty)) {
      _climbingResults.update((climbing) {
        climbing!.bigSize = result.bigSize;
        climbing.middleSize = result.middleSize;
      });
    }
  }
}
