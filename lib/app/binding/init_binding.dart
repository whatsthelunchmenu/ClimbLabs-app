import 'package:climb_labs/app/controller/controllers.dart';
import 'package:get/instance_manager.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(SearchController(), permanent: true);
    Get.put(LoggerController(), permanent: true);
  }
}
