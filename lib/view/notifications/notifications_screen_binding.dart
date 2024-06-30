import 'package:bitakasla/view/notifications/notifications_screen_controller.dart';
import 'package:get/get.dart';

class NotificationsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationsScreenController());
  }
}