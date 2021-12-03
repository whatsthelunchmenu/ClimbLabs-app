import 'package:climb_labs/app/data/dummy/location_model.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final RxList<LocationItem> locationItems = <LocationItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    locationItemGenerator();
  }

  locationItemGenerator() {
    locationDummyList.forEach((key, value) {
      locationItems.add(LocationItem(name: key, imageUrl: value));
    });
  }
}
