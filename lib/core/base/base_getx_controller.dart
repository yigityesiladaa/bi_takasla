import 'package:get/get.dart';
import 'package:logger/web.dart';
export 'package:get/get.dart';

class BaseGetxController extends GetxController {
  final logger = Get.find<Logger>();
}
