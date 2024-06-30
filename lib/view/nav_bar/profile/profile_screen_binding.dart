import 'package:bitakasla/view/nav_bar/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileScreenController());
  }
}