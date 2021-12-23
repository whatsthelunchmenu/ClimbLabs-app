import 'package:carousel_slider/carousel_controller.dart';
import 'package:climb_labs/app/data/model/geocode_model.dart';
import 'package:climb_labs/app/data/repository/detail/detail_repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find();
  late DetailRepository repository;
  late CarouselController carouselController;
  final Rx<GeocodeModel> _geocodeResult = GeocodeModel().obs;
  final RxInt sliderCurrentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    repository = DetailRepository();
    carouselController = CarouselController();
  }

  GeocodeModel get geocodeResult => _geocodeResult.value;

  getGeocode(String address) async {
    await repository.getGeocode(address).then((value) {
      if (value != null) {
        _geocodeResult(value);
      }
    });
  }
}
