
import 'package:flutter_getx/core/routes/app_routes.dart';
import 'package:get/get.dart';

class HomepageMenuController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  void gotoLowongan() {
    Get.toNamed(AppRoutes.lowongan);
  }
  void gotoNotifikasi() {
    Get.toNamed(AppRoutes.notifikasi);
  }
  void gotoDaftarKandidat() {
    Get.toNamed(AppRoutes.datarKandidat);
  }

}
