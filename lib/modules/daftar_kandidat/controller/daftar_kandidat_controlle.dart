import 'package:get/get.dart';

class DaftarKandidatController extends GetxController {
  final List<Map<String, dynamic>> kandidatList = [
    {
      'name': 'Akbar Maulana',
      'location': 'Badung',
      'status': 'Diproses',
      'image':
          'https://upload.wikimedia.org/wikipedia/en/c/c2/Peter_Griffin.png',
    },
    {
      'name': 'Safira',
      'location': 'Badung',
      'status': 'Diterima',
      'image':
          'https://i.pinimg.com/736x/60/14/0f/60140f1c60a5ea8e69becff7f53a4c0f.jpg',
    },
    {
      'name': 'Arief',
      'location': 'Badung',
      'status': 'Ditolak',
      'image':
          'https://i.pinimg.com/564x/54/10/be/5410be5967f5038f1821c77831f179e1.jpg',
    },
    {
      'name': 'Siti Markonah',
      'location': 'Badung',
      'status': 'Menunggu',
      'image':
          'https://www.listchallenges.com/f/items/e1157b9e-558e-4bc4-8c57-88283c7fd400.jpg',
    },
  ];

  @override
  void onInit() {
    filteredkandidatList = List.from(kandidatList);
    super.onInit();
  }

  List<Map<String, dynamic>> filteredkandidatList = [];
  String currentStatus = 'Semua';
  String searchQuery = '';

  void filterByStatus(String status) {
    currentStatus = status;
    _applyFilters();
  }

  void searchLowongan(String query) {
    searchQuery = query;
    _applyFilters();
  }

  void _applyFilters() {
    filteredkandidatList = kandidatList.where((kandidat) {
      bool matchesStatus =
          currentStatus == 'Semua' || kandidat['status'] == currentStatus;
      bool matchesSearch =
          kandidat['name'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchesStatus && matchesSearch;
    }).toList();
    update();
  }
}
