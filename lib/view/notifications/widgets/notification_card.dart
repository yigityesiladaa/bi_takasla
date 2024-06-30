import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/core/base/base_stateless_widget.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/models/notification_card_model.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:bitakasla/widgets/custom_cached_network_image.dart';
import 'package:bitakasla/widgets/image_failed_to_load.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeleton_text/skeleton_text.dart';

class NotificationCard extends BaseStatelessWidget {
  final NotificationCardModel? model;
  const NotificationCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding.symmetric(horizontal: 40, vertical: 20),
      margin: padding.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(Get.width * .03),
      ),
      child: Row(
        children: [
          //_buildCustomNetworkImage(imageUrl: model?.imageUrl)
          _buildCustomNetworkImage(
              imageUrl:
                  'https://www.pushengage.com/wp-content/uploads/2023/06/In-App-Notification-Examples.png'),
          SizedBox(width: 40.w),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScaleFactorAutoSizeText(
                      text: model?.title,
                      style: theme.primaryTextTheme.bodyMedium!.bold,
                      maxLines: 2,
                    ),
                    ScaleFactorAutoSizeText(
                      text: model?.title,
                      style: theme.primaryTextTheme.bodySmall!.semibold
                          .copyWith(color: AppColors.grey600Color),
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ScaleFactorAutoSizeText(
                  text: model?.description,
                  style: theme.primaryTextTheme.bodySmall!.semibold
                      .copyWith(color: AppColors.primaryColor),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          FaIcon(
            Icons.arrow_forward_ios,
            size: 20.h,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomNetworkImage({
    required String imageUrl,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return Expanded(
      flex: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Get.width * .03),
        child: CustomCachedNetworkImage(
          imageUrl: imageUrl,
          height: height ?? 85.h,
          width: double.infinity,
          fit: fit,
          placeholder: (context, url) => SkeletonAnimation(
            child: const SizedBox(),
          ),
          errorWidget: (context, url, error) => const ImageFailedToLoad(),
        ),
      ),
    );
  }
}
