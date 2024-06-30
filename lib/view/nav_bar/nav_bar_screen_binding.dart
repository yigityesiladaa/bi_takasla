import 'package:bitakasla/view/nav_bar/nav_bar_screen_controller.dart';
import 'package:get/get.dart';

class NavBarScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavBarScreenController());
  }
}