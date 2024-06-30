import 'package:bitakasla/config/routes/app_pages.dart';
import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/core/base/base_get_view.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/localization/localization_keys.dart';
import 'package:bitakasla/view/auth/sign_in/sign_in_screen_controller.dart';
import 'package:bitakasla/widgets/custom_button.dart';
import 'package:bitakasla/widgets/custom_text_field.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:bitakasla/widgets/primary_app_bar.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';

class SignInScreen extends BaseGetView<SignInScreenController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: LocalizationKeys.signInTextKey.tr,
          bgColor: theme.scaffoldBackgroundColor,
          iconThemeData: const IconThemeData(color: AppColors.grey1000Color),
          titleStyle: theme.primaryTextTheme.titleMedium!.semibold.copyWith(
            color: AppColors.grey1000Color
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() => Padding(
        padding: padding.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CustomTextField(label: LocalizationKeys.userNameTextKey.tr),
                CustomTextField(label: LocalizationKeys.passwordTextKey.tr),
                SizedBox(height: 20.h),
                _forgotPasswordButton(),
                SizedBox(height: 60.h),
                Padding(
                  padding: padding.symmetric(horizontal: 40),
                  child: CustomButton(
                    buttonText: LocalizationKeys.signInTextKey.tr,
                    onTap: () async => await controller.signIn(),
                  ),
                ),
                SizedBox(height: 60.h),
                _signUpRow(),
              ],
            ),
          ],
        ),
      );

  _forgotPasswordButton() => GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: Get.width,
          child: ScaleFactorAutoSizeText(
            text: LocalizationKeys.forgotPasswordTextKey.tr,
            style: theme.primaryTextTheme.bodyMedium!.copyWith(
              color: AppColors.darkPrimaryColor.withOpacity(.5),
            ),
            textAlign: TextAlign.end,
          ),
        ),
      );

  _signUpRow() => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleFactorAutoSizeText(
            text: LocalizationKeys.dontHaveAccountYetTextKey.tr,
            style: theme.primaryTextTheme.bodyMedium!,
          ),
          SizedBox(width: 40.w),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.signUpScreen),
            child: ScaleFactorAutoSizeText(
              text: LocalizationKeys.signUpTextKey.tr,
              style: theme.primaryTextTheme.bodyMedium!
                  .copyWith(color: AppColors.primaryColor),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      );
}
