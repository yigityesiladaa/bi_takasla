import 'package:bitakasla/view/app_selection/app_selection_screen.dart';
import 'package:bitakasla/view/app_selection/app_selection_screen_binding.dart';
import 'package:bitakasla/view/auth/sign_in/sign_in_screen.dart';
import 'package:bitakasla/view/auth/sign_in/sign_in_screen_binding.dart';
import 'package:bitakasla/view/auth/sign_up/sign_up_screen.dart';
import 'package:bitakasla/view/auth/sign_up/sign_up_screen_binding.dart';
import 'package:bitakasla/view/nav_bar/nav_bar_screen.dart';
import 'package:bitakasla/view/nav_bar/nav_bar_screen_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static String initial = AppRoutes.appSelectionScreen;
  static final routes = [
    GetPage(
      name: AppRoutes.appSelectionScreen,
      page: () => const AppSelectionScreen(),
      binding: AppSelectionScreenBinding(),
    ),
   GetPage(
      name: AppRoutes.signInScreen,
      page: () => const SignInScreen(),
      binding: SignInScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => const SignUpScreen(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.navBarScreen,
      page: () => const NavBarScreen(),
      binding: NavBarScreenBinding(),
    ),
  ];
}
