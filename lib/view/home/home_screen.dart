import 'package:bitakasla/components/custom_cached_network_image.dart';
import 'package:bitakasla/components/image_failed_to_load.dart';
import 'package:bitakasla/components/scale_factor_autosize_text.dart';
import 'package:bitakasla/core/base/base_stateless_widget.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/constants/image_constants.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: _buildBody(),
    );
  }

  _buildBody() => Stack(
    children: [
      Row(
        children: [
          _buildLeftSide(),
          _buildRightSide(),
        ],
      ),
      Padding(
        padding: padding.only(top: 30),
        child: _buildCustomNetworkImage(imageUrl: ImageConstants.topLogoAreaImage),
      ),
    ],
  );

  _buildLeftSide() => Container(
        height: Get.height,
        width: Get.width * 0.5,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCustomNetworkImage(
              imageUrl: ImageConstants.handShakeImage,
              height: 300.h,
              fit: BoxFit.contain,
              
            ),
            ScaleFactorAutoSizeText(
                text: 'Bi\'Takasla',
                maxLines: 1,
                style: TextStyle(
                  fontSize: SizeConfig.fontSize18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              ScaleFactorAutoSizeText(
                text: 'Ürünlerinizi takaslayarak çağ atlayın',
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.fontSize14,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      );

  _buildRightSide() => Container(
        height: Get.height,
        width: Get.width * 0.5,
        margin: padding.only(top: 40),
        color: AppColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCustomNetworkImage(
              imageUrl: ImageConstants.auctionImage,
              height: 300.h,
              fit: BoxFit.contain,
            ),
            ScaleFactorAutoSizeText(
                text: 'Açık Artırma',
                maxLines: 1,
                style: TextStyle(
                  fontSize: SizeConfig.fontSize18,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              ScaleFactorAutoSizeText(
                text: 'Açık artırma bölümü çok yakında aktif olacak..',
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.fontSize14,
                  color: AppColors.primaryColor,
                ),
              ),
          ],
        ),
      );

  _buildCustomNetworkImage({required String imageUrl, double? height, BoxFit fit = BoxFit.cover}) =>
      CustomCachedNetworkImage(
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
