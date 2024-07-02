import 'package:bitakasla/config/routes/app_pages.dart';
import 'package:bitakasla/core/base/base_get_view.dart';
import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/constants/app_constants.dart';
import 'package:bitakasla/core/localization/localization_keys.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:bitakasla/view/nav_bar/nav_bar_screen_controller.dart';
import 'package:bitakasla/widgets/custom_drawer/custom_drawer.dart';
import 'package:bitakasla/widgets/primary_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarScreen extends BaseGetView<NavBarController> {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;
    return PopScope(
      canPop: controller.currentIndex != 0,
      onPopInvoked: (_) => controller.changeScreen(0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: CustomDrawer(),
        appBar: _buildAppBar(),
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.homeScreen,
          onGenerateRoute: controller.onGenerateRoute,
        ),
        bottomNavigationBar: _bottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () => Get.toNamed(AppRoutes.addProductScreen),
          child: SvgPicture.asset('assets/nav_bar_icons/add.svg'),
        ),
      ),
    );
  }

  PrimaryAppBar _buildAppBar() => PrimaryAppBar(
        title: LocalizationKeys.bitakaslaTitleTextKey.tr,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.notificationsScreen),
            icon:
                const Icon(Icons.notifications, color: AppColors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_rounded,
                color: AppColors.white),
          ),
        ],
      );

  Widget _bottomNavigationBar() => Obx(() => BottomAppBar(
  shape: const CircularNotchedRectangle(),
  notchMargin: 16.h,
  elevation: 0,
  color: AppColors.white,
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        AppConstants.navbarItemNames.length,
        (index) => buildNavBarItem(index),
      ),
    ),
));

/*
CustomPaint(
    painter: BottomAppBarBorderPainter(
      notchMargin: 16.h,
      borderColor: AppColors.grey900Color, // Choose your desired border color
      borderWidth: 1.0, // Choose your desired border width
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        AppConstants.navbarItemNames.length,
        (index) => buildNavBarItem(index),
      ),
    ),
  ),
*/

  Widget buildNavBarItem(int index) {
    var imageName = AppConstants.navbarItemNames[index];
    return Expanded(
      child: InkWell(
        onTap: () => controller.changeScreen(index),
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Center(
            child: imageName.isNotEmpty
                ? SvgPicture.asset(
                    controller.currentIndex == index
                        ? 'assets/nav_bar_icons/${imageName}_active.svg'
                        : 'assets/nav_bar_icons/$imageName.svg',
                    height: 32.h,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
