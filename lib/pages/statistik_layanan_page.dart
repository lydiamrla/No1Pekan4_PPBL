import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../model/pengajuan_model.dart';

class StatistikLayananPage extends StatelessWidget {
  const StatistikLayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<PengajuanModel>().rekapStatistik;

    List<BarChartGroupData> barGroups = [];
    int index = 0;
    stats.forEach((key, value) {
      barGroups.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: value.toDouble(),
              color: const Color(0xFF2D6A4F),
              width: 18,
            )
          ],
        ),
      );
      index++;
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF4F1DE),
      appBar: AppBar(
        title: const Text('Statistik Layanan'),
        backgroundColor: const Color(0xFFA33327),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Jumlah Pengajuan per Bidang',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          List<String> labels = stats.keys.toList();
                          if (value.toInt() < labels.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                labels[value.toInt()],
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  barGroups: barGroups,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}