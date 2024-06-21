import 'package:bitakasla/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  BaseController(BuildContext context) {
    Get.put(SizeConfig(context), permanent: true);
  }
}