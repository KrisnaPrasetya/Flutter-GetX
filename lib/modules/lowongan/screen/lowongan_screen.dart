import 'package:flutter/material.dart';
import 'package:flutter_getx/core/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controller/lowongan_controller.dart';

class LowonganScreen extends StatelessWidget {
  const LowonganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LowonganController>(
      init: LowonganController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Lowongan',
              style: TextStyle(
                color: HexColor("#393938"),
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.width * 0.04),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: HexColor("#F5F8F9"),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Cari lowongan',
                                  hintStyle: TextStyle(
                                    color: HexColor("#777675"),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  controller.searchLowongan(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.02),
                    PopupMenuButton<String>(
                      offset: Offset(0, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        height: Get.height * 0.05,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(color: HexColor("#050774")),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontSize: Get.width * 0.035,
                                color: HexColor("#050774"),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: Get.width * 0.06,
                              color: HexColor("#050774"),
                            ),
                          ],
                        ),
                      ),
                      itemBuilder: (context) => [
                        'Semua',
                        'Aktif',
                        'Tidak aktif',
                        'Kadaluwarsa'
                      ].map((status) {
                        return PopupMenuItem<String>(
                          value: status,
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: Get.width * 0.035,
                            ),
                          ),
                        );
                      }).toList(),
                      onSelected: (String value) {
                        controller.filterByStatus(value);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                  itemCount: controller.filteredLowonganList.length,
                  itemBuilder: (context, index) {
                    final lowongan = controller.filteredLowonganList[index];
                    return _buildLowonganItem(lowongan);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLowonganItem(Map<String, dynamic> lowongan) {
    Color statusColor;
    switch (lowongan['status']) {
      case 'Aktif':
        statusColor = Colors.green;
        break;
      case 'Tidak aktif':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lowongan['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4),
                    Text(
                      lowongan['location'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Total pelamar: ${lowongan['total_pelamar']}',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  lowongan['waktu'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed(AppRoutes.datarKandidat),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#050774"),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Lihat Kandidat',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.03,
                vertical: Get.height * 0.006,
              ),
              width: Get.width * 0.27,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Text(
                lowongan['status'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.width * 0.032,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
