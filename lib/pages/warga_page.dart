import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/pengajuan_model.dart';
import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listPengajuan = context.watch<PengajuanModel>().daftarPengajuan;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F1DE),
      appBar: AppBar(
        title: const Text('Layanan Warga - Nusantara Cerdas'),
        backgroundColor: const Color(0xFFA33327),
        foregroundColor: Colors.white,
      ),
      body: listPengajuan.isEmpty
          ? const Center(child: Text('Belum ada riwayat pengajuan.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: listPengajuan.length,
              itemBuilder: (context, index) {
                final item = listPengajuan[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Detail Pengajuan: ${item.nama}'),
                        content: Text('Email: ${item.email}\nBidang: ${item.bidang}\nSesi: ${item.sesi}\nStatus: ${item.isSelesai ? "Selesai" : "Proses"}'),
                      ),
                    );
                  },
                  onLongPress: () {
                    context.read<PengajuanModel>().tandaiSelesai(item.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pengajuan ditandai Selesai!')),
                    );
                  },
                  child: Card(
                    color: item.isSelesai ? const Color(0xFFE9EDC9) : Colors.white,
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        item.isSelesai ? Icons.check_circle : Icons.hourglass_top,
                        color: item.isSelesai ? const Color(0xFF2D6A4F) : const Color(0xFFA33327),
                      ),
                      title: Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('${item.bidang} - Sesi ${item.sesi}'),
                      trailing: Text(
                        item.isSelesai ? 'Selesai' : 'Diproses',
                        style: TextStyle(
                          color: item.isSelesai ? const Color(0xFF2D6A4F) : const Color(0xFFA33327),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFA33327),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.rincianLayanan);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}