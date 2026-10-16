import 'package:flutter/material.dart';

class Pengajuan {
  final String id;
  final String nama;
  final String email;
  final String bidang;
  final String sesi;
  bool isSelesai;

  Pengajuan({
    required this.id,
    required this.nama,
    required this.email,
    required this.bidang,
    required this.sesi,
    this.isSelesai = false,
  });
}

class PengajuanModel extends ChangeNotifier {
  final List<Pengajuan> _daftarPengajuan = [
    Pengajuan(
      id: '1',
      nama: 'Budi Santoso',
      email: 'budi@mail.com',
      bidang: 'Kependudukan',
      sesi: 'pagi',
      isSelesai: false,
    ),
    Pengajuan(
      id: '2',
      nama: 'Siti Rahma',
      email: 'siti@mail.com',
      bidang: 'Perizinan',
      sesi: 'siang',
      isSelesai: true,
    ),
  ];

  List<Pengajuan> get daftarPengajuan => _daftarPengajuan;

  void tambahPengajuan(Pengajuan pengajuan) {
    _daftarPengajuan.add(pengajuan);
    notifyListeners();
  }

  void tandaiSelesai(String id) {
    final index = _daftarPengajuan.indexWhere((element) => element.id == id);
    if (index != -1) {
      _daftarPengajuan[index].isSelesai = true;
      notifyListeners();
    }
  }

  Map<String, int> get rekapStatistik {
    Map<String, int> stats = {
      'Kependudukan': 0,
      'Perizinan': 0,
      'Kesehatan': 0,
      'Sosial': 0,
    };
    for (var p in _daftarPengajuan) {
      if (stats.containsKey(p.bidang)) {
        stats[p.bidang] = stats[p.bidang]! + 1;
      }
    }
    return stats;
  }
}