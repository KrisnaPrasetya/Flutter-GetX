
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';

class HomepageMenuController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
    void gotoGetTest() {
    Get.toNamed(AppRoutes.getTest);
  }

  void gotoPostTest() {
    Get.toNamed(AppRoutes.postTest);
  }
}
