import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart';
import 'crop_guide_screen.dart';

class CropSelectionScreen extends StatelessWidget {
  const CropSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> crops = [
      {'name': 'قمح', 'image': 'assets/wheat.png'},
      {'name': 'ذرة', 'image': 'assets/corn.png'},
      {'name': 'أرز', 'image': 'assets/rice.png'},
      {'name': 'طماطم', 'image': 'assets/tomato.png'},
      {'name': 'خيار', 'image': 'assets/cucumber.png'},
      {'name': 'بطاطس', 'image': 'assets/potato.png'},
      {'name': 'بصل', 'image': 'assets/onion.png'},
      {'name': 'جزر', 'image': 'assets/carrot.png'},
      {'name': 'فلفل', 'image': 'assets/pepper.png'},
      {'name': 'باذنجان', 'image': 'assets/eggplant.png'},
      {'name': 'ملفوف', 'image': 'assets/cabbage.png'},
      {'name': 'خس', 'image': 'assets/lettuce.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('اختيار المحصول'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختر المحصول المطلوب:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'انقر على المحصول لعرض الإرشادات الزراعية',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: crops.length,
                itemBuilder: (context, index) {
                  final crop = crops[index];
                  return Crop3DCard(
                    name: crop['name'],
                    image: crop['image'],
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
