import 'package:flutter/material.dart';
import '../models/soil_data.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  late List<SoilData> reports;

  @override
  void initState() {
    super.initState();
    reports = [
      SoilData(
        ph: 6.5,
        moisture: 45.0,
        temperature: 22.0,
        salinity: 1.2,
        nitrogen: 60.0,
        phosphorus: 55.0,
        potassium: 58.0,
        date: DateTime(2024, 1, 15),
      ),
      SoilData(
        ph: 7.2,
        moisture: 38.0,
        temperature: 25.0,
        salinity: 2.1,
        nitrogen: 48.0,
        phosphorus: 52.0,
        potassium: 61.0,
        date: DateTime(2024, 1, 10),
      ),
    ];
  }

  String _getStatus(SoilData data) {
    if (data.ph >= 6.0 && data.ph <= 7.5) {
      return 'جيدة';
    } else {
      return 'تحتاج تحسين';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تقاريري'),
      ),
      body: reports.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'لا توجد تقارير سابقة',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                final status = _getStatus(report);

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تقرير ${index + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: status == 'جيدة'
                                    ? Colors.green[50]
                                    : Colors.orange[50],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: status == 'جيدة'
                                      ? Colors.green
                                      : Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'التاريخ: ${report.date.day}/${report.date.month}/${report.date.year}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'الحموضة',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '${report.ph}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'الرطوبة',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '${report.moisture}%',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'الملوحة',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '${report.salinity}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // عرض التفاصيل
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[50],
                                  foregroundColor: Colors.green,
                                ),
                                child: const Text('عرض التفاصيل'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                // مشاركة التقرير
                              },
                              icon: const Icon(
                                Icons.share,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
