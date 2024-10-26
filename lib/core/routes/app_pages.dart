import 'package:get/get.dart';

import '../../module/get_test/screen/get_testing_screen.dart';
import '../../module/homepage_menu/screen/homepage_menu_screen.dart';
import '../../module/post_test/screen/post_testing_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const HomepageMenuScreen()),
    GetPage(name: AppRoutes.getTest, page: () => const GetTestingScreen()),
    GetPage(name: AppRoutes.postTest, page: () => const PostTestingScreen()),
  ];
}