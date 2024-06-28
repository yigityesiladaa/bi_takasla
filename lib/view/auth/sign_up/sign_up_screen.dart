import 'package:bitakasla/core/base/base_get_view.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/localization/localization_keys.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:bitakasla/view/auth/sign_up/sign_up_screen_controller.dart';
import 'package:bitakasla/widgets/custom_button.dart';
import 'package:bitakasla/widgets/custom_text_field.dart';
import 'package:bitakasla/widgets/primary_app_bar.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';

class SignUpScreen extends BaseGetView<SignUpScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PrimaryAppBar(title: LocalizationKeys.signUpTextKey.tr),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: padding.symmetric(horizontal: 40,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(label: LocalizationKeys.nameSurnameTextKey.tr),
              CustomTextField(label: LocalizationKeys.phoneTextKey.tr),
              CustomTextField(label: LocalizationKeys.mailTextKey.tr),
              CustomTextField(label: LocalizationKeys.userNameTextKey.tr),
              CustomTextField(
                label: LocalizationKeys.passwordTextKey.tr,
                suffixIcon: controller.isPasswordObscured.value ? Icons.visibility_off : Icons.visibility,
                onTapSuffixIcon: () => controller.changePasswordObscureValue()
              ),
              CustomTextField(
                  label: LocalizationKeys.confirmPasswordTextKey.tr),
              SizedBox(height: 60.h),
              Padding(
                padding: padding.symmetric(horizontal: 40),
                child: CustomButton(
                  buttonText: LocalizationKeys.signUpTextKey.tr,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 30.h),
              _signUpRow(),
            ],
          ),
        ),
      );

      _signUpRow() => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleFactorAutoSizeText(
            text: LocalizationKeys.alreadyHaveAccountTextKey.tr,
            style: theme.primaryTextTheme.bodyMedium!,
            textAlign: TextAlign.end,
          ),
          SizedBox(width: 40.w),
          GestureDetector(
            onTap: () => Get.back(),
            child: ScaleFactorAutoSizeText(
              text: LocalizationKeys.signInTextKey.tr,
              style: theme.primaryTextTheme.bodyMedium!
                  .copyWith(color: AppColors.primaryColor),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      );
}
