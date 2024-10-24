import 'package:get/get.dart';

import '../../modules/daftar_kandidat/screen/daftar_kandidat_screen.dart';
import '../../modules/homepage_menu/screen/homepage_menu_screen.dart';
import '../../modules/lowongan/screen/lowongan_screen.dart';
import '../../modules/notifikasi/screen/notifikasi_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const HomepageMenuScreen()),
    GetPage(name: AppRoutes.lowongan, page: () => const LowonganScreen()),
    GetPage(name: AppRoutes.datarKandidat, page: () => const DaftarKandidatScreen()),
    GetPage(name: AppRoutes.notifikasi, page: () => const NotifikasiScreen()),
  ];
}