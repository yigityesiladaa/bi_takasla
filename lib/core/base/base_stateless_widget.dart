import 'package:bitakasla/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  SizeConfig get sizeConfig => Get.find<SizeConfig>();
  ResponsivePadding get padding => sizeConfig.padding;
  ThemeData get theme => Get.theme;
  Logger get logger => Get.find<Logger>();
  const BaseStatelessWidget({super.key});
}
