import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiKantorPage extends StatelessWidget {
  const LokasiKantorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = {
      const Marker(
        markerId: MarkerId('balai_kota'),
        position: LatLng(-6.9175, 107.6191),
        infoWindow: InfoWindow(title: 'Balai Kota Nusantara'),
      ),
      const Marker(
        markerId: MarkerId('disdukcapil'),
        position: LatLng(-6.9200, 107.6100),
        infoWindow: InfoWindow(title: 'Kantor Layanan Kependudukan'),
      ),
      const Marker(
        markerId: MarkerId('dinas_sosial'),
        position: LatLng(-6.9100, 107.6250),
        infoWindow: InfoWindow(title: 'Kantor Layanan Sosial'),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi Kantor Layanan'),
        backgroundColor: const Color(0xFFA33327),
        foregroundColor: Colors.white,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(-6.9175, 107.6191),
          zoom: 13,
        ),
        markers: markers,
      ),
    );
  }
}