import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart';
import 'soil_input_screen.dart';
import 'crop_selection_screen.dart';
import 'reports_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00D4AA),
              ),
              child: const Icon(Icons.eco, size: 18, color: Colors.white),
            ),
            const Text('AgriPen'),
          ],
        ),
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ترحيب
            const Text(
              'مرحباً بك،',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'كيف يمكنني مساعدتك اليوم؟',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 40),
            
            // الأزرار الرئيسية
            Center(
              child: Column(
                children: [
                  AgriButton(
                    text: 'تحليل التربة',
                    icon: Icons.analytics,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SoilInputScreen(),
                        ),
                      );
                    },
                    color: const Color(0xFF00D4AA),
                  ),
                  const SizedBox(height: 20),
                  AgriButton(
                    text: 'اختيار المحصول',
                    icon: Icons.eco,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CropSelectionScreen(),
                        ),
                      );
                    },
                    color: const Color(0xFFFF6B9D),
                  ),
                  const SizedBox(height: 20),
                  AgriButton(
                    text: 'تقاريري',
                    icon: Icons.history,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReportsScreen(),
                        ),
                      );
                    },
                    color: const Color(0xFF0095FF),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // نصائح سريعة
            const Text(
              'نصائح اليوم:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.lightbulb, color: Color(0xFFFF6B9D)),
                        const SizedBox(width: 10),
                        const Text(
                          'النصيحة الزراعية',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'افحص التربة قبل الزراعة للتأكد من مستوى الحموضة والعناصر الغذائية.',
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
