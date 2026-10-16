import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/pengajuan_model.dart';
import 'navigation/app_routes.dart';
import 'navigation/kerangka_navigasi.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PengajuanModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusantara Cerdas Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFA33327),
      ),
      home: const KerangkaNavigasi(),
      routes: AppRoutes.routes,
    );
  }
}