import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/homepage_menu_controller.dart';

class HomepageMenuScreen extends StatelessWidget {
  const HomepageMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageMenuController>(
      init: HomepageMenuController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Homepage Menu'),
          ),
          backgroundColor: Colors.white,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.gotoNotifikasi,
                    child: Text('Go to Notifikasi'),
                  ),
                  ElevatedButton(
                    onPressed: controller.gotoDaftarKandidat,
                    child: Text('Go to Daftar Kandidat'),
                  ),
                  ElevatedButton(
                    onPressed: controller.gotoLowongan,
                    child: Text('Go to Lowongan'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
