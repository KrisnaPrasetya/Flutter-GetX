import 'package:get/get.dart';

import '../../modules/daftar_kandidat/controller/daftar_kandidat_controlle.dart';
import '../../modules/homepage_menu/controller/homepage_menu_controller.dart';
import '../../modules/lowongan/controller/lowongan_controller.dart';
import '../../modules/notifikasi/controller/notifikasi_controller.dart';

class BaseController {
  static initialize() {
    Get.put(HomepageMenuController());
    Get.put(DaftarKandidatController());
    Get.put(NotifikasiController());
    Get.put(LowonganController());
  }
}