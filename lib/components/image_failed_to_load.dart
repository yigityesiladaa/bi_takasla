
import 'package:bitakasla/core/base/base_stateless_widget.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageFailedToLoad extends BaseStatelessWidget {
  final Color? backgroundColor;
  final int horizontalMargin;
  const ImageFailedToLoad({super.key, this.backgroundColor, this.horizontalMargin = 40});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding.symmetric(horizontal: horizontalMargin),
      alignment: Alignment.center,
      height: 150.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(Get.width * 0.03),
      ),
      child: FaIcon(
        FontAwesomeIcons.image,
        size: 40.w,
        color: AppColors.hintColor,
      ),
    );
  }
}
