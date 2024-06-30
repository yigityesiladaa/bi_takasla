import 'package:bitakasla/config/routes/app_pages.dart';
import 'package:bitakasla/config/theme/themes.dart';
import 'package:bitakasla/core/base/base_controller.dart';
import 'package:bitakasla/core/getx_manager.dart';
import 'package:bitakasla/core/localization/localization_service.dart';
import 'package:bitakasla/core/localization/localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await GetxManager.setupServices();
  await GetxManager.setupControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
        init: BaseController(context),
        builder: (_) {
          return GetMaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            locale: Get.find<LocalizationService>().getLocale(),
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
            initialRoute: AppPages.initial,
            translations: AppLanguages(),
          );
        });
  }
}
