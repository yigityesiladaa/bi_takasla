import 'package:get/get.dart';
import 'package:logger/web.dart';

class GetxManager {
  static Future<void> setupServices() async {
    Get.put(Logger(), permanent: true);
  }

  static Future<void> setupControllers() async {
  }

}
