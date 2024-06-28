import 'package:bitakasla/core/base/base_getx_controller.dart';

class SignUpScreenController extends BaseGetxController {
  var isPasswordObscured = true.obs;
  var isConfirmPasswordObscured = true.obs;

  void changePasswordObscureValue() => isPasswordObscured.value = !isPasswordObscured.value;
  void changeConfirmPasswordObscureValue() => isConfirmPasswordObscured.value = !isConfirmPasswordObscured.value;
}