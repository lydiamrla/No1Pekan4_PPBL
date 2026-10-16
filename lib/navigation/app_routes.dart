import 'package:flutter/material.dart';
import '../pages/rincian_layanan_page.dart';
import '../pages/warga_page.dart';
import '../pages/tanya_petugas_page.dart';
import '../pages/lokasi_kantor_page.dart';
import '../pages/statistik_layanan_page.dart';

class AppRoutes {
  static const String main = '/';
  static const String rincianLayanan = '/rincian-layanan';
  static const String warga = '/warga';
  static const String tanyaPetugas = '/tanya-petugas';
  static const String lokasiKantor = '/lokasi-kantor';
  static const String statistikLayanan = '/statistik-layanan';

  static Map<String, WidgetBuilder> get routes => {
        rincianLayanan: (context) => const RincianLayananPage(),
        warga: (context) => const WargaPage(),
        tanyaPetugas: (context) => const TanyaPetugasPage(),
        lokasiKantor: (context) => const LokasiKantorPage(),
        statistikLayanan: (context) => const StatistikLayananPage(),
      };
}