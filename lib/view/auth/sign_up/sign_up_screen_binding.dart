import 'package:bitakasla/view/auth/sign_up/sign_up_screen_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpScreenController());
  }
}