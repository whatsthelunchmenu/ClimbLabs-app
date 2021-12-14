import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoggerController extends GetxController {
  static LoggerController get to => Get.find();
  late Logger logger;

  @override
  void onInit() {
    super.onInit();
    logger = Logger();
  }

  void debug(String message) {
    logger.d(message);
  }

  void info(String message) {
    logger.i(message);
  }

  void error(String message) {
    logger.e(message);
  }

  void warning(String message) {
    logger.w(message);
  }
}
