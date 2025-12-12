import 'package:flutter/material.dart';
import '../models/soil_data.dart';
import 'crop_guide_screen.dart';

class ResultScreen extends StatelessWidget {
  final SoilData soilData;

  const ResultScreen({super.key, required this.soilData});

  String _getSoilStatus() {
    if (soilData.ph >= 6.0 && soilData.ph <= 7.5 &&
        soilData.moisture >= 40 &&
        soilData.salinity <= 2) {
      return 'جيدة';
    } else if (soilData.ph >= 5.0 && soilData.ph <= 8.0) {
      return 'متوسطة';
    } else {
      return 'ضعيفة';
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'جيدة':
        return Colors.green;
      case 'متوسطة':
        return Colors.orange;
      case 'ضعيفة':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  List<String> _getProblems() {
    List<String> problems = [];
    
    if (soilData.ph < 6.0) problems.add('حموضة التربة عالية جداً');
    if (soilData.ph > 7.5) problems.add('قلوية التربة عالية');
    if (soilData.moisture < 30) problems.add('نقص الرطوبة');
    if (soilData.moisture > 80) problems.add('زيادة الرطوبة');
    if (soilData.salinity > 3) problems.add('ملوحة عالية');
    if (soilData.nitrogen < 30) problems.add('نقص النيتروجين');
    
    if (problems.isEmpty) problems.add('لا توجد مشاكل رئيسية');
    
    return problems;
  }

  List<String> _getRecommendations() {
    List<String> recommendations = [];
    
    if (soilData.ph < 6.0) recommendations.add('إضافة الجير لمعادلة الحموضة');
    if (soilData.ph > 7.5) recommendations.add('إضافة الكبريت لخفض القلوية');
    if (soilData.moisture < 30) recommendations.add('زيادة الري');
    if (soilData.nitrogen < 30) recommendations.add('إضافة سماد نيتروجيني');
    if (soilData.phosphorus < 30) recommendations.add('إضافة سماد فوسفاتي');
    if (soilData.potassium < 30) recommendations.add('إضافة سماد بوتاسي');
    
    if (recommendations.isEmpty) {
      recommendations.add('استمر في نفس برنامج التسميد والري');
    }
    
    return recommendations;
  }

  List<Map<String, dynamic>> _getSuitableCrops() {
    return [
      {'name': 'قمح', 'image': 'assets/wheat.png'},
      {'name': 'ذرة', 'image': 'assets/corn.png'},
      {'name': 'أرز', 'image': 'assets/rice.png'},
      {'name': 'طماطم', 'image': 'assets/tomato.png'},
      {'name': 'خيار', 'image': 'assets/cucumber.png'},
      {'name': 'بطاطس', 'image': 'assets/potato.png'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final status = _getSoilStatus();
    final problems = _getProblems();
    final recommendations = _getRecommendations();
    final suitableCrops = _getSuitableCrops();

    return Scaffold(
      appBar: AppBar(
        title: const Text('نتيجة التحليل'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حالة التربة
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'حالة التربة',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _getStatusColor(status)),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _getStatusColor(status),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // المشاكل المحتملة
            const Text(
              'المشاكل المحتملة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...problems.map((problem) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: problem.startsWith('لا توجد') 
                        ? Colors.green 
                        : Colors.orange,
                  ),
                  const SizedBox(width: 10),
                  Text(problem),
                ],
              ),
            )),
            const SizedBox(height: 20),
            
            // نصائح التحسين
            const Text(
              'نصائح التحسين:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...recommendations.map((recommendation) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 10),
                  Expanded(child: Text(recommendation)),
                ],
              ),
            )),
            const SizedBox(height: 20),
            
            // المحاصيل المناسبة
            const Text(
              'المحاصيل المناسبة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemCount: suitableCrops.length,
              itemBuilder: (context, index) {
                final crop = suitableCrops[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                       builder: (context) => CropGuideScreen(
  cropName: crop['name'],
  cropImage: crop['image'], 
),

                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade100),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          crop['image'],
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          crop['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            
            // زر الحفظ
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // حفظ التقرير
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم حفظ التقرير بنجاح'),
                    ),
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text('حفظ التقرير'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
