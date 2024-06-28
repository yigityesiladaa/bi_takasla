import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/core/base/base_stateless_widget.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';

class CustomButton extends BaseStatelessWidget {
  final String buttonText;
  final void Function() onTap;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Builder(builder: (context) {
        return Container(
          alignment: Alignment.center,
          padding: padding.symmetric(vertical: 10, horizontal: 40),
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(Get.width * .06),
          ),
          child: ScaleFactorAutoSizeText(
            text: buttonText,
            style: theme.primaryTextTheme.bodyLarge!.medium.copyWith(
              color: AppColors.darkWhiteColor
            ),
          ),
        );
      }),
    );
  }
}
