import 'package:get/get.dart';

class LowonganController extends GetxController {
  List<Map<String, dynamic>> lowonganList = [
    {
      'title': 'Admin',
      'location': 'Denpasar, Bali',
      'total_pelamar': 200,
      'waktu': '1 minggu lalu',
      'status': 'Aktif',
    },
    {
      'title': 'IT Staff',
      'location': 'Denpasar, Bali',
      'total_pelamar': 200,
      'waktu': '1 minggu lalu',
      'status': 'Tidak aktif',
    },
    {
      'title': 'Marketing',
      'location': 'Denpasar, Bali',
      'total_pelamar': 200,
      'waktu': '3 bulan lalu',
      'status': 'Kadaluwarsa',
    },
  ];

  List<Map<String, dynamic>> filteredLowonganList = [];
  String currentStatus = 'Semua';
  String searchQuery = '';

  @override
  void onInit() {
    filteredLowonganList = List.from(lowonganList);
    super.onInit();
  }

  void filterByStatus(String status) {
    currentStatus = status;
    _applyFilters();
  }

  void searchLowongan(String query) {
    searchQuery = query;
    _applyFilters();
  }

  void _applyFilters() {
    filteredLowonganList = lowonganList.where((lowongan) {
      bool matchesStatus =
          currentStatus == 'Semua' || lowongan['status'] == currentStatus;
      bool matchesSearch =
          lowongan['title'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchesStatus && matchesSearch;
    }).toList();
    update();
  }
}
