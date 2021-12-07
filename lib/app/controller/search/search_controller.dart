import 'package:climb_labs/app/data/dummy/location_model.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.find();
  final RxList<LocationItem> locationItems = <LocationItem>[].obs;
  final RxString _seletedLocation = "".obs;

  @override
  void onInit() {
    super.onInit();
    locationItemGenerator();
  }

  String get seletedLocation => _seletedLocation.value;

  locationItemGenerator() {
    locationDummyList.forEach((key, value) {
      locationItems.add(LocationItem(name: key, imageUrl: value));
    });
  }

  toggleSelectLocation({String location = ""}) {
    _seletedLocation(location);
  }
}
