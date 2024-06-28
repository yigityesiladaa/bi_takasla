import 'package:bitakasla/view/auth/sign_in/sign_in_screen_controller.dart';
import 'package:get/get.dart';

class SignInScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInScreenController());
  }
}