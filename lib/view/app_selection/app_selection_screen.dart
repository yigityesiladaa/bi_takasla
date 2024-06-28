import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/core/localization/localization_keys.dart';
import 'package:bitakasla/widgets/custom_cached_network_image.dart';
import 'package:bitakasla/widgets/image_failed_to_load.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';
import 'package:bitakasla/config/routes/app_pages.dart';
import 'package:bitakasla/core/base/base_get_view.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/constants/image_constants.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:bitakasla/view/app_selection/app_selection_screen_controller.dart';
import 'package:skeleton_text/skeleton_text.dart';

class AppSelectionScreen extends BaseGetView<AppSelectionScreenController> {
  const AppSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Row(
          children: [
            _buildSide(
              imageUrl: ImageConstants.handShakeImage,
              title: 'Bi\'Takasla',
              subtitle: LocalizationKeys.swapAppDescriptionTextKey.tr,
              backgroundColor: AppColors.primaryColor,
              titleColor: Colors.white,
              subtitleColor: Colors.white,
              onTap: () => Get.toNamed(AppRoutes.signInScreen),
            ),
            _buildSide(
              imageUrl: ImageConstants.auctionImage,
              title: LocalizationKeys.auctionAppTitleTextKey.tr,
              subtitle: LocalizationKeys.auctionAppDescriptionTextKey.tr,
              backgroundColor: AppColors.darkWhiteColor
              ,
              titleColor: AppColors.primaryColor,
              subtitleColor: AppColors.primaryColor,
              onTap: () {},
            ),
          ],
        ),
        Padding(
          padding: padding.only(top: 40),
          child: _buildCustomNetworkImage(
            imageUrl: ImageConstants.topLogoAreaImage,
          ),
        ),
      ],
    );
  }

  Widget _buildSide({
    required String imageUrl,
    required String title,
    required String subtitle,
    required Color backgroundColor,
    required Color titleColor,
    required Color subtitleColor,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: padding.only(top: 60),
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCustomNetworkImage(
              imageUrl: imageUrl,
              height: 300.h,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            _buildText(
              text: title,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
            const SizedBox(height: 20),
            _buildText(
              text: subtitle,
              color: subtitleColor,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomNetworkImage({
    required String imageUrl,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return CustomCachedNetworkImage(
      imageUrl: imageUrl,
      height: height ?? 220.h,
      width: double.infinity,
      fit: fit,
      placeholder: (context, url) => SkeletonAnimation(
        child: const SizedBox(),
      ),
      errorWidget: (context, url, error) => const ImageFailedToLoad(),
    );
  }

  Widget _buildText({
    required String text,
    required Color color,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.left,
    int maxLines = 1,
  }) {
    return Padding(
      padding: padding.symmetric(horizontal: 20),
      child: ScaleFactorAutoSizeText(
        text: text,
        maxLines: maxLines,
        textAlign: textAlign,
        style: theme.primaryTextTheme.bodyMedium!.bold.copyWith(color: color),
      ),
    );
  }
}
