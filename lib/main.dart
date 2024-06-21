import 'package:bitakasla/config/routes/app_pages.dart';
import 'package:bitakasla/core/base/base_controller.dart';
import 'package:bitakasla/core/getx_manager.dart';
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
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute: AppPages.initial,
        );
      }
    );
  }
}
