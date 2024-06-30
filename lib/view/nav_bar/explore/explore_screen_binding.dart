import 'package:bitakasla/view/nav_bar/explore/explore_screen_controller.dart';
import 'package:get/get.dart';

class ExploreScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExploreScreenController());
  }
}