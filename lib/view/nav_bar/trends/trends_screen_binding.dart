import 'package:bitakasla/view/nav_bar/trends/trends_screen_controller.dart';
import 'package:get/get.dart';

class TrendsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrendsScreenController());
  }
}