import 'package:get/get.dart';

class NotifikasiController extends GetxController {
  RxInt selectedTab = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTab(int index) {
    selectedTab.value = index;
    update();
  }
}
