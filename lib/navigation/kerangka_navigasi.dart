import 'package:flutter/material.dart';
import '../pages/warga_page.dart';
import '../pages/tanya_petugas_page.dart';
import '../pages/lokasi_kantor_page.dart';
import '../pages/statistik_layanan_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WargaPage(),
    const TanyaPetugasPage(),
    const LokasiKantorPage(),
    const StatistikLayananPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xA33327), // Terracotta Nusantara
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFFAEDCD),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Warga'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Tanya Petugas'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Lokasi'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistik'),
        ],
      ),
    );
  }
}