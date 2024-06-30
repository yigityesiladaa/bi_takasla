import 'package:bitakasla/config/theme/theme_extensions.dart';
import 'package:bitakasla/core/base/base_stateless_widget.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/localization/localization_keys.dart';
import 'package:bitakasla/core/models/drawer_item_model.dart';
import 'package:bitakasla/core/utils/formatter.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:bitakasla/widgets/custom_drawer/custom_drawer_controller.dart';
import 'package:bitakasla/widgets/scale_factor_autosize_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends BaseStatelessWidget {
  CustomDrawer({super.key});

  final controller = Get.put(CustomDrawerController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: Column(
        children: <Widget>[
          _buildHeader(),
          _buildWallet(),
          ...List.generate(
            controller.drawerList.length,
            (index) => _buildDrawerItem(controller.drawerList[index]),
          ),
          _buildBottom(),
          const Spacer(),
          _buildSocialMediaButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() => UserAccountsDrawerHeader(
        accountName: ScaleFactorAutoSizeText(
          text: 'Yigit Yesilada',
          style: theme.primaryTextTheme.bodyMedium!.semibold.copyWith(
            color: AppColors.white,
          ),
        ),
        accountEmail: ScaleFactorAutoSizeText(
          text: 'yy.yesilada@gmail.com',
          style: theme.primaryTextTheme.bodySmall!.regular.copyWith(
            color: AppColors.white,
          ),
        ),
        currentAccountPicture: const CircleAvatar(
          backgroundImage: NetworkImage("https://example.com/profile.jpg"),
        ),
        decoration: BoxDecoration(color: theme.primaryColor),
      );

  Widget _buildWallet() => Container(
        margin: padding.symmetric(horizontal: 40, vertical: 10),
        padding: padding.symmetric(vertical: 16, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * .03),
          color: AppColors.cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.wallet, color: theme.primaryColor),
                SizedBox(width: 40.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScaleFactorAutoSizeText(
                      text: LocalizationKeys.walletTextKey.tr,
                      style: theme.primaryTextTheme.bodyMedium?.semibold,
                    ),
                    ScaleFactorAutoSizeText(
                      text: Formatter.formatMoney('35000'),
                      style: theme.primaryTextTheme.bodyMedium?.semibold,
                    ),
                  ],
                ),
              ],
            ),
            FaIcon(
              Icons.arrow_forward_ios,
              size: 20.h,
            ),
          ],
        ),
      );
  Widget _buildDrawerItem(DrawerItemModel model) => GestureDetector(
    onTap: () {
      model.onTap();
      Get.back();
    },
    child: Container(
          margin: padding.symmetric(horizontal: 40, vertical: 10),
          padding: padding.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * .03),
            color: AppColors.cardColor,
          ),
          child: Padding(
            padding: padding.symmetric(vertical: 0, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(model.icon, color: AppColors.primaryColor),
                    SizedBox(width: 40.w),
                    ScaleFactorAutoSizeText(
                      text: model.title.tr,
                      style: theme.primaryTextTheme.bodyMedium!.semibold,
                    ),
                  ],
                ),
                FaIcon(
                  Icons.arrow_forward_ios,
                  size: 20.h,
                ),
              ],
            ),
          ),
        ),
  );

  Widget _buildBottom() => Container(
        margin: padding.symmetric(horizontal: 40, vertical: 10),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * .03),
          color: AppColors.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {},
                child: ScaleFactorAutoSizeText(
                  text: LocalizationKeys.settingsTitleTextKey.tr,
                  textAlign: TextAlign.start,
                  style: theme.primaryTextTheme.bodyMedium?.semibold,
                )),
            TextButton(
                onPressed: () {},
                child: ScaleFactorAutoSizeText(
                  text: LocalizationKeys.termsOfUseTitleTextKey.tr,
                  style: theme.primaryTextTheme.bodyMedium?.semibold,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                )),
            TextButton(
                onPressed: () {},
                child: ScaleFactorAutoSizeText(
                  text: LocalizationKeys.kvkkTitleTextKey.tr,
                  style: theme.primaryTextTheme.bodyMedium?.semibold,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                )),
            TextButton(
                onPressed: () {},
                child: ScaleFactorAutoSizeText(
                  text: LocalizationKeys.signOutTextKey.tr,
                  style: theme.primaryTextTheme.bodyMedium?.semibold,
                  textAlign: TextAlign.start,
                )),
          ],
        ),
      );

  Widget _buildSocialMediaButtons() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.facebook),
              onPressed: () {
                // Navigate to Facebook
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.instagram),
              onPressed: () {
                // Navigate to Twitter
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.twitter),
              onPressed: () {
                // Navigate to Instagram
              },
            ),
          ],
        ),
      );
}
