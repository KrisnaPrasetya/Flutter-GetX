import 'package:flutter/material.dart';
import 'package:flutter_getx/modules/daftar_kandidat/controller/daftar_kandidat_controlle.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DaftarKandidatScreen extends StatelessWidget {
  const DaftarKandidatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DaftarKandidatController>(
      init: DaftarKandidatController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () => Get.back(),
            ),
            title: Text(
              'Daftar Kandidat',
              style: TextStyle(
                color: HexColor("#393938"),
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
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
                                  hintText: 'Cari kandidat',
                                  hintStyle: TextStyle(
                                      color: HexColor("#777675"),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.02),
                    PopupMenuButton<String>(
                      offset: const Offset(0, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        height: Get.height * 0.05,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(color: HexColor("#171A9D")),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontSize: Get.width * 0.035,
                                color: HexColor("#171A9D"),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: Get.width * 0.06,
                              color: HexColor("#171A9D"),
                            ),
                          ],
                        ),
                      ),
                      itemBuilder: (context) => [
                        'Semua',
                        'Diproses',
                        'Diterima',
                        'Ditolak',
                        'Menunggu'
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
                  itemCount: controller.filteredkandidatList.length,
                  itemBuilder: (context, index) {
                    final kandidat = controller.filteredkandidatList[index];
                    return _buildKandidatItem(kandidat);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildKandidatItem(Map<String, dynamic> kandidat) {
    Color statusBgColor;

    switch (kandidat['status']) {
      case 'Diproses':
        statusBgColor = Colors.amber;
        break;
      case 'Diterima':
        statusBgColor = Colors.green;
        break;
      case 'Ditolak':
        statusBgColor = Colors.red;
        break;
      default:
        statusBgColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Get.height * 0.02,
              bottom: Get.height * 0.02,
              left: Get.width * 0.014,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: Get.width * 0.06,
                  backgroundImage: NetworkImage(kandidat['image']),
                ),
                SizedBox(width: Get.width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kandidat['name'],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#050774"),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.004),
                    Text(
                      kandidat['location'],
                      style: TextStyle(
                        fontSize: 13,
                        color: HexColor("#393938"),
                      ),
                    ),
                  ],
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
              width: Get.width * 0.23,
              decoration: BoxDecoration(
                color: statusBgColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Text(
                kandidat['status'],
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
