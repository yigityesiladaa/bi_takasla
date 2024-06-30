import 'package:bitakasla/config/routes/app_pages.dart';
import 'package:bitakasla/core/base/base_getx_controller.dart';

class SignInScreenController extends BaseGetxController {

  Future<void> signIn() async {
    Get.offAllNamed(AppRoutes.navBarScreen);
  }
  
}
