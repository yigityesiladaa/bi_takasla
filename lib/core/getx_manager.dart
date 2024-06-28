import 'package:bitakasla/core/localization/localization_service.dart';
import 'package:bitakasla/core/services/cache_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';

class GetxManager {
  static Future<void> setupServices() async {
    Get.put(Dio(), permanent: true);
    Get.put(Logger(), permanent: true);
    Get.put(CacheService(), permanent: true);
    await Get.put(LocalizationService(), permanent: true).initLocale();
  }

  static Future<void> setupControllers() async {
  }

}
