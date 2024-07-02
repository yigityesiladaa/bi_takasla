import 'package:bitakasla/view/add_product/add_product_screen_controller.dart';
import 'package:get/get.dart';

class AddProductScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddProductScreenController());
  }
}