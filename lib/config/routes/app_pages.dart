
import 'package:bitakasla/view/home/home_screen.dart';
import 'package:bitakasla/view/home/home_screen_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static String initial = AppRoutes.mainScreen;
  static final routes = [
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
   
  ];
}
