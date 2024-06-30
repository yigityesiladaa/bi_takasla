import 'package:bitakasla/core/base/base_getx_controller.dart';
import 'package:bitakasla/core/localization/localization_keys.dart';
import 'package:bitakasla/core/models/drawer_item_model.dart';
import 'package:bitakasla/view/nav_bar/nav_bar_screen_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawerController extends BaseGetxController {
  final navBarController = Get.find<NavBarController>();
  late final List<DrawerItemModel> drawerList;

  @override
  void onInit() {
    drawerList = [
      DrawerItemModel(
        title: LocalizationKeys.homeTitleTextKey,
        icon: FontAwesomeIcons.house,
        onTap: () => navBarController.changeScreen(0),
      ),
      DrawerItemModel(
        title: LocalizationKeys.exploreTitleTextKey,
        icon: FontAwesomeIcons.compass,
        onTap: () => navBarController.changeScreen(1),
      ),
      DrawerItemModel(
        title: LocalizationKeys.trendsTitleTextKey,
        icon: FontAwesomeIcons.fire,
        onTap: () => navBarController.changeScreen(2),
      ),
      DrawerItemModel(
        title: LocalizationKeys.profileTitleTextKey,
        icon: FontAwesomeIcons.user,
        onTap: () => navBarController.changeScreen(3),
      ),
    ];
    super.onInit();
  }
}
