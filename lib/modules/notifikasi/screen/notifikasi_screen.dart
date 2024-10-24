import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controller/notifikasi_controller.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotifikasiController>(
      init: NotifikasiController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: Get.width * 0.04,
                    top: Get.height * 0.02,
                    bottom: Get.height * 0.02,
                  ),
                  child: Text(
                    'Notifikasi',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#393938"),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTab(
                        title: 'Rekrutmen',
                        index: 0,
                        controller: controller,
                      ),
                      _buildTab(
                        title: 'Sosial',
                        index: 1,
                        controller: controller,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.selectedTab.value == 0 ? 2 : 3,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? _buildNotificationItem1()
                          : _buildNotificationItem2();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTab({
    required String title,
    required int index,
    required NotifikasiController controller,
  }) {
    bool isSelected = controller.selectedTab.value == index;

    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Align(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04,
            vertical: Get.height * 0.015,
          ),
          width: Get.width * 0.4,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? HexColor('#050774') : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? HexColor('#050774') : Colors.grey,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem1() {
    return InkWell(
      onTap: () {
        // Handle notification tap
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor("#F5F8F9").withOpacity(0.3),
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.04,
          vertical: Get.height * 0.01,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: Get.width * 0.05,
              backgroundImage: const NetworkImage(
                'https://upload.wikimedia.org/wikipedia/en/c/c2/Peter_Griffin.png',
              ),
            ),
            SizedBox(width: Get.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Dessy Maria',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' mengajukan penjadwalan ulang wawancara',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.004),
                  Text(
                    '4 hari yang lalu',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[700],
              size: Get.width * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildNotificationItem2() {
  return InkWell(
    onTap: () {
      // Handle notification tap
    },
    child: Container(
      decoration: BoxDecoration(
        color: HexColor("#F5F8F9").withOpacity(0.3),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.04,
        vertical: Get.height * 0.01,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: Get.width * 0.05,
            backgroundImage: const NetworkImage(
              'https://upload.wikimedia.org/wikipedia/en/c/c2/Peter_Griffin.png',
            ),
          ),
          SizedBox(width: Get.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Dessy Maria',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' mengajukan penjadwalan ulang wawancara',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.004),
                Text(
                  '4 hari yang lalu',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey[700],
            size: Get.width * 0.06,
          ),
        ],
      ),
    ),
  );
}
