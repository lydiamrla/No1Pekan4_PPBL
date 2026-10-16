import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/pengajuan_model.dart';

class RincianLayananPage extends StatefulWidget {
  const RincianLayananPage({super.key});

  @override
  State<RincianLayananPage> createState() => _RincianLayananPageState();
}

class _RincianLayananPageState extends State<RincianLayananPage> {
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isApproved = false;
  String _sesi = 'pagi';
  String _bidang = 'Kependudukan';
  bool _isLoading = false;

  bool get _isFormValid =>
      _namaController.text.isNotEmpty &&
      _emailController.text.contains('@') &&
      _isApproved;

  void _kirimForm() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // Simulasi pengiriman

    if (!mounted) return;
    context.read<PengajuanModel>().tambahPengajuan(
          Pengajuan(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            nama: _namaController.text,
            email: _emailController.text,
            bidang: _bidang,
            sesi: _sesi,
          ),
        );

    setState(() => _isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengajuan Berhasil Dikirim!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1DE),
      appBar: AppBar(
        title: const Text('Formulir Pengajuan Layanan'),
        backgroundColor: const Color(0xFFA33327),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email (Harus ada @)',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _bidang,
              decoration: const InputDecoration(
                labelText: 'Bidang Layanan',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              items: ['Kependudukan', 'Perizinan', 'Kesehatan', 'Sosial']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => _bidang = val!),
            ),
            const SizedBox(height: 16),
            const Text('Pilih Sesi Kunjungan:', style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Pagi (08.00 - 11.00)'),
              value: 'pagi',
              groupValue: _sesi,
              activeColor: const Color(0xFFA33327),
              onChanged: (val) => setState(() => _sesi = val!),
            ),
            RadioListTile<String>(
              title: const Text('Siang (11.00 - 14.00)'),
              value: 'siang',
              groupValue: _sesi,
              activeColor: const Color(0xFFA33327),
              onChanged: (val) => setState(() => _sesi = val!),
            ),
            RadioListTile<String>(
              title: const Text('Sore (14.00 - 16.00)'),
              value: 'sore',
              groupValue: _sesi,
              activeColor: const Color(0xFFA33327),
              onChanged: (val) => setState(() => _sesi = val!),
            ),
            Row(
              children: [
                Checkbox(
                  value: _isApproved,
                  activeColor: const Color(0xFFA33327),
                  onChanged: (val) => setState(() => _isApproved = val!),
                ),
                const Expanded(child: Text('Saya menyetujui penggunaan data pribadi.')),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D6A4F),
                  foregroundColor: Colors.white,
                ),
                onPressed: _isFormValid && !_isLoading ? _kirimForm : null,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Kirim Pengajuan', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}