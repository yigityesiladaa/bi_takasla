import 'package:bitakasla/config/routes/app_pages.dart';
import 'package:bitakasla/core/base/base_getx_controller.dart';
import 'package:bitakasla/view/nav_bar/explore/explore_screen.dart';
import 'package:bitakasla/view/nav_bar/explore/explore_screen_binding.dart';
import 'package:bitakasla/view/nav_bar/home/home_screen.dart';
import 'package:bitakasla/view/nav_bar/home/home_screen_binding.dart';
import 'package:bitakasla/view/nav_bar/profile/profile_screen.dart';
import 'package:bitakasla/view/nav_bar/profile/profile_screen_binding.dart';
import 'package:bitakasla/view/nav_bar/trends/trends_screen.dart';
import 'package:bitakasla/view/nav_bar/trends/trends_screen_binding.dart';
import 'package:flutter/material.dart';

class NavBarScreenController extends BaseGetxController {
  var isLoading = false.obs;

  late final DateTime popupOpenTime;
  late final DateTime popupCloseTime;
  late final String popupOnTime;

  final _routes = <String>[
    AppRoutes.homeScreen,
    AppRoutes.exploreScreen,
    '',
    AppRoutes.trendsScreen,
    AppRoutes.profileScreen,
  ];
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  void changeScreen(int index) {
    if (index != currentIndex && _routes[index].isNotEmpty) {
      _currentIndex.value = index;
      Get.offAndToNamed(_routes[index], id: 1);
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return GetPageRoute(
          settings: settings,
          page: () => const HomeScreen(),
          binding: HomeScreenBinding(),
          transition: Transition.fadeIn,
        );
      case AppRoutes.exploreScreen:
        return GetPageRoute(
          settings: settings,
          page: () => const ExploreScreen(),
          binding: ExploreScreenBinding(),
          transition: Transition.fadeIn,
        );
      case AppRoutes.trendsScreen:
        return GetPageRoute(
          settings: settings,
          page: () => const TrendsScreen(),
          binding: TrendsScreenBinding(),
          transition: Transition.fadeIn,
        );
      case AppRoutes.profileScreen:
        return GetPageRoute(
          settings: settings,
          page: () => const ProfileScreen(),
          binding: ProfileScreenBinding(),
          transition: Transition.fadeIn,
        );
      default:
        return null;
    }
  }
}
