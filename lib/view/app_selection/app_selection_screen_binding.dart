import 'package:bitakasla/view/app_selection/app_selection_screen_controller.dart';
import 'package:get/get.dart';

class AppSelectionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppSelectionScreenController());
  }
}